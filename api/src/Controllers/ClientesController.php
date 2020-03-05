<?php

namespace App\Controllers;

use Slim\Http\Request;
use Slim\Http\Response;

use App\Models\Cliente;

class ClientesController extends Controller
{
    public function listar(Request $request, Response $response) {
    	$Cliente = new Cliente($this->app);

    	$filtros = $this->app['sanitize'](
    		$request->getQueryParams()
    	);

    	$clientes = $Cliente->filtrar($filtros)
    						->listar();

    	return $response->withJson($clientes)->withStatus(200);
    }
}
