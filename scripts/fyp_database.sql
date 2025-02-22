-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2025 at 12:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fyp_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL,
  `country` varchar(50) NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `location`, `country`, `province`, `city`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 'Gulberg', 'Pakistan', 'Punjab', 'Lahore', '75600', '2024-12-16 10:29:26', '2024-12-16 10:37:12'),
(2, 'Clifton Beach', 'Pakistan', 'Sindh', 'Karachi', '54000', '2024-11-24 18:13:44', '2024-12-16 10:37:12'),
(3, 'Quetta Cantt', 'Pakistan', 'Balochistan', 'Queta', '87800', '2024-11-24 18:13:44', '2024-12-16 10:37:12'),
(4, 'Daman-e-Koh', 'Pakistan', 'Punjab', 'Islamabad', '44050', '2024-11-24 18:13:44', '2024-12-16 10:37:12');

-- --------------------------------------------------------

--
-- Table structure for table `buildingdocuments`
--

CREATE TABLE `buildingdocuments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `document_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildingdocuments`
--

INSERT INTO `buildingdocuments` (`id`, `building_id`, `file_path`, `file_name`, `document_type`, `created_at`, `updated_at`) VALUES
(1, 1, '/documents/tech_innovations_building_plan.pdf', 'tech_innovations_building_plan.pdf', 'Building Plan', '2024-11-24 18:13:44', '2024-11-24 18:13:44'),
(2, 2, '/documents/green_solutions_building_permit.pdf', 'green_solutions_building_permit.pdf', 'Building Permit', '2024-11-24 18:13:44', '2024-11-24 18:13:44'),
(3, 1, '1', 'First Floor', 'Office space for rent', '2024-11-24 18:13:44', '2024-11-24 18:13:44'),
(4, 2, '2', 'Second Floor', 'Meeting rooms and conference spaces', '2024-11-24 18:13:44', '2024-12-17 14:10:29'),
(5, 3, '3', 'Ground Floor', 'Office reception area', '2024-11-24 18:13:44', '2024-12-17 14:10:29');

-- --------------------------------------------------------

--
-- Table structure for table `buildinglevels`
--

CREATE TABLE `buildinglevels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL,
  `level_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `level_number` int(11) NOT NULL,
  `status` enum('Approved','Rejected') NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildinglevels`
--

INSERT INTO `buildinglevels` (`id`, `building_id`, `level_name`, `description`, `level_number`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'First Floor', 'Office space for rent', 1, 'Approved', 1, 1, '2024-11-24 18:13:44', '2024-11-24 18:13:44'),
(2, 2, 'Second Floor', 'Meeting rooms and conference spaces', 2, 'Approved', 2, 2, '2024-11-24 18:13:44', '2024-12-17 14:10:29'),
(3, 3, 'Ground Floor', 'Office reception area', 1, 'Rejected', 2, 2, '2024-11-24 18:13:44', '2024-12-17 14:10:29');

-- --------------------------------------------------------

--
-- Table structure for table `buildingpictures`
--

CREATE TABLE `buildingpictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildingpictures`
--

INSERT INTO `buildingpictures` (`id`, `building_id`, `file_path`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, '/uploads/Building_1.jpeg', 'Bahria Prime.jpg', '2024-11-24 18:13:44', '2024-12-16 12:51:37'),
(2, 2, '/uploads/Building_2.jpeg', 'HMY Heights.jpg', '2024-11-24 18:13:44', '2024-12-16 12:51:37'),
(3, 3, '/uploads/Building_3.jpeg', 'Lahore SKY Apartments.jpg', '2024-12-15 14:08:20', '2024-12-16 12:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `remarks` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `area` decimal(10,2) NOT NULL,
  `building_type` varchar(50) NOT NULL COMMENT 'Residential, Commercial, Industrial, Mixed-Use',
  `construction_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `organization_id`, `name`, `address_id`, `status`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`, `area`, `building_type`, `construction_year`) VALUES
