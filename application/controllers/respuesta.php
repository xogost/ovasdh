<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Respuesta extends CI_Controller {

    function agregar($pregunta_id, $respuesta1, $respuesta2, $respuesta3, $respuesta4) {
        $this->load->model('Respuestas_model', '', true);
        $texto = "";
        for ($i = 0; $i < 4; $i++) {
            switch ($i) {
                case 0:
                    $texto = $respuesta1;
                    break;
                case 1:
                    $texto = $respuesta2;
                    break;
                case 2:
                    $texto = $respuesta3;
                    break;
                case 3:
                    $texto = $respuesta4;
                    break;
            }
            $texto = str_replace("%20", " ", $texto);
            $data = array(
                'pregunta_id' => $pregunta_id,
                'texto' => $texto,
                'fechacreacion' => date("Y/m/d H:i:s"),
                'fechaactualizacion' => date("Y/m/d H:i:s"),
                'usuario_id' => 1);
            $this->Respuestas_model->create($data);
        }
        echo "Las respuestas se almacenaron correctamente";
    }
    
    function obtener($pregunta_id) {
        $this->load->model('Respuestas_model', '', true);
        $arrayRespuestas = $this->Respuestas_model->read((int)$pregunta_id);
        echo json_encode($arrayRespuestas->result());
    }
    

}
