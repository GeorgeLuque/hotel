-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-11-2024 a las 14:43:01
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `monto_apertura` double DEFAULT NULL,
  `monto_cierre` double DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_creada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id`, `fecha_apertura`, `fecha_cierre`, `monto_apertura`, `monto_cierre`, `estado`, `id_usuario`, `fecha_creada`) VALUES
(2, '2024-06-21 13:14:46', '2024-06-22 15:49:21', 10000, 0, 0, 1, '2024-06-21 13:16:43'),
(3, '2024-06-21 16:25:34', '2024-06-22 15:49:42', 50000, 0, 0, 1, '2024-06-21 16:25:49'),
(4, '2024-06-22 17:17:07', '2024-06-22 16:17:19', 1000, 0, 0, 1, '2024-06-22 17:17:14'),
(5, '2024-06-29 09:56:26', '2024-06-29 08:57:16', 1000, 0, 0, 1, '2024-06-29 09:56:51'),
(6, '2024-06-29 10:00:06', '2024-06-29 09:01:29', 15000, 0, 0, 1, '2024-06-29 10:00:34'),
(7, '2024-06-29 10:00:34', '2024-06-29 09:01:32', 2000, 0, 0, 1, '2024-06-29 10:00:39'),
(8, '2024-06-29 10:01:39', '2024-06-29 09:34:01', 12000, 0, 0, 1, '2024-06-29 10:01:49'),
(9, '2024-06-29 10:01:49', '2024-06-29 09:34:17', 1000, 0, 0, 1, '2024-06-29 10:01:55'),
(10, '2024-06-29 10:35:38', '2024-06-29 10:52:33', 1000, 0, 0, 1, '2024-06-29 10:35:52'),
(11, '2024-06-29 11:22:06', '2024-06-29 10:52:36', 20000, 0, 0, 1, '2024-06-29 11:22:18'),
(12, '2024-06-29 11:34:48', '2024-06-29 10:52:38', 15000, 0, 0, 1, '2024-06-29 11:34:58'),
(13, '2024-06-29 11:48:12', '2024-06-29 10:52:40', 200000000, 0, 0, 1, '2024-06-29 11:48:18'),
(14, '2024-06-29 11:53:19', '2024-07-06 11:54:17', 10000, 0, 0, 1, '2024-06-29 11:53:23'),
(15, '2024-06-29 11:53:23', '2024-07-06 11:54:47', 52151515, 0, 0, 1, '2024-06-29 11:53:27'),
(16, '2024-06-29 11:53:27', '2024-07-06 11:55:17', 515151, 0, 0, 1, '2024-06-29 11:53:30'),
(17, '2024-07-06 11:55:32', '2024-07-06 11:55:47', 5000, 0, 0, 1, '2024-07-06 11:55:38'),
(18, '2024-07-06 11:55:38', '2024-07-06 11:59:20', 2000, 0, 0, 1, '2024-07-06 11:55:43'),
(19, '2024-07-06 11:59:39', '2024-09-07 10:18:16', 15000, 0, 0, 1, '2024-07-06 11:59:44'),
(20, '2024-07-06 11:59:44', '2024-09-07 10:18:24', 7500, 0, 0, 1, '2024-07-06 11:59:53'),
(21, '2024-09-07 10:18:54', '2024-09-21 08:52:56', 100000, 0, 0, 1, '2024-09-07 10:19:01'),
(23, '2024-09-21 08:53:54', '2024-09-21 10:45:48', 10000, 650, 0, 1, '2024-09-21 08:54:03'),
(24, '2024-10-05 11:13:39', NULL, 100000, NULL, 1, 1, '2024-10-05 11:13:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `fecha_creada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `imagen`, `fecha_creada`) VALUES
(1, 'Personal', 'conference.jpg', '2018-02-15 09:14:21'),
(2, 'Doble', NULL, '2019-02-26 11:39:02'),
(3, 'Triple', NULL, '2019-02-26 11:39:08'),
(4, 'Cuatruple', NULL, '2019-02-26 11:40:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_proceso`
--

CREATE TABLE `cliente_proceso` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_proceso` int(11) DEFAULT NULL,
  `sesion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente_proceso`
--

INSERT INTO `cliente_proceso` (`id`, `id_cliente`, `id_proceso`, `sesion`) VALUES
(1, 153, 5, '924d2e737864e5a130c03aa2e5d63604'),
(2, 153, 7, '8f9d017704eeafc5742651b737a91f43'),
(3, 178, 11, '8f9d017704eeafc5742651b737a91f43'),
(4, 178, 12, '8f9d017704eeafc5742651b737a91f43'),
(5, 183, 20, 'f2339e0d405217401f73cbe18ddd0866'),
(6, 183, 21, 'f2339e0d405217401f73cbe18ddd0866');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fax` varchar(25) DEFAULT NULL,
  `rnc` varchar(25) DEFAULT NULL,
  `registro_empresarial` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `direccion`, `estado`, `telefono`, `fax`, `rnc`, `registro_empresarial`, `ciudad`, `logo`) VALUES
