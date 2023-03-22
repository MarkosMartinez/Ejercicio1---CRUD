-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2023 a las 13:54:33
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
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_apellido` varchar(32) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `codigo` varchar(8) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_apellido`, `dni`, `codigo`, `fecha_nacimiento`, `password`) VALUES
(2, 'iñigo rosado', '22222222a', '1001', '2023-03-11', 'adiossss'),
(3, 'oier ugalde', '33333333a', '1002', '2023-06-23', 'null'),
(4, 'beñat bilbao', '44444444a', '1003', NULL, 'null'),
(5, 'markel rajado', '55555555a', '1004', NULL, 'null'),
(6, 'aitor gonzalez', '66666666a', '1005', NULL, 'null'),
(7, 'paul horcajada', '77777777a', '1006', NULL, 'null'),
(8, 'zigor etxebarria', '88888888a', '1007', NULL, 'null'),
(9, 'aitzol estebez', '99999999a', '1008', NULL, 'null'),
(10, 'xabier oyarzun', '10101010a', '1009', NULL, 'null'),
(11, 'andoni garcia', '12121212a', '1010', NULL, 'null'),
(12, 'oier garcia', '13131313a', '1011', NULL, 'null'),
(13, 'aritz santana', '14141414a', '1012', NULL, 'null'),
(14, 'anartz vargas', '15151515a', '1013', NULL, 'null'),
(15, 'beñat bikuña', '16161616a', '1014', NULL, 'null'),
(16, 'Aitor Goikoetxea', '45781245J', '1015', NULL, 'null'),
(20, 'Aitor Etxaide', '45784578J', '1018', '2002-09-15', 'null');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
