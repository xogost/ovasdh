/*
SQLyog Ultimate v8.5 
MySQL - 5.5.24-log : Database - cuestionario
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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla imagenes',
  `ruta` varchar(200) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Rutas para las imagenes a asignar en las preguntas del test',
  `pregunta_id` int(11) NOT NULL COMMENT 'Identificador de pregunta a la que pertenece',
  `orden` int(1) DEFAULT '0' COMMENT 'Orden en que se mostraran las imagenes',
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT 'NO ASIGNADO' COMMENT 'Nombre de la imagen a buscar en el texto cuando se va a reemplazar',
  PRIMARY KEY (`id`),
  KEY `FK_imagenes` (`pregunta_id`),
  CONSTRAINT `FK_imagenes` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena la ruta de las imagenes que pertenecen a las pregun';

/*Data for the table `imagenes` */

insert  into `imagenes`(`id`,`ruta`,`pregunta_id`,`orden`,`nombre`) values (2,'goldengatebridge-001-san-francisco1.jpg',5,0,'San Francisco'),(3,'avengers_by_jprart.jpg',5,0,'Prueba de imagen'),(4,'yo - Pacho.jpg',10,0,'yo'),(8,'USA_San_Francisco_Golden_Gate_by_angelcostavillacrez.jpg',10,0,'san fran');

/*Table structure for table `orden` */

DROP TABLE IF EXISTS `orden`;

CREATE TABLE `orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla',
  `test_id` int(11) DEFAULT NULL COMMENT 'Identificador para test',
  `orden_test` int(11) DEFAULT NULL COMMENT 'Orden para la presentacion el test',
  PRIMARY KEY (`id`),
  KEY `FK_orden` (`test_id`),
  CONSTRAINT `FK_orden` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena el orden de las tareas para principal';

/*Data for the table `orden` */

/*Table structure for table `preguntas` */

DROP TABLE IF EXISTS `preguntas`;

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Idetificador de la tabla',
  `pregunta` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Texto para la pregunta planteada',
  `valor` int(11) DEFAULT NULL COMMENT 'Valor asignado a la pregunta',
  `respuestacorrecta` int(11) DEFAULT NULL COMMENT 'Id de respuesta correcta para la pregunta',
  `fechacreacion` datetime DEFAULT NULL COMMENT 'Fecha de creacion',
  `fechaactualizacion` datetime DEFAULT NULL COMMENT 'Fecha de actualizacion',
  `usuario_id` int(11) DEFAULT NULL COMMENT 'Usuario que modifico o actualizo la pregunta',
  `idtest` int(11) DEFAULT NULL COMMENT 'Identificador de test al que pertenece',
  `subcategoria` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Identificador para la subcategoria asignada',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `preguntas` */

insert  into `preguntas`(`id`,`pregunta`,`valor`,`respuestacorrecta`,`fechacreacion`,`fechaactualizacion`,`usuario_id`,`idtest`,`subcategoria`) values (5,'Pregunta No .2 y en san francisco [San Francisco] [Prueba de imagen]',5,4,'2012-11-21 16:26:20','2012-11-21 16:26:20',1,NULL,NULL),(6,'Pregunta No. 1',1,5,'2012-09-23 23:03:24','2012-09-23 23:03:24',1,NULL,NULL),(7,'Pregunta Reunion Noche',36,1,'2012-09-24 21:13:12','2012-09-24 21:13:12',1,NULL,NULL),(8,'Pregunta No. 1',12,2,'2012-11-27 03:03:57','2012-11-27 03:03:57',1,NULL,NULL),(9,'Pregunta No. 2',32,1,'2012-11-27 03:19:52','2012-11-27 03:19:52',1,24,'lengua'),(10,'Pregunta No. 1 [yo] y despues [san fran]',12,1,'2012-11-27 07:09:05','2012-11-27 07:09:05',1,25,'intestino delgado'),(11,'Pregunta No. 2',2,1,'2012-11-27 06:22:42','2012-11-27 06:22:42',1,25,'intestino delgado'),(12,'Pregunta No. 3',12,2,'2012-11-27 06:22:52','2012-11-27 06:22:52',1,25,'intestino delgado');

/*Table structure for table `principal` */

DROP TABLE IF EXISTS `principal`;

CREATE TABLE `principal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla principal',
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT 'No Asigando',
  `fechacreacion` datetime DEFAULT NULL,
  `fechaactualizacion` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `orden_id` int(11) DEFAULT NULL COMMENT 'Orden para el test, comic, y video',
  PRIMARY KEY (`id`),
  KEY `FK_principal` (`orden_id`),
  CONSTRAINT `FK_principal` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `principal` */

/*Table structure for table `respuestas` */

