<?php
return [
    'allowed_redirect_hosts' => [
        parse_url(env('APP_URL', 'http://localhost'), PHP_URL_HOST),
    ],
];