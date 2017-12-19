<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Postagens_model extends CI_Model{

	public function get_postagem($id){
		$this->db->select('usuarios.id as id_usuario, usuarios.login, usuarios.assinante');
		$this->db->from('postagens');
		$this->db->join('usuarios', 'usuarios.id = postagens.id_usuario');
		$this->db->where('postagens.id', $id);
		return $this->db->get()->row();
	}

	public function get_postagens($id){
		$this->db->select('usuarios.id as id_usuario, postagem_comentario.id_comentario, usuarios.login, usuarios.assinante, comentarios.datetime, comentarios.comentario');
		$this->db->from('postagem_comentario');
		$this->db->join('postagens', 'postagens.id = postagem_comentario.id_postagem');
		$this->db->join('comentarios', 'comentarios.id = postagem_comentario.id_comentario');
		$this->db->join('usuarios', 'usuarios.id = postagens.id_usuario');

		if($id != '')
			$this->db->where('postagens.id', $id);

		$this->db->order_by('comentarios.datetime', 'DESC');
		return $this->db->get()->result_array();
	}

}