(1, 'HOTELEL DESCANSO', 'DIRECCION EXACTA', 'luque', '0981123123', 'NULL', '0038947384786', 'NULL', 'Luque', '122321_2.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `documento` varchar(12) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `documento`, `nombre`, `telefono`, `email`, `id_persona`) VALUES
(1, '3669922', 'francis', 'lopez', 'asdasd@gmail.com', 64);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto`
--

CREATE TABLE `gasto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `capacidad` int(11) NOT NULL DEFAULT 1,
  `fecha_creada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id`, `nombre`, `descripcion`, `precio`, `id_categoria`, `estado`, `capacidad`, `fecha_creada`) VALUES
(1, '101', 'habitacion simple', 0, 1, 1, 1, '2024-06-15 14:55:20'),
(2, '102', 'habitacion para matrimonio e hijos', 0, 2, 1, 1, '2024-06-21 11:57:37'),
(3, '103', 'habitacion para 1 persona', 0, 1, 1, 1, '2024-08-18 08:02:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `fecha_creada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `tipo_documento` int(11) DEFAULT NULL,
  `documento` varchar(12) DEFAULT NULL,
  `giro` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `razon_social` varchar(150) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fecha_creada` datetime DEFAULT NULL,
  `tipo` int(11) DEFAULT 1,
  `vip` int(11) NOT NULL DEFAULT 0,
  `contador` int(11) NOT NULL DEFAULT 0,
  `limite` int(11) NOT NULL DEFAULT 7,
  `nacionalidad` varchar(25) DEFAULT NULL,
  `estado_civil` varchar(12) DEFAULT NULL,
  `ocupacion` varchar(255) DEFAULT NULL,
  `medio_transporte` varchar(65) DEFAULT NULL,
  `destino` varchar(55) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `celular` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `tipo_documento`, `documento`, `giro`, `nombre`, `fecha_nac`, `razon_social`, `direccion`, `fecha_creada`, `tipo`, `vip`, `contador`, `limite`, `nacionalidad`, `estado_civil`, `ocupacion`, `medio_transporte`, `destino`, `motivo`, `telefono`, `celular`) VALUES
(68, 1, '2132132', NULL, 'asdasd', NULL, NULL, 'asdasd', '2024-06-10 15:44:35', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 1, '12321321', NULL, 'pepito', NULL, NULL, 'asdfsdfs', '2024-06-15 11:47:31', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 1, '12345678', '12345678', 'jorge ', NULL, NULL, 'luque', '2024-07-06 11:06:59', 1, 0, 0, 7, 'jorge gomez', '12123123', '1', '12345678', '001-002', 'nigun', NULL, NULL),
(133, 1, '123456', '123456-8', 'marcos ian lopez', '0000-00-00', 'NULL', 'san lorenzo ', '2024-07-06 11:27:13', 1, 0, 0, 7, 'marcos lopez', '03323', '1', '1234578', '112-003', 'nignuna', NULL, NULL),
(168, 1, '8115151', NULL, 'marcos ian lopez', NULL, NULL, 'luque', '2024-10-05 12:31:11', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 1, '77777', '77777-2', 'juan perez', '2024-11-09', 'juan perez', 'luque', '2024-11-09 09:40:59', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 1, 'asdasdasdasd', 'NULL', 'asdasdasd', '0000-00-00', 'asdasdasd prueba', 'asdasdasd', '2024-11-09 11:25:05', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, '1111', NULL),
(182, 1, '3660435', NULL, 'sandra isabel', NULL, NULL, NULL, '2024-11-16 10:33:03', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, '0962255534', NULL),
(183, 1, '3669922', '3669922-5', 'francis ramon lopez', '2024-11-15', 'francis lopez', 'san lorenzo', '2024-11-16 15:59:31', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, '0962123123', NULL),
(184, 1, '11', '11-2', 'pepitoi', '2024-11-14', 'pepito', 'edmundo reyes', '0000-00-00 00:00:00', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, '1234', NULL),
(185, 1, '113', NULL, 'Cuadruple', NULL, NULL, NULL, '2024-11-16 19:13:29', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, '0962123124', NULL),
(188, 1, '222', '', 'test', '0000-00-00', '', '', '2024-11-17 07:59:47', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, '0961222', NULL),
(189, 1, '111555', NULL, 'test', NULL, NULL, NULL, '2024-11-17 08:01:31', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, '0962123123', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE `proceso` (
  `id` int(11) NOT NULL,
  `id_habitacion` int(11) DEFAULT NULL,
  `id_tarifa` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `precio` double NOT NULL DEFAULT 0,
  `cant_noche` float NOT NULL DEFAULT 1,
  `dinero_dejado` double NOT NULL DEFAULT 0,
  `id_tipo_pago` int(11) DEFAULT NULL,
  `fecha_entrada` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `total` double NOT NULL DEFAULT 0,
  `id_usuario` int(11) DEFAULT NULL,
  `cant_personas` double DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `fecha_creada` datetime DEFAULT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `observacion` varchar(255) DEFAULT NULL,
  `pagado` int(11) NOT NULL DEFAULT 1,
  `nro_operacion` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proceso`
--

INSERT INTO `proceso` (`id`, `id_habitacion`, `id_tarifa`, `id_cliente`, `precio`, `cant_noche`, `dinero_dejado`, `id_tipo_pago`, `fecha_entrada`, `fecha_salida`, `total`, `id_usuario`, `cant_personas`, `id_caja`, `estado`, `fecha_creada`, `cantidad`, `observacion`, `pagado`, `nro_operacion`) VALUES
(5, 1, 61, 153, 100, 1, 0, 1, '2024-11-02 13:12:14', '2024-11-03 12:00:00', 0, 1, 1, 24, 1, '2024-11-02 15:12:14', 1, NULL, 1, NULL),
(7, 1, 61, 153, 100, 1, 0, 1, '2024-11-09 09:22:54', '2024-11-10 12:00:00', 0, 1, 1, 24, 1, '2024-11-09 11:22:54', 2, NULL, 1, NULL),
(11, 1, 61, 178, 100, 1, 0, 1, '2024-11-09 09:39:25', '2024-11-10 12:00:00', 0, 1, 1, 24, 1, '2024-11-09 11:39:25', 1, NULL, 1, NULL),
(12, 2, 55, 178, 0, 1, 0, 1, '2024-11-09 09:40:46', '2024-11-10 12:00:00', 0, 1, 1, 24, 1, '2024-11-09 11:40:46', 1, NULL, 1, NULL),
(13, 2, NULL, 153, 0, 1, 0, 1, '2024-11-09 10:00:00', '2024-11-10 09:00:00', 0, 1, 1, NULL, 3, '2024-11-09 12:04:26', 1, '', 0, NULL),
(20, 1, 61, 183, 100, 1, 0, 1, '2024-11-17 05:48:28', '2024-11-18 12:00:00', 0, 1, 1, 24, 1, '2024-11-17 07:48:28', 2, NULL, 1, NULL),
(21, 1, 61, 183, 100, 1, 0, 1, '2024-11-17 05:58:58', '2024-11-18 12:00:00', 0, 1, 1, 24, 1, '2024-11-17 07:58:58', 1, NULL, 1, NULL),
(22, 1, NULL, 188, 0, 1, 0, 1, '2024-11-18 10:00:00', '2024-11-19 10:00:00', 0, 1, 1, NULL, 3, '2024-11-17 07:59:47', 1, '  ', 0, NULL),
(23, 1, NULL, 189, 0, 1, 0, 1, '2024-11-17 08:00:00', '2024-11-17 12:00:00', 0, 1, 1, NULL, 3, '2024-11-17 08:01:31', 1, 'asdasd', 0, NULL),
(24, 1, NULL, 184, 0, 1, 0, 1, '2024-11-17 13:00:00', '2024-11-18 13:00:00', 0, 1, 1, NULL, 3, '2024-11-17 08:01:55', 1, 'sdsdsd', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso_cancelados`
--

CREATE TABLE `proceso_cancelados` (
  `id` int(11) NOT NULL,
  `id_habitacion` int(11) DEFAULT NULL,
  `id_tarifa` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `precio` double NOT NULL DEFAULT 0,
  `cant_noche` float NOT NULL DEFAULT 1,
  `dinero_dejado` double NOT NULL DEFAULT 0,
  `id_tipo_pago` int(11) DEFAULT NULL,
  `fecha_entrada` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `total` double NOT NULL DEFAULT 0,
  `id_usuario` int(11) DEFAULT NULL,
  `cant_personas` double DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 0,
  `fecha_creada` datetime DEFAULT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `observacion` varchar(255) DEFAULT NULL,
  `pagado` int(11) NOT NULL DEFAULT 1,
  `nro_operacion` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proceso_cancelados`
--

INSERT INTO `proceso_cancelados` (`id`, `id_habitacion`, `id_tarifa`, `id_cliente`, `precio`, `cant_noche`, `dinero_dejado`, `id_tipo_pago`, `fecha_entrada`, `fecha_salida`, `total`, `id_usuario`, `cant_personas`, `id_caja`, `estado`, `fecha_creada`, `cantidad`, `observacion`, `pagado`, `nro_operacion`) VALUES
(2, 1, NULL, 155, 0, 1, 0, 1, NULL, NULL, 0, NULL, 1, NULL, 3, '2024-08-31 10:46:41', 1, '', 0, NULL),
(3, 3, NULL, 158, 0, 1, 0, 1, '2024-08-31 00:00:00', '2024-09-01 00:00:00', 0, 1, 1, NULL, 3, '2024-08-31 11:34:03', 1, '', 0, NULL),
(4, 3, NULL, 168, 0, 1, 0, 1, '2024-10-05 00:00:00', '2024-10-06 00:00:00', 0, 1, 1, NULL, 3, '2024-10-05 12:31:15', 1, 'asasas', 0, NULL),
(5, 1, NULL, 169, 0, 1, 0, 1, '2024-11-02 00:00:00', '2024-11-03 00:00:00', 0, 1, 1, NULL, 3, '2024-11-02 10:08:01', 1, '', 0, NULL),
(6, 1, NULL, 170, 0, 1, 0, 1, '2024-11-02 00:00:00', '2024-11-03 00:00:00', 0, 1, 1, NULL, 3, '2024-11-02 10:14:00', 1, '', 0, NULL),
(7, 1, NULL, 171, 0, 1, 0, 1, '2024-11-02 00:00:00', '2024-11-03 00:00:00', 0, 1, 1, NULL, 3, '2024-11-02 10:17:00', 1, '', 0, NULL),
(8, 1, NULL, 174, 0, 1, 0, 1, '2024-11-02 00:00:00', '2024-11-03 00:00:00', 0, 1, 1, NULL, 3, '2024-11-02 13:55:36', 1, '', 0, NULL),
(9, 1, NULL, 153, 0, 1, 0, 1, '2024-11-02 00:00:00', '2024-11-03 00:00:00', 0, 1, 1, NULL, 3, '2024-11-02 14:21:55', 1, '', 0, NULL),
(10, 1, NULL, 179, 0, 1, 0, 1, '2024-11-09 00:00:00', '2024-11-10 00:00:00', 0, 1, 1, NULL, 3, '2024-11-09 11:26:24', 1, 'asdasdasd', 0, NULL),
(11, 1, NULL, 178, 0, 1, 0, 1, '2024-11-10 00:00:00', '2024-11-11 00:00:00', 0, 1, 1, NULL, 3, '2024-11-09 11:36:45', 1, '', 0, NULL),
(12, 1, NULL, 180, 0, 1, 0, 1, '2024-11-16 00:00:00', '2024-11-17 00:00:00', 0, 1, 1, NULL, 3, '2024-11-16 10:27:48', 1, 'asdasd', 0, NULL),
(13, 2, NULL, 153, 0, 1, 0, 1, '2024-11-16 00:00:00', '2024-11-17 00:00:00', 0, 1, 1, NULL, 3, '2024-11-16 10:27:51', 1, '', 0, NULL),
(14, 2, NULL, 153, 0, 1, 0, 1, '2024-11-16 00:00:00', '2024-11-17 00:00:00', 0, 1, 1, NULL, 3, '2024-11-16 10:28:44', 1, 'asdasdasd', 0, NULL),
(15, 2, NULL, 153, 0, 1, 0, 1, '2024-11-16 00:00:00', '2024-11-17 00:00:00', 0, 1, 1, NULL, 3, '2024-11-16 15:57:35', 1, 'qweqweqwe', 0, NULL),
(16, 1, NULL, 183, 0, 1, 0, 1, '2024-11-16 00:00:00', '2024-11-17 00:00:00', 0, 1, 1, NULL, 3, '2024-11-16 19:18:34', 1, '', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso_sueldo`
--

CREATE TABLE `proceso_sueldo` (
  `id` int(11) NOT NULL,
  `id_sueldo` int(11) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `id_caja` int(11) DEFAULT NULL,
  `fecha_creada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso_venta`
--

CREATE TABLE `proceso_venta` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_operacion` int(11) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `tipo_operacion` int(11) NOT NULL DEFAULT 1,
  `fecha_creada` datetime DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `presentacion` varchar(255) DEFAULT NULL,
  `precio_compra` double DEFAULT NULL,
  `precio_venta` double DEFAULT NULL,
  `stock` double NOT NULL DEFAULT 0,
  `id_proveedor` int(11) DEFAULT NULL,
  `fecha_creada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `nombre`, `marca`, `descripcion`, `presentacion`, `precio_compra`, `precio_venta`, `stock`, `id_proveedor`, `fecha_creada`) VALUES
(3, 'PRO-0003', 'Gaseosa Inka Kola', 'Inka Kola', 'Personal medio litro', NULL, 0, 3, 10, 0, '2018-02-16 20:59:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `documento` varchar(12) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `paid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sueldo`
--

CREATE TABLE `sueldo` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `dia_pago` int(11) NOT NULL DEFAULT 1,
  `fecha_comienzo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa`
--

CREATE TABLE `tarifa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarifa`
--

INSERT INTO `tarifa` (`id`, `nombre`) VALUES
(1, '24 Horas'),
(4, '12 horas'),
(7, 'Doble'),
(8, 'Personal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa_habitacion`
--

CREATE TABLE `tarifa_habitacion` (
  `id` int(11) NOT NULL,
  `id_tarifa` int(11) DEFAULT NULL,
  `id_habitacion` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarifa_habitacion`
--

INSERT INTO `tarifa_habitacion` (`id`, `id_tarifa`, `id_habitacion`, `precio`) VALUES
(17, 8, 6, 380),
(18, 7, 6, 580),
(23, 7, 8, 580),
(24, 7, 7, 580),
(25, 7, 9, 580),
(27, 7, 11, 580),
(28, 8, 12, 380),
(29, 8, 13, 380),
(30, 8, 14, 500),
(31, 7, 14, 600),
(32, 8, 15, 380),
(33, 7, 16, 580),
(34, 7, 17, 580),
(36, 7, 19, 580),
(37, 8, 20, 380),
(38, 8, 21, 380),
(40, 8, 23, 380),
(41, 7, 24, 580),
(42, 7, 25, 580),
(44, 7, 27, 580),
(45, 8, 28, 380),
(46, 8, 29, 380),
(48, 8, 31, 380),
(49, 7, 32, 580),
(51, 8, 34, 380),
(52, 7, 35, 400),
(53, 11, 35, 800),
(55, 4, 2, 300),
(56, 4, 3, 100),
(61, 4, 1, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comprobante`
--

CREATE TABLE `tipo_comprobante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_comprobante`
--

INSERT INTO `tipo_comprobante` (`id`, `nombre`, `estado`) VALUES
(1, 'TICKET', 1),
(2, 'BOLETA', 1),
(3, 'FACTURA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha_creada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `nombre`, `fecha_creada`) VALUES
(1, 'C.I.P.', '2018-02-15 08:23:24'),
(2, 'PASAPORTE', '2018-02-15 09:24:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha_creada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`id`, `nombre`, `fecha_creada`) VALUES
(1, 'EFECTIVO', '2018-02-15 09:25:24'),
(2, 'TARJETA DE DEBITO / CREDITO', '2018-02-15 09:25:24'),
(3, 'DEPOSITO', '2018-08-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp`
--

CREATE TABLE `tmp` (
  `id_tmp` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad_tmp` int(11) DEFAULT NULL,
  `precio_tmp` double DEFAULT NULL,
  `sessionn_id` varchar(255) DEFAULT NULL,
  `tipo_operacion` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `pago` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `email`, `password`, `image`, `is_active`, `is_admin`, `created_at`, `pago`) VALUES
(1, 'Administrador', 'admin', 'admin', 'admin@gmail.com', 'e3f83ed23d18a34fc770626571753fabf1c54b5e', NULL, 1, 1, '2016-12-13 09:08:03', 0),
(3, 'francis', 'lopez', 'flopez', 'flopez', '036d0ef7567a20b5a4ad24a354ea4a945ddab676', NULL, 1, 0, '2024-06-10 12:13:35', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(11) NOT NULL,
  `id_tipo_comprobante` int(11) DEFAULT NULL,
  `nro_comprobante` varchar(25) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_tipo_pago` int(11) DEFAULT NULL,
  `tipo_operacion` int(11) NOT NULL DEFAULT 1,
  `total` double DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `fecha_creada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente_proceso`
--
ALTER TABLE `cliente_proceso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gasto`
--
ALTER TABLE `gasto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proceso_cancelados`
--
ALTER TABLE `proceso_cancelados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proceso_sueldo`
--
ALTER TABLE `proceso_sueldo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proceso_venta`
--
ALTER TABLE `proceso_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sueldo`
--
ALTER TABLE `sueldo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarifa_habitacion`
--
ALTER TABLE `tarifa_habitacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_comprobante`
--
ALTER TABLE `tipo_comprobante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tmp`
--
ALTER TABLE `tmp`
  ADD PRIMARY KEY (`id_tmp`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente_proceso`
--
ALTER TABLE `cliente_proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `gasto`
--
ALTER TABLE `gasto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT de la tabla `proceso`
--
ALTER TABLE `proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `proceso_cancelados`
--
ALTER TABLE `proceso_cancelados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `proceso_sueldo`
--
ALTER TABLE `proceso_sueldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proceso_venta`
--
ALTER TABLE `proceso_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sueldo`
--
ALTER TABLE `sueldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tarifa_habitacion`
--
ALTER TABLE `tarifa_habitacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `tipo_comprobante`
--
ALTER TABLE `tipo_comprobante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tmp`
--
ALTER TABLE `tmp`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
