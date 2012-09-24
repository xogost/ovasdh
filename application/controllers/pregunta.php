<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once 'site.php';

class Pregunta extends CI_Controller{
    function index($id) {
        $this->load->model("preguntas_model", '', true);
        $dataTest = $this->preguntas_model->readAll();
        $parameters = array("preguntasArray" => $dataTest, "id" => $id);
        $parametersView = array("view"=>'preguntas/index', "parameters" => $parameters);
        site::loadView($parametersView);
    }
    function form_new($id) {
        $parametersView = array("view"=>'preguntas/new_view', "parameters" => array("id" => $id));
        site::loadView($parametersView); 
    }
    function form_update($id, $test) {
        $this->load->model("Preguntas_model", '', true);
        $row = $this->Preguntas_model->read($id);
        $item = $row->result();
        $parametersView = array("view"=>'preguntas/update_new', "parameters" => array("id" => $id, "test" => $test, "pregunta" => $item[0]->pregunta==null?"":$item[0]->pregunta, "valor" =>$item[0]->valor==null?"":$item[0]->valor, "respuestacorrecta"=> $item[0]->respuestacorrecta==null?"":$item[0]->respuestacorrecta));
        site::loadView($parametersView);
    }
    function insert($id) {
        $this->load->model("Preguntas_model", '', true);
        $pregunta = $_POST["pregunta"];
        $valor = $_POST["valor"];
        $respuestacorrecta = $_POST["respuestacorrecta"];
        $data = array("pregunta"=>$pregunta, "valor"=> (int)$valor, "respuestacorrecta" => (int)$respuestacorrecta , "fechacreacion" => date("Y/m/d H:i:s"), "fechaactualizacion" => date("Y/m/d H:i:s"), "usuario_id"=> 1);
        $this->Preguntas_model->create($data);
        redirect(site_url("pregunta/index/$id"));
    }
    function update($id, $idtest) {
        $this->load->model("Preguntas_model", '', true);
        $pregunta = $_POST["pregunta"];
        $valor = $_POST["valor"];
        $respuestacorrecta = $_POST["respuestacorrecta"];
        $data = array("pregunta"=>$pregunta, "valor"=> (int)$valor, "respuestacorrecta" => (int)$respuestacorrecta , "fechacreacion" => date("Y/m/d H:i:s"), "fechaactualizacion" => date("Y/m/d H:i:s"), "usuario_id"=> 1);
        $this->Preguntas_model->update($id, $data);
        redirect(site_url("pregunta/index/$idtest"));
    }
}