DROP TABLE IF EXISTS `respuestas`;

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de respuesta',
  `pregunta_id` int(11) NOT NULL COMMENT 'Identificador de la pregunta a la que pertenece',
  `texto` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'Texto de la respuesta',
  `fechacreacion` datetime DEFAULT NULL COMMENT 'Fecha de creacion',
  `fechaactualizacion` datetime DEFAULT NULL COMMENT 'Fecha de actualizacion',
  `usuario_id` int(11) DEFAULT NULL COMMENT 'Identificador de usuario',
  PRIMARY KEY (`id`),
  KEY `FK_respuestas` (`pregunta_id`),
  CONSTRAINT `FK_respuestas` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `respuestas` */

insert  into `respuestas`(`id`,`pregunta_id`,`texto`,`fechacreacion`,`fechaactualizacion`,`usuario_id`) values (10,5,'LKSDJFKSJDFKL','2012-10-06 22:34:19','2012-10-09 21:56:55',1),(11,5,'LKASJDKAJSDKJ','2012-10-06 22:34:19','2012-10-09 21:56:55',1),(12,5,'Respuesta No. lajdklajd','2012-10-06 22:34:19','2012-10-09 21:56:55',1),(13,5,'Respuesta No. Traja','2012-10-06 22:34:19','2012-10-09 21:56:55',1),(14,9,'Respuesta No1','2012-11-27 03:20:30','2012-11-27 03:20:30',1),(15,9,'Respuesta No2','2012-11-27 03:20:30','2012-11-27 03:20:30',1),(16,9,'Respuesta No3','2012-11-27 03:20:30','2012-11-27 03:20:30',1),(17,9,'Respuesta No4','2012-11-27 03:20:30','2012-11-27 03:20:30',1),(18,10,'respuesta No 1','2012-11-27 06:23:13','2012-11-27 06:23:13',1),(19,10,'respuesta No 2','2012-11-27 06:23:13','2012-11-27 06:23:13',1),(20,10,'respuesta No 3','2012-11-27 06:23:13','2012-11-27 06:23:13',1),(21,10,'respuesta No 4','2012-11-27 06:23:13','2012-11-27 06:23:13',1),(22,11,'respuesta No 2','2012-11-27 06:23:33','2012-11-27 06:23:33',1),(23,11,'respuesta No 3','2012-11-27 06:23:33','2012-11-27 06:23:33',1),(24,11,'respuesta No 4','2012-11-27 06:23:33','2012-11-27 06:23:33',1),(25,11,'respuesta No 5','2012-11-27 06:23:33','2012-11-27 06:23:33',1),(26,12,'respuesta No 1','2012-11-27 06:23:52','2012-11-27 06:23:52',1),(27,12,'respuesta No 2','2012-11-27 06:23:52','2012-11-27 06:23:52',1),(28,12,'respuesta No 3','2012-11-27 06:23:52','2012-11-27 06:23:52',1),(29,12,'respuesta No 4','2012-11-27 06:23:52','2012-11-27 06:23:52',1);

/*Table structure for table `rutaaprendizaje` */

DROP TABLE IF EXISTS `rutaaprendizaje`;

