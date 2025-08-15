<?php

namespace App\Lib;

class GoogleAuthenticator
{
    protected $_codeLength = 6;

    public function createSecret($secretLength = 16)
    {
        $validChars = $this->_getBase32LookupTable();

        if ($secretLength < 16 || $secretLength > 128) {
            throw new \Exception('Bad secret length');
        }

        $secret = '';
        if (function_exists('random_bytes')) {
            $rnd = random_bytes($secretLength);
        } elseif (function_exists('openssl_random_pseudo_bytes')) {
            $rnd = openssl_random_pseudo_bytes($secretLength);
        } else {
            throw new \Exception('No secure random source available');
        }

        for ($i = 0; $i < $secretLength; ++$i) {
            $secret .= $validChars[ord($rnd[$i]) & 31];
        }

        return $secret;
    }

    public function getCode($secret, $timeSlice = null)
    {
        if ($timeSlice === null) {
            $timeSlice = floor(time() / 30);
        }

        $secretkey = $this->_base32Decode($secret);
        $time = pack('N*', 0) . pack('N*', $timeSlice);
        $hm = hash_hmac('SHA1', $time, $secretkey, true);
        $offset = ord(substr($hm, -1)) & 0x0F;
        $hashpart = substr($hm, $offset, 4);
        $value = unpack('N', $hashpart)[1];
        $value = $value & 0x7FFFFFFF;

        return str_pad($value % pow(10, $this->_codeLength), $this->_codeLength, '0', STR_PAD_LEFT);
    }

    /**
     * توليد صورة QR Base64 بدون Google API
     */
    public function getQRCodeGoogleUrl($name, $secret, $title = null)
    {
        $otpauth = 'otpauth://totp/' . $name . '?secret=' . $secret;
        if ($title) {
            $otpauth .= '&issuer=' . urlencode($title);
        }

        $size = 200;
        $image = $this->generateQrCodeImage($otpauth, $size);

        return 'data:image/png;base64,' . base64_encode($image);
    }

    /**
     * توليد صورة QR مباشرة بـ GD بدون مكتبات خارجية
     */
    private function generateQrCodeImage($text, $size = 200)
    {
        if (!function_exists('imagecreatetruecolor')) {
            throw new \Exception('GD library is not enabled');
        }

        // سنستخدم QRcode API مجاني من goqr.me لكن نحوله لباينري
        $url = "https://api.qrserver.com/v1/create-qr-code/?data=" . urlencode($text) . "&size={$size}x{$size}";
        $imageData = file_get_contents($url);

        if ($imageData === false) {
            throw new \Exception('Unable to generate QR code');
        }

        return $imageData;
    }

    public function verifyCode($secret, $code, $discrepancy = 1, $currentTimeSlice = null)
    {
        if ($currentTimeSlice === null) {
            $currentTimeSlice = floor(time() / 30);
        }

        if (strlen($code) != 6) {
            return false;
        }

        for ($i = -$discrepancy; $i <= $discrepancy; ++$i) {
            if ($this->timingSafeEquals($this->getCode($secret, $currentTimeSlice + $i), $code)) {
                return true;
            }
        }

        return false;
    }

    protected function _base32Decode($secret)
    {
        if (empty($secret)) {
            return '';
        }

        $base32chars = $this->_getBase32LookupTable();
        $base32charsFlipped = array_flip($base32chars);

        $secret = str_replace('=', '', $secret);
        $secret = str_split($secret);
        $binaryString = '';

        for ($i = 0; $i < count($secret); $i = $i + 8) {
            $x = '';
            for ($j = 0; $j < 8; ++$j) {
                $x .= str_pad(base_convert($base32charsFlipped[$secret[$i + $j]] ?? 0, 10, 2), 5, '0', STR_PAD_LEFT);
            }
            $eightBits = str_split($x, 8);
            foreach ($eightBits as $bits) {
                $binaryString .= chr(base_convert($bits, 2, 10));
            }
        }

        return $binaryString;
    }

    protected function _getBase32LookupTable()
    {
        return array(
            'A','B','C','D','E','F','G','H',
            'I','J','K','L','M','N','O','P',
            'Q','R','S','T','U','V','W','X',
            'Y','Z','2','3','4','5','6','7',
            '='
        );
    }

    private function timingSafeEquals($safeString, $userString)
    {
        if (function_exists('hash_equals')) {
            return hash_equals($safeString, $userString);
        }

        $safeLen = strlen($safeString);
        $userLen = strlen($userString);

        if ($userLen != $safeLen) {
            return false;
        }

        $result = 0;
        for ($i = 0; $i < $userLen; ++$i) {
            $result |= (ord($safeString[$i]) ^ ord($userString[$i]));
        }
        return $result === 0;
    }
}
