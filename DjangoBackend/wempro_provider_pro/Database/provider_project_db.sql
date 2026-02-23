-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2026 at 03:21 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `provider_project_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add content type', 3, 'add_contenttype'),
(10, 'Can change content type', 3, 'change_contenttype'),
(11, 'Can delete content type', 3, 'delete_contenttype'),
(12, 'Can view content type', 3, 'view_contenttype'),
(13, 'Can add product', 4, 'add_product'),
(14, 'Can change product', 4, 'change_product'),
(15, 'Can delete product', 4, 'delete_product'),
(16, 'Can view product', 4, 'view_product'),
(17, 'Can add product manage', 5, 'add_productmanage'),
(18, 'Can change product manage', 5, 'change_productmanage'),
(19, 'Can delete product manage', 5, 'delete_productmanage'),
(20, 'Can view product manage', 5, 'view_productmanage'),
(21, 'Can add custom user', 6, 'add_customuser'),
(22, 'Can change custom user', 6, 'change_customuser'),
(23, 'Can delete custom user', 6, 'delete_customuser'),
(24, 'Can view custom user', 6, 'view_customuser'),
(25, 'Can add log entry', 7, 'add_logentry'),
(26, 'Can change log entry', 7, 'change_logentry'),
(27, 'Can delete log entry', 7, 'delete_logentry'),
(28, 'Can view log entry', 7, 'view_logentry'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session'),
(33, 'Can add slider list', 9, 'add_sliderlist'),
(34, 'Can change slider list', 9, 'change_sliderlist'),
(35, 'Can delete slider list', 9, 'delete_sliderlist'),
(36, 'Can view slider list', 9, 'view_sliderlist'),
(37, 'Can add services', 10, 'add_services'),
(38, 'Can change services', 10, 'change_services'),
(39, 'Can delete services', 10, 'delete_services'),
(40, 'Can view services', 10, 'view_services');

-- --------------------------------------------------------

--
-- Table structure for table `custom_user`
--

CREATE TABLE `custom_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(150) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `district` varchar(150) NOT NULL,
  `father_name` varchar(150) NOT NULL,
  `mother_name` varchar(150) NOT NULL,
  `village` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `custom_user`
--

