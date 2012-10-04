<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Imagen extends CI_Controller{
    function cargarImagen($id){
        var_dump($_POST);
        $ruta = $_FILES["file"]["name"];
        $nombre = $_POST["nombre"];
        $destino = "files/".$_FILES["file"]["name"];
        $pregunta_id = $id;
        $this->load->model('Imagenes_model','',true);
        $data = array('ruta'=>$ruta, 'nombre'=>$nombre, 'pregunta_id'=>$pregunta_id);
        $okInsert = $this->Imagenes_model->create($data);
        
        if($okInsert){
            if(copy($_FILES["file"]["tmp_name"], $destino))
                echo "ok";
            else
                echo "Error";
        }
        else
            echo "error";
    }
}
