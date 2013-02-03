<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

require_once 'site.php';

class examenfinal extends CI_Controller {

    function index() {
        $this->load->model("Subcategorias_model", 'Subcategorias', true);
        $this->load->model("Preguntas_model", 'Preguntas', true);
        $this->load->model("Respuestas_model", 'Respuestas', true);
        $this->load->model("Imagenes_model", 'Imagenes', true);
        $html = "<ol>";
        $subcategorias = $this->Subcategorias->getsubcategoriasFinalQuestionary();
        foreach($subcategorias->result() as $subcategoria) {
            $dataTest = $this->Preguntas->readFinalQuestionary($subcategoria->subcategoria);
            foreach ($dataTest->result() as $itemPregunta) {
                $textoPregunta = "<li><p>$itemPregunta->pregunta:</p>";
                $respuestaCorrecta = $itemPregunta->respuestacorrecta;
                $valorRespuestaCorrecta = $itemPregunta->valor;
                $arrayImagenes = $this->Imagenes->read($itemPregunta->id);
                foreach ($arrayImagenes->result() as $itemImagen) {
                    $textoPregunta = str_replace("[" . $itemImagen->nombre . "]", "<img width='70px' height='70px' class='img-polaroid' src='" . base_url("files") . "/$itemImagen->ruta'/>", $textoPregunta);
                }
                $html .= $textoPregunta;
                $arrayRespuestas = $this->Respuestas->read($itemPregunta->id);
                $html .= "<ol type='A' style='font-weight: bold;'>";
                $consecutivoRespuesta = 1;
                foreach ($arrayRespuestas->result() as $itemRespuesta) {
                    $funcionJavaScriptSuma = "";
                    if ($consecutivoRespuesta == $respuestaCorrecta)
                        $funcionJavaScriptSuma = "onclick='sumar($valorRespuestaCorrecta);'";
                    $html .= "<li><label for='radio$itemRespuesta->id'>$itemRespuesta->texto</label><input name='preg$itemPregunta->id' type='radio' $funcionJavaScriptSuma id='radio$itemRespuesta->id' value='$itemRespuesta->id'/></li>";
                    $consecutivoRespuesta++;
                }
                $html .= "</ol></li>";
            }
        }
        $html .= "</ol><br/><button class='btn btn-large btn-inverse' onclick=\"alert('El examen final se envió correctamente.');\">Guardar y Enviar</button>";
        $parameters = array('html' => $html);
        $parametersView = array(
            array("view" => 'examenfinal/index', "parameters" => $parameters)
        );
        site::loadView($parametersView);
    }

}