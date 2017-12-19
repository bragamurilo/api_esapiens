<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Notificacoes_model extends CI_Model{

	public function get_notificacoes($id,$pagina,$limite){
		$this->db->select('notificacoes.id, notificacoes.id_postagem, notificacoes.id_usuario, usuarios.login, postagens.postagem,  notificacoes.datetime');
		$this->db->from('notificacoes');
		$this->db->join('usuarios', 'usuarios.id=notificacoes.id_usuario');
		$this->db->join('postagens', 'postagens.id=notificacoes.id_postagem');

		if($id != '')
			$this->db->where('postagens.id_usuario', $id);
		$this->db->limit($limite, $pagina * $limite);

		return $this->db->get()->result();
	}
}
