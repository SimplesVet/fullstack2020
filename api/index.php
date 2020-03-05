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

$container = $app->getContainer();

$container['sanitize'] = function () {
    return function ($fields) {
        return $fields = App\Lib\Sanitize::filter($fields);
    };
};

// CORS
$app->add(new \Tuupola\Middleware\Cors([
    "origin" => ["*"],
    "methods" => ["OPTIONS", "GET", "POST", "PUT", "PATCH", "DELETE"],
    "headers.allow" => ["authorization", "content-type", "timezone", "accept", "origin"],
    "headers.expose" => [],
    "credentials" => true,
    "cache" => 0 //,
]));

// Rotas
$app->group('/clientes', function () {
    $this->get('', App\Controllers\ClientesController::class . ':listar');
    $this->get('/{id:[0-9]+}', App\Controllers\ClientesController::class . ':listar');
    $this->post('', App\Controllers\ClientesController::class . ':inserir');
    $this->put('/{id:[0-9]+}', App\Controllers\ClientesController::class . ':alterar');
    $this->delete('/{id:[0-9]+}', App\Controllers\ClientesController::class . ':excluir');
});

$app->run();
