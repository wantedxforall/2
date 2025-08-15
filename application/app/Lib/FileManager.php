<?php

namespace App\Lib;

use App\Traits\FileInfo;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class FileManager
{
    /*
    |--------------------------------------------------------------------------
    | File Manager
    |--------------------------------------------------------------------------
    |
    | FileManager class is using to manage edit, update, remove files. Developer
    | can manage any kind of files from here. But some limitations is here for image.
    | This class using a trait to manage the file paths and sizes. Developer can also
    | use this class as a helper function.
    |
    */

	use FileInfo;

    /**
    * The file which will be uploaded
    *
    *
    * @var object
    */
	protected $file;

    /**
    * The path where will be uploaded
    *
    * @var string
    */
	public $path;

    /**
    * The size, if the file is image
    *
    * @var string
    */
	public $size;

    /**
    * Check the file is image or not
    *
    * @var boolean
    */
	protected $isImage;

    /**
    * Thumbnail version size, if required
    * and if the file is image
    *
    * @var string
    */
	public $thumb;

    /**
    * Old filename, which will be removed
    *
    * @var string
    */
	public $old;

    /**
    * Current filename, which is uploading
    *
    * @var string
    */
	public $filename;

    /**
    * Paths that are allowed to be removed
    *
    * @var array
    */
        protected $allowedPaths = [];


    /**
    * Set the file and file type to properties if exist
    *
    * @param $file
    * @return void
    */
	public function __construct($file = null, array $allowedPaths = []){
                $this->file = $file;
                if ($file) {
                        $imageExtensions = ['jpg','jpeg','png','JPG','JPEG','PNG'];
                        if (in_array($file->getClientOriginalExtension(), $imageExtensions)) {
                                $this->isImage = true;
                        }else{
                                $this->isImage = false;
                        }
                }

                $defaultAllowed = [base_path('assets')];
                $merged = array_merge($defaultAllowed, $allowedPaths);
                $this->allowedPaths = array_filter(array_map('realpath', $merged));
        }

    /**
    * Check if a path is within allowed locations
    *
    * @param string $path
    * @return bool
    */
        protected function isAllowedPath($path)
        {
                $realPath = realpath($path);
                if (!$realPath) {
                        return false;
                }

                foreach ($this->allowedPaths as $allowed) {
                        if (strpos($realPath, $allowed) === 0) {
                                return true;
                        }
                }

                return false;
        }

    /**
    * File upload process
    *
    * @return void
    */
	public function upload(){

        //create the directory if doesn't exists
		$path = $this->makeDirectory();
		if (!$path) throw new \Exception('File could not been created.');

        //remove the old file if exist
		if ($this->old) {
            $this->removeFile();
	    }

        //get the filename
	    $filename = $this->getFileName();
	    $this->filename = $filename;

        //upload file or image
	    if ($this->isImage == true) {
                $this->uploadImage();
            }else{
                $this->validateFile();
                $this->uploadFile();
            }
        }

    /**
    * Upload the file if this is image
    *
    * @return void
    */
	protected function uploadImage(){
		$image = Image::make($this->file);

        //resize the
	    if ($this->size) {
	        $size = explode('x', strtolower($this->size));
	        $image->resize($size[0], $size[1]);
	    }
        //save the image
	    $image->save($this->path . '/' . $this->filename);

        //save the image as thumbnail version
	    if ($this->thumb) {
            if ($this->old) {
                $this->removeFile($this->path . '/thumb_' . $this->old);
            }
	        $thumb = explode('x', $this->thumb);
	        Image::make($this->file)->resize($thumb[0], $thumb[1])->save($this->path . '/thumb_' . $this->filename);
	    }
	}


    /**
    * Upload the file if this is not a image
    *
    * @return void
    */
	protected function uploadFile(){
            $this->file->move($this->path,$this->filename);
        }

    /**
    * Validate non-image uploads for safe extension, size and mime type
    *
    * @throws \Exception
    * @return void
    */
        protected function validateFile(){
            $extension = strtolower($this->file->getClientOriginalExtension());
            $blockedExtensions = [
                'php','php3','php4','php5','php7','phtml','exe','sh','bat','cmd','com','msi'
            ];

            if (in_array($extension, $blockedExtensions)) {
                throw new \Exception('Executable files are not allowed.');
            }

            $maxSize = 5 * 1024 * 1024; // 5MB
            if ($this->file->getSize() > $maxSize) {
                throw new \Exception('File exceeds maximum allowed size of 5MB.');
            }

            $mimeType = File::mimeType($this->file->getRealPath());
            if (!$mimeType) {
                throw new \Exception('Unable to determine file type.');
            }
            
            $mimeType = File::mimeType($this->file->getRealPath());
            $blockedMimes = [
                'text/x-php',
                'application/x-php',
                'application/x-httpd-php',
                'application/x-msdownload',
                'application/x-msdos-program',
                'application/x-sh',
                'application/x-bat',
                'application/x-executable'
            ];

            if (in_array($mimeType, $blockedMimes)) {
                throw new \Exception('Executable files are not allowed.');
            }
        }

    /**
    * Make directory doesn't exists
    * Developer can also call this method statically
    *
    * @param $location
    * @return string
    */
	public function makeDirectory($location = null){
		if (!$location) $location = $this->path;
		if (file_exists($location)) return true;
    	return mkdir($location, 0755, true);
	}

    /**
    * Remove all directory inside the location
    * Developer can also call this method statically
    *
    * @param $location
    * @return void
    */
	public function removeDirectory($location = null){
                if (!$location) $location = $this->path;
                $realLocation = realpath($location);
                if (!$realLocation || ! $this->isAllowedPath($realLocation)) {
                        throw new \InvalidArgumentException('Unauthorized deletion path.');
                }
                if (! is_dir($realLocation)) {
                throw new \InvalidArgumentException("$location must be a directory");
            }
            if (substr($realLocation, strlen($realLocation) - 1, 1) != '/') {
                $realLocation .= '/';
            }
            $files = glob($realLocation . '*', GLOB_MARK);
            foreach ($files as $file) {
                if (is_dir($file)) {
                    $this->removeDirectory($file);
                } else {
                    $realFile = realpath($file);
                    if ($realFile && $this->isAllowedPath($realFile) && is_file($realFile)) {
                        unlink($realFile);
                    }
                }
            }
            rmdir($realLocation);
        }

    /**
    * Remove the file if exists
    * Developer can also call this method statically
    *
    * @param $path
    * @return void
    */
        public function removeFile($path = null)
        {
                if (!$path) $path = $this->path . '/' . $this->old;

	    $realPath = realpath($path);
            if ($realPath && $this->isAllowedPath($realPath) && is_file($realPath)) {
                @unlink($realPath);
            }

	    if ($this->thumb) {
                $thumbPath = $this->path . '/thumb_' . $this->old;
                $realThumb = realpath($thumbPath);
                if ($realThumb && $this->isAllowedPath($realThumb) && is_file($realThumb)) {
                    @unlink($realThumb);
                }
            }
        }

    /**
    * Generating the filename which is uploading
    *
    * @return string
    */
	protected function getFileName(){
                $name = Str::random(40);
                $extension = preg_replace('/[^A-Za-z0-9]/', '', $this->file->getClientOriginalExtension());
                $filename = $name . ($extension ? '.' . $extension : '');
                $filename = preg_replace('/[^A-Za-z0-9._-]/', '', $filename);
                return basename($filename);
        }

    /**
    * Get access of array from fileInfo method as non-static method.
    * Also get some others method
    *
    * @return string|void
    */
	public function __call($method,$args){
		$filePaths = $this->fileInfo();
		if (array_key_exists($method, $filePaths)) {
			$path = json_decode(json_encode($filePaths[$method]));
			return $path;
		}else{
			$this->$method(...$args);
		}
	}

    /**
    * Get access some non-static method as static method
    *
    * @return void
    */
	public static function __callStatic($method,$args){
		$selfClass = new FileManager;
		$selfClass->$method(...$args);
	}

}
