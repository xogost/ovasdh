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
        console.log(arrayEvaluacion);
        var a = arrayEvaluacion.sort(arrayEvaluacion[0][1][1]);
        console.log(a);
        $("#rutasAprendizaje").css("display","none");    
        $("#evaluacion").html();
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
<div style="display: none;">
    <h1>Ruta de Aprendizaje</h1>
    <div id="evaluacion"></div>
</div>
