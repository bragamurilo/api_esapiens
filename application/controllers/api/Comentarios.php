<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
/** @noinspection PhpIncludeInspection */
require APPPATH . 'libraries/REST_Controller.php';
use Carbon\Carbon;

/**
 * This is an example of a few basic user interaction methods you could use
 * all done with a hardcoded array
 *
 * @package         CodeIgniter
 * @subpackage      Rest Server
 * @category        Controller
 * @author          Phil Sturgeon, Chris Kacerguis
 * @license         MIT
 * @link            https://github.com/chriskacerguis/codeigniter-restserver
 */
class Comentarios extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->load->model('comentarios_model');
        $this->load->model('usuarios_model');

        // Configure limits on our controller methods
        // Ensure you have created the 'limits' table and enabled 'limits' within application/config/rest.php
        $this->methods['users_get']['limit'] = 500; // 500 requests per hour per user/key
        $this->methods['users_post']['limit'] = 100; // 100 requests per hour per user/key
        $this->methods['users_delete']['limit'] = 50; // 50 requests per hour per user/key
    }


    public function index_get()
    {
        // id da postagem
        $id = $this->get('id');
        $pagina = $this->get('pagina')-1;
        $limite = 5;

        // Users from a data store e.g. database
        $comentarios = $this->comentarios_model->get_comentarios($id, $pagina, $limite);

        // Check if the users data store contains users (in case the database result returns NULL)
        if ($comentarios)
        {
            // Set the response and exit
            $this->response($comentarios, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
        }
        else
        {
            // Set the response and exit
            $this->response([
                'status' => FALSE,
                'message' => 'Nenhum resultado encontrado!'
            ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function comentarios_post()
    {
         // Recebe o id da postagem que vem por POST
        $id_postagem = $this->post('id_postagem');

        //Usuário que está comentando a postagem
        $id_usuario = $this->post('id_usuario');

        $usuario = $this->usuarios_model->get_usuario($id_usuario);
        $postagem = $this->postagens_model->get_postagem($id_postagem);
        $ultimo_comentario = $this->comentarios_model->get_ultimo_comentario($id_postagem, $id_usuario);
        $date = Carbon::now();


        // Veirifica se os usuários são assinantes
        if(!$usuario->assinante && !$postagem->assinante){
            $this->set_response([
                'status' => FALSE,
                'message' => 'Você não pode comentar esta postagem poque não é um ASSINANTE!'
            ], REST_Controller::HTTP_OK); // NOT_FOUND (404) being the HTTP response code   
        }
        else{
            if($this->comentarios_model->insert_comentario($this->post())){
                $message = [
                    'status' => TRUE,
                    'message' => 'Comentário realizado com sucesso!'
                ];
                $this->set_response($message, REST_Controller::HTTP_CREATED);
            }
        }
             


        // $this->some_model->update_user( ... );
        // $message = [
        //     'id' => 100, // Automatically generated by the model
        //     'name' => $this->post('name'),
        //     'email' => $this->post('email'),
        //     'message' => 'Added a resource'
        // ];

        // $this->set_response($message, REST_Controller::HTTP_CREATED); // CREATED (201) being the HTTP response code
    }
}
