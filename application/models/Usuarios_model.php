<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usuarios_model extends CI_Model{

	public function get_usuario($id){
		return $this->db->where('id', $id)->get('usuarios')->row();
	}
}
