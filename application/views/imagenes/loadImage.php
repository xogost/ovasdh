<div>
    <form action="<?php echo site_url("imagen/cargarImagen/$id"); ?>" method="POST" enctype="multipart/form-data">
        <label for="file">Seleccione la imagen a cargar:</label>
        <input name="file" type="file"  />
        <input name="nombre" type="text" placeholder="Nombre de Imagen" value="" />
        <input type="submit" />
    </form>
</div>
