create database `aulaConocimiento`;
use `aulaConocimiento`;
-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2016 a las 05:10:24
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aulaconocimiento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int(10) NOT NULL,
  `nombre` text NOT NULL,
  `descripcion` text NOT NULL,
  `duracion` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` char(10) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `nombre`, `descripcion`, `duracion`, `fecha_inicio`, `fecha_fin`, `activo`) VALUES
(1, 'Robotica', 'bdbdbandbsda', 2, NULL, NULL, 1),
(2, 'Test', 'Este es', 0, '2016-10-28', '2016-10-29', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_users`
--

CREATE TABLE `curso_users` (
  `id` int(10) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `calificacion` float DEFAULT NULL,
  `users_id` int(10) DEFAULT NULL,
  `curso_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_evaluacion`
--

CREATE TABLE `detalle_evaluacion` (
  `id` int(10) NOT NULL,
  `evaluacionusers_id` int(10) NOT NULL,
  `pregunta_id` int(10) DEFAULT NULL,
  `respuesta_seleccionada_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_evaluacion`
--

INSERT INTO `detalle_evaluacion` (`id`, `evaluacionusers_id`, `pregunta_id`, `respuesta_seleccionada_id`) VALUES
(41, 116, 20, NULL),
(42, 116, 17, NULL),
(43, 116, 18, NULL),
(44, 116, 22, NULL),
(45, 116, 19, NULL),
(46, 117, 23, NULL),
(47, 117, 16, NULL),
(48, 117, 14, NULL),
(49, 117, 20, NULL),
(50, 117, 19, NULL),
(51, 118, 14, 36),
(52, 118, 20, 61),
(53, 118, 15, 40),
(54, 118, 16, 45),
(55, 118, 22, 68),
(56, 119, 28, 88);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ente`
--

CREATE TABLE `ente` (
  `Ente_ID` int(10) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `activo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tiempo` text,
  `taller_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`id`, `nombre`, `fecha`, `tiempo`, `taller_id`) VALUES
(20, 'Conocete 16', '2016-09-13 00:00:00', '', 13),
(26, 'conocete 4', '2016-10-27 18:38:48', '', 7),
(27, 'conocete', '2016-10-28 14:36:16', '2', 14),
(28, 'Conocete semana 17', '2016-10-28 15:38:39', '15', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_users`
--

CREATE TABLE `evaluacion_users` (
  `id` int(10) NOT NULL,
  `users_id` int(10) DEFAULT NULL,
  `evaluacion_id` int(10) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `puntuacion` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evaluacion_users`
--

INSERT INTO `evaluacion_users` (`id`, `users_id`, `evaluacion_id`, `fecha`, `puntuacion`) VALUES
(116, 1, 20, '2016-10-28 09:44:51', 0),
(117, 1, 20, '2016-10-28 09:48:25', 0),
(118, 2, 20, '2016-10-28 10:29:07', 2),
(119, 2, 28, '2016-10-28 10:40:34', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `introev3`
--

CREATE TABLE `introev3` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_menu` int(10) UNSIGNED NOT NULL,
  `ruta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `introev3`
--

INSERT INTO `introev3` (`id`, `id_menu`, `ruta`, `created_at`, `updated_at`) VALUES
(1, 9, 'BloqueMotormediano.pdf', '2016-10-08 12:59:23', '2016-10-08 12:59:23'),
(2, 10, 'BloqueMotorgrande.pdf', '2016-10-08 12:59:23', '2016-10-08 12:59:23'),
(3, 11, 'BloqueMoverladireccion.pdf', '2016-10-08 12:59:23', '2016-10-08 12:59:23'),
(4, 12, 'BloqueMovertanque.pdf', '2016-10-08 12:59:23', '2016-10-08 12:59:23'),
(5, 13, 'BloquePantalla.pdf', '2016-10-08 12:59:23', '2016-10-08 12:59:23'),
(6, 14, 'BloqueSonido.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(7, 15, 'BloqueLuzdeestado.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(8, 21, 'Bloque Sensor ultrasónico.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(9, 22, 'Bloque Sensor infrarrojo.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(10, 23, 'Bloque Girosensor.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(11, 24, 'Bloque Sensor de color.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(12, 25, 'Bloque Rotación del motor.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(13, 26, 'Bloque Sensor táctil.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(14, 27, 'Bloque Temporizador.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(15, 28, 'Bloque Botones del Bloque EV3.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(16, 29, 'Bloque Sensor de sonido NXT.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(17, 16, 'Bloque de inicio.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(18, 17, 'Bloque Esperar.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(19, 18, 'Bloque de bucle.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(20, 19, 'Bloque Interruptor.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(21, 20, 'Bloque Interrupción del bucle.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(22, 30, 'Bloque Constante.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(23, 31, 'Bloque Variable.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(24, 32, 'Bloque Operaciones secuenciales.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(25, 33, 'Bloque Operaciones lógicas.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(26, 34, 'Bloque Matemática.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(27, 35, 'Bloque Redondear.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(28, 36, 'Bloque Comparar.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(29, 37, 'Bloque Alcance.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(30, 38, 'Bloque Texto.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(31, 39, 'Bloque Aleatorio.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(32, 40, 'Bloque Acceso al archivo.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(33, 41, 'Bloque Mandar mensajes.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(34, 42, 'Bloque Conexión Bluetooth.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(35, 43, 'Bloque Mantener activo.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(36, 44, 'Bloque Comentario.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(37, 45, 'Bloque Valor del sensor sin procesar.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(38, 46, 'Bloque Detener.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(39, 47, 'Bloque Invertir el motor.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24'),
(40, 48, 'Bloque Motor sin regular.pdf', '2016-10-08 12:59:24', '2016-10-08 12:59:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `esHoja` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `id_padre`, `id_curso`, `titulo`, `descripcion`, `esHoja`, `activo`) VALUES
(1, NULL, 1, 'Robótica', 'Robótica', 0, 1),
(2, 1, 1, 'Introducción EV3', 'Introducción EV3', 0, 1),
(3, 1, 1, 'Tutoria', 'Secciones', 0, 1),
(4, 2, 1, 'Bloque de Acción', 'Bloque de Acción', 0, 1),
(5, 2, 1, 'Bloque de Sensores', 'Bloque de Sensores', 0, 1),
(6, 2, 1, 'Bloque de Flujo', 'Bloque de Flujo', 0, 1),
(7, 2, 1, 'Bloque de Datos', 'Bloque de Datos', 0, 1),
(8, 2, 1, 'Bloque Avanzados', 'Bloque Avanzados', 0, 1),
(9, 4, 1, 'Motor Mediano', 'Motor Mediano', 1, 1),
(10, 4, 1, 'Motor Grande', 'Motor Grande', 1, 1),
(11, 4, 1, 'Mover Direccion', 'Mover Dirección', 1, 1),
(12, 4, 1, 'Mover Tanque', 'Mover Tanque', 1, 1),
(13, 4, 1, 'Pantalla', 'Pantalla', 1, 1),
(14, 4, 1, 'Sonido', 'Sonido', 1, 1),
(15, 4, 1, 'Luz de Estado Bloque', 'Luz de Estado Bloque', 1, 1),
(16, 5, 1, 'Inicio', 'Inicio', 1, 1),
(17, 5, 1, 'Espera', 'Espera', 1, 1),
(18, 5, 1, 'Bucle', 'Bucle', 1, 1),
(19, 5, 1, 'Interruptor', 'Interruptor', 1, 1),
(20, 5, 1, 'Interrupcion de Bucle', 'Interrupción de Bucle', 1, 1),
(21, 6, 1, 'Sensor Ultrasonico', 'Sensor Ultrasónico', 1, 1),
(22, 6, 1, 'Sensor Infrarrojo', 'Sensor Infrarrojo', 1, 1),
(23, 6, 1, 'Girosensor', 'Girosensor', 1, 1),
(24, 6, 1, 'Sensor de Color', 'Sensor de Color', 1, 1),
(25, 6, 1, 'Rotacion del Motor', 'Rotación del Motor', 1, 1),
(26, 6, 1, 'Sensor Táctil', 'Sensor Táctil', 1, 1),
(27, 6, 1, 'Temporizador', 'Temporizador', 1, 1),
(28, 6, 1, 'Botones Bloque EV3', 'Botones Bloque EV3', 1, 1),
(29, 6, 1, 'Sonido NXT', 'Sonido NXT', 1, 1),
(30, 7, 1, 'Constante', 'Constante', 1, 1),
(31, 7, 1, 'Variable', 'Variable', 1, 1),
(32, 7, 1, 'Operaciones Secuenciales', 'Operaciones Secuenciales', 1, 1),
(33, 7, 1, 'Operaciones Lógicas', 'Operaciones Lógicas', 1, 1),
(34, 7, 1, 'Matemática', 'Matemática', 1, 1),
(35, 7, 1, 'Redondear', 'Redondear', 1, 1),
(36, 7, 1, 'Comparar', 'Comparar', 1, 1),
(37, 7, 1, 'Alcance', 'Alcance', 1, 1),
(38, 7, 1, 'Texto', 'Texto', 1, 1),
(39, 7, 1, 'Aleatorio', 'Aleatorio', 1, 1),
(40, 8, 1, 'Acceso Archivos', 'Acceso archivos', 1, 1),
(41, 8, 1, 'Mandar Mensaje', 'Mandar Mensaje', 1, 1),
(42, 8, 1, 'Conexión Bluetooth', 'Conexión Bluetooth', 1, 1),
(43, 8, 1, 'Mantener activo', 'Mantener activo', 1, 1),
(44, 8, 1, 'Comentario', 'Comentario', 1, 1),
(45, 8, 1, 'Valor Sensor sin procesar', 'Valor Sensor sin procesar', 1, 1),
(46, 8, 1, 'Detener', 'Detener', 1, 1),
(47, 8, 1, 'Invertir Motor', 'Invertir Motor', 1, 1),
(48, 8, 1, 'Motor sin regular', 'Motor sin regular', 1, 1),
(49, NULL, NULL, 'Mantenimiento', 'Mantenimiento', 0, 1),
(50, 49, NULL, 'Tutorías', 'Tutorías', 1, 1),
(51, 49, NULL, 'Evaluaciones', 'Evaluaciones', 1, 1),
(52, 49, NULL, 'Cursos', 'Cursos', 1, 1),
(53, 49, NULL, 'Introducción EV3', 'Introducción EV3', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_09_28_205141_create_ev3_table', 2),
('2016_09_30_001512_create_menu_table', 2),
('2016_10_02_221530_create_Introdev3_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(10) NOT NULL,
  `enunciado` text NOT NULL,
  `rutaImagen` varchar(150) DEFAULT NULL,
  `evaluacion_id` int(10) DEFAULT NULL,
  `tipopregunta` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `enunciado`, `rutaImagen`, `evaluacion_id`, `tipopregunta`) VALUES
(14, '¿Qué tipo de motor debe ser usado en la práctica ‘Riley Rover’?', NULL, 20, NULL),
(15, '¿Qué sensores son usados en la práctica ‘Riley Rover’?', NULL, 20, NULL),
(16, '¿Cuántas ruedas en total son usadas en la práctica de ‘Riley Rover’?', NULL, 20, NULL),
(17, 'En ‘Desafio 1’, el bloque Mover Tanque debe ser programado con los valores:', NULL, 20, NULL),
(18, 'En ‘Desafio 1’, en bloque Sensor de color, se usaron los siguientes valores:', NULL, 20, NULL),
(19, 'En ‘Desafio 2’, cuál secuencia de programación usamos para que el ‘robot’ detecte el color y se\r\ndetenga:', NULL, 20, NULL),
(20, 'En ´Desafio 2´, para hacer retroceder al ‘robot’, la programación en Bloque Mover dirección\r\ndebe ser:', NULL, 20, NULL),
(21, 'En ‘Desafio 3’, que bloques son usados para hacer que el ‘robot’ responda el color que detecta:', NULL, 20, NULL),
(22, 'En ‘Desafio 3’, porque el ‘robot’ debe esperar unos segundos (3 promedio) cuando detecta un\r\ncolor:', NULL, 20, NULL),
(23, 'En ‘Desafio 3’, que debemos programar dentro del Bloque if para el caso por defecto:', NULL, 20, NULL),
(24, 'preg1', '', 26, NULL),
(25, 'preg 2', '', 26, NULL),
(26, 'pregunta 1 ?', '', 27, NULL),
(27, 'pregunta 2?', '', 27, NULL),
(28, 'Pregunta 1?', '', 28, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso`
--

CREATE TABLE `recurso` (
  `id` int(10) NOT NULL,
  `nombre_archivo` text NOT NULL,
  `ruta` text,
  `link` text,
  `archivo` mediumblob,
  `extension` text,
  `taller_id` int(10) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recurso`
--

INSERT INTO `recurso` (`id`, `nombre_archivo`, `ruta`, `link`, `archivo`, `extension`, `taller_id`, `descripcion`, `orden`) VALUES
(14, 'Riley Rover', NULL, NULL, 0x52696c657920526f7665722e6a7067, '.jpg', 7, 'Asistencia', 1),
(15, '', NULL, NULL, '', '', 7, 'Video educativo o sobre valores. Charla educativa.', 2),
(16, '', NULL, NULL, '', '', 7, 'Entrega y verificación del kit necesario para el armado de prototipo', 3),
(17, 'Riley River con Sensor de Color', NULL, NULL, 0x52696c657920526976657220636f6e2053656e736f7220646520436f6c6f722e706466, '.pdf', 7, 'Armado del prototipo siguiendo las indicaciones del manual de ensamblado "Riley River con sensor de color". Verificación de los modelos terminados.', 4),
(18, 'Desafio1', NULL, NULL, 0x4465736166696f312e6d7034, '.mp4', 7, 'Desafío 1: Girar el robot hasta que detecte el color negro. Ver video "Desafío 1". Usar el bloque mover dirección para todos los ejercicios.', 5),
(19, 'DesafYuo 2', NULL, NULL, 0x446573616659756f20322e6d7034, '.mp4', 7, 'Desafío 2: Mover el robot entre dos líneas de color. Ver video "Desafío 2"', 6),
(20, 'DesafYuo 3', NULL, NULL, 0x446573616659756f20332e6d7034, '.mp4', 7, 'Desafío 3: El robot debe avanzar hasta la línea azul, pero cada vez que detecte un cambio de color debe detenerse y decir cual color ha identificado. Si no reconoce ningún color, la opción por defecto es seguir adelante.', 7),
(21, '', NULL, NULL, '', '', 7, 'Borrar todos los programas del brick', 8),
(22, '', NULL, NULL, '', '', 7, 'Apagado, desensamblado, organización y verificación del puesto de trabajo, tomando como guía la imagen "Bot-ticelli". Dejar el puesto organizado según se muestra en la imagen.', 9),
(23, '', NULL, NULL, '', '', 7, 'Entrega de refrigerio', 10),
(24, 'Riley Rover', NULL, NULL, 0x52696c657920526f7665722e6a7067, '.jpg', 13, 'Verifica la cantidad de piezas entregadas, guiándote por la imagen.', 1),
(25, 'Riley River con Sensor de Color', NULL, NULL, 0x52696c657920526976657220636f6e2053656e736f7220646520436f6c6f722e706466, '.pdf', 13, 'Arma el prototipo siguiendo las indicaciones del manual de ensamblado.', 2),
(26, 'Desafio1', NULL, NULL, 0x4465736166696f312e6d7034, '.mp4', 13, 'Desafío 1: Utilizando el bloque Mover la dirección, hacer girar el robot hasta que detecte el color negro. Ver el video', 3),
(27, 'Desafio3', NULL, NULL, 0x4465736166696f332e6d7034, '.mp4', 13, 'Desafío 2: Programa un bucle infinito para que el robot se mueva entre 2 líneas de diferente color, tal como se muestra en el video ', 4),
(28, 'Desafio3', NULL, NULL, 0x4465736166696f332e6d7034, '.mp4', 13, 'Desafío 3: El robot debe avanzar hasta la línea negra, pero cada vez que detecte un cambio de color debe detenerse y decir cual color ha identificado. Si no reconoce ningún color, la opción por defecto es seguir adelante. Ver el video.', 5),
(29, '', NULL, NULL, '', '', 13, 'Borra todos los programas del Brick.', 6),
(30, 'Riley Rover', NULL, NULL, 0x52696c657920526f7665722e6a7067, '.jpg', 13, 'Apaga, desensambla, organiza y verifica el puesto de trabajo, tomando como guía la imagen ', 7),
(31, 'Riley Rover', NULL, NULL, 0x52696c657920526f7665722e6a7067, '.jpg', 14, 'Actividad 1 test', 1),
(32, 'Riley River con Sensor de Color', NULL, NULL, 0x52696c657920526976657220636f6e2053656e736f7220646520436f6c6f722e706466, '.pdf', 14, 'Ver pdf Test', 2),
(33, 'Riley Rover', NULL, NULL, 0x52696c657920526f7665722e6a7067, '.jpg', 17, 'Verifica la cantidad de piezas entregadas, guiándote por la imagen.', 1),
(34, 'Riley River con Sensor de Color', NULL, NULL, 0x52696c657920526976657220636f6e2053656e736f7220646520436f6c6f722e706466, '.pdf', 17, 'Arma el prototipo siguiendo las indicaciones del manual de ensamblado ', 2),
(35, 'Desafio1', NULL, NULL, 0x4465736166696f312e6d7034, '.mp4', 17, 'Desafío 1: Utilizando el bloque Mover la dirección, hacer girar el robot hasta que detecte el color negro. Ver el video', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id` int(10) NOT NULL,
  `respuesta` text,
  `es_correcta` bit(1) NOT NULL,
  `pregunta_id` int(10) NOT NULL,
  `rutaImagen` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id`, `respuesta`, `es_correcta`, `pregunta_id`, `rutaImagen`) VALUES
(36, 'Mover Tanque', b'0', 14, NULL),
(37, 'Mover Dirección', b'1', 14, NULL),
(38, 'Motor Grande', b'0', 14, NULL),
(39, 'Pantalla', b'0', 14, NULL),
(40, 'Sensor infrarrojo', b'0', 15, NULL),
(41, 'Sensor de color', b'1', 15, NULL),
(42, 'Rotación del motor', b'0', 15, NULL),
(43, 'Sensor táctil', b'0', 15, NULL),
(44, '2 ruedas traseras', b'0', 16, NULL),
(45, '2 ruedas delanteras y 1 trasera', b'1', 16, NULL),
(46, '1 rueda delantera y 2 traseras', b'0', 16, NULL),
(47, '3 ruedas traseras', b'0', 16, NULL),
(48, 'Dirección : 50 ; Potencia : 30', b'1', 17, NULL),
(49, 'Dirección : -30 ; Potencia : 50', b'0', 17, NULL),
(50, 'Dirección : 20 ; Potencia : 50', b'0', 17, NULL),
(51, 'Dirección : -20 ; Potencia : 60', b'0', 17, NULL),
(52, 'Sensor de color, comparar, color', b'1', 18, NULL),
(53, 'Sensor de color, cambiar, color', b'0', 18, NULL),
(54, 'Rotación del motor, comparar, grados', b'0', 18, NULL),
(55, 'Bloque if, Sensor de color, comparar', b'0', 18, NULL),
(56, 'Bloque esperar, Bloque Mover dirección: Apagado', b'1', 19, NULL),
(57, 'Bloque Mover dirección: Encendido por rotaciones', b'0', 19, NULL),
(58, 'Bloque interruptor, Sensor de color, comparar, color', b'0', 19, NULL),
(59, 'Interrupción del bucle', b'0', 19, NULL),
(60, 'Dirección : -50 ; Potencia : 20', b'0', 20, NULL),
(61, 'Dirección : 50 ; Potencia : -20', b'0', 20, NULL),
(62, 'Dirección : 0 ; Potencia : -50', b'1', 20, NULL),
(63, 'Dirección : -20 ; Potencia : 50', b'0', 20, NULL),
(64, 'Mover dirección: detenido ; sonido', b'1', 21, NULL),
(65, 'Mover dirección: Girar por rotaciones ; luz de estado', b'0', 21, NULL),
(66, 'Bloque esperar ; sonido', b'0', 21, NULL),
(67, 'Bloque esperar ; luz de estado', b'0', 21, NULL),
(68, 'El Brick tarda en procesar la información', b'1', 22, NULL),
(69, 'Para escuchar un sonido nítido desde el Brick', b'0', 22, NULL),
(70, 'Hacer que el Brick descance', b'0', 22, NULL),
(71, 'No gastar las llantas', b'0', 22, NULL),
(72, 'Si no hay color, continua', b'1', 23, NULL),
(73, 'Si hay color, continua', b'0', 23, NULL),
(74, 'Siempre continuar', b'0', 23, NULL),
(75, 'Detenerse, si hay color', b'0', 23, NULL),
(76, 'a', b'1', 24, ''),
(77, 'b', b'0', 24, ''),
(78, 'a', b'1', 25, ''),
(79, 'b', b'0', 25, ''),
(80, 'resp 1', b'1', 26, ''),
(81, 'resp 2', b'0', 26, ''),
(82, 'resp 3', b'0', 26, ''),
(83, 'resp 4', b'0', 26, ''),
(84, 'resp 1', b'1', 27, ''),
(85, 'resp 2', b'0', 27, ''),
(86, 'resp 3', b'0', 27, ''),
(87, 'resp4', b'0', 27, ''),
(88, 'A resp 1', b'1', 28, 'logo.jpg'),
(89, 'b resp 2', b'0', 28, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller`
--

CREATE TABLE `taller` (
  `id` int(10) NOT NULL,
  `titulo` text NOT NULL,
  `duracion` int(11) DEFAULT NULL,
  `curso_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `taller`
--

INSERT INTO `taller` (`id`, `titulo`, `duracion`, `curso_id`) VALUES
(7, 'Semana 16', NULL, 1),
(13, 'Semana 16 Nivel 4', 2, 1),
(14, 'Semana 15 ', 2, NULL),
(17, 'semana 17', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `rol` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ente_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `rol`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `ente_id`) VALUES
(1, 'admin2', '1', 'admin2@gmail.com', '$2y$10$j/eBhQxz0mkf61v0cRYhKOPfQgTBXmZZvdTPujiTGT4S1kxzKlt4m', 'jLHEQRBrA8PEGKrwCMchXiQae6i47fKHMsDLOMhKYqMoXCkIaUJzvSgM84jL', '2016-10-08 12:59:21', '2016-11-06 09:02:13', 0),
(2, 'estudiante', '0', 'estudiante@gmail.com', '$2y$10$7F.LQPlRQfGQZFNed5u63.y8Vmm0pEzf9JT68BrO/sZ8G1tiIMne6', 'gO3F3jaMiQKZJAhTn1e2Z6PzSnV6DSnyHydlknpeRUX0Ge118Y18blDYRplc', '2016-10-08 12:59:22', '2016-10-28 20:43:20', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `curso_users`
--
ALTER TABLE `curso_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ref24` (`curso_id`),
  ADD KEY `RefCursoUsersFK_idx` (`users_id`);

--
-- Indices de la tabla `detalle_evaluacion`
--
ALTER TABLE `detalle_evaluacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ref625` (`pregunta_id`),
  ADD KEY `Ref726` (`respuesta_seleccionada_id`),
  ADD KEY `RefevaluacionUser201_idx` (`evaluacionusers_id`);

--
-- Indices de la tabla `ente`
--
ALTER TABLE `ente`
  ADD PRIMARY KEY (`Ente_ID`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ref418` (`taller_id`);

--
-- Indices de la tabla `evaluacion_users`
--
ALTER TABLE `evaluacion_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `RefEvaluacionUsersEva_idx` (`evaluacion_id`),
  ADD KEY `RefEvaluacionUsersUser_idx` (`users_id`);

--
-- Indices de la tabla `introev3`
--
ALTER TABLE `introev3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `introev3_id_menu_foreign` (`id_menu`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `RefPreguntaEvaluacion_idx` (`evaluacion_id`);

--
-- Indices de la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ref413` (`taller_id`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ref614` (`pregunta_id`);

--
-- Indices de la tabla `taller`
--
ALTER TABLE `taller`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ref212` (`curso_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `curso_users`
--
ALTER TABLE `curso_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_evaluacion`
--
ALTER TABLE `detalle_evaluacion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT de la tabla `ente`
--
ALTER TABLE `ente`
  MODIFY `Ente_ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `evaluacion_users`
--
ALTER TABLE `evaluacion_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT de la tabla `introev3`
--
ALTER TABLE `introev3`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `recurso`
--
ALTER TABLE `recurso`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT de la tabla `taller`
--
ALTER TABLE `taller`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso_users`
--
ALTER TABLE `curso_users`
  ADD CONSTRAINT `Refcursouserscur` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Refcursousersusr` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_evaluacion`
--
ALTER TABLE `detalle_evaluacion`
  ADD CONSTRAINT `RefevaluacionUser201` FOREIGN KEY (`evaluacionusers_id`) REFERENCES `evaluacion_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Refpregunta251` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Refrespuesta261` FOREIGN KEY (`respuesta_seleccionada_id`) REFERENCES `respuesta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `Reftaller181` FOREIGN KEY (`taller_id`) REFERENCES `taller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `evaluacion_users`
--
ALTER TABLE `evaluacion_users`
  ADD CONSTRAINT `FkEvaluacionUsersUsers` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FkevaluacionuserEva` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `introev3`
--
ALTER TABLE `introev3`
  ADD CONSTRAINT `FkIntroEvMenu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FkmenuCurso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `FhPreguntaEvaluacion` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD CONSTRAINT `FkRecursoTaller` FOREIGN KEY (`taller_id`) REFERENCES `taller` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `FkRespuestaPregunta` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `taller`
--
ALTER TABLE `taller`
  ADD CONSTRAINT `FkTallerCurso` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
