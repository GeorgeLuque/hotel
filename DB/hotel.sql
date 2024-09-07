-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-09-2024 a las 17:14:40
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
(21, '2024-09-07 10:18:54', NULL, 100000, NULL, 1, 1, '2024-09-07 10:19:01'),
(22, '2024-09-07 10:37:11', NULL, 50000, NULL, 1, 3, '2024-09-07 10:37:28');

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
(40, 71, 1, 'f740aa50bf12ee1967eae65ed656c442'),
(41, 129, 8, 'c7fdebcf081b16a4a423049867e0919a'),
(42, 130, 9, 'c7fdebcf081b16a4a423049867e0919a'),
(43, 131, 10, 'c7fdebcf081b16a4a423049867e0919a'),
(44, 132, 11, 'c7fdebcf081b16a4a423049867e0919a'),
(45, 133, 12, 'c7fdebcf081b16a4a423049867e0919a'),
(46, 134, 13, 'c7fdebcf081b16a4a423049867e0919a'),
(47, 135, 14, '9e9cb4962191aab96a5c4146b31ac330'),
(48, 136, 15, '9e9cb4962191aab96a5c4146b31ac330'),
(49, 160, 36, 'bececde54c317fcb75f3973748e085ce');

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
(1, 'HOTEL EDEN', 'DIRECCION EXACTA', 'MÃ©xico', '+52 1 953 114 9', 'NULL', '0038947384786', 'NULL', 'Mexico', '122321_2.png');

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
(1, '101', 'habitacion simple', 0, 1, 2, 1, '2024-06-15 14:55:20'),
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
(90, 1, '123', NULL, 'qweqwe', NULL, NULL, 'qweqwe', '2024-06-15 13:53:34', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 1, '12345678', '12345678', 'jorge ', NULL, NULL, 'luque', '2024-07-06 11:06:59', 1, 0, 0, 7, 'jorge gomez', '12123123', '1', '12345678', '001-002', 'nigun', NULL, NULL),
(133, 1, '123456', '123456-8', 'marcos ian lopez', '0000-00-00', 'NULL', 'san lorenzo ', '2024-07-06 11:27:13', 1, 0, 0, 7, 'marcos lopez', '03323', '1', '1234578', '112-003', 'nignuna', NULL, NULL),
(148, 1, '12345', '', 'juan Perez', '0000-00-00', '', 'sdfsdfsdfsdf', '2024-08-31 09:24:08', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 1, '3669922', '', 'francis ramon lopez', '0000-00-00', '', 'san lorenzo', '2024-08-31 10:36:50', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 1, '3669922', NULL, 'francis ramon lopez', NULL, NULL, 'san lorenzo', '2024-08-31 10:46:38', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 1, '3669922', NULL, 'francis ramon lopez', NULL, NULL, 'san lorenzo', '2024-08-31 10:57:16', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 1, '3669922', NULL, 'francis ramon lopez', NULL, NULL, 'san lorenzo', '2024-08-31 11:24:27', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 1, '3669922', NULL, 'francis ramon lopez', NULL, NULL, 'luque', '2024-08-31 11:34:00', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 1, '3669922', NULL, 'francis ramon lopez', NULL, NULL, 'san lorenzo', '2024-09-07 08:39:27', 1, 0, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 1, '3669922', '3669922', 'francis ramon lopez', NULL, NULL, 'san lorenzo', '2024-09-07 08:41:04', 1, 0, 0, 7, 'francis lopez', '0962255534', '1', '12345678', '001-002', '  ', NULL, NULL);

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
(1, 1, NULL, 118, 0, 1, 0, 1, '2024-06-16 00:00:00', '2024-06-17 00:00:00', 0, 1, 1, NULL, 3, '2024-06-16 14:23:23', 1, '', 1, NULL),
(2, 1, NULL, 119, 0, 1, 0, 1, '2024-06-16 00:00:00', '2024-06-17 00:00:00', 0, 1, 1, NULL, 3, '2024-06-16 14:23:43', 1, '', 1, NULL),
(3, 1, NULL, 120, 0, 1, 0, 1, '2024-06-16 00:00:00', '2024-06-17 00:00:00', 0, 1, 1, NULL, 3, '2024-06-16 14:24:03', 1, '', 1, NULL),
(4, 1, NULL, 123, 0, 1, 0, 1, '2024-06-16 10:00:00', '2024-06-17 10:00:00', 0, 1, 1, NULL, 3, '2024-06-16 14:28:10', 1, '', 1, NULL),
(5, 1, NULL, 124, 0, 1, 0, 1, '2024-06-16 11:00:00', '2024-06-17 11:00:00', 0, 1, 1, NULL, 3, '2024-06-16 14:30:36', 1, '', 1, NULL),
(6, 1, NULL, 126, 0, 1, 0, 1, '2024-06-16 13:00:00', '2024-06-17 13:00:00', 0, 1, 1, NULL, 3, '2024-06-16 14:32:23', 1, '', 1, NULL),
(7, 1, NULL, 128, 0, 1, 0, 1, '2024-07-06 00:00:00', '2024-07-07 00:00:00', 0, 1, 1, NULL, 3, '2024-07-06 09:46:35', 1, 'ninguna', 0, NULL),
(8, 1, 54, 129, 200, 1, 0, 1, '2024-07-06 09:03:43', '2024-07-07 12:00:00', 0, 1, 1, 0, 1, '2024-07-06 10:03:43', 1, NULL, 1, NULL),
(9, 1, 54, 130, 200, 1, 0, 1, '2024-07-06 10:01:33', '2024-07-07 12:00:00', 30, 1, 1, 0, 1, '2024-07-06 11:01:33', 1, NULL, 1, NULL),
(10, 2, 55, 131, 200, 1, 0, 1, '2024-07-06 10:06:59', '2024-07-07 12:00:00', 0, 1, 1, 0, 1, '2024-07-06 11:06:59', 1, NULL, 1, NULL),
(11, 1, 54, 132, 200, 1, 0, 1, '2024-07-06 10:10:04', '2024-07-07 12:00:00', 0, 1, 1, 0, 1, '2024-07-06 11:10:04', 1, NULL, 1, NULL),
(12, 1, 54, 133, 200, 1, 0, 1, '2024-07-06 10:27:13', '2024-07-07 12:00:00', 0, 1, 1, 0, 1, '2024-07-06 11:27:13', 1, NULL, 1, NULL),
(13, 1, 54, 134, 200, 1, 0, 1, '2024-07-06 10:37:27', '2024-07-07 12:00:00', 0, 3, 1, 0, 1, '2024-07-06 11:37:27', 1, NULL, 1, NULL),
(14, 1, 54, 135, 200, 1, 0, 1, '2024-08-03 11:43:26', '2024-08-04 12:00:00', 0, 1, 1, 0, 1, '2024-08-03 12:43:26', 1, NULL, 1, NULL),
(15, 2, 55, 136, 200, 1, 0, 1, '2024-08-03 11:44:37', '2024-08-04 12:00:00', 0, 1, 1, 0, 0, '2024-08-03 12:44:37', 2, NULL, 1, NULL),
(21, 3, NULL, 144, 0, 1, 0, 1, '2024-08-25 00:00:00', '2024-08-26 00:00:00', 0, 1, 1, NULL, 3, '2024-08-25 14:15:58', 1, '', 0, NULL),
(35, 1, NULL, 159, 0, 1, 0, 1, '2024-09-07 10:09:00', '2024-09-07 19:00:00', 0, 1, 1, NULL, 3, '2024-09-07 08:39:27', 1, '', 0, NULL),
(36, 1, 54, 160, 200, 1, 0, 1, '2024-09-07 07:41:04', '2024-09-08 12:00:00', 0, 1, 1, 0, 0, '2024-09-07 08:41:04', 1, NULL, 1, NULL);

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
(3, 3, NULL, 158, 0, 1, 0, 1, '2024-08-31 00:00:00', '2024-09-01 00:00:00', 0, 1, 1, NULL, 3, '2024-08-31 11:34:03', 1, '', 0, NULL);

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
(50, 7, 33, 580),
(51, 8, 34, 380),
(52, 7, 35, 400),
(53, 11, 35, 800),
(54, 1, 1, 200),
(55, 4, 2, 200),
(56, 4, 3, 100);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente_proceso`
--
ALTER TABLE `cliente_proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT de la tabla `proceso`
--
ALTER TABLE `proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `proceso_cancelados`
--
ALTER TABLE `proceso_cancelados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
