/*
SQLyog Ultimate v9.63 
MySQL - 5.0.51b-community-nt-log : Database - cuestionario
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cuestionario` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;

USE `cuestionario`;

/*Table structure for table `imagenes` */

DROP TABLE IF EXISTS `imagenes`;

CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de tabla imagenes',
  `ruta` varchar(200) collate utf8_spanish_ci NOT NULL COMMENT 'Rutas para las imagenes a asignar en las preguntas del test',
  `pregunta_id` int(11) NOT NULL COMMENT 'Identificador de pregunta a la que pertenece',
  `orden` int(1) default '0' COMMENT 'Orden en que se mostraran las imagenes',
  `nombre` varchar(100) collate utf8_spanish_ci default 'NO ASIGNADO' COMMENT 'Nombre de la imagen a buscar en el texto cuando se va a reemplazar',
  PRIMARY KEY  (`id`),
  KEY `FK_imagenes` (`pregunta_id`),
  CONSTRAINT `FK_imagenes` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena la ruta de las imagenes que pertenecen a las pregun';

/*Data for the table `imagenes` */

insert  into `imagenes`(`id`,`ruta`,`pregunta_id`,`orden`,`nombre`) values (9,'Puesta de sol.jpg',13,0,'');

/*Table structure for table `orden` */

DROP TABLE IF EXISTS `orden`;

CREATE TABLE `orden` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de tabla',
  `test_id` int(11) default NULL COMMENT 'Identificador para test',
  `orden_test` int(11) default NULL COMMENT 'Orden para la presentacion el test',
  PRIMARY KEY  (`id`),
  KEY `FK_orden` (`test_id`),
  CONSTRAINT `FK_orden` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena el orden de las tareas para principal';

/*Data for the table `orden` */

/*Table structure for table `preguntas` */

DROP TABLE IF EXISTS `preguntas`;

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Idetificador de la tabla',
  `pregunta` varchar(255) collate utf8_spanish_ci default NULL COMMENT 'Texto para la pregunta planteada',
  `valor` int(11) default NULL COMMENT 'Valor asignado a la pregunta',
  `respuestacorrecta` int(11) default NULL COMMENT 'Id de respuesta correcta para la pregunta',
  `fechacreacion` datetime default NULL COMMENT 'Fecha de creacion',
  `fechaactualizacion` datetime default NULL COMMENT 'Fecha de actualizacion',
  `usuario_id` int(11) default NULL COMMENT 'Usuario que modifico o actualizo la pregunta',
  `idtest` int(11) default NULL COMMENT 'Identificador de test al que pertenece',
  `subcategoria` varchar(255) collate utf8_spanish_ci default NULL COMMENT 'Identificador para la subcategoria asignada',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `preguntas` */

insert  into `preguntas`(`id`,`pregunta`,`valor`,`respuestacorrecta`,`fechacreacion`,`fechaactualizacion`,`usuario_id`,`idtest`,`subcategoria`) values (13,'lp',30,1,'2012-11-28 20:51:49','2012-11-28 20:51:49',1,26,'esofago'),(14,'Pregunta No1 Diferenciacion',445,1,'2013-01-23 15:15:16','2013-01-23 15:15:16',1,-1,'Transformación Mental');

/*Table structure for table `principal` */

DROP TABLE IF EXISTS `principal`;

CREATE TABLE `principal` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de la tabla principal',
  `nombre` varchar(100) collate utf8_spanish_ci default 'No Asigando',
  `fechacreacion` datetime default NULL,
  `fechaactualizacion` datetime default NULL,
  `usuario_id` int(11) default NULL,
  `orden_id` int(11) default NULL COMMENT 'Orden para el test, comic, y video',
  PRIMARY KEY  (`id`),
  KEY `FK_principal` (`orden_id`),
  CONSTRAINT `FK_principal` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `principal` */

/*Table structure for table `respuestas` */

DROP TABLE IF EXISTS `respuestas`;

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de respuesta',
  `pregunta_id` int(11) NOT NULL COMMENT 'Identificador de la pregunta a la que pertenece',
  `texto` varchar(255) collate utf8_bin default NULL COMMENT 'Texto de la respuesta',
  `fechacreacion` datetime default NULL COMMENT 'Fecha de creacion',
  `fechaactualizacion` datetime default NULL COMMENT 'Fecha de actualizacion',
  `usuario_id` int(11) default NULL COMMENT 'Identificador de usuario',
  PRIMARY KEY  (`id`),
  KEY `FK_respuestas` (`pregunta_id`),
  CONSTRAINT `FK_respuestas` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `respuestas` */

