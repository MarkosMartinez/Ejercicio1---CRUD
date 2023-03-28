-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2023 a las 09:51:11
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `polideportivo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `dias_semana` varchar(64) NOT NULL,
  `horas` int(11) NOT NULL,
  `max_participantes` int(11) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `nombre`, `fecha_inicio`, `dias_semana`, `horas`, `max_participantes`, `precio`) VALUES
(2, 'zumba', '2020-01-08', 'jueves, sabado', 16, 20, 45),
(3, 'zumba', '2020-03-02', 'lunes, miercoles', 16, 20, 45),
(4, 'spining', '2020-02-03', 'miercoles', 12, 12, 30),
(5, 'spining', '2020-02-03', 'lunes, miercoles', 8, 12, 24),
(6, 'cros fit', '2020-03-08', 'miercoles, viernes', 8, 20, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id`, `id_usuario`, `id_actividad`) VALUES
(25, 4, 6),
(26, 5, 6),
(31, 6, 5),
(1, 6, 6),
(32, 7, 5),
(27, 7, 6),
(33, 8, 5),
(28, 8, 6),
(34, 9, 5),
(2, 9, 6),
(35, 10, 5),
(29, 10, 6),
(36, 11, 5),
(30, 11, 6),
(37, 12, 5),
(38, 13, 5),
(39, 14, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(3) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Usuario'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_apellido` varchar(32) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `codigo` varchar(8) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_rol` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_apellido`, `dni`, `codigo`, `fecha_nacimiento`, `password`, `id_rol`) VALUES
(2, 'iñigo rosado', '22222222a', '1001', '2023-03-12', 'Kaixoooooooooooooo', 0),
(3, 'oier ugalde', '33333333a', '1002', '2023-06-23', 'a', 0),
(4, 'beñat bilbao', '44444444a', '1003', NULL, 'null', 0),
(5, 'markel rajado', '55555555a', '1004', NULL, 'null', 0),
(6, 'aitor gonzalez', '66666666a', '1005', NULL, 'null', 0),
(7, 'paul horcajada', '77777777a', '1006', NULL, 'null', 0),
(8, 'zigor etxebarria', '88888888a', '1007', NULL, 'null', 0),
(9, 'aitzol estebez', '99999999a', '1008', NULL, 'null', 0),
(10, 'xabier oyarzun', '10101010a', '1009', NULL, 'null', 0),
(11, 'andoni garcia', '12121212a', '1010', NULL, 'null', 0),
(12, 'oier garcia', '13131313a', '1011', NULL, 'null', 0),
(13, 'aritz santana', '14141414a', '1012', NULL, 'null', 0),
(14, 'anartz vargas', '15151515a', '1013', NULL, 'null', 0),
(15, 'beñat bikuña', '16161616a', '1014', NULL, 'null', 0),
(16, 'Aitor Goikoetxea', '45781245J', '1015', NULL, 'null', 0),
(30, 'Aitor Etxaide', '4578455T', '1016', '2023-03-23', 'Contraseña', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_usuario_2` (`id_usuario`,`id_actividad`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_actividad` (`id_actividad`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
