<h1>Administracion de Test</h1>
    <p class="lead">Ingresa la información requerida para los campos disponibles, y genera un test completo luego de terminar el proceso.</p>
    <br/>
    <form id="frmTest" action="<?php echo site_url("test/update"); ?>" class="form-horizontal" method="POST">
        <legend>Actualizar Test</legend>
        <div class="control-group">
            <input type="hidden" name="id" id="id" value="<?php echo $id; ?>" />
            <input type="hidden" name="fechacreacion" id="fechacreacion" value="<?php echo $fechacreacion; ?>" />
            <label class="control-label" from="inptNombre">Nombre de Test</label>
            <div class="controls">
                <input name="nombre" id="nombre" type="text" placeholder="<?php echo $placeholder; ?>" value="<?php echo $nombre; ?>"/> 
            </div>
        </div>
        <div>
            <div class="control-group">
                <div class="controls">
                    <input type="submit" value="Actualizar" class="btn btn-primary"/> 
                </div>
            </div>
        </div>
    </form>