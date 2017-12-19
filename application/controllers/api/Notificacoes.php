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
class Notificacoes extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->load->model('notificacoes_model');

        // Configure limits on our controller methods
        // Ensure you have created the 'limits' table and enabled 'limits' within application/config/rest.php
        $this->methods['users_get']['limit'] = 500; // 500 requests per hour per user/key
        $this->methods['users_post']['limit'] = 100; // 100 requests per hour per user/key
        $this->methods['users_delete']['limit'] = 50; // 50 requests per hour per user/key
    }

    public function index_get()
    {

        $id = $this->get('id');
        $pagina = $this->get('pagina')-1;
        $limite = 5;

        // Users from a data store e.g. database
        $notificacoes = $this->notificacoes_model->get_notificacoes($id, $pagina,$limite);

        // Check if the users data store contains users (in case the database result returns NULL)
        if ($notificacoes)
        {                   
            foreach ($notificacoes as $key) {
             
                $key->notificacao = "$key->login comentou sua publicação $key->postagem";
                unset($key->login);
                unset($key->postagem);
            }
            
            // Set the response and exit
            $this->response($notificacoes, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
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
}