CREATE TABLE `rutaaprendizaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'NO ASIGNADO',
  `data` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '{}',
  `usuario_id` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `rutaaprendizaje` */

insert  into `rutaaprendizaje`(`id`,`nombre`,`data`,`usuario_id`,`fecha_creacion`) values (12,'Ruta 1','alto.flv,comic_alto.swf,act_alto.jclic.zip,22,,3,2,1,0,4',1,'0000-00-00'),(13,'Ruta 2','alto.flv,comic_alto.swf,act_alto.jclic.zip,presalto.swf,22,3,2,1,0,4',1,'0000-00-00'),(14,'Ruta bajo','bajo.flv,comic_bajo.swf,act_bajo.jclic.zip,presbajo.swf,25,3,2,1,0,4',1,'0000-00-00'),(15,'Ruta medio','medio.flv,comic_medio.swf,act_medio.jclic.zip,presmedio.swf,25,3,1,2,0,4',1,'0000-00-00'),(16,'Ruta medio correc','medio.flv,comic_medio.swf,act_medio.jclic.zip,presmedio.swf,25,1,3,2,0,4',1,'0000-00-00'),(17,'Ruta comic','alto.flv,comic_alto.swf,act_alto.jclic.zip,presalto.swf,22,2,1,3,0,4',1,'0000-00-00');

/*Table structure for table `sf_config` */

DROP TABLE IF EXISTS `sf_config`;

CREATE TABLE `sf_config` (
  `sf_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `sf_table` varchar(64) NOT NULL DEFAULT '',
  `sf_field` varchar(64) NOT NULL DEFAULT '',
  `sf_type` varchar(16) DEFAULT 'default',
  `sf_related` varchar(100) DEFAULT '',
  `sf_label` varchar(64) DEFAULT '',
  `sf_desc` tinytext,
  `sf_order` int(3) DEFAULT NULL,
  `sf_hidden` int(1) DEFAULT '0',
  PRIMARY KEY (`sf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `sf_config` */

insert  into `sf_config`(`sf_id`,`sf_table`,`sf_field`,`sf_type`,`sf_related`,`sf_label`,`sf_desc`,`sf_order`,`sf_hidden`) values (1,'orden','id','default','','',NULL,NULL,0),(2,'orden','test_id','default','','',NULL,NULL,0),(3,'orden','orden_test','default','','',NULL,NULL,0),(4,'preguntas','id','default','','',NULL,NULL,0),(5,'preguntas','pregunta','default','','',NULL,NULL,0),(6,'preguntas','valor','default','','',NULL,NULL,0),(7,'preguntas','respuestacorrecta','default','','',NULL,NULL,0),(8,'preguntas','fechacreacion','default','','',NULL,NULL,0),(9,'preguntas','fechaactualizacion','default','','',NULL,NULL,0),(10,'preguntas','usuario_id','default','','',NULL,NULL,0),(11,'principal','id','default','','',NULL,NULL,0),(12,'principal','nombre','default','','',NULL,NULL,0),(13,'principal','fechacreacion','default','','',NULL,NULL,0),(14,'principal','fechaactualizacion','default','','',NULL,NULL,0),(15,'principal','usuario_id','default','','',NULL,NULL,0),(16,'principal','orden_id','default','','',NULL,NULL,0),(17,'respuestas','id','default','','',NULL,NULL,0),(18,'respuestas','pregunta_id','default','','',NULL,NULL,0),(19,'respuestas','texto','default','','',NULL,NULL,0),(20,'respuestas','fechacreacion','default','','',NULL,NULL,0),(21,'respuestas','fechaactualizacion','default','','',NULL,NULL,0),(22,'respuestas','usuario_id','default','','',NULL,NULL,0),(23,'test','id','default','','',NULL,NULL,0),(24,'test','nombre','default','','',NULL,NULL,0),(25,'test','fechacreacion','default','','',NULL,NULL,0),(26,'test','fechaactualizacion','default','','',NULL,NULL,0),(27,'test','usuario_id','default','','',NULL,NULL,0),(28,'test_preguntas','id','default','','',NULL,NULL,0),(29,'test_preguntas','test_id','default','','',NULL,NULL,0),(30,'test_preguntas','pregunta_id','default','','',NULL,NULL,0),(31,'test_preguntas','fechacreacion','default','','',NULL,NULL,0),(32,'test_preguntas','fechaactualizacion','default','','',NULL,NULL,0),(33,'test_preguntas','usuario_id','default','','',NULL,NULL,0);

/*Table structure for table `subcategorias` */

DROP TABLE IF EXISTS `subcategorias`;

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de subcategoria',
  `sistema_digestivo` varchar(255) COLLATE utf8_spanish_ci DEFAULT 'No Asignado' COMMENT 'Sistema digestivo al que pertenece la subcategoria',
  `subcategoria` varchar(255) COLLATE utf8_spanish_ci DEFAULT 'No Asignado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `subcategorias` */

insert  into `subcategorias`(`id`,`sistema_digestivo`,`subcategoria`) values (1,'alto','dientes'),(2,'alto','lengua'),(3,'alto','glandulas salivales'),(4,'alto','esofago'),(5,'medio','estomago'),(6,'medio','No Asignado'),(7,'medio','No Asignado'),(8,'bajo','intestino delgado'),(9,'bajo','intestino grueso');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla',
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Nombre de test o descripcion',
  `fechacreacion` datetime DEFAULT NULL COMMENT 'Fecha creacion',
  `fechaactualizacion` datetime DEFAULT NULL COMMENT 'Fecha actualizacion',
  `usuario_id` int(11) DEFAULT NULL COMMENT 'Identificador del usuario',
  `tipo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Tipo de test Alto Medio Bajo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `test` */

insert  into `test`(`id`,`nombre`,`fechacreacion`,`fechaactualizacion`,`usuario_id`,`tipo`) values (22,'Sistema Digestivo No.2','2012-09-23 19:12:15','2012-09-24 20:47:22',1,NULL),(23,'prueba fransua','2012-09-24 21:09:23','2012-10-09 21:47:08',1,NULL),(24,'Test sistema digestivo alto','2012-11-21 20:05:07','2012-11-21 20:05:07',1,'alto'),(25,'Sistema Digestivo Bajo','2012-11-21 20:12:16','2012-11-27 05:47:32',1,'bajo');

/*Table structure for table `test_preguntas` */

DROP TABLE IF EXISTS `test_preguntas`;

CREATE TABLE `test_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de tabla',
  `test_id` int(11) DEFAULT NULL COMMENT 'Identificador de test al que pertenece',
  `pregunta_id` int(11) DEFAULT NULL COMMENT 'Identificador de pregunta a la que pertenece',
  `fechacreacion` datetime DEFAULT NULL COMMENT 'fecha de creacion',
  `fechaactualizacion` datetime DEFAULT NULL COMMENT 'fecha de actualizacion',
  `usuario_id` int(11) DEFAULT NULL COMMENT 'identificador de usuario',
  PRIMARY KEY (`id`),
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
