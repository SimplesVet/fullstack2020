<?php
header('Content-Type: text/html; charset=utf-8');

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require_once 'vendor/autoload.php';

$configSlim = [
    'settings' => [
        'displayErrorDetails' => true,
        'addContentLengthHeader' => false
    ]
];

$app = new Slim\App($configSlim);

$app->add(new \Tuupola\Middleware\Cors([
    "origin" => ["*"],
    "methods" => ["OPTIONS", "GET", "POST", "PUT", "PATCH", "DELETE"],
    "headers.allow" => ["authorization", "content-type", "timezone", "accept", "origin"],
    "headers.expose" => [],
    "credentials" => true,
    "cache" => 0 //,
]));

$app->get('/clientes', function ($request, $response, $args) {
    $ret = [
        ['id' => 1, 'nome' => 'Salvador']
    ];

    return $response->withJson($ret)->withStatus(200);
});

$app->run();
