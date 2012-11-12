<script type="text/javascript">
    var textPregunta = "";
    var arrayImagenes = new Array(); 
    $(document).ready(function(){
        textPregunta = $("#prevPregunta").html();
    });
    function prev(){
        for (var item in arrayImagenes) {
            var search = "["+arrayImagenes[item][0]+"]";
            textPregunta = textPregunta.replace(search," " + arrayImagenes[item][1] + " ");
        }
        $("#prevPregunta").html(textPregunta);
    }
</script>
<div id="contentTest">
    <h1>Administracion de Test</h1>
    <p class="lead">Ingresa la información requerida para los campos disponibles, y genera una pregunta completa luego de terminar el proceso.</p>
    <br/>
    <form id="frmTest" action="<?php echo site_url("pregunta/update/$id/$test"); ?>" class="form-horizontal" method="POST">
        <legend>Agregar Nueva Pregunta</legend>
        <div class="control-group">
            <input type="hidden" value="<?php echo $id; ?>" />
            <label class="control-label" from="pregunta">Pregunta</label>
            <div class="controls">
                <textarea style="width: 80%;" name="pregunta" id="pregunta" placeholder="Ingrese texto aqui..." ><?php echo $pregunta; ?></textarea> 
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" from="valor">Valor</label>
            <div class="controls">
                <input name="valor" id="valor" type="text" placeholder="Ingrese texto aqui..." value="<?php echo $valor; ?>"/> 
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" from="respuestacorrecta">Respuesta Correcta</label>
            <div class="controls">
                <input name="respuestacorrecta" id="respuestacorrecta" type="text" placeholder="Ingrese texto aqui..." value="<?php echo $respuestacorrecta; ?>"/> 
            </div>
        </div>
        <div>
            <div class="control-group">
                <div class="controls">
                    <input type="submit" value="Guardar" class="btn btn-primary"/> 
                </div>
            </div>
        </div>
    </form>
    <legend>Previzualización de pregunta</legend>
    <p id="prevPregunta"><?php echo $pregunta; ?></p> 
    
    <button onclick="prev();">Previsualizar</button>
</div>