INSERT INTO `custom_user` (`id`, `password`, `last_login`, `is_superuser`, `email`, `full_name`, `is_staff`, `is_active`, `created_at`, `district`, `father_name`, `mother_name`, `village`, `phone`, `image`) VALUES
(1, '1234', NULL, 0, 'akkas@g.c', 'Akkas Mia', 0, 1, '2026-02-07 07:49:32.699656', '', '', '', '', '01902353773', ''),
(2, '1234', NULL, 0, 'nur@g.c', 'Nur Mohammad Zihadi', 0, 1, '2026-02-07 07:53:25.798596', '', '', '', '', '686868', ''),
(3, '1234', NULL, 0, 'jane@g.c', 'jkhan', 0, 1, '2026-02-07 11:36:28.589453', '', '', '', '', '123456789', ''),
(4, '1234', NULL, 0, 'faruk@g.c', 'Omar Faruk', 0, 1, '2026-02-08 04:19:32.926146', '', '', '', '', '0184248405', ''),
(5, '1235', NULL, 0, 'ali@g.c', 'akkas Ali', 0, 1, '2026-02-08 07:59:53.471127', '', '', '', '', '852147963', ''),
(6, 'hchch', NULL, 0, 'vjchc', 'dyfyd', 0, 1, '2026-02-08 08:57:53.030209', '', '', '', '', '8686868', 'profile_images/1000021620.jpg'),
(7, 'vhfhf', NULL, 0, 'chfhf', 'hghfh', 0, 1, '2026-02-08 09:07:15.925053', '', '', '', '', '53535', 'profile_images/1000021492.jpg'),
(8, 'hvjvjgj', NULL, 0, 'gjfhf', 'ughfhdf', 0, 1, '2026-02-08 09:11:19.226566', '', '', '', '', '653565', 'profile_images/1000021614.jpg'),
(9, 'cufyfyfyf', NULL, 0, 'gjghvhg', 'hfufufyf', 0, 1, '2026-02-08 09:12:49.497089', '', '', '', '', '3868585858', 'profile_images/1000021596.jpg'),
(10, '1234', NULL, 0, 'mahbub@g.c', 'Mahabub', 0, 1, '2026-02-08 09:14:21.107272', '', '', '', '', '353524248585', 'profile_images/1000021611.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `custom_user_groups`
--

CREATE TABLE `custom_user_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_user_user_permissions`
--

CREATE TABLE `custom_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'admin', 'logentry'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'contenttypes', 'contenttype'),
(6, 'provider_app', 'customuser'),
(4, 'provider_app', 'product'),
(5, 'provider_app', 'productmanage'),
(10, 'provider_app', 'services'),
(9, 'provider_app', 'sliderlist'),
(8, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-02-07 06:39:20.667139'),
(2, 'contenttypes', '0002_remove_content_type_name', '2026-02-07 06:39:20.730042'),
(3, 'auth', '0001_initial', '2026-02-07 06:39:20.965444'),
(4, 'auth', '0002_alter_permission_name_max_length', '2026-02-07 06:39:21.028960'),
(5, 'auth', '0003_alter_user_email_max_length', '2026-02-07 06:39:21.028960'),
(6, 'auth', '0004_alter_user_username_opts', '2026-02-07 06:39:21.043971'),
(7, 'auth', '0005_alter_user_last_login_null', '2026-02-07 06:39:21.043971'),
(8, 'auth', '0006_require_contenttypes_0002', '2026-02-07 06:39:21.043971'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2026-02-07 06:39:21.075233'),
(10, 'auth', '0008_alter_user_username_max_length', '2026-02-07 06:39:21.075233'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2026-02-07 06:39:21.090898'),
(12, 'auth', '0010_alter_group_name_max_length', '2026-02-07 06:39:21.106492'),
(13, 'auth', '0011_update_proxy_permissions', '2026-02-07 06:39:21.106492'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2026-02-07 06:39:21.122114'),
(15, 'provider_app', '0001_initial', '2026-02-07 06:39:21.443753'),
(16, 'provider_app', '0002_customuser_district_customuser_father_name_and_more', '2026-02-07 06:44:32.526704'),
(17, 'provider_app', '0003_customuser_phone_alter_customuser_password', '2026-02-07 07:46:28.881948'),
(18, 'admin', '0001_initial', '2026-02-08 08:46:16.043664'),
(19, 'admin', '0002_logentry_remove_auto_add', '2026-02-08 08:46:16.059305'),
(20, 'admin', '0003_logentry_add_action_flag_choices', '2026-02-08 08:46:16.059305'),
(21, 'provider_app', '0004_customuser_image', '2026-02-08 08:46:16.090553'),
(22, 'sessions', '0001_initial', '2026-02-08 08:46:16.138058'),
(23, 'provider_app', '0005_alter_customuser_image', '2026-02-08 08:51:20.025453'),
(24, 'provider_app', '0006_sliderlist', '2026-02-09 06:25:41.280577'),
(25, 'provider_app', '0007_services', '2026-02-10 02:47:51.059200'),
(26, 'provider_app', '0008_services_price', '2026-02-15 10:47:27.202952');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_manage`
--

CREATE TABLE `product_manage` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` bigint(20) NOT NULL,
  `category_title` varchar(100) NOT NULL,
  `service_title` varchar(150) NOT NULL,
  `service_details` longtext NOT NULL,
  `rank` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `category_title`, `service_title`, `service_details`, `rank`, `image`, `created`, `price`) VALUES
(1, 'Painting', 'fgchchch', 'gjgjvjgjgjvjvkh\nghfugu', 5, 'service_images/scaled_1000021830.png', '2026-02-10 03:28:58.705727', 1234),
(2, 'Cleaning', 'House cleaning service', 'dhjk\ngfduuh hgdt\ngfdsrui jgds', 2, 'service_images/scaled_1000021829.png', '2026-02-10 03:58:31.470883', 5678),
(3, 'Electrical', 'nur service', 'dhjkgc\nfgjk\nfhkk', 3, 'service_images/scaled_1000021836.jpg', '2026-02-10 05:22:08.831205', 9876),
(4, 'Electrical', 'hfjg', 'vhvjg', 5, 'service_images/scaled_1000021830_UcbycT5.png', '2026-02-10 06:11:19.551923', 34324),
(5, 'Cleaning', 'Test Service', 'This sis dhdjfnd cjfjdjd', 4, 'service_images/scaled_1000021817.jpg', '2026-02-10 08:06:22.757190', 3456),
(6, 'Plumbing', 'Test Service', 'This sis dhdjfnd cjfjdjd', 4, 'service_images/scaled_1000021820.jpg', '2026-02-10 08:09:29.153994', 546),
(7, 'Plumbing', 'fgh', 'vvv', 85, 'service_images/scaled_1000021830_hUAX7P0.png', '2026-02-10 08:10:36.824915', 598),
(8, 'Plumbing', 'fgh', 'vvv', 72, 'service_images/scaled_1000021817_9Yt1IM2.jpg', '2026-02-10 08:11:17.088035', 0),
(9, 'Plumbing', 'fgh', 'vvv', 78, 'service_images/scaled_1000021836_MpGwCuU.jpg', '2026-02-10 08:12:24.976987', 0),
(10, 'Plumbing', 'fgh', 'vvv', 79, 'service_images/scaled_1000021830_TkckkD3.png', '2026-02-10 08:19:37.348399', 0),
(11, 'Cleaning Category', 'Basic House Cleaning 112', 'We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \"Accept All\", you consent to our use of cookies. We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \"Accept All\", you consent to our use of cookies. We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \"Accept All\", you consent to our use of cookies. We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \"Accept All\", you consent to our use of cookies.', 1, 'service_images/scaled_1000021821.jpg', '2026-02-10 08:30:14.849694', 23456),
(12, 'Plumbing', 'shshd', 'zhdhdbhd', 2, 'service_images/scaled_1000021836_F32pu13.jpg', '2026-02-10 08:30:54.001093', 0),
(13, 'Electrical', 'ghv', 'vhcgcgxgf', 4, 'service_images/scaled_1000021817_EuZfdhV.jpg', '2026-02-10 08:37:59.201567', 0),
(14, 'Electrical', 'uguhg', 'vhcvh', 6, 'service_images/scaled_1000021829_5hb4mL5.png', '2026-02-10 08:39:26.126200', 0),
(15, 'Electrical', 'akkas jhvh ', 'gbbnn', 1, 'service_images/scaled_1000021619.jpg', '2026-02-10 08:40:16.273541', 0),
(16, 'Electrical', 'akkas Aki', 'shdbddvdbndd\ndedf', 1, 'service_images/scaled_1000021829_2Nld6mr.png', '2026-02-10 08:42:11.904577', 0),
(17, 'Electrical', 'dghjjuyt yttf ', 'vtg thug thy  home gtgthyn', 2, 'service_images/scaled_1000022074.jpg', '2026-02-16 05:35:53.454045', 0);

-- --------------------------------------------------------

--
-- Table structure for table `slider_list`
--

CREATE TABLE `slider_list` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider_list`
--

INSERT INTO `slider_list` (`id`, `title`, `image`, `rank`, `created`) VALUES
(1, 'Welcome to Our Website', 'slider_images/Slider2.webp', 1, '2026-02-09 12:26:25.000000'),
(2, 'Our Latest Products', 'slider_images/Slider4.webp', 2, '2026-02-09 12:26:25.000000'),
(5, 'Our Latest Products 333', 'slider_images/Slider3.png', 3, '2026-02-09 12:26:25.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `custom_user`
--
ALTER TABLE `custom_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `custom_user_groups`
--
ALTER TABLE `custom_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_user_groups_customuser_id_group_id_ea14f886_uniq` (`customuser_id`,`group_id`),
  ADD KEY `custom_user_groups_group_id_02874f21_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `custom_user_user_permissions`
--
ALTER TABLE `custom_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_user_user_permiss_customuser_id_permission_f9232336_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_custom_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_manage`
--
ALTER TABLE `product_manage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_list`
--
ALTER TABLE `slider_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `custom_user`
--
ALTER TABLE `custom_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `custom_user_groups`
--
ALTER TABLE `custom_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_user_user_permissions`
--
ALTER TABLE `custom_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_manage`
--
ALTER TABLE `product_manage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `slider_list`
--
ALTER TABLE `slider_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `custom_user_groups`
--
ALTER TABLE `custom_user_groups`
  ADD CONSTRAINT `custom_user_groups_customuser_id_8e3d0338_fk_custom_user_id` FOREIGN KEY (`customuser_id`) REFERENCES `custom_user` (`id`),
  ADD CONSTRAINT `custom_user_groups_group_id_02874f21_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `custom_user_user_permissions`
--
ALTER TABLE `custom_user_user_permissions`
  ADD CONSTRAINT `custom_user_user_per_customuser_id_ec2da4cb_fk_custom_us` FOREIGN KEY (`customuser_id`) REFERENCES `custom_user` (`id`),
  ADD CONSTRAINT `custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `custom_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
