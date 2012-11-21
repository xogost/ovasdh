<script type="text/javascript">
    function ocultarRutasAprendizaje(data){
        data = data.split(',');
        var arrayEvaluacion =[]; 
        for (i = 0; i < 4; i++) {
            var arrayRutaAprendizajedata = [];
            if(i==0)
                arrayRutaAprendizajedata.push([data[i], data[4], "video"]);
            else if(i==1)
                arrayRutaAprendizajedata.push([data[i], data[5], "comic"]);
            else if(i==2)
                arrayRutaAprendizajedata.push([data[i], data[6], "actividades"]);
            else if(i==3)
                arrayRutaAprendizajedata.push([data[i], data[7], "test"]);
            
            arrayEvaluacion.push(arrayRutaAprendizajedata);
        }
        var htmlVideo = "";
        var htmlActividad = "";
        var htmlTest = "";
        var htmlcomic = "";
        for(i=0; i <arrayEvaluacion.length; i++){
            if(arrayEvaluacion[i][0][2] == "actividades"){
                var rutaActividades = "http://clic.xtec.cat/db/jclicApplet.jsp?project=<?php echo base_url("multimedia/Actividades/"); ?>/" + arrayEvaluacion[i][0][0] + "&amp;lang=es";
                htmlActividad = "<iframe width='600' height='400' frameborder='0' src='" + rutaActividades + "' ></iframe><br />";
            }
            else if(arrayEvaluacion[i][0][2] == "video"){
                var rutaVideo = '<?php echo base_url("multimedia/videos/"); ?>/' + arrayEvaluacion[i][0][0];
                alert(rutaVideo);
                htmlVideo = '<video width="420" height="315" controls><source src"' + rutaVideo + '" type="video/flv"></video>';
            }
        }
        
        $("#rutasAprendizaje").css("display","none");    
        $("#contentEvaliuacion").css("display","block");
        $("#evaluacion").append(htmlActividad);
        $("#evaluacion").append(htmlVideo);
    }
</script>
<h1>Listado de Rutas de aprendizaje a responder</h1>
<table id="rutasAprendizaje" class="table">
    <?php
    foreach ($arrauRutasAprendizaje as $arrayItem) {
        $registroRutaAprendizaje = "<tr><td>%s</td><td>%s</td><td><input type='button' class='btn btn-large btn-inverse' onclick='ocultarRutasAprendizaje(\"%s\");' value='Realizar Evaluación'/></td></tr>";
        echo sprintf($registroRutaAprendizaje, $arrayItem->nombre, $arrayItem->data, $arrayItem->data);
    }
    ?>
</table>
<div id="contentEvaliuacion" style="display: none;">
    <h1>Ruta de Aprendizaje</h1>
    <div id="evaluacion"></div>
</div>
