-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2025 a las 12:14:33
-- Versión del servidor: 11.6.2-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `topmeal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add menu', 7, 'add_menu'),
(26, 'Can change menu', 7, 'change_menu'),
(27, 'Can delete menu', 7, 'delete_menu'),
(28, 'Can view menu', 7, 'view_menu'),
(29, 'Can add repartidores', 8, 'add_repartidores'),
(30, 'Can change repartidores', 8, 'change_repartidores'),
(31, 'Can delete repartidores', 8, 'delete_repartidores'),
(32, 'Can view repartidores', 8, 'view_repartidores'),
(33, 'Can add restaurantes', 9, 'add_restaurantes'),
(34, 'Can change restaurantes', 9, 'change_restaurantes'),
(35, 'Can delete restaurantes', 9, 'delete_restaurantes'),
(36, 'Can view restaurantes', 9, 'view_restaurantes'),
(37, 'Can add usuarios', 10, 'add_usuarios'),
(38, 'Can change usuarios', 10, 'change_usuarios'),
(39, 'Can delete usuarios', 10, 'delete_usuarios'),
(40, 'Can view usuarios', 10, 'view_usuarios'),
(41, 'Can add productos', 11, 'add_productos'),
(42, 'Can change productos', 11, 'change_productos'),
(43, 'Can delete productos', 11, 'delete_productos'),
(44, 'Can view productos', 11, 'view_productos'),
(45, 'Can add reservas', 12, 'add_reservas'),
(46, 'Can change reservas', 12, 'change_reservas'),
(47, 'Can delete reservas', 12, 'delete_reservas'),
(48, 'Can view reservas', 12, 'view_reservas'),
(49, 'Can add pedido', 13, 'add_pedido'),
(50, 'Can change pedido', 13, 'change_pedido'),
(51, 'Can delete pedido', 13, 'delete_pedido'),
(52, 'Can view pedido', 13, 'view_pedido'),
(53, 'Can add opiniones', 14, 'add_opiniones'),
(54, 'Can change opiniones', 14, 'change_opiniones'),
(55, 'Can delete opiniones', 14, 'delete_opiniones'),
(56, 'Can view opiniones', 14, 'view_opiniones'),
(57, 'Can add detalle pedido', 15, 'add_detallepedido'),
(58, 'Can change detalle pedido', 15, 'change_detallepedido'),
(59, 'Can delete detalle pedido', 15, 'delete_detallepedido'),
(60, 'Can view detalle pedido', 15, 'view_detallepedido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$atBMa0CdZxCFHiMqV3yXEB$i0hb9TT7OlYVcME49NP7angekQcelYIzGjDQ4sLWTwc=', '2025-06-11 07:44:21.750690', 1, 'zx23student3270', '', '', 'asdsad@gmail.com', 1, 1, '2025-06-11 07:00:22.665707');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_detallepedido`
--

CREATE TABLE `base_detallepedido` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_menu`
--

CREATE TABLE `base_menu` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `imagen_url` varchar(255) NOT NULL,
  `restaurante_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_opiniones`
--

CREATE TABLE `base_opiniones` (
  `id` bigint(20) NOT NULL,
  `puntuacion` decimal(3,2) NOT NULL,
  `comentario` longtext NOT NULL,
  `restaurante_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `base_opiniones`
--

