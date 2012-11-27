<script type="text/javascript">
    function ocultarRutasAprendizaje(data){
        data = data.split(',');
        var arrayEvaluacion =[]; 
        for (i = 0; i < 5; i++) {
            var arrayRutaAprendizajedata = [];
            if(i==0)
                arrayRutaAprendizajedata.push([data[i], data[5], "video"]);
            else if(i==1)
                arrayRutaAprendizajedata.push([data[i], data[6], "comic"]);
            else if(i==2)
                arrayRutaAprendizajedata.push([data[i], data[7], "actividades"]);
            else if(i==3)
                arrayRutaAprendizajedata.push([data[i], 0, "presentacion"]);
            else if(i==4)
                arrayRutaAprendizajedata.push([data[i], data[8], "test"]);
            
            arrayEvaluacion.push(arrayRutaAprendizajedata);
        }
        var htmlVideo = "";
        var htmlActividad = "";
        var htmlPresentacion = "";
        var htmlTest = "<legend>Test Evaluativo</legend>";
        var htmlcomic = "";
        for(i=0; i <arrayEvaluacion.length; i++){
            if(arrayEvaluacion[i][0][2] == "presentacion" && arrayEvaluacion[i][0][1] == 0){
                var rutaPresentacion = "<?php echo base_url("multimedia/Presentaciones/"); ?>/" + arrayEvaluacion[i][0][0];
                htmlPresentacion = '<legend>Presentación</legend><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="600" height="400">';
                htmlPresentacion += '<param name="movie" value="'+rutaPresentacion+'" />';
                htmlPresentacion += '<param name="quality" value="high" />';
                htmlPresentacion += '<embed src="'+rutaPresentacion+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"></embed>';
                htmlPresentacion += '</object>';
            }
            if(arrayEvaluacion[i][0][2] == "actividades" && arrayEvaluacion[i][0][1] == 1){
                var rutaActividades = "http://clic.xtec.cat/db/jclicApplet.jsp?project=<?php echo base_url("multimedia/Actividades/"); ?>/" + arrayEvaluacion[i][0][0] + "&amp;lang=es";
                htmlActividad = "<legend>Actividad</legend><iframe width='600' height='400' frameborder='0' src='" + rutaActividades + "' ></iframe><br />";
            }
            else if(arrayEvaluacion[i][0][2] == "video" && arrayEvaluacion[i][0][1] == 1){
                var rutaVideo = '<?php echo base_url("multimedia/videos/"); ?>/' + arrayEvaluacion[i][0][0];
                htmlVideo ='<legend>Video</legend><object width="600" height="400" data="video.flv">';
                htmlVideo += '<param name="movie" value="' + rutaVideo + '">';
                htmlVideo += '<embed src="' + rutaVideo + '" width="600" height="400">';
                htmlVideo += '</object>';
            }
            else if(arrayEvaluacion[i][0][2] == "comic" && arrayEvaluacion[i][0][1] == 1){
                var rutaComic = '<?php echo base_url("multimedia/Comic/"); ?>/' + arrayEvaluacion[i][0][0];
                htmlcomic = '<legend>Comic</legend><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="600" height="400">';
                htmlcomic += '<param name="movie" value="'+ rutaComic +'" />';
                htmlcomic += '<param name="quality" value="high" />';
                htmlcomic += '<embed src="'+ rutaComic +'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="600" height="400"></embed>';
                htmlcomic += '</object>';
            }
            else if(arrayEvaluacion[i][0][2] == "test" && arrayEvaluacion[i][0][1] == 4){
                
            }
        }
        
        $("#rutasAprendizaje").css("display","none");    
        $("#contentEvaliuacion").css("display","block");
        $("#evaluacion").append(htmlPresentacion);
        $("#evaluacion").append(htmlActividad);
        $("#evaluacion").append(htmlVideo);
        $("#evaluacion").append(htmlcomic);
        $("#evaluacion").append(htmlTest);
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
