-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-12-2017 a las 19:58:48
-- Versión del servidor: 5.6.13
-- Versión de PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `store`
--
CREATE DATABASE IF NOT EXISTS `store` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `store`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `Nombre` varchar(30) NOT NULL,
  `Clave` text NOT NULL,
  PRIMARY KEY (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`Nombre`, `Clave`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3'),
('alegria', 'e10adc3949ba59abbe56e057f20f883e'),
('martin', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `CodigoCat` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL,
  PRIMARY KEY (`CodigoCat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CodigoCat`, `Nombre`, `Descripcion`) VALUES
('C1', 'Pastillas en Tabletas', 'Pastillas para todo tipo de dolor en tabletas'),
('C2', 'Cicatrizantes', 'Eliminan todo tipo de Cicatrices'),
('C3', 'Inyecciones', 'Inyecciones I.V y I.M'),
('C4', 'Preservativos ', 'Preservativos de las marcas más reconocidas.'),
('C5', 'Lubricantes', 'Lubricantes de las mejores marcas.'),
('C6', 'Vitáminas', 'Toda clase de vitaminas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `NIT` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `NombreCompleto` varchar(70) NOT NULL,
  `Apellido` varchar(70) NOT NULL,
  `Clave` text NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`NIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`NIT`, `Nombre`, `NombreCompleto`, `Apellido`, `Clave`, `Direccion`, `Telefono`, `Email`) VALUES
('00014789562314', 'castro', 'Cristian ', 'Castro', 'e10adc3949ba59abbe56e057f20f883e', 'San Miguel', 78797475, 'crispc@pc.com'),
('00154872547896', 'martin', 'Martin', 'Luna', 'e10adc3949ba59abbe56e057f20f883e', 'San Miguel', 72679842, 'martinsmoon@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE IF NOT EXISTS `detalle` (
  `NumPedido` int(20) NOT NULL,
  `CodigoProd` varchar(30) NOT NULL,
  `CantidadProductos` int(20) NOT NULL,
  KEY `NumPedido` (`NumPedido`),
  KEY `CodigoProd` (`CodigoProd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`NumPedido`, `CodigoProd`, `CantidadProductos`) VALUES
(5, '0001', 1),
(5, '0002', 1),
(6, '00010', 1),
(6, '00011', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `CodigoProd` varchar(30) NOT NULL,
  `NombreProd` varchar(30) NOT NULL,
  `CodigoCat` varchar(30) NOT NULL,
  `Precio` decimal(30,2) NOT NULL,
  `Modelo` varchar(30) NOT NULL,
  `Marca` varchar(30) NOT NULL,
  `Stock` int(20) NOT NULL,
  `NITProveedor` varchar(30) NOT NULL,
  `Imagen` varchar(150) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`CodigoProd`),
  KEY `CodigoCat` (`CodigoCat`),
  KEY `NITProveedor` (`NITProveedor`),
  KEY `Agregado` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`CodigoProd`, `NombreProd`, `CodigoCat`, `Precio`, `Modelo`, `Marca`, `Stock`, `NITProveedor`, `Imagen`, `Nombre`) VALUES
('0001', 'Aspirina', 'C1', '13.00', '15/02/2006', '20/10/2020', 19, '0001234', '553322.jpg', 'admin'),
('00010', 'Condones Durex', 'C4', '10.00', '10/05/2001', '12/08/2040', 99, '0001369', 'durex.png', 'admin'),
('00011', 'Durex Sensitivo', 'C4', '12.00', '17/06/2002', '20/10/2050', 99, '0001234', 'durex-sensitivo.png', 'admin'),
('00012', 'Prudence', 'C4', '5.00', '08/10/2002', '20/04/2020', 50, '0001369', 'prudence.png', 'admin'),
('00013', 'Vitamina E', 'C6', '25.00', '23/03/2006', '22/01/2030', 30, '0001478', 'vitamina e.png', 'admin'),
('00014', 'Vitamina C', 'C6', '45.00', '05/04/2004', '30/09/2025', 90, '0001234', 'vitamina c.png', 'admin'),
('0002', 'Homeoplasmine', 'C2', '15.00', '17/05/2005', '30/12/2021', 24, '0001478', 'hosmeoplamea.png', 'admin'),
('0003', 'Avaden', 'C1', '29.00', '10/01/2003', '05/04/2023', 30, '0001369', 'avaden.png', 'admin'),
('0004', 'Cicactiv', 'C2', '20.00', '02/06/2001', '30/08/2025', 40, '0001478', 'cicactiv.png', 'admin'),
('0005', 'Cicaplast', 'C2', '50.00', '07/12/2005', '31/10/2030', 45, '0001234', 'cicaplast.png', 'admin'),
('0006', 'Cicatricure', 'C2', '15.00', '15/10/2010', '16/04/2030', 50, '0001478', 'cicatricure.png', 'admin'),
('0007', 'Depo-provera', 'C3', '12.00', '03/05/2008', '10/09/2029', 30, '0001369', 'depo-provera..png', 'admin'),
('0008', 'Derma', 'C2', '15.00', '01/07/2007', '09/06/2028', 60, '0001234', 'derma.png', 'admin'),
('0009', 'Duphaston', 'C1', '14.00', '10/02/2006', '06/08/2027', 30, '0001478', 'duphaston.png', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `NITProveedor` varchar(30) NOT NULL,
  `NombreProveedor` varchar(30) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `PaginaWeb` varchar(30) NOT NULL,
  PRIMARY KEY (`NITProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`NITProveedor`, `NombreProveedor`, `Direccion`, `Telefono`, `PaginaWeb`) VALUES
('0001234', 'Farmacia Brasil', 'San Miguel, El Salvador', 24255668, 'www.farmaciabrasil.com'),
('0001369', 'Farmacia San Nicolas', 'Usulután, El Salvador', 22252120, 'www.farsannicolas.com'),
('0001478', 'Farmacia La Buena', 'La Unión, El Salvador', 27272923, 'www.farmacialabuena.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `NumPedido` int(20) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(150) NOT NULL,
  `NIT` varchar(30) NOT NULL,
  `Descuento` int(20) NOT NULL,
  `TotalPagar` decimal(30,2) NOT NULL,
  `Estado` varchar(150) NOT NULL,
  PRIMARY KEY (`NumPedido`),
  KEY `NIT` (`NIT`),
  KEY `NIT_2` (`NIT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`NumPedido`, `Fecha`, `NIT`, `Descuento`, `TotalPagar`, `Estado`) VALUES
(5, '08-12-2017', '00154872547896', 0, '28.00', 'Entregado'),
(6, '09-12-2017', '00014789562314', 0, '22.00', 'Pendiente');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_8` FOREIGN KEY (`CodigoProd`) REFERENCES `producto` (`CodigoProd`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ibfk_9` FOREIGN KEY (`NumPedido`) REFERENCES `venta` (`NumPedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_7` FOREIGN KEY (`CodigoCat`) REFERENCES `categoria` (`CodigoCat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_8` FOREIGN KEY (`NITProveedor`) REFERENCES `proveedor` (`NITProveedor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_9` FOREIGN KEY (`Nombre`) REFERENCES `administrador` (`Nombre`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`NIT`) REFERENCES `cliente` (`NIT`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
