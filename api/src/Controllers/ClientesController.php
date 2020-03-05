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
	
	/**
     * @param Request $request
     * @param Response $response
     * @return Response
     * @throws \Exception
     */
    public function inserir(Request $request, Response $response)
    {
        $body = $this->app['sanitize'](
			$request->getParsedBody()
		);
        $Cliente = new Cliente($this->app);

        try {
            $params = [
                ':nome' => $body['nome'],
                ':telefone' => $body['telefone']
            ];

            $result = $Cliente->inserir($params);

            $p_status = $result[0]['@p_status'];
            $p_msg = $result[0]['@p_msg'];

            if (!$p_status) {
                throw new \Exception($p_msg);
            }

            $ret['code'] = 201;
            $ret['success']['message'] = $p_msg;
        } catch (\Exception $e) {
            $ret['code'] = 400;
            $ret['error']['message'] = $e->getMessage();
        }
        return $response->withJson($ret)->withStatus($ret['code']);
    }

    /**
     * @param Request $request
     * @param Response $response
     * @return Response
     * @throws \Exception
     */
    public function alterar(Request $request, Response $response)
    {
        $id = $request->getAttribute('route')->getArgument('id');
        $body = $this->app['sanitize'](
			$request->getParsedBody()
		);
        $Cliente = new Cliente($this->app);

        try {
            $params = [
                ':id' => $id,
                ':nome' => $body['nome'],
                ':telefone' => $body['telefone']
            ];

            $result = $Cliente->alterar($params);

            $p_status = $result[0]['@p_status'];
            $p_msg = $result[0]['@p_msg'];

            if (!$p_status) {
                throw new \Exception($p_msg);
            }

            $ret['success']['message'] = $p_msg;
            $ret['code'] = 200;
        } catch (\Exception $e) {
            $ret['code'] = 400;
            $ret['error']['message'] = $e->getMessage();
        }
        return $response->withJson($ret)->withStatus($ret['code']);
    }

    /**
     *
     * @param Request $request
     * @param Response $response
     * @return Response
     * @throws \Exception
     */
    public function excluir(Request $request, Response $response)
    {
        $id = $request->getAttribute('route')->getArgument('id');

        try {
            $params = [
                ':id' => $id
            ];

            $Cliente = new Cliente($this->app);

            $result = $Cliente->excluir($params);

            $p_status = $result[0]['@p_status'];
            $p_msg = $result[0]['@p_msg'];

            if (!$p_status) {
                throw new \Exception($p_msg);
            }

            $ret['success']['message'] = $p_msg;
            $ret['code'] = 200;
        } catch (\Exception $e) {
            $ret['code'] = 400;
            $ret['error']['message'] = $e->getMessage();
        }
        return $response->withJson($ret)->withStatus($ret['code']);
    }
}