insert  into `respuestas`(`id`,`pregunta_id`,`texto`,`fechacreacion`,`fechaactualizacion`,`usuario_id`) values (30,13,'ju','2012-11-28 20:54:29','2012-11-28 20:54:29',1),(31,13,'yu','2012-11-28 20:54:29','2012-11-28 20:54:29',1),(32,13,'lk','2012-11-28 20:54:29','2012-11-28 20:54:29',1),(33,13,'po','2012-11-28 20:54:29','2012-11-28 20:54:29',1),(34,14,'asdasd','2013-01-23 15:15:26','2013-01-23 15:15:26',1),(35,14,'asdasd','2013-01-23 15:15:26','2013-01-23 15:15:26',1),(36,14,'asdasd','2013-01-23 15:15:26','2013-01-23 15:15:26',1),(37,14,'asdasd','2013-01-23 15:15:26','2013-01-23 15:15:26',1);

/*Table structure for table `rutaaprendizaje` */

DROP TABLE IF EXISTS `rutaaprendizaje`;

CREATE TABLE `rutaaprendizaje` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(255) collate utf8_spanish_ci NOT NULL default 'NO ASIGNADO',
  `data` varchar(255) collate utf8_spanish_ci NOT NULL default '{}',
  `usuario_id` int(11) default NULL,
  `fecha_creacion` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `rutaaprendizaje` */

insert  into `rutaaprendizaje`(`id`,`nombre`,`data`,`usuario_id`,`fecha_creacion`) values (22,'pri','alto.flv,comic_alto.swf,act_alto.jclic.zip,presalto.swf,,2,1,3,0,4',1,'0000-00-00'),(23,'dos','alto.flv,comic_alto.swf,act_alto.jclic.zip,presalto.swf,,,1,2,0,4',1,'0000-00-00'),(24,'tres','alto.flv,comic_alto.swf,act_alto.jclic.zip,presalto.swf,,1,,2,0,4',1,'0000-00-00'),(25,'Ruta JC','medio.flv,comic_medio.swf,act_medio.jclic.zip,presmedio.swf,26,2,1,3,0,4',1,'0000-00-00'),(26,'Test 1 Prueba JC','alto.flv,comic_alto.swf,act_alto.jclic.zip,presalto.swf,26,2,1,3,0,4',1,'0000-00-00');

/*Table structure for table `sf_config` */

DROP TABLE IF EXISTS `sf_config`;

