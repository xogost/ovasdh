<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

require_once 'site.php';

class Test extends CI_Controller {

    function index() {
        $this->load->model("Test_model", '', true);
        $dataTest = $this->Test_model->selectAll();
        $parameters = array("testArray" => $dataTest);
        $parametersView = array(
            array("view" => 'test/list_view', "parameters" => $parameters)
        );
        site::loadView($parametersView);
    }

    function form_new() {
        $parametersView = array(
            array("view" => 'test/new_view', "parameters" => '')
        );
        site::loadView($parametersView);
    }

    function form_update($id) {
        $this->load->model("Test_model", '', true);
        $row = $this->Test_model->selectOne($id)->result();
        if (isset($row[0]->nombre))
            $parameters = array("id" => $id, "fechacreacion" => $row[0]->fechacreacion, "nombre" => $row[0]->nombre, "tipo" => $row[0]->tipo, "placeholder" => 'Nombre No Asignado ...');
        else
            $parameters = array("id" => $id, "fechacreacion" => $row[0]->fechacreacion, "nombre" => '', "placeholder" => 'Nombre No Asignado ...');

        $parametersView = array(
            array("view" => 'test/update_view', "parameters" => $parameters)
        );
        site::loadView($parametersView);
    }

    function insert() {
        $nombre = $_POST["nombre"];
        $tipo = $_POST["tipo"];
        $this->load->model("Test_model", '', true);
        $data = array("nombre" => $nombre, "tipo" => $tipo,"fechacreacion" => date("Y/m/d H:i:s"), "fechaactualizacion" => date("Y/m/d H:i:s"), "usuario_id" => 1);
        $this->Test_model->create($data);
        redirect(site_url("test/index"));
    }

    function update() {
        $id = $_POST["id"];
        $nombre = $_POST["nombre"];
        $tipo = $_POST["tipo"];
        $fechacreacion = $_POST["fechacreacion"];
        $this->load->model("Test_model", '', true);
        $data = array("id" => (int) $id, "nombre" => $nombre,"tipo" => $tipo, "fechacreacion" => $fechacreacion, "fechaactualizacion" => date("Y/m/d H:i:s"), "usuario_id" => 1);
        $this->Test_model->update($data);
        redirect(site_url("test/index"));
    }
    
    function getTest(){
        $this->load->model("Test_model", 'Test', true);
        $testArray = $this->Test->selectAll();
        echo json_encode($testArray->result());
    }

}
