<div class="site-index">
    <p>A continuacion se describen el procedimeinto para el proceso de creacion de las rutas de aprendizaje que realizan los docentes y como los estudiantes pueden ingresar a la plataforma para ejecutar el proceso de evaluación.</p>
    <br/>
    <legend>Estudiantes</legend>
    <div class="control">
        <ol>
            <li>Los estudiantes ejecutan responden las rutas de aprendizaje creadas por el docente.</li>
        </ol>
        <button type="button" class="btn btn-large btn-inverse" onclick="window.location = '<?php echo base_url("index.php/responderRuta/index"); ?>';">Responder Rutas de Aprendizaje</button>
    </div>
    <legend>Docentes</legend>
    <div class="control">
        <ol>
            <li>Ejecuta el proceso de creacion para las rutas de aprendizaje que los estudiantes desarrollaran por medio de la aplicacion.</li>
        </ol>
        <button type="button" class="btn btn-large btn-inverse" onclick="window.location = '<?php echo base_url("index.php/rutaAprendizaje/index"); ?>';">Crear Ruta de Aprendizaje</button>
    </div>
    <br/>
    <div class="control">
        <ol start='2'>
            <li>Ejecute el proceso de creación de test.</li>
        </ol>
        <button type="button" class="btn btn-large btn-inverse" onclick="window.location = '<?php echo base_url("index.php/test/"); ?>';">Crear Test</button>
    </div>
</div>