CREATE TABLE `sf_config` (
  `sf_id` int(5) unsigned NOT NULL auto_increment,
  `sf_table` varchar(64) NOT NULL default '',
  `sf_field` varchar(64) NOT NULL default '',
  `sf_type` varchar(16) default 'default',
  `sf_related` varchar(100) default '',
  `sf_label` varchar(64) default '',
  `sf_desc` tinytext,
  `sf_order` int(3) default NULL,
  `sf_hidden` int(1) default '0',
  PRIMARY KEY  (`sf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `sf_config` */

insert  into `sf_config`(`sf_id`,`sf_table`,`sf_field`,`sf_type`,`sf_related`,`sf_label`,`sf_desc`,`sf_order`,`sf_hidden`) values (1,'orden','id','default','','',NULL,NULL,0),(2,'orden','test_id','default','','',NULL,NULL,0),(3,'orden','orden_test','default','','',NULL,NULL,0),(4,'preguntas','id','default','','',NULL,NULL,0),(5,'preguntas','pregunta','default','','',NULL,NULL,0),(6,'preguntas','valor','default','','',NULL,NULL,0),(7,'preguntas','respuestacorrecta','default','','',NULL,NULL,0),(8,'preguntas','fechacreacion','default','','',NULL,NULL,0),(9,'preguntas','fechaactualizacion','default','','',NULL,NULL,0),(10,'preguntas','usuario_id','default','','',NULL,NULL,0),(11,'principal','id','default','','',NULL,NULL,0),(12,'principal','nombre','default','','',NULL,NULL,0),(13,'principal','fechacreacion','default','','',NULL,NULL,0),(14,'principal','fechaactualizacion','default','','',NULL,NULL,0),(15,'principal','usuario_id','default','','',NULL,NULL,0),(16,'principal','orden_id','default','','',NULL,NULL,0),(17,'respuestas','id','default','','',NULL,NULL,0),(18,'respuestas','pregunta_id','default','','',NULL,NULL,0),(19,'respuestas','texto','default','','',NULL,NULL,0),(20,'respuestas','fechacreacion','default','','',NULL,NULL,0),(21,'respuestas','fechaactualizacion','default','','',NULL,NULL,0),(22,'respuestas','usuario_id','default','','',NULL,NULL,0),(23,'test','id','default','','',NULL,NULL,0),(24,'test','nombre','default','','',NULL,NULL,0),(25,'test','fechacreacion','default','','',NULL,NULL,0),(26,'test','fechaactualizacion','default','','',NULL,NULL,0),(27,'test','usuario_id','default','','',NULL,NULL,0),(28,'test_preguntas','id','default','','',NULL,NULL,0),(29,'test_preguntas','test_id','default','','',NULL,NULL,0),(30,'test_preguntas','pregunta_id','default','','',NULL,NULL,0),(31,'test_preguntas','fechacreacion','default','','',NULL,NULL,0),(32,'test_preguntas','fechaactualizacion','default','','',NULL,NULL,0),(33,'test_preguntas','usuario_id','default','','',NULL,NULL,0);

/*Table structure for table `subcategorias` */

DROP TABLE IF EXISTS `subcategorias`;

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de subcategoria',
  `sistema_digestivo` varchar(255) collate utf8_spanish_ci default 'No Asignado' COMMENT 'Sistema digestivo al que pertenece la subcategoria',
  `subcategoria` varchar(255) collate utf8_spanish_ci default 'No Asignado',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `subcategorias` */

insert  into `subcategorias`(`id`,`sistema_digestivo`,`subcategoria`) values (1,'alto','dientes'),(2,'alto','lengua'),(3,'alto','glandulas salivales'),(4,'alto','esofago'),(5,'medio','estomago'),(6,'medio','No Asignado'),(7,'medio','No Asignado'),(8,'bajo','intestino delgado'),(9,'bajo','intestino grueso'),(10,'final','Identificación'),(11,'final','Diferenciación'),(12,'final','Representación Mental'),(13,'final','Transformación Mental'),(14,'final','Comparación'),(15,'final','Clasificación'),(16,'final','Codificación'),(17,'final','Descodificación'),(18,'final','Proyección'),(19,'final','Análisis'),(20,'final','Síntesis'),(21,'final','Inferencia Lógica'),(22,'final','Razonamiento Analógico'),(23,'final','Razonamiento Hipotético'),(24,'final','Razonamiento Transitivo'),(25,'final','Razonamiento Silogístico'),(26,'final','Pensamiento Divergente-Convergente'),(27,'final','Conceptualización');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de tabla',
  `nombre` varchar(255) collate utf8_spanish_ci default NULL COMMENT 'Nombre de test o descripcion',
  `valor` int(11) default NULL COMMENT 'Valor con el cual puede aprobar el test',
  `fechacreacion` datetime default NULL COMMENT 'Fecha creacion',
  `fechaactualizacion` datetime default NULL COMMENT 'Fecha actualizacion',
  `usuario_id` int(11) default NULL COMMENT 'Identificador del usuario',
  `tipo` varchar(255) collate utf8_spanish_ci default NULL COMMENT 'Tipo de test Alto Medio Bajo',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `test` */

insert  into `test`(`id`,`nombre`,`valor`,`fechacreacion`,`fechaactualizacion`,`usuario_id`,`tipo`) values (26,'lk',30,'2012-11-28 20:51:07','2013-01-22 12:04:11',1,'alto');

/*Table structure for table `test_preguntas` */

DROP TABLE IF EXISTS `test_preguntas`;

CREATE TABLE `test_preguntas` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identificador de tabla',
  `test_id` int(11) default NULL COMMENT 'Identificador de test al que pertenece',
  `pregunta_id` int(11) default NULL COMMENT 'Identificador de pregunta a la que pertenece',
  `fechacreacion` datetime default NULL COMMENT 'fecha de creacion',
  `fechaactualizacion` datetime default NULL COMMENT 'fecha de actualizacion',
  `usuario_id` int(11) default NULL COMMENT 'identificador de usuario',
  PRIMARY KEY  (`id`),
  KEY `FK_test_preguntas` (`test_id`),
  KEY `FK_test_preguntas_many` (`pregunta_id`),
  CONSTRAINT `FK_test_preguntas` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_test_preguntas_many` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `test_preguntas` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
