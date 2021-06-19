-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2021 a las 06:03:31
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `greenground`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcarrito`
--

CREATE TABLE `tbcarrito` (
  `carri_id_carrito` int(11) NOT NULL,
  `carri_id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcomprador`
--

CREATE TABLE `tbcomprador` (
  `compra_id_comprador` int(11) NOT NULL,
  `compra_id_carrito` int(11) NOT NULL,
  `compra_nombre_comprador` varchar(30) NOT NULL,
  `compra_apellido_comprador` varchar(30) NOT NULL,
  `compra_correo_comprador` varchar(30) NOT NULL,
  `compra_historial` varchar(30) NOT NULL,
  `compra_confianza` varchar(10) NOT NULL,
  `compra_estado_compra` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbdetalle_factura`
--

CREATE TABLE `tbdetalle_factura` (
  `detfac_id_producto` int(11) NOT NULL,
  `detfac_nombre_producto` varchar(30) NOT NULL,
  `detfac_cantidad_producto` int(11) NOT NULL,
  `detfac_precio_producto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbencabezado_factura`
--

CREATE TABLE `tbencabezado_factura` (
  `enc_id_factura` int(11) NOT NULL,
  `enc_id_comprador` int(11) NOT NULL,
  `enc_id_pago` int(11) NOT NULL,
  `enc_id_vendedor` int(11) NOT NULL,
  `enc_id_envio` int(11) NOT NULL,
  `enc_forma_pago` varchar(30) NOT NULL,
  `enc_fecha_compra` date NOT NULL,
  `enc_nombre_comprador` varchar(30) NOT NULL,
  `enc_apellido_comprador` varchar(30) NOT NULL,
  `enc_correo_comprador` varchar(30) NOT NULL,
  `enc_nombre_vendedor` varchar(30) NOT NULL,
  `enc_apellido_vendedor` varchar(30) NOT NULL,
  `enc_correo_vendedor` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbenvio`
--

CREATE TABLE `tbenvio` (
  `env_id_envio` int(11) NOT NULL,
  `env_id_comprador` int(11) NOT NULL,
  `env_id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbpedido`
--

CREATE TABLE `tbpedido` (
  `pedi_id_pedido` int(11) NOT NULL,
  `pedi_id_producto` int(11) NOT NULL,
  `pedi_id_vendedor` int(11) NOT NULL,
  `pedi_id_comprador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbproducto`
--

CREATE TABLE `tbproducto` (
  `pro_id_producto` int(11) NOT NULL,
  `pro_nombre_producto` varchar(30) NOT NULL,
  `pro_descripcion_producto` varchar(400) NOT NULL,
  `pro_fecha_lote` date NOT NULL,
  `pro_fecha_vencimiento` date NOT NULL,
  `pro_precio_producto` double NOT NULL,
  `pro_estado_producto` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbroles`
--

CREATE TABLE `tbroles` (
  `rol_id_rol` int(11) NOT NULL,
  `rol_tipo_rol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbusuario`
--

CREATE TABLE `tbusuario` (
  `usu_id_usuario` int(11) NOT NULL,
  `usu_nombre_usuario` varchar(30) NOT NULL,
  `usu_apellido_usuario` varchar(30) NOT NULL,
  `usu_correo_vendedor` varchar(30) NOT NULL,
  `contrasena` varchar(30) NOT NULL,
  `num_cel` int(20) NOT NULL,
  `usu_dir` varchar(40) NOT NULL,
  `recuperacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbusuario`
--

INSERT INTO `tbusuario` (`usu_id_usuario`, `usu_nombre_usuario`, `usu_apellido_usuario`, `usu_correo_vendedor`, `contrasena`, `num_cel`, `usu_dir`, `recuperacion`) VALUES
(5, 'Andres Felipe', 'rojas', 'andresolmos2784@gmail.com', '78945', '3103977412', 'diagonal 14c numero19-46b', 'skefalutruc'),
(6, 'clemencia', 'rojas vargas', 'sadasd@gmail.com', '', '304399882', 'diagonal 14c numero19-46b', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbvendedor`
--

CREATE TABLE `tbvendedor` (
  `vende_id_vendedor` int(11) NOT NULL,
  `vende_nombre_vendedor` varchar(30) NOT NULL,
  `vende_Apellido_vendedor` varchar(30) NOT NULL,
  `vende_correo_vendedor` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_forma_pago`
--

CREATE TABLE `tb_forma_pago` (
  `formpa_id_pago` int(11) NOT NULL,
  `formpa_descripcion_pago` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbcarrito`
--
ALTER TABLE `tbcarrito`
  ADD PRIMARY KEY (`carri_id_carrito`),
  ADD KEY `carri_id_producto` (`carri_id_producto`);

--
-- Indices de la tabla `tbcomprador`
--
ALTER TABLE `tbcomprador`
  ADD PRIMARY KEY (`compra_id_comprador`),
  ADD KEY `compra_id_carrito` (`compra_id_carrito`);

--
-- Indices de la tabla `tbdetalle_factura`
--
ALTER TABLE `tbdetalle_factura`
  ADD PRIMARY KEY (`detfac_id_producto`);

--
-- Indices de la tabla `tbencabezado_factura`
--
ALTER TABLE `tbencabezado_factura`
  ADD PRIMARY KEY (`enc_id_factura`),
  ADD KEY `enc_id_comprador` (`enc_id_comprador`),
  ADD KEY `enc_id_pago` (`enc_id_pago`),
  ADD KEY `enc_id_vendedor` (`enc_id_vendedor`),
  ADD KEY `enc_id_envio` (`enc_id_envio`);

--
-- Indices de la tabla `tbenvio`
--
ALTER TABLE `tbenvio`
  ADD PRIMARY KEY (`env_id_envio`),
  ADD KEY `env_id_comprador` (`env_id_comprador`),
  ADD KEY `env_id_producto` (`env_id_producto`);

--
-- Indices de la tabla `tbpedido`
--
ALTER TABLE `tbpedido`
  ADD PRIMARY KEY (`pedi_id_pedido`),
  ADD KEY `pedi_id_vendedor` (`pedi_id_vendedor`),
  ADD KEY `pedi_id_comprador` (`pedi_id_comprador`);

--
-- Indices de la tabla `tbproducto`
--
ALTER TABLE `tbproducto`
  ADD PRIMARY KEY (`pro_id_producto`);

--
-- Indices de la tabla `tbroles`
--
ALTER TABLE `tbroles`
  ADD PRIMARY KEY (`rol_id_rol`);

--
-- Indices de la tabla `tbusuario`
--
ALTER TABLE `tbusuario`
  ADD PRIMARY KEY (`usu_id_usuario`);

--
-- Indices de la tabla `tbvendedor`
--
ALTER TABLE `tbvendedor`
  ADD PRIMARY KEY (`vende_id_vendedor`);

--
-- Indices de la tabla `tb_forma_pago`
--
ALTER TABLE `tb_forma_pago`
  ADD PRIMARY KEY (`formpa_id_pago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbcarrito`
--
ALTER TABLE `tbcarrito`
  MODIFY `carri_id_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbcomprador`
--
ALTER TABLE `tbcomprador`
  MODIFY `compra_id_comprador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbdetalle_factura`
--
ALTER TABLE `tbdetalle_factura`
  MODIFY `detfac_id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbencabezado_factura`
--
ALTER TABLE `tbencabezado_factura`
  MODIFY `enc_id_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbenvio`
--
ALTER TABLE `tbenvio`
  MODIFY `env_id_envio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbpedido`
--
ALTER TABLE `tbpedido`
  MODIFY `pedi_id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbproducto`
--
ALTER TABLE `tbproducto`
  MODIFY `pro_id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbroles`
--
ALTER TABLE `tbroles`
  MODIFY `rol_id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbusuario`
--
ALTER TABLE `tbusuario`
  MODIFY `usu_id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbvendedor`
--
ALTER TABLE `tbvendedor`
  MODIFY `vende_id_vendedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_forma_pago`
--
ALTER TABLE `tb_forma_pago`
  MODIFY `formpa_id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbcarrito`
--
ALTER TABLE `tbcarrito`
  ADD CONSTRAINT `tbcarrito_ibfk_1` FOREIGN KEY (`carri_id_producto`) REFERENCES `tbproducto` (`pro_id_producto`);

--
-- Filtros para la tabla `tbcomprador`
--
ALTER TABLE `tbcomprador`
  ADD CONSTRAINT `tbcomprador_ibfk_1` FOREIGN KEY (`compra_id_carrito`) REFERENCES `tbcarrito` (`carri_id_carrito`);

--
-- Filtros para la tabla `tbencabezado_factura`
--
ALTER TABLE `tbencabezado_factura`
  ADD CONSTRAINT `tbencabezado_factura_ibfk_1` FOREIGN KEY (`enc_id_comprador`) REFERENCES `tbcomprador` (`compra_id_comprador`),
  ADD CONSTRAINT `tbencabezado_factura_ibfk_2` FOREIGN KEY (`enc_id_pago`) REFERENCES `tb_forma_pago` (`formpa_id_pago`),
  ADD CONSTRAINT `tbencabezado_factura_ibfk_3` FOREIGN KEY (`enc_id_vendedor`) REFERENCES `tbvendedor` (`vende_id_vendedor`),
  ADD CONSTRAINT `tbencabezado_factura_ibfk_4` FOREIGN KEY (`enc_id_envio`) REFERENCES `tbenvio` (`env_id_envio`);

--
-- Filtros para la tabla `tbenvio`
--
ALTER TABLE `tbenvio`
  ADD CONSTRAINT `tbenvio_ibfk_1` FOREIGN KEY (`env_id_comprador`) REFERENCES `tbcomprador` (`compra_id_comprador`),
  ADD CONSTRAINT `tbenvio_ibfk_2` FOREIGN KEY (`env_id_producto`) REFERENCES `tbproducto` (`pro_id_producto`),
  ADD CONSTRAINT `tbenvio_ibfk_3` FOREIGN KEY (`env_id_comprador`) REFERENCES `tbcomprador` (`compra_id_comprador`),
  ADD CONSTRAINT `tbenvio_ibfk_4` FOREIGN KEY (`env_id_producto`) REFERENCES `tbproducto` (`pro_id_producto`);

--
-- Filtros para la tabla `tbpedido`
--
ALTER TABLE `tbpedido`
  ADD CONSTRAINT `tbpedido_ibfk_1` FOREIGN KEY (`pedi_id_vendedor`) REFERENCES `tbvendedor` (`vende_id_vendedor`),
  ADD CONSTRAINT `tbpedido_ibfk_2` FOREIGN KEY (`pedi_id_comprador`) REFERENCES `tbcomprador` (`compra_id_comprador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