INSERT INTO `base_opiniones` (`id`, `puntuacion`, `comentario`, `restaurante_id`, `usuario_id`) VALUES
(1, 4.90, 'Una comida espectacular. Sin duda volveré', 4, 2),
(2, 4.30, 'Un ambiente muy agradable y la comida muy bien . Lo recomiendo', 5, 2),
(3, 4.40, 'El personal muy amable , la comida un 10 , el lugar mejorable.', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_pedido`
--

CREATE TABLE `base_pedido` (
  `id` bigint(20) NOT NULL,
  `direccion_entrega` longtext NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `repartidor_id` bigint(20) NOT NULL,
  `restaurante_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_productos`
--

CREATE TABLE `base_productos` (
  `id` bigint(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `menu_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_repartidores`
--

CREATE TABLE `base_repartidores` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_reservas`
--

CREATE TABLE `base_reservas` (
  `id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `numero_personas` int(11) NOT NULL,
  `restaurante_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_restaurantes`
--

CREATE TABLE `base_restaurantes` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `precio_medio` decimal(6,2) NOT NULL,
  `media_valoracion` decimal(3,2) NOT NULL,
  `hora_apertura` time(6) NOT NULL,
  `hora_cierre` time(6) NOT NULL,
  `imagen_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `base_restaurantes`
--

INSERT INTO `base_restaurantes` (`id`, `nombre`, `direccion`, `tipo`, `precio_medio`, `media_valoracion`, `hora_apertura`, `hora_cierre`, `imagen_url`) VALUES
(1, 'La Parrilla del Norte', 'Calle Fuego 45, Madrid', 'Parrilla', 25.50, 4.00, '13:00:00.000000', '23:00:00.000000', 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092'),
(2, 'Sabor Oriental', 'Av. del Dragón 88, Barcelona', 'Asiática', 18.00, 2.00, '12:30:00.000000', '22:30:00.000000', 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38'),
(3, 'Bella Italia', 'Via Roma 12, Valencia', 'Italiana', 21.90, 1.00, '12:00:00.000000', '23:00:00.000000', 'https://lh3.googleusercontent.com/proxy/XGZEOFPY2GIYtDAtT-yGeyTbWX90w0S7HoQZnV-fDRklpoUQpa3V5B0zjD2u2-YqwCTtL24osublTNqkCCvKJIslvA'),
(4, 'Mariscos del Puerto', 'Calle del Mar 78, Málaga', 'Marisquería', 30.00, 4.80, '13:00:00.000000', '23:30:00.000000', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/e7/5c/d3/marisqueria-godoy-since.jpg?w=900&h=500&s=1'),
(5, 'Green Garden', 'Calle Verde 17, Sevilla', 'Vegetariana', 16.50, 4.00, '11:00:00.000000', '21:00:00.000000', 'https://static.diariovasco.com/www/multimedia/201909/06/media/invernadero.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `base_usuarios`
--

CREATE TABLE `base_usuarios` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `tarjeta` varchar(20) NOT NULL,
  `cad_tarjeta` varchar(5) NOT NULL,
  `cvv_tarjeta` varchar(3) NOT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `base_usuarios`
--

INSERT INTO `base_usuarios` (`id`, `nombre`, `email`, `contraseña`, `telefono`, `tarjeta`, `cad_tarjeta`, `cvv_tarjeta`, `direccion`) VALUES
(2, 'Jose Antonio', 'ejemplo@gmail.com', 'Miro_1703', '603689704', '4111 1111 1111 1111', '12/26', '123', 'Colegio Valle Del Miro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-06-11 07:45:09.294809', '1', 'Opiniones object (1)', 1, '[{\"added\": {}}]', 14, 1),
(2, '2025-06-11 07:45:26.594199', '5', 'Restaurantes object (5)', 2, '[{\"changed\": {\"fields\": [\"Media valoracion\"]}}]', 9, 1),
(3, '2025-06-11 07:46:02.407551', '2', 'Opiniones object (2)', 1, '[{\"added\": {}}]', 14, 1),
(4, '2025-06-11 07:47:01.498319', '3', 'Opiniones object (3)', 1, '[{\"added\": {}}]', 14, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(15, 'base', 'detallepedido'),
(7, 'base', 'menu'),
(14, 'base', 'opiniones'),
(13, 'base', 'pedido'),
(11, 'base', 'productos'),
(8, 'base', 'repartidores'),
(12, 'base', 'reservas'),
(9, 'base', 'restaurantes'),
(10, 'base', 'usuarios'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-06-11 06:59:49.599338'),
(2, 'auth', '0001_initial', '2025-06-11 06:59:50.062904'),
(3, 'admin', '0001_initial', '2025-06-11 06:59:50.169558'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-06-11 06:59:50.205475'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-11 06:59:50.217155'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-06-11 06:59:50.297815'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-06-11 06:59:50.338230'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-06-11 06:59:50.366167'),
(9, 'auth', '0004_alter_user_username_opts', '2025-06-11 06:59:50.373972'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-06-11 06:59:50.413730'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-06-11 06:59:50.416226'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-06-11 06:59:50.429527'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-06-11 06:59:50.456428'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-06-11 06:59:50.484907'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-06-11 06:59:50.516659'),
(16, 'auth', '0011_update_proxy_permissions', '2025-06-11 06:59:50.529495'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-06-11 06:59:50.558714'),
(18, 'base', '0001_initial', '2025-06-11 06:59:51.020102'),
(19, 'sessions', '0001_initial', '2025-06-11 06:59:51.053734');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('fpg4nidp94hnci5js9a9llq8kb6c16af', '.eJxVjEEOgjAQRe_StWnoOFOoS_eeoZnOtIIaSCisjHcXEha6_e-9_zaR16WPa81zHNRcjDOn3y2xPPO4A33weJ-sTOMyD8nuij1otbdJ8-t6uH8HPdd-q7l07tygICfyqL6oBwgQyLWQBbAgtaFTT0IaXPHKhGUTKTWdoID5fAHR4DeB:1uPG8D:D0FspW3DpkIWQb_7-9s9NC4MqsR3hMD7mUlEzWIuJno', '2025-06-25 07:44:21.754696');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `base_detallepedido`
--
ALTER TABLE `base_detallepedido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `base_detallepedido_pedido_id_producto_id_87a1efd3_uniq` (`pedido_id`,`producto_id`),
  ADD KEY `base_detallepedido_producto_id_a5c9b2e3_fk_base_productos_id` (`producto_id`);

--
-- Indices de la tabla `base_menu`
--
ALTER TABLE `base_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_menu_restaurante_id_8ea00bd5_fk_base_restaurantes_id` (`restaurante_id`);

--
-- Indices de la tabla `base_opiniones`
--
ALTER TABLE `base_opiniones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_opiniones_restaurante_id_89dd2c63_fk_base_restaurantes_id` (`restaurante_id`),
  ADD KEY `base_opiniones_usuario_id_fb419764_fk_base_usuarios_id` (`usuario_id`);

--
-- Indices de la tabla `base_pedido`
--
ALTER TABLE `base_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_pedido_repartidor_id_fe127d52_fk_base_repartidores_id` (`repartidor_id`),
  ADD KEY `base_pedido_restaurante_id_f11e7359_fk_base_restaurantes_id` (`restaurante_id`),
  ADD KEY `base_pedido_usuario_id_6fc97c0f_fk_base_usuarios_id` (`usuario_id`);

--
-- Indices de la tabla `base_productos`
--
ALTER TABLE `base_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_productos_menu_id_23925fa3_fk_base_menu_id` (`menu_id`);

--
-- Indices de la tabla `base_repartidores`
--
ALTER TABLE `base_repartidores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `base_reservas`
--
ALTER TABLE `base_reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_reservas_restaurante_id_fe91cda8_fk_base_restaurantes_id` (`restaurante_id`),
  ADD KEY `base_reservas_usuario_id_6a3720f5_fk_base_usuarios_id` (`usuario_id`);

--
-- Indices de la tabla `base_restaurantes`
--
ALTER TABLE `base_restaurantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `base_usuarios`
--
ALTER TABLE `base_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `base_detallepedido`
--
ALTER TABLE `base_detallepedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `base_menu`
--
ALTER TABLE `base_menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `base_opiniones`
--
ALTER TABLE `base_opiniones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `base_pedido`
--
ALTER TABLE `base_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `base_productos`
--
ALTER TABLE `base_productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `base_repartidores`
--
ALTER TABLE `base_repartidores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `base_reservas`
--
ALTER TABLE `base_reservas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `base_restaurantes`
--
ALTER TABLE `base_restaurantes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `base_usuarios`
--
ALTER TABLE `base_usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `base_detallepedido`
--
ALTER TABLE `base_detallepedido`
  ADD CONSTRAINT `base_detallepedido_pedido_id_f886613d_fk_base_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `base_pedido` (`id`),
  ADD CONSTRAINT `base_detallepedido_producto_id_a5c9b2e3_fk_base_productos_id` FOREIGN KEY (`producto_id`) REFERENCES `base_productos` (`id`);

--
-- Filtros para la tabla `base_menu`
--
ALTER TABLE `base_menu`
  ADD CONSTRAINT `base_menu_restaurante_id_8ea00bd5_fk_base_restaurantes_id` FOREIGN KEY (`restaurante_id`) REFERENCES `base_restaurantes` (`id`);

--
-- Filtros para la tabla `base_opiniones`
--
ALTER TABLE `base_opiniones`
  ADD CONSTRAINT `base_opiniones_restaurante_id_89dd2c63_fk_base_restaurantes_id` FOREIGN KEY (`restaurante_id`) REFERENCES `base_restaurantes` (`id`),
  ADD CONSTRAINT `base_opiniones_usuario_id_fb419764_fk_base_usuarios_id` FOREIGN KEY (`usuario_id`) REFERENCES `base_usuarios` (`id`);

--
-- Filtros para la tabla `base_pedido`
--
ALTER TABLE `base_pedido`
  ADD CONSTRAINT `base_pedido_repartidor_id_fe127d52_fk_base_repartidores_id` FOREIGN KEY (`repartidor_id`) REFERENCES `base_repartidores` (`id`),
  ADD CONSTRAINT `base_pedido_restaurante_id_f11e7359_fk_base_restaurantes_id` FOREIGN KEY (`restaurante_id`) REFERENCES `base_restaurantes` (`id`),
  ADD CONSTRAINT `base_pedido_usuario_id_6fc97c0f_fk_base_usuarios_id` FOREIGN KEY (`usuario_id`) REFERENCES `base_usuarios` (`id`);

--
-- Filtros para la tabla `base_productos`
--
ALTER TABLE `base_productos`
  ADD CONSTRAINT `base_productos_menu_id_23925fa3_fk_base_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `base_menu` (`id`);

--
-- Filtros para la tabla `base_reservas`
--
ALTER TABLE `base_reservas`
  ADD CONSTRAINT `base_reservas_restaurante_id_fe91cda8_fk_base_restaurantes_id` FOREIGN KEY (`restaurante_id`) REFERENCES `base_restaurantes` (`id`),
  ADD CONSTRAINT `base_reservas_usuario_id_6a3720f5_fk_base_usuarios_id` FOREIGN KEY (`usuario_id`) REFERENCES `base_usuarios` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
