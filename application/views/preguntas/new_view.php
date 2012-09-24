<div id="contentTest">
    <h1>Administracion de Test</h1>
    <p class="lead">Ingresa la información requerida para los campos disponibles, y genera una pregunta completa luego de terminar el proceso.</p>
    <br/>
    <form id="frmTest" action="<?php echo site_url("pregunta/insert/$id"); ?>" class="form-horizontal" method="POST">
        <legend>Agregar Nueva Pregunta</legend>
        <div class="control-group">
            <label class="control-label" from="pregunta">Pregunta</label>
            <div class="controls">
                <input name="pregunta" id="pregunta" type="text" placeholder="Ingrese texto aqui..." value=""/> 
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" from="valor">Valor</label>
            <div class="controls">
                <input name="valor" id="valor" type="text" placeholder="Ingrese texto aqui..." value=""/> 
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" from="respuestacorrecta">Respuesta Correcta</label>
            <div class="controls">
                <input name="respuestacorrecta" id="respuestacorrecta" type="text" placeholder="Ingrese texto aqui..." value=""/> 
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
</div>