(1, 1, 'Bahria Prime', 1, 'Approved', 'Approved building for office use.', 1, 1, '2024-11-24 18:13:44', '2024-12-16 14:45:12', 10.00, 'Residential', '2012'),
(2, 1, 'HMY Heights', 2, 'Approved', 'Under review for new office setup.', 2, 2, '2024-11-24 18:13:44', '2024-12-16 14:45:12', 10.00, 'Commercial', '2010'),
(3, 2, 'Islamabad SKY Apartments', 4, 'Approved', 'Under review for new office setup.', 2, 2, '2024-11-24 18:13:44', '2024-12-16 14:45:12', 10.00, 'Commercial', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `buildingunits`
--

CREATE TABLE `buildingunits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level_id` bigint(20) UNSIGNED NOT NULL,
  `unit_name` varchar(50) NOT NULL,
  `unit_type` varchar(50) NOT NULL COMMENT 'Type of unit: Room, Shop, Apartment, Restaurant, Gym',
  `availability_status` enum('Available','Rented','Sold','Not Available') NOT NULL,
  `sale_or_rent` enum('Sale','Rent','Not Available') NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` enum('Approved','Rejected') DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `organization_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area` decimal(10,2) NOT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildingunits`
--

INSERT INTO `buildingunits` (`id`, `level_id`, `unit_name`, `unit_type`, `availability_status`, `sale_or_rent`, `price`, `status`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`, `organization_id`, `area`, `building_id`) VALUES
(1, 1, 'Room 01', 'Room', 'Rented', 'Rent', 10000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 1, 1, '2024-11-24 18:13:44', '2025-02-15 09:19:23', 1, 100.00, 1),
(2, 3, 'Shop 01', 'Shop', 'Available', 'Sale', 150000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:10:03', 2, 100.00, 3),
(3, 3, 'Apartment 01', 'Apartment', 'Available', 'Rent', 35000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:10:03', 2, 100.00, 3),
(4, 2, 'Room 02', 'Room', 'Sold', 'Sale', 100000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:10:03', 1, 100.00, 2),
(5, 2, 'Shop 02', 'Shop', 'Available', 'Rent', 15000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:09:30', 1, 100.00, 2),
(6, 1, 'Apartment 02', 'Apartment', 'Rented', 'Rent', 25000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 1, 1, '2024-11-24 18:13:44', '2025-02-15 09:19:23', 1, 100.00, 1),
(7, 2, 'Room 03', 'Room', 'Available', 'Rent', 10000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:09:30', 1, 100.00, 2),
(8, 3, 'Shop 03', 'Shop', 'Available', 'Sale', 135000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:09:30', 2, 100.00, 3),
(9, 1, 'Apartment 03', 'Apartment', 'Rented', 'Rent', 20000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 09:19:23', 1, 100.00, 1),
(10, 3, 'Room 04', 'Room', 'Available', 'Rent', 10000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:09:30', 2, 100.00, 3),
(11, 1, 'Shop 04', 'Shop', 'Rented', 'Rent', 150000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 1, 1, '2024-11-24 18:13:44', '2025-02-15 09:19:23', 1, 100.00, 1),
(12, 2, 'Apartment 04', 'Apartment', 'Available', 'Sale', 35000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:09:30', 1, 100.00, 2),
(13, 1, 'Room 05', 'Room', 'Available', 'Rent', 100000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 09:19:23', 1, 100.00, 1),
(14, 1, 'Shop 05', 'Shop', 'Rented', 'Rent', 15000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 09:19:23', 1, 100.00, 1),
(15, 2, 'Apartment 05', 'Apartment', 'Available', 'Rent', 25000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:09:30', 1, 100.00, 2),
(16, 2, 'Room 06', 'Room', 'Sold', 'Sale', 10000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 1, 1, '2024-11-24 18:13:44', '2025-02-15 12:09:30', 1, 100.00, 2),
(17, 1, 'Shop 06', 'Shop', 'Available', 'Rent', 135000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 09:19:23', 1, 100.00, 1),
(18, 2, 'Apartment 06', 'Apartment', 'Available', 'Sale', 20000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:09:30', 1, 100.00, 2),
(19, 1, 'Room 07', 'Room', 'Sold', 'Sale', 10000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 09:19:23', 1, 100.00, 1),
(20, 3, 'Shop 07', 'Shop', 'Available', 'Sale', 150000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:09:30', 2, 100.00, 3),
(21, 3, 'Apartment 07', 'Apartment', 'Available', 'Sale', 35000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 2, 2, '2024-11-24 18:13:44', '2025-02-15 12:09:30', 2, 100.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `organization_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Electric', NULL, 1, 1, 1, '2025-02-15 16:39:20', '2025-02-15 16:39:21'),
(2, 'Water', NULL, 1, 1, 1, '2025-02-15 16:42:03', '2025-02-15 16:42:24'),
(3, 'Management', NULL, 1, 1, 1, '2025-02-15 16:42:03', '2025-02-15 16:42:24'),
(4, 'Electric', NULL, 2, 1, 1, '2025-02-15 16:39:20', '2025-02-15 16:39:21'),
(5, 'Water', NULL, 2, 1, 1, '2025-02-15 16:42:03', '2025-02-15 16:42:24'),
(6, 'Management', NULL, 2, 1, 1, '2025-02-15 16:42:03', '2025-02-15 16:42:24'),
(52, 'Electric', NULL, 2, 1, 1, '2025-02-15 16:39:20', '2025-02-16 12:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `dropdowntypes`
--

CREATE TABLE `dropdowntypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_value_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dropdowntypes`
--

INSERT INTO `dropdowntypes` (`id`, `type_name`, `description`, `parent_value_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Country', NULL, NULL, 1, '2024-11-17 07:41:29', '2024-11-17 07:41:29'),
(2, 'Province', NULL, 1, 1, '2024-11-17 07:41:41', '2024-11-17 07:59:42'),
(3, 'City', NULL, 2, 1, '2024-11-17 07:41:51', '2024-11-17 08:03:16'),
(4, 'Building-type', NULL, NULL, 1, '2024-12-16 01:55:34', '2024-12-16 01:55:34'),
(5, 'Building-document-type', NULL, NULL, 1, '2024-12-16 01:56:03', '2024-12-16 01:56:03'),
(6, 'Unit-type', NULL, NULL, 1, '2024-12-17 08:38:34', '2024-12-17 08:38:34');

-- --------------------------------------------------------

--
-- Table structure for table `dropdownvalues`
--

CREATE TABLE `dropdownvalues` (
  `id` int(10) UNSIGNED NOT NULL,
  `value_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `dropdown_type_id` int(10) UNSIGNED NOT NULL,
  `parent_value_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dropdownvalues`
--

INSERT INTO `dropdownvalues` (`id`, `value_name`, `description`, `dropdown_type_id`, `parent_value_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pakistan', NULL, 1, NULL, 1, '2024-11-17 12:39:48', '2024-12-19 02:02:20'),
(2, 'Punjab', NULL, 2, 1, 1, '2024-11-17 12:56:19', '2024-11-17 12:56:19'),
(3, 'Lahore', NULL, 3, 2, 1, '2024-11-17 12:57:59', '2024-11-17 13:25:00'),
(4, 'Sindh', NULL, 2, 1, 1, '2024-11-18 11:44:09', '2024-11-18 11:44:09'),
(5, 'Karachi', NULL, 3, 4, 1, '2024-11-18 11:44:53', '2024-11-18 11:44:53'),
(6, 'Balochistan', NULL, 2, 1, 1, '2024-12-14 22:03:16', '2024-12-14 22:03:16'),
(7, 'Khyber Pakhtunkhwa', NULL, 2, 1, 1, '2024-12-14 22:04:15', '2024-12-14 22:04:15'),
(8, 'Capital', NULL, 2, 1, 1, '2024-12-14 22:05:43', '2024-12-17 08:47:58'),
(9, 'Multan', NULL, 3, 2, 1, '2024-12-14 22:08:38', '2024-12-14 22:08:38'),
(10, 'Faisalabad', NULL, 3, 2, 1, '2024-12-14 22:09:05', '2024-12-14 22:09:05'),
(11, 'Okara', NULL, 3, 2, 1, '2024-12-14 22:09:31', '2024-12-14 22:09:31'),
(12, 'Hyderabad', NULL, 3, 4, 1, '2024-12-14 22:10:14', '2024-12-14 22:10:14'),
(13, 'Sukkur', NULL, 3, 4, 1, '2024-12-14 22:10:38', '2024-12-14 22:10:38'),
(14, 'Quetta', NULL, 3, 6, 1, '2024-12-14 22:11:16', '2024-12-14 22:11:16'),
(15, 'Turbat', NULL, 3, 6, 1, '2024-12-14 22:11:44', '2024-12-14 22:11:44'),
(16, 'Abbottabad', NULL, 3, 7, 1, '2024-12-14 22:12:26', '2024-12-14 22:12:26'),
(17, 'Dera Ismail Khan', NULL, 3, 7, 1, '2024-12-14 22:12:51', '2024-12-14 22:12:51'),
(18, 'Peshawar', NULL, 3, 7, 1, '2024-12-14 22:13:31', '2024-12-14 22:13:31'),
(19, 'Islamabad', NULL, 3, 8, 1, '2024-12-14 22:14:47', '2024-12-17 08:48:13'),
(20, 'Residential', NULL, 4, NULL, 1, '2024-12-16 01:57:22', '2024-12-19 02:01:03'),
(21, 'Commercial', NULL, 4, NULL, 1, '2024-12-16 01:57:56', '2024-12-16 01:57:56'),
(22, 'Industrial', NULL, 4, NULL, 1, '2024-12-16 01:58:25', '2024-12-16 01:58:25'),
(23, 'Mixed-Use', NULL, 4, NULL, 1, '2024-12-16 01:59:07', '2024-12-16 01:59:07'),
(24, 'Building Permit', NULL, 5, NULL, 1, '2024-12-16 02:00:17', '2024-12-16 02:00:17'),
(25, 'Occupancy Certificate', NULL, 5, NULL, 1, '2024-12-16 02:00:46', '2024-12-16 02:00:46'),
(26, 'Completion Certificate', NULL, 5, NULL, 1, '2024-12-16 02:01:14', '2024-12-16 02:01:14'),
(27, 'Room', NULL, 6, NULL, 1, '2024-12-17 08:39:05', '2024-12-17 08:39:05'),
(28, 'Shop', NULL, 6, NULL, 1, '2024-12-17 08:39:21', '2024-12-17 08:39:21'),
(29, 'Apartment', NULL, 6, NULL, 1, '2024-12-17 08:40:06', '2024-12-17 08:40:06'),
(30, 'Restaurant', NULL, 6, NULL, 1, '2024-12-17 08:40:22', '2024-12-17 08:40:22'),
(31, 'Gym', NULL, 6, NULL, 1, '2024-12-17 08:40:37', '2024-12-17 08:40:37');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `unit_id`, `created_at`) VALUES
(1, 4, 1, '2024-11-24 18:13:44'),
(2, 4, 2, '2024-11-24 18:13:44'),
(3, 4, 3, '2024-12-01 13:15:39'),
(4, 4, 4, '2024-12-01 13:15:58'),
(5, 4, 5, '2024-12-15 10:33:56'),
(45, 5, 2, '2024-12-19 15:27:25'),
(46, 6, 15, '2024-12-21 07:16:45'),
(47, 6, 2, '2024-12-21 08:25:43'),
(49, 4, 13, '2025-02-15 18:54:15'),
(50, 4, 10, '2025-02-15 18:56:30'),
(51, 4, 7, '2025-02-15 18:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `organizationdocuments`
--

CREATE TABLE `organizationdocuments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `document_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizationdocuments`
--

INSERT INTO `organizationdocuments` (`id`, `organization_id`, `file_path`, `file_name`, `document_type`, `created_at`, `updated_at`) VALUES
(1, 1, '/documents/tech_innovations_contract.pdf', 'tech_innovations_contract.pdf', 'Contract', '2024-11-24 18:13:44', '2024-11-24 18:13:44'),
(2, 2, '/documents/green_solutions_agreement.pdf', 'green_solutions_agreement.pdf', 'Agreement', '2024-11-24 18:13:44', '2024-11-24 18:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `organizationpictures`
--

CREATE TABLE `organizationpictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizationpictures`
--

INSERT INTO `organizationpictures` (`id`, `organization_id`, `file_path`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 1, '/uploads/Organization_1.jpeg', 'tech_innovations_logo.jpg', '2024-11-24 18:13:44', '2024-12-16 08:46:12'),
(2, 2, '/uploads/Organization_2.png', 'green_solutions_logo.jpg', '2024-11-24 18:13:44', '2024-12-16 08:46:12');

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` enum('enable','disable','block') NOT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `membership_start_date` date NOT NULL,
  `membership_end_date` date NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `owner_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `status`, `address_id`, `membership_start_date`, `membership_end_date`, `created_by`, `updated_by`, `created_at`, `updated_at`, `owner_id`) VALUES
(1, 'Bahria Town', 'enable', 1, '2024-11-01', '2025-11-01', 1, 1, '2024-11-24 18:13:44', '2024-12-17 06:15:17', 2),
(2, 'Etihad Town', 'enable', 4, '2024-11-01', '2025-11-01', 2, 2, '2024-11-24 18:13:44', '2024-12-17 06:15:17', 3);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'view_buildings', 'Permission to view buildings', '2024-11-24 18:13:44', '2024-11-24 18:13:44'),
(2, 'edit_buildings', 'Permission to edit building information', '2024-11-24 18:13:44', '2024-11-24 18:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `staff_member_id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `status` enum('Open','In Progress','Closed','Rejected') NOT NULL,
  `expected_closure_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`id`, `user_id`, `building_id`, `department_id`, `staff_member_id`, `description`, `status`, `expected_closure_date`, `created_at`, `updated_at`, `unit_id`, `remarks`) VALUES
(2, 1, 1, 1, 3, 'no description', 'Open', '2025-02-15', '2025-02-15 17:22:37', '2025-02-17 20:49:52', 1, NULL),
(3, 1, 1, 1, 3, 'no description', 'Open', NULL, '2025-02-15 17:26:51', '2025-02-17 20:49:52', 1, NULL),
(4, 1, 1, 1, 3, 'no description', 'Open', NULL, '2025-02-15 17:27:17', '2025-02-17 20:49:52', 1, NULL),
(5, 1, 1, 1, 2, 'no description', 'Open', NULL, '2025-02-15 17:27:35', '2025-02-17 20:49:52', 1, NULL),
(6, 1, 1, 1, 3, 'no description', 'Open', NULL, '2025-02-15 17:27:41', '2025-02-17 20:49:52', 1, NULL),
(7, 1, 1, 1, 2, 'no description', 'Open', NULL, '2025-02-15 17:27:48', '2025-02-17 20:49:52', 1, NULL),
(8, 1, 1, 1, 1, 'no description', 'Open', NULL, '2025-02-15 17:27:52', '2025-02-17 20:49:52', 1, NULL),
(9, 1, 1, 1, 3, 'no description', 'Open', NULL, '2025-02-15 17:27:52', '2025-02-17 20:49:52', 1, NULL),
(10, 1, 1, 1, 2, 'no description', 'Open', NULL, '2025-02-15 17:27:52', '2025-02-17 20:49:52', 1, NULL),
(11, 1, 1, 1, 1, 'no description', 'Open', NULL, '2025-02-15 17:27:52', '2025-02-17 20:49:52', 1, NULL),
(12, 1, 1, 1, 3, 'no description', 'Open', NULL, '2025-02-15 17:27:58', '2025-02-17 20:49:52', 1, NULL),
(13, 1, 3, 4, 6, 'no description', 'Open', NULL, '2025-02-15 17:30:54', '2025-02-17 20:49:52', 1, NULL),
(14, 1, 3, 4, 5, 'no description', 'Open', NULL, '2025-02-15 17:31:03', '2025-02-17 20:49:52', 1, NULL),
(15, 1, 3, 4, 4, 'no description', 'Open', NULL, '2025-02-15 17:31:12', '2025-02-17 20:49:52', 1, NULL),
(16, 1, 3, 4, 6, 'no description', 'Open', NULL, '2025-02-15 17:31:21', '2025-02-17 20:49:52', 1, NULL),
(17, 1, 3, 4, 5, 'no description', 'Open', NULL, '2025-02-15 17:31:21', '2025-02-17 20:49:52', 1, NULL),
(18, 1, 3, 4, 4, 'no description', 'Open', NULL, '2025-02-15 17:41:17', '2025-02-17 20:49:52', 1, NULL),
(19, 1, 3, 4, 6, 'no description', 'Open', NULL, '2025-02-15 17:41:27', '2025-02-17 20:49:52', 1, NULL),
(20, 1, 3, 4, 5, 'no description', 'Open', NULL, '2025-02-15 17:41:28', '2025-02-17 20:49:52', 1, NULL),
(21, 1, 3, 4, 4, 'no description', 'Open', NULL, '2025-02-15 17:41:28', '2025-02-17 20:49:52', 1, NULL),
(22, 1, 3, 4, 6, 'no description', 'Open', NULL, '2025-02-15 17:41:28', '2025-02-17 20:49:52', 1, NULL),
(23, 1, 3, 4, 5, 'no description', 'Open', NULL, '2025-02-15 18:37:37', '2025-02-17 20:49:52', 1, NULL),
(24, 1, 3, 4, 4, 'no description', 'Open', NULL, '2025-02-15 18:37:44', '2025-02-17 20:49:52', 1, NULL),
(25, 1, 3, 4, 6, 'no description', 'Open', NULL, '2025-02-16 09:02:21', '2025-02-17 20:49:52', 1, NULL),
(26, 1, 3, 4, 5, 'no description', 'Open', NULL, '2025-02-16 09:02:28', '2025-02-17 20:49:52', 1, NULL),
(27, 1, 3, 4, 4, 'no description', 'Open', NULL, '2025-02-16 09:02:28', '2025-02-17 20:49:52', 1, NULL),
(28, 1, 3, 4, 6, 'no description', 'Open', NULL, '2025-02-16 09:02:35', '2025-02-17 20:49:52', 1, NULL),
(29, 1, 3, 4, 5, 'no description', 'Open', NULL, '2025-02-16 09:02:57', '2025-02-17 20:49:52', 1, NULL),
(30, 1, 3, 4, 4, 'no description', 'Open', NULL, '2025-02-16 09:03:06', '2025-02-17 20:49:52', 1, NULL),
(31, 1, 3, 4, 6, 'no description', 'Open', NULL, '2025-02-16 09:03:15', '2025-02-17 20:49:52', 1, NULL),
(32, 1, 1, 1, 1, 'no description', 'Open', NULL, '2025-02-16 09:07:53', '2025-02-17 20:49:52', 1, NULL),
(33, 3, 3, 4, 5, 'f', 'Closed', '2025-02-22', '2025-02-16 12:53:21', '2025-02-22 10:33:40', 1, 'Done'),
(34, 3, 3, 4, 4, 'rqtwtw', 'Rejected', NULL, '2025-02-16 13:02:09', '2025-02-17 20:49:52', 1, NULL),
(37, 3, 3, 4, 6, 'ta', 'Closed', '2025-02-22', '2025-02-16 13:18:05', '2025-02-22 10:33:40', 1, 'Done'),
(38, 3, 1, 1, 2, 'how are you', 'Rejected', NULL, '2025-02-16 13:19:12', '2025-02-17 20:49:52', 1, NULL),
(39, 3, 3, 4, 5, 'hi', 'Closed', '2025-02-22', '2025-02-16 13:19:32', '2025-02-22 10:33:40', 1, 'Done'),
(44, 3, 3, 4, 4, 'hi', 'Closed', '2025-02-22', '2025-02-16 13:30:47', '2025-02-22 10:33:40', 1, 'Done'),
(45, 3, 3, 4, 6, '5 Tasweer ka sath', 'In Progress', NULL, '2025-02-16 13:31:39', '2025-02-17 20:49:52', 1, NULL),
(49, 3, 3, 4, 5, 'taswero ka sath', 'Closed', '2025-02-22', '2025-02-16 13:35:13', '2025-02-22 10:33:40', 1, 'Done'),
(50, 3, 1, 1, 1, '3 ka sath', 'Open', NULL, '2025-02-16 13:37:14', '2025-02-17 20:49:52', 1, NULL),
(51, 1, 1, 1, 3, 'no description', 'Open', NULL, '2025-02-16 17:57:37', '2025-02-17 20:49:52', 1, NULL),
(52, 3, 3, 4, 4, 'This is new query regarding testing of my application.', 'Open', NULL, '2025-02-17 14:38:20', '2025-02-17 20:49:52', 1, NULL),
(53, 3, 3, 4, 6, 'New query', 'Open', NULL, '2025-02-17 14:47:55', '2025-02-17 20:49:52', 1, NULL),
(54, 3, 1, 1, 2, 'New Query ', 'Open', NULL, '2025-02-17 14:58:29', '2025-02-17 20:49:52', 1, NULL),
(55, 3, 3, 4, 5, 'fff', 'Open', NULL, '2025-02-17 15:27:05', '2025-02-17 20:49:52', 1, NULL),
(59, 1, 1, 1, 1, 'no description', 'Open', NULL, '2025-02-17 20:54:49', '2025-02-17 20:54:49', 1, NULL),
(60, 1, 1, 1, 3, 'no description', 'Open', NULL, '2025-02-18 13:49:43', '2025-02-18 13:49:43', 1, NULL),
(63, 1, 1, 1, 2, 'no description', 'Open', NULL, '2025-02-19 15:34:42', '2025-02-19 15:34:42', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `querypictures`
--

CREATE TABLE `querypictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `query_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `querypictures`
--

INSERT INTO `querypictures` (`id`, `query_id`, `file_path`, `file_name`, `created_at`, `updated_at`) VALUES
(7, 44, 'uploads/query/images/1739712647_1000105710.jpg', 'uploads/query/images/1739712647_1000105710.jpg', '2025-02-16 13:30:47', '2025-02-16 13:30:47'),
(8, 45, 'uploads/query/images/1739712700_1000105733.jpg', 'uploads/query/images/1739712700_1000105733.jpg', '2025-02-16 13:31:40', '2025-02-16 13:31:40'),
(9, 45, 'uploads/query/images/1739712700_1000105710.jpg', 'uploads/query/images/1739712700_1000105710.jpg', '2025-02-16 13:31:40', '2025-02-16 13:31:40'),
(10, 45, 'uploads/query/images/1739712700_1000105695.jpg', 'uploads/query/images/1739712700_1000105695.jpg', '2025-02-16 13:31:40', '2025-02-16 13:31:40'),
(11, 45, 'uploads/query/images/1739712700_1000105693.jpg', 'uploads/query/images/1739712700_1000105693.jpg', '2025-02-16 13:31:40', '2025-02-16 13:31:40'),
(12, 45, 'uploads/query/images/1739712700_1000105691.jpg', 'uploads/query/images/1739712700_1000105691.jpg', '2025-02-16 13:31:40', '2025-02-16 13:31:40'),
(13, 49, 'uploads/query/images/1739712914_1000105733.jpg', 'uploads/query/images/1739712914_1000105733.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(14, 49, 'uploads/query/images/1739712914_1000105710.jpg', 'uploads/query/images/1739712914_1000105710.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(15, 49, 'uploads/query/images/1739712914_1000105695.jpg', 'uploads/query/images/1739712914_1000105695.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(16, 49, 'uploads/query/images/1739712914_1000105693.jpg', 'uploads/query/images/1739712914_1000105693.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(17, 49, 'uploads/query/images/1739712914_1000105691.jpg', 'uploads/query/images/1739712914_1000105691.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(18, 49, 'uploads/query/images/1739712914_1000105645.jpg', 'uploads/query/images/1739712914_1000105645.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(19, 49, 'uploads/query/images/1739712914_1000104880.jpg', 'uploads/query/images/1739712914_1000104880.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(20, 49, 'uploads/query/images/1739712914_1000105642.jpg', 'uploads/query/images/1739712914_1000105642.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(21, 49, 'uploads/query/images/1739712914_1000105639.jpg', 'uploads/query/images/1739712914_1000105639.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(22, 49, 'uploads/query/images/1739712914_1000105627.jpg', 'uploads/query/images/1739712914_1000105627.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(23, 49, 'uploads/query/images/1739712914_1000105551.jpg', 'uploads/query/images/1739712914_1000105551.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(24, 49, 'uploads/query/images/1739712914_1000105546.jpg', 'uploads/query/images/1739712914_1000105546.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(25, 49, 'uploads/query/images/1739712914_1000105543.jpg', 'uploads/query/images/1739712914_1000105543.jpg', '2025-02-16 13:35:14', '2025-02-16 13:35:14'),
(26, 50, 'uploads/query/images/1739713034_1000105733.jpg', 'uploads/query/images/1739713034_1000105733.jpg', '2025-02-16 13:37:14', '2025-02-16 13:37:14'),
(27, 50, 'uploads/query/images/1739713034_1000105710.jpg', 'uploads/query/images/1739713034_1000105710.jpg', '2025-02-16 13:37:14', '2025-02-16 13:37:14'),
(28, 50, 'uploads/query/images/1739713034_1000105695.jpg', 'uploads/query/images/1739713034_1000105695.jpg', '2025-02-16 13:37:14', '2025-02-16 13:37:14');

-- --------------------------------------------------------

--
-- Table structure for table `rolepermissions`
--

CREATE TABLE `rolepermissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `granted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rolepermissions`
--

INSERT INTO `rolepermissions` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`, `granted_by`) VALUES
(1, 1, 1, '2024-11-24 18:13:44', '2024-12-15 09:04:03', 1),
(2, 1, 2, '2024-11-24 18:13:44', '2024-12-15 09:04:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Administrator with full access', 1, '2024-11-24 18:13:44', '2024-11-24 18:13:44'),
(2, 'Owner', 'NO Description', 1, '2024-11-24 18:13:44', '2024-12-15 14:14:50'),
(3, 'User', 'Regular user with restricted access', 1, '2024-11-24 18:13:44', '2024-11-24 18:13:44'),
(4, 'Staff', 'NO Description', 1, '2025-02-15 16:49:56', '2025-02-15 16:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `staffmembers`
--

CREATE TABLE `staffmembers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL,
  `is_manager` tinyint(4) NOT NULL,
  `salary` decimal(8,1) DEFAULT NULL,
  `active_load` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `organization_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staffmembers`
--

INSERT INTO `staffmembers` (`id`, `user_id`, `department_id`, `building_id`, `is_manager`, `salary`, `active_load`, `created_by`, `updated_by`, `created_at`, `updated_at`, `organization_id`) VALUES
(1, 7, 1, 1, 0, 10000.0, 9, 1, 1, '2025-02-15 17:26:42', '2025-02-22 10:47:16', 1),
(2, 8, 1, 1, 0, 10000.0, 10, 1, 1, '2025-02-15 17:26:42', '2025-02-22 10:47:16', 1),
(3, 9, 1, 1, 0, 10000.0, 10, 1, 1, '2025-02-15 17:26:42', '2025-02-22 10:47:16', 1),
(4, 10, 4, 3, 0, 10000.0, 9, 1, 1, '2025-02-15 17:26:42', '2025-02-22 10:47:16', 2),
(5, 11, 4, 3, 0, 10000.0, 10, 1, 1, '2025-02-15 17:26:42', '2025-02-22 10:47:16', 2),
(6, 12, 4, 3, 0, 10000.0, 10, 1, 1, '2025-02-15 17:26:42', '2025-02-22 10:47:16', 2);

-- --------------------------------------------------------

--
-- Table structure for table `unitpictures`
--

CREATE TABLE `unitpictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unitpictures`
--

INSERT INTO `unitpictures` (`id`, `unit_id`, `file_path`, `file_name`, `created_at`, `updated_at`) VALUES
(1, 3, '/uploads/Apartment_1.jpeg', 'Apartment1', '2024-11-24 18:13:44', '2025-02-12 12:35:35'),
(2, 3, '/uploads/Apartment_2.jpeg', 'Apartment2', '2024-11-24 18:13:44', '2025-02-12 12:35:35'),
(5, 3, '/uploads/Apartment_3.jpeg', 'Apartment3', '2024-11-24 18:13:44', '2025-02-12 12:35:35'),
(6, 6, '/uploads/Apartment_4.jpeg', 'Apartment4', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(7, 6, '/uploads/Apartment_5.jpeg', 'Apartment5', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(8, 6, '/uploads/Apartment_6.jpeg', 'Apartment6', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(9, 9, '/uploads/Apartment_7.jpeg', 'Apartment7', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(10, 9, '/uploads/Apartment_8.jpeg', 'Apartment8', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(11, 9, '/uploads/Apartment_9.jpeg', 'Apartment9', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(12, 12, '/uploads/Apartment_10.jpeg', 'Apartment10', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(13, 12, '/uploads/Apartment_11.jpeg', 'Apartment11', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(14, 12, '/uploads/Apartment_12.jpeg', 'Apartment12', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(15, 15, '/uploads/Apartment_13.jpeg', 'Apartment13', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(16, 15, '/uploads/Apartment_14.jpeg', 'Apartment14', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(17, 15, '/uploads/Apartment_15.jpeg', 'Apartment15', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(18, 18, '/uploads/Apartment_16.jpeg', 'Apartment16', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(19, 18, '/uploads/Apartment_17.jpeg', 'Apartment17', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(20, 18, '/uploads/Apartment_18.jpeg', 'Apartment18', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(21, 21, '/uploads/Apartment_19.jpeg', 'Apartment19', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(22, 21, '/uploads/Apartment_20.jpeg', 'Apartment20', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(23, 21, '/uploads/Apartment_21.jpeg', 'Apartment21', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(24, 2, '/uploads/Shop_1.jpeg', 'Shop1', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(25, 5, '/uploads/Shop_2.jpeg', 'Shop2', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(26, 8, '/uploads/Shop_3.jpeg', 'Shop3', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(27, 11, '/uploads/Shop_4.jpeg', 'Shop4', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(28, 14, '/uploads/Shop_5.jpeg', 'Shop5', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(29, 17, '/uploads/Shop_6.jpeg', 'Shop6', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(30, 20, '/uploads/Shop_7.jpeg', 'Shop7', '2024-11-24 18:13:44', '2024-12-15 13:37:52'),
(31, 1, '/uploads/Room_1.jpeg', 'Room1', '2024-12-15 13:43:18', '2024-12-15 13:43:18'),
(32, 4, '/uploads/Room_2.jpeg', 'Room2', '2024-12-15 13:43:18', '2024-12-15 13:43:18'),
(33, 7, '/uploads/Room_3.jpeg', 'Room3', '2024-12-15 13:43:18', '2024-12-15 13:43:18'),
(34, 10, '/uploads/Room_4.jpeg', 'Room4', '2024-12-15 13:43:18', '2024-12-15 13:43:18'),
(35, 13, '/uploads/Room_5.jpeg', 'Room5', '2024-12-15 13:43:18', '2024-12-15 13:43:18'),
(36, 16, '/uploads/Room_6.jpeg', 'Room6', '2024-12-15 13:43:18', '2024-12-15 13:43:18'),
(37, 19, '/uploads/Room_7.jpeg', 'Room7', '2024-12-15 13:43:18', '2024-12-15 13:43:18'),
(38, 1, '/uploads/Room_8.jpeg', 'Room8', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(39, 4, '/uploads/Room_9.jpeg', 'Room9', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(40, 7, '/uploads/Room_10.jpeg', 'Room10', '2024-12-15 13:46:10', '2024-12-15 13:46:27'),
(41, 10, '/uploads/Room_11.jpeg', 'Room11', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(42, 13, '/uploads/Room_12.jpeg', 'Room12', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(43, 16, '/uploads/Room_13.jpeg', 'Room13', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(44, 19, '/uploads/Room_14.jpeg', 'Room14', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(45, 1, '/uploads/Room_15.jpeg', 'Room15', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(46, 4, '/uploads/Room_16.jpeg', 'Room16', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(47, 7, '/uploads/Room_17.jpeg', 'Room17', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(48, 10, '/uploads/Room_18.jpeg', 'Room18', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(49, 13, '/uploads/Room_19.jpeg', 'Room19', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(50, 16, '/uploads/Room_20.jpeg', 'Room20', '2024-12-15 13:46:10', '2024-12-15 13:46:10'),
(51, 19, '/uploads/Room_21.jpeg', 'Room21', '2024-12-15 13:46:10', '2024-12-15 13:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `userbuildingunits`
--

CREATE TABLE `userbuildingunits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `rent_start_date` date DEFAULT NULL,
  `rent_end_date` date DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `contract_status` tinyint(4) NOT NULL DEFAULT 1,
  `type` enum('Rented','Sold') NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userbuildingunits`
--

INSERT INTO `userbuildingunits` (`id`, `user_id`, `unit_id`, `rent_start_date`, `rent_end_date`, `purchase_date`, `created_by`, `updated_by`, `created_at`, `updated_at`, `contract_status`, `type`, `price`) VALUES
(1, 1, 1, '2023-01-01', '2023-12-31', NULL, 1, 1, '2024-11-24 18:13:44', '2025-02-15 16:36:35', 1, 'Rented', 25000.00),
(2, 3, 2, '2023-06-01', '2023-12-31', NULL, 2, 2, '2024-11-24 18:13:44', '2025-02-16 12:14:50', 1, 'Rented', 20000.00),
(3, 6, 4, NULL, NULL, '2024-12-15', 1, 1, '2024-12-15 09:54:14', '2025-02-14 22:15:11', 1, 'Sold', 100000.00),
(4, 6, 9, '2023-01-01', '2023-12-31', NULL, 1, 1, '2024-11-24 18:13:44', '2025-02-14 22:15:11', 1, 'Rented', 10000.00),
(5, 6, 14, '2023-06-01', '2023-12-31', NULL, 2, 2, '2024-11-24 18:13:44', '2025-02-14 22:15:11', 1, 'Rented', 10000.00),
(6, 3, 19, NULL, NULL, '2024-12-15', 1, 1, '2024-12-15 09:54:14', '2025-02-16 11:41:49', 1, 'Sold', 500000.00),
(7, 3, 6, '2023-01-01', '2023-12-31', NULL, 1, 1, '2024-11-24 18:13:44', '2025-02-16 11:41:49', 1, 'Rented', 15000.00),
(8, 3, 11, '2023-06-01', '2023-12-31', NULL, 2, 2, '2024-11-24 18:13:44', '2025-02-16 11:41:49', 1, 'Rented', 25000.00),
(14, 2, 3, '2025-03-01', '2025-09-01', NULL, 3, 3, '2025-02-19 12:43:17', '2025-02-19 12:43:17', 1, 'Rented', 1500.00),
(15, 2, 4, '2025-03-01', '2025-09-01', NULL, 9, 9, '2025-02-19 12:44:13', '2025-02-19 12:44:13', 1, 'Rented', 1500.00);

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `granted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userpermissions`
--

INSERT INTO `userpermissions` (`id`, `user_id`, `permission_id`, `created_at`, `updated_at`, `granted_by`) VALUES
(1, 1, 1, '2024-11-24 18:13:44', '2024-12-15 09:03:30', 1),
(2, 2, 2, '2024-11-24 18:13:44', '2024-12-15 09:03:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `cnic` varchar(25) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_of_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `reset_token`, `cnic`, `phone_no`, `status`, `gender`, `picture`, `address_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `date_of_birth`) VALUES
(1, 1, 'Rehan Manzoor', 'fa21-bse-002@cuilahore.edu.pk', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-1', '0300-0000001', 1, 'Male', 'uploads/pictures/1737892921101_User_1.jpg', 1, 1, 1, '2024-11-24 18:13:44', '2025-02-17 19:27:24', '2024-12-01'),
(2, 2, 'Usman Iqbal', 'fa21-bse-014@cuilahore.edu.pk', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-2', '0300-0000002', 1, 'Male', 'uploads/pictures/1737892940462_User_2.jpg', 1, 1, 1, '2024-11-24 18:13:44', '2025-02-17 19:27:24', '2019-07-03'),
(3, 3, 'Abdullah Aasir', 'fa21-bse-119@cuilahore.edu.pk', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-3', '0300-00000', 1, 'Male', 'uploads/users/images/1739806565_scaled_1000105910.jpg', 1, 1, 1, '2024-12-24 18:13:44', '2025-02-17 19:27:24', '2019-07-03'),
(4, 3, 'Arham Nasir', 'Arham@example.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-4', '0300-0000000', 1, 'Male', 'uploads/pictures/1737892960463_User_4.jpg', 4, 1, 1, '2024-11-24 18:13:44', '2025-02-17 19:27:24', '2019-07-03'),
(5, 3, 'Syed Ibrahim', 'smibrahim297@gmail.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZXNzYWdlIjoiUmVzZXQgVG9rZW4iLCJpYXQiOjE3Mzk4ODM3ODMsImV4cCI6MTczOTg4NDA4M30.DHN7JNv4hyLw5TlAatsMY9wzII1hcPlXJRlxjgfrUT8', '35202-0000000-5', '0300-0000005', 1, 'Male', 'uploads/pictures/1737892969511_User_5.jpg', 1, 1, 1, '2024-12-15 14:21:46', '2025-02-18 13:03:03', '2024-12-15'),
(6, 3, 'Rehan Manzoor', 'rh7081789@gmail.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-6', '0300-0000006', 1, 'Male', 'uploads/pictures/1737895565636_User_6.jpg', 1, 1, 1, '2024-12-17 06:48:25', '2025-02-17 19:27:24', '2024-12-16'),
(7, 4, 'Rehan Manzoor', 'fa21-bse-002@example.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-7', '0300-0000001', 1, 'Male', 'uploads/pictures/1737892921101_User_1.jpg', 1, 1, 1, '2024-11-24 18:13:44', '2025-02-17 19:27:24', '2024-12-01'),
(8, 4, 'Usman Iqbal', 'fa21-bse-014@example.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-8', '0300-0000002', 1, 'Male', 'uploads/pictures/1737892940462_User_2.jpg', 1, 1, 1, '2024-11-24 18:13:44', '2025-02-17 19:27:24', '2019-07-03'),
(9, 4, 'Abdullah Aasir', 'fa21-bse-119@example.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-9', '0300-0000003', 1, 'Male', 'uploads/pictures/1738239830658_scaled_1000098108.jpg', 1, 1, 1, '2024-12-24 18:13:44', '2025-02-17 19:27:24', '2019-07-03'),
(10, 4, 'Arham Nasir', 'Arham1@example.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000001-0', '0300-0000004', 1, 'Male', 'uploads/pictures/1737892960463_User_4.jpg', 4, 1, 1, '2024-11-24 18:13:44', '2025-02-17 19:27:24', '2019-07-03'),
(11, 4, 'Syed Ibrahim', 'smibrahim297@example.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000001-1', '0300-0000005', 1, 'Male', 'uploads/pictures/1737892969511_User_5.jpg', 1, 1, 1, '2024-12-15 14:21:46', '2025-02-17 19:27:24', '2024-12-15'),
(12, 4, 'Rehan Manzoor', 'rh7081789@example.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000001-2', '0300-0000006', 1, 'Male', 'uploads/pictures/1737895565636_User_6.jpg', 1, 1, 1, '2024-12-17 06:48:25', '2025-02-17 19:27:24', '2024-12-16');

-- --------------------------------------------------------

--
-- Table structure for table `userunitpictures`
--

CREATE TABLE `userunitpictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_unit_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buildingdocuments`
--
ALTER TABLE `buildingdocuments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `building_id` (`building_id`);

--
-- Indexes for table `buildinglevels`
--
ALTER TABLE `buildinglevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building_id` (`building_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `buildingpictures`
--
ALTER TABLE `buildingpictures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `building_id` (`building_id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `organization_id` (`organization_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `buildingunits`
--
ALTER TABLE `buildingunits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `buildingunits_ibfk_4` (`organization_id`),
  ADD KEY `buildingunits_ibfk_5` (`building_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_departments_organization` (`organization_id`),
  ADD KEY `fk_departments_created_by` (`created_by`),
  ADD KEY `fk_departments_updated_by` (`updated_by`);

--
-- Indexes for table `dropdowntypes`
--
ALTER TABLE `dropdowntypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_name` (`type_name`),
  ADD KEY `fk_dropdowntype_parent` (`parent_value_id`);

--
-- Indexes for table `dropdownvalues`
--
ALTER TABLE `dropdownvalues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_name` (`value_name`),
  ADD KEY `fk_dropdownvalues_parent` (`parent_value_id`),
  ADD KEY `fk_dropdownvalues_type` (`dropdown_type_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `organizationdocuments`
--
ALTER TABLE `organizationdocuments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `organizationpictures`
--
ALTER TABLE `organizationpictures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `organizations_ibfk_2` (`owner_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_queries_user` (`user_id`),
  ADD KEY `fk_queries_building` (`building_id`),
  ADD KEY `fk_queries_department` (`department_id`),
  ADD KEY `fk_queries_staff` (`staff_member_id`),
  ADD KEY `fk_queries_unit` (`unit_id`);

--
-- Indexes for table `querypictures`
--
ALTER TABLE `querypictures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `fk_querypictures_query` (`query_id`);

--
-- Indexes for table `rolepermissions`
--
ALTER TABLE `rolepermissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `granted_by` (`granted_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `staffmembers`
--
ALTER TABLE `staffmembers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_staff_user` (`user_id`),
  ADD KEY `fk_staff_department` (`department_id`),
  ADD KEY `fk_staff_building` (`building_id`),
  ADD KEY `fk_staff_created_by` (`created_by`),
  ADD KEY `fk_staff_updated_by` (`updated_by`),
  ADD KEY `fk_staff_organization` (`organization_id`);

--
-- Indexes for table `unitpictures`
--
ALTER TABLE `unitpictures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `userbuildingunits`
--
ALTER TABLE `userbuildingunits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `granted_by` (`granted_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cnic` (`cnic`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `userunitpictures`
--
ALTER TABLE `userunitpictures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_name` (`file_name`),
  ADD KEY `idx_userunitpictures_userunit` (`user_unit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buildingdocuments`
--
ALTER TABLE `buildingdocuments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `buildinglevels`
--
ALTER TABLE `buildinglevels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buildingpictures`
--
ALTER TABLE `buildingpictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buildingunits`
--
ALTER TABLE `buildingunits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `dropdowntypes`
--
ALTER TABLE `dropdowntypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dropdownvalues`
--
ALTER TABLE `dropdownvalues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `organizationdocuments`
--
ALTER TABLE `organizationdocuments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `organizationpictures`
--
ALTER TABLE `organizationpictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `querypictures`
--
ALTER TABLE `querypictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `rolepermissions`
--
ALTER TABLE `rolepermissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staffmembers`
--
ALTER TABLE `staffmembers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `unitpictures`
--
ALTER TABLE `unitpictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `userbuildingunits`
--
ALTER TABLE `userbuildingunits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `userunitpictures`
--
ALTER TABLE `userunitpictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buildingdocuments`
--
ALTER TABLE `buildingdocuments`
  ADD CONSTRAINT `buildingdocuments_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`);

--
-- Constraints for table `buildinglevels`
--
ALTER TABLE `buildinglevels`
  ADD CONSTRAINT `buildinglevels_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`),
  ADD CONSTRAINT `buildinglevels_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `buildinglevels_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `buildingpictures`
--
ALTER TABLE `buildingpictures`
  ADD CONSTRAINT `buildingpictures_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`);

--
-- Constraints for table `buildings`
--
ALTER TABLE `buildings`
  ADD CONSTRAINT `buildings_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `buildings_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `buildings_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `buildings_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `buildingunits`
--
ALTER TABLE `buildingunits`
  ADD CONSTRAINT `buildingunits_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `buildinglevels` (`id`),
  ADD CONSTRAINT `buildingunits_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `buildingunits_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `buildingunits_ibfk_4` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `buildingunits_ibfk_5` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `fk_departments_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_departments_organization` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `fk_departments_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `dropdowntypes`
--
ALTER TABLE `dropdowntypes`
  ADD CONSTRAINT `fk_dropdowntype_parent` FOREIGN KEY (`parent_value_id`) REFERENCES `dropdowntypes` (`id`);

--
-- Constraints for table `dropdownvalues`
--
ALTER TABLE `dropdownvalues`
  ADD CONSTRAINT `fk_dropdownvalues_parent` FOREIGN KEY (`parent_value_id`) REFERENCES `dropdownvalues` (`id`),
  ADD CONSTRAINT `fk_dropdownvalues_type` FOREIGN KEY (`dropdown_type_id`) REFERENCES `dropdowntypes` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `buildingunits` (`id`);

--
-- Constraints for table `organizationdocuments`
--
ALTER TABLE `organizationdocuments`
  ADD CONSTRAINT `organizationdocuments_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `organizationpictures`
--
ALTER TABLE `organizationpictures`
  ADD CONSTRAINT `organizationpictures_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `organizations_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `queries`
--
ALTER TABLE `queries`
  ADD CONSTRAINT `fk_queries_building` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`),
  ADD CONSTRAINT `fk_queries_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `fk_queries_staff` FOREIGN KEY (`staff_member_id`) REFERENCES `staffmembers` (`id`),
  ADD CONSTRAINT `fk_queries_unit` FOREIGN KEY (`unit_id`) REFERENCES `buildingunits` (`id`),
  ADD CONSTRAINT `fk_queries_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `querypictures`
--
ALTER TABLE `querypictures`
  ADD CONSTRAINT `fk_querypictures_query` FOREIGN KEY (`query_id`) REFERENCES `queries` (`id`);

--
-- Constraints for table `rolepermissions`
--
ALTER TABLE `rolepermissions`
  ADD CONSTRAINT `rolepermissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `rolepermissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `rolepermissions_ibfk_3` FOREIGN KEY (`granted_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `staffmembers`
--
ALTER TABLE `staffmembers`
  ADD CONSTRAINT `fk_staff_building` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`),
  ADD CONSTRAINT `fk_staff_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_staff_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `fk_staff_organization` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `fk_staff_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_staff_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `unitpictures`
--
ALTER TABLE `unitpictures`
  ADD CONSTRAINT `unitpictures_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `buildingunits` (`id`);

--
-- Constraints for table `userbuildingunits`
--
ALTER TABLE `userbuildingunits`
  ADD CONSTRAINT `userbuildingunits_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `userbuildingunits_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `buildingunits` (`id`),
  ADD CONSTRAINT `userbuildingunits_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `userbuildingunits_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD CONSTRAINT `userpermissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `userpermissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `userpermissions_ibfk_3` FOREIGN KEY (`granted_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `userunitpictures`
--
ALTER TABLE `userunitpictures`
  ADD CONSTRAINT `fk_userunitpictures_userunit` FOREIGN KEY (`user_unit_id`) REFERENCES `userbuildingunits` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
