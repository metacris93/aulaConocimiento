create database `aulaconocimiento`;
use `aulaconocimiento`;
-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: aulaconocimiento
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `descripcion` text NOT NULL,
  `duracion` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` char(10) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Robotica','bdbdbandbsda',2,NULL,NULL,1),(2,'Test','Este es',0,'2016-10-28','2016-10-29',1);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_users`
--

DROP TABLE IF EXISTS `curso_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL,
  `calificacion` float DEFAULT NULL,
  `users_id` int(10) DEFAULT NULL,
  `curso_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Ref24` (`curso_id`),
  KEY `RefCursoUsersFK_idx` (`users_id`),
  CONSTRAINT `Refcursouserscur` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Refcursousersusr` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_users`
--

LOCK TABLES `curso_users` WRITE;
/*!40000 ALTER TABLE `curso_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_evaluacion`
--

DROP TABLE IF EXISTS `detalle_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_evaluacion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `evaluacionusers_id` int(10) NOT NULL,
  `pregunta_id` int(10) DEFAULT NULL,
  `respuesta_seleccionada_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Ref625` (`pregunta_id`),
  KEY `Ref726` (`respuesta_seleccionada_id`),
  KEY `RefevaluacionUser201_idx` (`evaluacionusers_id`),
  CONSTRAINT `RefevaluacionUser201` FOREIGN KEY (`evaluacionusers_id`) REFERENCES `evaluacion_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Refpregunta251` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Refrespuesta261` FOREIGN KEY (`respuesta_seleccionada_id`) REFERENCES `respuesta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_evaluacion`
--

LOCK TABLES `detalle_evaluacion` WRITE;
/*!40000 ALTER TABLE `detalle_evaluacion` DISABLE KEYS */;
INSERT INTO `detalle_evaluacion` VALUES (41,116,20,NULL),(42,116,17,NULL),(43,116,18,NULL),(44,116,22,NULL),(45,116,19,NULL),(46,117,23,NULL),(47,117,16,NULL),(48,117,14,NULL),(49,117,20,NULL),(50,117,19,NULL),(51,118,14,36),(52,118,20,61),(53,118,15,40),(54,118,16,45),(55,118,22,68),(56,119,28,88);
/*!40000 ALTER TABLE `detalle_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ente`
--

DROP TABLE IF EXISTS `ente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ente` (
  `Ente_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Ente_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ente`
--

LOCK TABLES `ente` WRITE;
/*!40000 ALTER TABLE `ente` DISABLE KEYS */;
/*!40000 ALTER TABLE `ente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tiempo` text,
  `taller_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Ref418` (`taller_id`),
  CONSTRAINT `Reftaller181` FOREIGN KEY (`taller_id`) REFERENCES `taller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion`
--

LOCK TABLES `evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion` VALUES (20,'Conocete 16','2016-09-13 00:00:00','',13),(26,'conocete 4','2016-10-27 18:38:48','',7),(27,'conocete','2016-10-28 14:36:16','2',14),(28,'Conocete semana 17','2016-10-28 15:38:39','15',17);
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_users`
--

DROP TABLE IF EXISTS `evaluacion_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) DEFAULT NULL,
  `evaluacion_id` int(10) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `puntuacion` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RefEvaluacionUsersEva_idx` (`evaluacion_id`),
  KEY `RefEvaluacionUsersUser_idx` (`users_id`),
  CONSTRAINT `FkEvaluacionUsersUsers` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FkevaluacionuserEva` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_users`
--

