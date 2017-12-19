<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Comentarios_model extends CI_Model{

	public function get_comentarios($id, $pagina, $limite){
		$this->db->select('usuarios.id as id_usuario, postagem_comentario.id_comentario, usuarios.login, usuarios.assinante, comentarios.datetime, comentarios.comentario');
		$this->db->from('postagem_comentario');
		$this->db->join('postagens', 'postagens.id = postagem_comentario.id_postagem');
		$this->db->join('comentarios', 'comentarios.id = postagem_comentario.id_comentario');
		$this->db->join('usuarios', 'usuarios.id = postagens.id_usuario');

		if($id != '')
			$this->db->where('postagem_comentario.id_postagem', $id);

		$this->db->order_by('comentarios.datetime', 'DESC');
		$this->db->limit($limite, $pagina * $limite);
		
		return $this->db->get()->result_array();
	}

	public function get_ultimo_comentario($id_postagem, $id_usuario){
		$this->db->select('postagem_comentario.id_comentario, comentarios.comentario, comentarios.datetime');
		$this->db->from('postagem_comentario');
		$this->db->join('comentarios', 'comentarios.id = postagem_comentario.id_comentario');

		$this->db->where('postagem_comentario.id_postagem', $id_postagem);
		$this->db->where('comentarios.id_usuario', $id_usuario);

		$this->db->order_by('comentarios.datetime', 'DESC');
		return $this->db->get()->row();
	}

	public function insert_comentario($data){
		$post_coment['id_postagem'] = $data['id_postagem'];
		unset($data['id_postagem']);

		// Insere o comentario do banco de dados
    	if($this->db->insert('comentarios', $data)){
			$post_coment['id_comentario'] = $this->db->insert_id();
    		if($this->db->insert('postagem_comentario', $post_coment)){
    			$data_noti['id_postagem'] = $post_coment['id_postagem'];
    			$data_noti['id_usuario'] = $data['id_usuario'];
    			return $this->db->insert('notificacoes', $data_noti);
    		}else return false;
    	}
    	else return false;
	}

}