LOCK TABLES `evaluacion_users` WRITE;
/*!40000 ALTER TABLE `evaluacion_users` DISABLE KEYS */;
INSERT INTO `evaluacion_users` VALUES (116,1,20,'2016-10-28 09:44:51',0),(117,1,20,'2016-10-28 09:48:25',0),(118,2,20,'2016-10-28 10:29:07',2),(119,2,28,'2016-10-28 10:40:34',1);
/*!40000 ALTER TABLE `evaluacion_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `introev3`
--

DROP TABLE IF EXISTS `introev3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `introev3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_menu` int(10) unsigned NOT NULL,
  `ruta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `introev3_id_menu_foreign` (`id_menu`),
  CONSTRAINT `FkIntroEvMenu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `introev3`
--

LOCK TABLES `introev3` WRITE;
/*!40000 ALTER TABLE `introev3` DISABLE KEYS */;
INSERT INTO `introev3` VALUES (1,9,'BloqueMotormediano.pdf','2016-10-08 12:59:23','2016-10-08 12:59:23'),(2,10,'BloqueMotorgrande.pdf','2016-10-08 12:59:23','2016-10-08 12:59:23'),(3,11,'BloqueMoverladireccion.pdf','2016-10-08 12:59:23','2016-10-08 12:59:23'),(4,12,'BloqueMovertanque.pdf','2016-10-08 12:59:23','2016-10-08 12:59:23'),(5,13,'BloquePantalla.pdf','2016-10-08 12:59:23','2016-10-08 12:59:23'),(6,14,'BloqueSonido.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(7,15,'BloqueLuzdeestado.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(8,21,'Bloque Sensor ultrasónico.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(9,22,'Bloque Sensor infrarrojo.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(10,23,'Bloque Girosensor.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(11,24,'Bloque Sensor de color.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(12,25,'Bloque Rotación del motor.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(13,26,'Bloque Sensor táctil.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(14,27,'Bloque Temporizador.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(15,28,'Bloque Botones del Bloque EV3.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(16,29,'Bloque Sensor de sonido NXT.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(17,16,'Bloque de inicio.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(18,17,'Bloque Esperar.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(19,18,'Bloque de bucle.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(20,19,'Bloque Interruptor.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(21,20,'Bloque Interrupción del bucle.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(22,30,'Bloque Constante.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(23,31,'Bloque Variable.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(24,32,'Bloque Operaciones secuenciales.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(25,33,'Bloque Operaciones lógicas.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(26,34,'Bloque Matemática.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(27,35,'Bloque Redondear.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(28,36,'Bloque Comparar.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(29,37,'Bloque Alcance.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(30,38,'Bloque Texto.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(31,39,'Bloque Aleatorio.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(32,40,'Bloque Acceso al archivo.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(33,41,'Bloque Mandar mensajes.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(34,42,'Bloque Conexión Bluetooth.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(35,43,'Bloque Mantener activo.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(36,44,'Bloque Comentario.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(37,45,'Bloque Valor del sensor sin procesar.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(38,46,'Bloque Detener.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(39,47,'Bloque Invertir el motor.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24'),(40,48,'Bloque Motor sin regular.pdf','2016-10-08 12:59:24','2016-10-08 12:59:24');
/*!40000 ALTER TABLE `introev3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_padre` int(11) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `esHoja` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `FkmenuCurso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,NULL,1,'Robótica','Robótica',0,1),(2,1,1,'Introducción EV3','Introducción EV3',0,1),(3,1,1,'Tutoria','Secciones',0,1),(4,2,1,'Bloque de Acción','Bloque de Acción',0,1),(5,2,1,'Bloque de Sensores','Bloque de Sensores',0,1),(6,2,1,'Bloque de Flujo','Bloque de Flujo',0,1),(7,2,1,'Bloque de Datos','Bloque de Datos',0,1),(8,2,1,'Bloque Avanzados','Bloque Avanzados',0,1),(9,4,1,'Motor Mediano','Motor Mediano',1,1),(10,4,1,'Motor Grande','Motor Grande',1,1),(11,4,1,'Mover Direccion','Mover Dirección',1,1),(12,4,1,'Mover Tanque','Mover Tanque',1,1),(13,4,1,'Pantalla','Pantalla',1,1),(14,4,1,'Sonido','Sonido',1,1),(15,4,1,'Luz de Estado Bloque','Luz de Estado Bloque',1,1),(16,5,1,'Inicio','Inicio',1,1),(17,5,1,'Espera','Espera',1,1),(18,5,1,'Bucle','Bucle',1,1),(19,5,1,'Interruptor','Interruptor',1,1),(20,5,1,'Interrupcion de Bucle','Interrupción de Bucle',1,1),(21,6,1,'Sensor Ultrasonico','Sensor Ultrasónico',1,1),(22,6,1,'Sensor Infrarrojo','Sensor Infrarrojo',1,1),(23,6,1,'Girosensor','Girosensor',1,1),(24,6,1,'Sensor de Color','Sensor de Color',1,1),(25,6,1,'Rotacion del Motor','Rotación del Motor',1,1),(26,6,1,'Sensor Táctil','Sensor Táctil',1,1),(27,6,1,'Temporizador','Temporizador',1,1),(28,6,1,'Botones Bloque EV3','Botones Bloque EV3',1,1),(29,6,1,'Sonido NXT','Sonido NXT',1,1),(30,7,1,'Constante','Constante',1,1),(31,7,1,'Variable','Variable',1,1),(32,7,1,'Operaciones Secuenciales','Operaciones Secuenciales',1,1),(33,7,1,'Operaciones Lógicas','Operaciones Lógicas',1,1),(34,7,1,'Matemática','Matemática',1,1),(35,7,1,'Redondear','Redondear',1,1),(36,7,1,'Comparar','Comparar',1,1),(37,7,1,'Alcance','Alcance',1,1),(38,7,1,'Texto','Texto',1,1),(39,7,1,'Aleatorio','Aleatorio',1,1),(40,8,1,'Acceso Archivos','Acceso archivos',1,1),(41,8,1,'Mandar Mensaje','Mandar Mensaje',1,1),(42,8,1,'Conexión Bluetooth','Conexión Bluetooth',1,1),(43,8,1,'Mantener activo','Mantener activo',1,1),(44,8,1,'Comentario','Comentario',1,1),(45,8,1,'Valor Sensor sin procesar','Valor Sensor sin procesar',1,1),(46,8,1,'Detener','Detener',1,1),(47,8,1,'Invertir Motor','Invertir Motor',1,1),(48,8,1,'Motor sin regular','Motor sin regular',1,1),(49,NULL,NULL,'Mantenimiento','Mantenimiento',0,1),(50,49,NULL,'Tutorías','Tutorías',1,1),(51,49,NULL,'Evaluaciones','Evaluaciones',1,1),(52,49,NULL,'Cursos','Cursos',1,1),(53,49,NULL,'Introducción EV3','Introducción EV3',1,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2016_09_28_205141_create_ev3_table',2),('2016_09_30_001512_create_menu_table',2),('2016_10_02_221530_create_Introdev3_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `enunciado` text NOT NULL,
  `rutaImagen` varchar(150) DEFAULT NULL,
  `evaluacion_id` int(10) DEFAULT NULL,
  `tipopregunta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RefPreguntaEvaluacion_idx` (`evaluacion_id`),
  CONSTRAINT `FhPreguntaEvaluacion` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (14,'¿Qué tipo de motor debe ser usado en la práctica ‘Riley Rover’?',NULL,20,NULL),(15,'¿Qué sensores son usados en la práctica ‘Riley Rover’?',NULL,20,NULL),(16,'¿Cuántas ruedas en total son usadas en la práctica de ‘Riley Rover’?',NULL,20,NULL),(17,'En ‘Desafio 1’, el bloque Mover Tanque debe ser programado con los valores:',NULL,20,NULL),(18,'En ‘Desafio 1’, en bloque Sensor de color, se usaron los siguientes valores:',NULL,20,NULL),(19,'En ‘Desafio 2’, cuál secuencia de programación usamos para que el ‘robot’ detecte el color y se\r\ndetenga:',NULL,20,NULL),(20,'En ´Desafio 2´, para hacer retroceder al ‘robot’, la programación en Bloque Mover dirección\r\ndebe ser:',NULL,20,NULL),(21,'En ‘Desafio 3’, que bloques son usados para hacer que el ‘robot’ responda el color que detecta:',NULL,20,NULL),(22,'En ‘Desafio 3’, porque el ‘robot’ debe esperar unos segundos (3 promedio) cuando detecta un\r\ncolor:',NULL,20,NULL),(23,'En ‘Desafio 3’, que debemos programar dentro del Bloque if para el caso por defecto:',NULL,20,NULL),(24,'preg1','',26,NULL),(25,'preg 2','',26,NULL),(26,'pregunta 1 ?','',27,NULL),(27,'pregunta 2?','',27,NULL),(28,'Pregunta 1?','',28,NULL);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_archivo` text NOT NULL,
  `ruta` text,
  `link` text,
  `archivo` mediumblob,
  `extension` text,
  `taller_id` int(10) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Ref413` (`taller_id`),
  CONSTRAINT `FkRecursoTaller` FOREIGN KEY (`taller_id`) REFERENCES `taller` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
INSERT INTO `recurso` VALUES (14,'Riley Rover',NULL,NULL,'Riley Rover.jpg','.jpg',7,'Asistencia',1),(15,'',NULL,NULL,'','',7,'Video educativo o sobre valores. Charla educativa.',2),(16,'',NULL,NULL,'','',7,'Entrega y verificación del kit necesario para el armado de prototipo',3),(17,'Riley River con Sensor de Color',NULL,NULL,'Riley River con Sensor de Color.pdf','.pdf',7,'Armado del prototipo siguiendo las indicaciones del manual de ensamblado \"Riley River con sensor de color\". Verificación de los modelos terminados.',4),(18,'Desafio1',NULL,NULL,'Desafio1.mp4','.mp4',7,'Desafío 1: Girar el robot hasta que detecte el color negro. Ver video \"Desafío 1\". Usar el bloque mover dirección para todos los ejercicios.',5),(19,'DesafYuo 2',NULL,NULL,'DesafYuo 2.mp4','.mp4',7,'Desafío 2: Mover el robot entre dos líneas de color. Ver video \"Desafío 2\"',6),(20,'DesafYuo 3',NULL,NULL,'DesafYuo 3.mp4','.mp4',7,'Desafío 3: El robot debe avanzar hasta la línea azul, pero cada vez que detecte un cambio de color debe detenerse y decir cual color ha identificado. Si no reconoce ningún color, la opción por defecto es seguir adelante.',7),(21,'',NULL,NULL,'','',7,'Borrar todos los programas del brick',8),(22,'',NULL,NULL,'','',7,'Apagado, desensamblado, organización y verificación del puesto de trabajo, tomando como guía la imagen \"Bot-ticelli\". Dejar el puesto organizado según se muestra en la imagen.',9),(23,'',NULL,NULL,'','',7,'Entrega de refrigerio',10),(24,'Riley Rover',NULL,NULL,'Riley Rover.jpg','.jpg',13,'Verifica la cantidad de piezas entregadas, guiándote por la imagen.',1),(25,'Riley River con Sensor de Color',NULL,NULL,'Riley River con Sensor de Color.pdf','.pdf',13,'Arma el prototipo siguiendo las indicaciones del manual de ensamblado.',2),(26,'Desafio1',NULL,NULL,'Desafio1.mp4','.mp4',13,'Desafío 1: Utilizando el bloque Mover la dirección, hacer girar el robot hasta que detecte el color negro. Ver el video',3),(27,'Desafio3',NULL,NULL,'Desafio3.mp4','.mp4',13,'Desafío 2: Programa un bucle infinito para que el robot se mueva entre 2 líneas de diferente color, tal como se muestra en el video ',4),(28,'Desafio3',NULL,NULL,'Desafio3.mp4','.mp4',13,'Desafío 3: El robot debe avanzar hasta la línea negra, pero cada vez que detecte un cambio de color debe detenerse y decir cual color ha identificado. Si no reconoce ningún color, la opción por defecto es seguir adelante. Ver el video.',5),(29,'',NULL,NULL,'','',13,'Borra todos los programas del Brick.',6),(30,'Riley Rover',NULL,NULL,'Riley Rover.jpg','.jpg',13,'Apaga, desensambla, organiza y verifica el puesto de trabajo, tomando como guía la imagen ',7),(31,'Riley Rover',NULL,NULL,'Riley Rover.jpg','.jpg',14,'Actividad 1 test',1),(32,'Riley River con Sensor de Color',NULL,NULL,'Riley River con Sensor de Color.pdf','.pdf',14,'Ver pdf Test',2),(33,'Riley Rover',NULL,NULL,'Riley Rover.jpg','.jpg',17,'Verifica la cantidad de piezas entregadas, guiándote por la imagen.',1),(34,'Riley River con Sensor de Color',NULL,NULL,'Riley River con Sensor de Color.pdf','.pdf',17,'Arma el prototipo siguiendo las indicaciones del manual de ensamblado ',2),(35,'Desafio1',NULL,NULL,'Desafio1.mp4','.mp4',17,'Desafío 1: Utilizando el bloque Mover la dirección, hacer girar el robot hasta que detecte el color negro. Ver el video',3);
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `respuesta` text,
  `es_correcta` bit(1) NOT NULL,
  `pregunta_id` int(10) NOT NULL,
  `rutaImagen` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Ref614` (`pregunta_id`),
  CONSTRAINT `FkRespuestaPregunta` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES (36,'Mover Tanque','\0',14,NULL),(37,'Mover Dirección','',14,NULL),(38,'Motor Grande','\0',14,NULL),(39,'Pantalla','\0',14,NULL),(40,'Sensor infrarrojo','\0',15,NULL),(41,'Sensor de color','',15,NULL),(42,'Rotación del motor','\0',15,NULL),(43,'Sensor táctil','\0',15,NULL),(44,'2 ruedas traseras','\0',16,NULL),(45,'2 ruedas delanteras y 1 trasera','',16,NULL),(46,'1 rueda delantera y 2 traseras','\0',16,NULL),(47,'3 ruedas traseras','\0',16,NULL),(48,'Dirección : 50 ; Potencia : 30','',17,NULL),(49,'Dirección : -30 ; Potencia : 50','\0',17,NULL),(50,'Dirección : 20 ; Potencia : 50','\0',17,NULL),(51,'Dirección : -20 ; Potencia : 60','\0',17,NULL),(52,'Sensor de color, comparar, color','',18,NULL),(53,'Sensor de color, cambiar, color','\0',18,NULL),(54,'Rotación del motor, comparar, grados','\0',18,NULL),(55,'Bloque if, Sensor de color, comparar','\0',18,NULL),(56,'Bloque esperar, Bloque Mover dirección: Apagado','',19,NULL),(57,'Bloque Mover dirección: Encendido por rotaciones','\0',19,NULL),(58,'Bloque interruptor, Sensor de color, comparar, color','\0',19,NULL),(59,'Interrupción del bucle','\0',19,NULL),(60,'Dirección : -50 ; Potencia : 20','\0',20,NULL),(61,'Dirección : 50 ; Potencia : -20','\0',20,NULL),(62,'Dirección : 0 ; Potencia : -50','',20,NULL),(63,'Dirección : -20 ; Potencia : 50','\0',20,NULL),(64,'Mover dirección: detenido ; sonido','',21,NULL),(65,'Mover dirección: Girar por rotaciones ; luz de estado','\0',21,NULL),(66,'Bloque esperar ; sonido','\0',21,NULL),(67,'Bloque esperar ; luz de estado','\0',21,NULL),(68,'El Brick tarda en procesar la información','',22,NULL),(69,'Para escuchar un sonido nítido desde el Brick','\0',22,NULL),(70,'Hacer que el Brick descance','\0',22,NULL),(71,'No gastar las llantas','\0',22,NULL),(72,'Si no hay color, continua','',23,NULL),(73,'Si hay color, continua','\0',23,NULL),(74,'Siempre continuar','\0',23,NULL),(75,'Detenerse, si hay color','\0',23,NULL),(76,'a','',24,''),(77,'b','\0',24,''),(78,'a','',25,''),(79,'b','\0',25,''),(80,'resp 1','',26,''),(81,'resp 2','\0',26,''),(82,'resp 3','\0',26,''),(83,'resp 4','\0',26,''),(84,'resp 1','',27,''),(85,'resp 2','\0',27,''),(86,'resp 3','\0',27,''),(87,'resp4','\0',27,''),(88,'A resp 1','',28,'logo.jpg'),(89,'b resp 2','\0',28,'');
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller`
--

DROP TABLE IF EXISTS `taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taller` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `titulo` text NOT NULL,
  `duracion` int(11) DEFAULT NULL,
  `curso_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Ref212` (`curso_id`),
  CONSTRAINT `FkTallerCurso` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller`
--

LOCK TABLES `taller` WRITE;
/*!40000 ALTER TABLE `taller` DISABLE KEYS */;
INSERT INTO `taller` VALUES (7,'Semana 16',NULL,1),(13,'Semana 16 Nivel 4',2,1),(14,'Semana 15 ',2,NULL),(17,'semana 17',2,NULL);
/*!40000 ALTER TABLE `taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `rol` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ente_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin2','admin2','1','admin2@gmail.com','$2y$10$j/eBhQxz0mkf61v0cRYhKOPfQgTBXmZZvdTPujiTGT4S1kxzKlt4m','p2tBG2TC9PWYVksCCbAGg2kmRadC355NuanAdRzfl0xhG57gBUkYjsOrKwDK','2016-10-08 12:59:21','2017-03-22 07:16:10',0),(2,'estudiante','estudiante','0','estudiante@gmail.com','$2y$10$7F.LQPlRQfGQZFNed5u63.y8Vmm0pEzf9JT68BrO/sZ8G1tiIMne6','LoE2qJLmsbnhWA7Y0gFUB4TCA8RFQnetP04c03jqEvkx5LAc2uoOlLxqPAHj','2016-10-08 12:59:22','2017-03-22 07:16:24',0),(6,'HDC045','EDUARDO GARCIA','0','metacris93@gmail.com','$2y$10$QjYMKBcUHsj59Gq3Pog.ROXh5uSnEcnjXeogUB.gNAawDFtyIcZ1.','AkFXZxrQJZB014zqa8qJlycYVRRACbzuRY0q3EJ2fEf2Wz3O6OMgRLYdD8Qe',NULL,'2017-04-04 09:17:34',0),(9,'HDC045','ANDRES OCHOA','0','','$2y$10$ZggCs8ESe1IghaMwYLpYdOHkAG6u6.ziX1.8Cs7RkHq0pdADU5Sm6','0QDOu5jx5n12eC61zUcl3tENoxfp1HFz',NULL,NULL,0),(11,'1306684133','MARISOL INTRIAGO','1','cpisco@fiec.espol.edu.ec','$2y$10$ggbr9REZ6an.K0TKjTYUwuSJXbzupF/cd5Sz.s0wL2NcpqlYiXmIe','1uHEuJ7GfmfQVMZGIy0e9gIbLlINlnHBtMun5XL7OsJeBM0cCu59MuGdl4JK',NULL,'2017-04-04 09:28:12',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-03 23:41:56
