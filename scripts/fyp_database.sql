-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2025 at 01:14 PM
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
  `location` varchar(255) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `location`, `country`, `province`, `city`, `postal_code`, `created_at`, `updated_at`, `latitude`, `longitude`) VALUES
(1, 'Gulberg', 'Pakistan', 'Punjab', 'Lahore', '54000', '2024-12-16 05:29:26', '2025-03-02 08:11:01', NULL, NULL),
(2, 'Clifton Beach', 'Pakistan', 'Sindh', 'Karachi', '72000', '2024-11-24 13:13:44', '2025-03-02 08:11:01', NULL, NULL),
(3, 'Quetta Cantt', 'Pakistan', 'Balochistan', 'Queta', '87800', '2024-11-24 13:13:44', '2024-12-16 05:37:12', NULL, NULL),
(4, 'Daman-e-Koh', 'Pakistan', 'Punjab', 'Islamabad', '44050', '2024-11-24 13:13:44', '2024-12-16 05:37:12', NULL, NULL),
(5, 'Gulberg', 'Pakistan', 'Punjab', 'Lahore', '54000', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(6, 'Clifton Beach', 'Pakistan', 'Sindh', 'Karachi', '72000', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(7, 'Quetta Cantt', 'Pakistan', 'Balochistan', 'Quetta', '87800', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(8, 'Daman-e-Koh', 'Pakistan', 'Punjab', 'Islamabad', '44050', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(9, 'Gulberg', 'Pakistan', 'Punjab', 'Lahore', '54000', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(10, 'Clifton Beach', 'Pakistan', 'Sindh', 'Karachi', '72000', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(11, 'Quetta Cantt', 'Pakistan', 'Balochistan', 'Queta', '87800', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(12, 'Daman-e-Koh', 'Pakistan', 'Punjab', 'Islamabad', '44050', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(13, 'Gulberg', 'Pakistan', 'Punjab', 'Lahore', '54000', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(14, 'Clifton Beach', 'Pakistan', 'Sindh', 'Karachi', '72000', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(15, 'Quetta Cantt', 'Pakistan', 'Balochistan', 'Queta', '87800', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(16, 'Daman-e-Koh', 'Pakistan', 'Punjab', 'Islamabad', '44050', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL),
(17, 'Gulberg', 'Pakistan', 'Punjab', 'Lahore', '54000', '2025-03-02 08:11:01', '2025-03-02 08:11:01', NULL, NULL);

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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildingdocuments`
--

INSERT INTO `buildingdocuments` (`id`, `building_id`, `file_path`, `file_name`, `document_type`, `created_at`, `updated_at`, `issue_date`, `expiry_date`) VALUES
(1, 1, '/documents/tech_innovations_building_plan.pdf', 'tech_innovations_building_plan.pdf', 'Building Plan', '2024-11-24 13:13:44', '2024-11-24 13:13:44', NULL, NULL),
(2, 2, '/documents/green_solutions_building_permit.pdf', 'green_solutions_building_permit.pdf', 'Building Permit', '2024-11-24 13:13:44', '2024-11-24 13:13:44', NULL, NULL);

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
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildinglevels`
--

INSERT INTO `buildinglevels` (`id`, `building_id`, `level_name`, `description`, `level_number`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'First Floor', 'Office space for rent', 1, 'Approved', 1, 1, '2024-11-24 13:13:44', '2024-11-24 13:13:44'),
(2, 2, 'Second Floor', 'Meeting rooms and conference spaces', 2, 'Approved', 2, 2, '2024-11-24 13:13:44', '2024-12-17 09:10:29'),
(3, 3, 'Ground Floor', 'Office reception area', 1, 'Approved', 2, 2, '2024-11-24 13:13:44', '2025-02-28 20:10:59');

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
(1, 1, 'uploads/buildings/images/1734379577_Building_1.jpeg', '1734379577_Building_1.jpeg', '2024-11-24 13:13:44', '2025-03-02 08:32:26'),
(2, 2, 'uploads/buildings/images/1734379590_Building_2.jpeg', '1734379590_Building_2.jpeg', '2024-11-24 13:13:44', '2025-03-02 08:32:26'),
(3, 3, 'uploads/buildings/images/1734379603_Building_3.jpeg', '1734379603_Building_3.jpeg', '2024-12-15 09:08:20', '2025-03-02 08:32:26');

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
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
(1, 1, 'Bahria Prime', 3, 'Approved', 'Approved building for office use.', 1, 1, '2024-11-24 13:13:44', '2025-03-02 08:13:44', 10.00, 'Residential', '2012'),
(2, 1, 'HMY Heights', 4, 'Approved', 'Under review for new office setup.', 2, 2, '2024-11-24 13:13:44', '2025-03-02 08:13:44', 10.00, 'Commercial', '2010'),
(3, 2, 'Islamabad SKY Apartments', 5, 'Approved', 'Under review for new office setup.', 2, 2, '2024-11-24 13:13:44', '2025-03-02 08:13:44', 10.00, 'Commercial', '2020');

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
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('Approved','Rejected') NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildingunits`
--

INSERT INTO `buildingunits` (`id`, `level_id`, `unit_name`, `unit_type`, `availability_status`, `sale_or_rent`, `price`, `status`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`, `organization_id`, `area`, `building_id`) VALUES
(1, 1, 'Room 01', 'Room', 'Rented', 'Rent', 10000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 1),
(2, 2, 'Shop 01', 'Shop', 'Available', 'Sale', 150000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 2, 100.00, 2),
(3, 3, 'Apartment 01', 'Apartment', 'Available', 'Rent', 35000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 2, 100.00, 3),
(4, 2, 'Room 02', 'Room', 'Sold', 'Sale', 100000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 2),
(5, 2, 'Shop 02', 'Shop', 'Available', 'Rent', 15000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 2),
(6, 1, 'Apartment 02', 'Apartment', 'Rented', 'Rent', 25000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 1),
(7, 2, 'Room 03', 'Room', 'Available', 'Rent', 10000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 2),
(8, 3, 'Shop 03', 'Shop', 'Available', 'Sale', 135000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 2, 100.00, 3),
(9, 1, 'Apartment 03', 'Apartment', 'Rented', 'Rent', 20000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 1),
(10, 3, 'Room 04', 'Room', 'Available', 'Rent', 10000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 2, 100.00, 3),
(11, 1, 'Shop 04', 'Shop', 'Rented', 'Rent', 150000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 1),
(12, 2, 'Apartment 04', 'Apartment', 'Available', 'Sale', 35000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 2),
(13, 1, 'Room 05', 'Room', 'Available', 'Rent', 100000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 1),
(14, 1, 'Shop 05', 'Shop', 'Rented', 'Rent', 15000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 1),
(15, 2, 'Apartment 05', 'Apartment', 'Available', 'Rent', 25000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 2),
(16, 2, 'Room 06', 'Room', 'Sold', 'Sale', 10000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 2),
(17, 1, 'Shop 06', 'Shop', 'Available', 'Rent', 135000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 1),
(18, 2, 'Apartment 06', 'Apartment', 'Available', 'Sale', 20000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 2),
(19, 1, 'Room 07', 'Room', 'Sold', 'Sale', 10000.00, 'Approved', 'A cozy room with large windows, neutral walls, hardwood floors, a queen-sized bed, a desk, and built-in closets. Perfect for relaxation and productivity.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 1, 100.00, 1),
(20, 3, 'Shop 07', 'Shop', 'Available', 'Sale', 150000.00, 'Approved', 'Vintage Treasures offers handpicked antiques, unique collectibles, and retro décor in a charming, rustic setting.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 2, 100.00, 3),
(21, 3, 'Apartment 07', 'Apartment', 'Available', 'Sale', 35000.00, 'Approved', 'A modern two-bedroom apartment with an open living area, stainless steel appliances, spacious bedrooms, and a private balcony with city views.', 1, 1, '2025-03-02 08:25:47', '2025-03-02 08:25:47', 2, 100.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `organization_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Electric', NULL, 1, 1, 1, '2025-02-15 11:39:20', '2025-02-15 11:39:21'),
(2, 'Water', NULL, 1, 1, 1, '2025-02-15 11:42:03', '2025-02-15 11:42:24'),
(3, 'Management', NULL, 1, 1, 1, '2025-02-15 11:42:03', '2025-02-15 11:42:24'),
(4, 'Electric', NULL, 2, 1, 1, '2025-02-15 11:39:20', '2025-02-15 11:39:21'),
(5, 'Water', NULL, 2, 1, 1, '2025-02-15 11:42:03', '2025-02-15 11:42:24'),
(6, 'Management', NULL, 2, 1, 1, '2025-02-15 11:42:03', '2025-02-15 11:42:24'),
(52, 'Electric', NULL, 2, 1, 1, '2025-02-15 11:39:20', '2025-02-16 07:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `dropdowntypes`
--

CREATE TABLE `dropdowntypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_type_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dropdowntypes`
--

INSERT INTO `dropdowntypes` (`id`, `type_name`, `description`, `parent_type_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Country', NULL, NULL, 1, '2024-11-17 02:41:29', '2024-11-17 02:41:29'),
(2, 'Province', NULL, 1, 1, '2024-11-17 02:41:41', '2024-11-17 02:59:42'),
(3, 'City', NULL, 2, 1, '2024-11-17 02:41:51', '2025-02-24 06:14:25'),
(4, 'Building-type', NULL, NULL, 1, '2024-12-15 20:55:34', '2024-12-15 20:55:34'),
(5, 'Building-document-type', NULL, NULL, 1, '2024-12-15 20:56:03', '2024-12-15 20:56:03'),
(6, 'Unit-type', NULL, NULL, 1, '2024-12-17 03:38:34', '2024-12-17 03:38:34');

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
(1, 'Pakistan', NULL, 1, NULL, 1, '2024-11-17 07:39:48', '2024-12-18 21:02:20'),
(2, 'Punjab', NULL, 2, 1, 1, '2024-11-17 07:56:19', '2024-11-17 07:56:19'),
(3, 'Lahore', NULL, 3, 2, 1, '2024-11-17 07:57:59', '2025-02-24 06:12:42'),
(4, 'Sindh', NULL, 2, 1, 1, '2024-11-18 06:44:09', '2024-11-18 06:44:09'),
(5, 'Karachi', NULL, 3, 4, 1, '2024-11-18 06:44:53', '2024-11-18 06:44:53'),
(6, 'Balochistan', NULL, 2, 1, 1, '2024-12-14 17:03:16', '2024-12-14 17:03:16'),
(7, 'Khyber Pakhtunkhwa', NULL, 2, 1, 1, '2024-12-14 17:04:15', '2024-12-14 17:04:15'),
(8, 'Capital', NULL, 2, 1, 1, '2024-12-14 17:05:43', '2024-12-17 03:47:58'),
(9, 'Multan', NULL, 3, 2, 1, '2024-12-14 17:08:38', '2024-12-14 17:08:38'),
(10, 'Faisalabad', NULL, 3, 2, 1, '2024-12-14 17:09:05', '2024-12-14 17:09:05'),
(11, 'Okara', NULL, 3, 2, 1, '2024-12-14 17:09:31', '2024-12-14 17:09:31'),
(12, 'Hyderabad', NULL, 3, 4, 1, '2024-12-14 17:10:14', '2024-12-14 17:10:14'),
(13, 'Sukkur', NULL, 3, 4, 1, '2024-12-14 17:10:38', '2024-12-14 17:10:38'),
(14, 'Quetta', NULL, 3, 6, 1, '2024-12-14 17:11:16', '2024-12-14 17:11:16'),
(15, 'Turbat', NULL, 3, 6, 1, '2024-12-14 17:11:44', '2024-12-14 17:11:44'),
(16, 'Abbottabad', NULL, 3, 7, 1, '2024-12-14 17:12:26', '2024-12-14 17:12:26'),
(17, 'Dera Ismail Khan', NULL, 3, 7, 1, '2024-12-14 17:12:51', '2024-12-14 17:12:51'),
(18, 'Peshawar', NULL, 3, 7, 1, '2024-12-14 17:13:31', '2024-12-14 17:13:31'),
(19, 'Islamabad', NULL, 3, 8, 1, '2024-12-14 17:14:47', '2024-12-17 03:48:13'),
(20, 'Residential', NULL, 4, NULL, 1, '2024-12-15 20:57:22', '2024-12-18 21:01:03'),
(21, 'Commercial', NULL, 4, NULL, 1, '2024-12-15 20:57:56', '2024-12-15 20:57:56'),
(22, 'Industrial', NULL, 4, NULL, 1, '2024-12-15 20:58:25', '2024-12-15 20:58:25'),
(23, 'Mixed-Use', NULL, 4, NULL, 1, '2024-12-15 20:59:07', '2024-12-15 20:59:07'),
(24, 'Building Permit', NULL, 5, NULL, 1, '2024-12-15 21:00:17', '2024-12-15 21:00:17'),
(25, 'Occupancy Certificate', NULL, 5, NULL, 1, '2024-12-15 21:00:46', '2024-12-15 21:00:46'),
(26, 'Completion Certificate', NULL, 5, NULL, 1, '2024-12-15 21:01:14', '2024-12-15 21:01:14'),
(27, 'Room', NULL, 6, NULL, 1, '2024-12-17 03:39:05', '2024-12-17 03:39:05'),
(28, 'Shop', NULL, 6, NULL, 1, '2024-12-17 03:39:21', '2024-12-17 03:39:21'),
(29, 'Apartment', NULL, 6, NULL, 1, '2024-12-17 03:40:06', '2024-12-17 03:40:06'),
(30, 'Restaurant', NULL, 6, NULL, 1, '2024-12-17 03:40:22', '2024-12-17 03:40:22'),
(31, 'Gym', NULL, 6, NULL, 1, '2024-12-17 03:40:37', '2024-12-17 03:40:37');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `unit_id`, `created_at`, `updated_at`) VALUES
(7, 9, 10, '2025-03-04 11:45:30', '2025-03-04 11:45:30');

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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizationdocuments`
--

INSERT INTO `organizationdocuments` (`id`, `organization_id`, `file_path`, `file_name`, `document_type`, `created_at`, `updated_at`, `issue_date`, `expiry_date`) VALUES
(1, 1, '/documents/tech_innovations_contract.pdf', 'tech_innovations_contract.pdf', 'Contract', '2024-11-24 13:13:44', '2024-11-24 13:13:44', NULL, NULL),
(2, 2, '/documents/green_solutions_agreement.pdf', 'green_solutions_agreement.pdf', 'Agreement', '2024-11-24 13:13:44', '2024-11-24 13:13:44', NULL, NULL);

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
(1, 1, 'uploads/organizations/images/1734415026_Organization_1.jpeg', '1734415026_Organization_1.jpeg', '2024-11-24 13:13:44', '2025-03-02 08:31:56'),
(2, 2, 'uploads/organizations/images/1734415045_Organization_2.png', '1734415045_Organization_2.png', '2024-11-24 13:13:44', '2025-03-02 08:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` enum('Enable','Disable','Block') NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `membership_start_date` date NOT NULL,
  `membership_end_date` date NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `owner_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `status`, `address_id`, `membership_start_date`, `membership_end_date`, `created_by`, `updated_by`, `created_at`, `updated_at`, `owner_id`) VALUES
(1, 'Bahria Town', 'Enable', 1, '2024-11-01', '2025-11-01', 1, 1, '2024-11-24 13:13:44', '2024-12-17 01:15:17', 2),
(2, 'Etihad Town', 'Enable', 2, '2024-11-01', '2025-11-01', 1, 1, '2024-11-24 13:13:44', '2025-03-02 08:12:50', 3);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `created_at`, `updated_at`, `status`) VALUES
(1, 'View Profile Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(2, 'Update Profile Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(3, 'Remove Profile Picture Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(4, 'Upload Profile Picture Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(5, 'User Homepage Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(6, 'Show Favorites Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(7, 'Add Favorites Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(8, 'Remove Favorites Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(9, 'Show My Properties Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(10, 'Log Queries Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(11, 'View User Queries Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(12, 'View Staff Queries Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(13, 'Accept Queries Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1),
(14, 'Reject Queries Access', NULL, '2025-03-02 08:00:03', '2025-03-02 08:00:03', 1);

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
  `expected_closure_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`id`, `user_id`, `building_id`, `department_id`, `staff_member_id`, `description`, `status`, `expected_closure_date`, `created_at`, `updated_at`, `unit_id`, `remarks`) VALUES
(1, 9, 1, 1, 1, 'hi', 'Open', NULL, '2025-03-04 12:01:21', '2025-03-04 12:01:21', 19, NULL);

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
  `granted_by` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `header` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rolepermissions`
--

INSERT INTO `rolepermissions` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`, `granted_by`, `status`, `name`, `header`) VALUES
(1, 4, 1, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'View Profile Access', 'Profile'),
(2, 4, 2, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Update Profile Access', 'Profile'),
(3, 4, 3, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Remove Profile Picture Access', 'Profile'),
(4, 4, 4, '2025-03-02 08:02:45', '2025-03-04 10:50:24', 1, 1, 'Upload Profile Picture Access', 'Profile'),
(5, 4, 5, '2025-03-02 08:02:45', '2025-03-04 10:53:04', 1, 1, 'User Homepage Access', 'User Application'),
(6, 4, 6, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Show Favorites Access', 'User Application'),
(7, 4, 7, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Add Favorites Access', 'User Application'),
(8, 4, 8, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Remove Favorites Access', 'User Application'),
(9, 4, 9, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Show My Properties Access', 'User Application'),
(10, 4, 10, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Log Queries Access', 'User Application'),
(11, 4, 11, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'View User Queries Access', 'User Application'),
(12, 3, 1, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'View Profile Access', 'Profile'),
(13, 3, 2, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Update Profile Access', 'Profile'),
(14, 3, 3, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Remove Profile Picture Access', 'Profile'),
(15, 3, 4, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Upload Profile Picture Access', 'Profile'),
(16, 3, 12, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'View Staff Queries Access', 'Staff Application'),
(17, 3, 13, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Accept Queries Access', 'Staff Application'),
(18, 3, 14, '2025-03-02 08:02:45', '2025-03-02 08:02:45', 1, 1, 'Reject Queries Access', 'Staff Application');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Administrator with full access', 1, '2024-11-24 13:13:44', '2024-11-24 13:13:44'),
(2, 'Owner', 'NO Description', 1, '2024-11-24 13:13:44', '2024-12-15 09:14:50'),
(3, 'Staff', 'Building Operational Staff Members', 1, '2024-11-24 13:13:44', '2025-03-02 08:05:55'),
(4, 'User', 'Tanents and buyers.', 1, '2025-02-15 11:49:56', '2025-03-02 08:05:55');

-- --------------------------------------------------------

--
-- Table structure for table `staffmembers`
--

CREATE TABLE `staffmembers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL,
  `salary` decimal(8,1) NOT NULL DEFAULT 0.0,
  `active_load` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `accept_queries` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staffmembers`
--

INSERT INTO `staffmembers` (`id`, `user_id`, `department_id`, `building_id`, `salary`, `active_load`, `created_by`, `updated_by`, `created_at`, `updated_at`, `organization_id`, `status`, `accept_queries`) VALUES
(1, 7, 1, 1, 10000.0, 23, 1, 1, '2025-02-15 12:26:42', '2025-03-04 12:01:21', 1, 1, 1),
(2, 8, 1, 1, 10000.0, 23, 1, 1, '2025-02-15 12:26:42', '2025-02-28 11:56:44', 1, 1, 1),
(3, 9, 1, 1, 10000.0, 23, 1, 1, '2025-02-15 12:26:42', '2025-02-28 11:56:44', 1, 1, 1),
(4, 10, 4, 3, 10000.0, 9, 1, 1, '2025-02-15 12:26:42', '2025-02-28 11:56:44', 2, 1, 1),
(5, 11, 4, 3, 10000.0, 10, 1, 1, '2025-02-15 12:26:42', '2025-02-28 11:56:44', 2, 1, 1),
(6, 12, 4, 3, 10000.0, 10, 1, 1, '2025-02-15 12:26:42', '2025-02-28 11:56:44', 2, 1, 1);

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
(1, 3, 'uploads/units/images/Apartment_1.jpeg', 'Apartment1', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(2, 3, 'uploads/units/images/Apartment_2.jpeg', 'Apartment2', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(3, 3, 'uploads/units/images/Apartment_3.jpeg', 'Apartment3', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(4, 6, 'uploads/units/images/Apartment_4.jpeg', 'Apartment4', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(5, 6, 'uploads/units/images/Apartment_5.jpeg', 'Apartment5', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(6, 6, 'uploads/units/images/Apartment_6.jpeg', 'Apartment6', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(7, 9, 'uploads/units/images/Apartment_7.jpeg', 'Apartment7', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(8, 9, 'uploads/units/images/Apartment_8.jpeg', 'Apartment8', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(9, 9, 'uploads/units/images/Apartment_9.jpeg', 'Apartment9', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(10, 12, 'uploads/units/images/Apartment_10.jpeg', 'Apartment10', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(11, 12, 'uploads/units/images/Apartment_11.jpeg', 'Apartment11', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(12, 12, 'uploads/units/images/Apartment_12.jpeg', 'Apartment12', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(13, 15, 'uploads/units/images/Apartment_13.jpeg', 'Apartment13', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(14, 15, 'uploads/units/images/Apartment_14.jpeg', 'Apartment14', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(15, 15, 'uploads/units/images/Apartment_15.jpeg', 'Apartment15', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(16, 18, 'uploads/units/images/Apartment_16.jpeg', 'Apartment16', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(17, 18, 'uploads/units/images/Apartment_17.jpeg', 'Apartment17', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(18, 18, 'uploads/units/images/Apartment_18.jpeg', 'Apartment18', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(19, 21, 'uploads/units/images/Apartment_19.jpeg', 'Apartment19', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(20, 21, 'uploads/units/images/Apartment_20.jpeg', 'Apartment20', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(21, 21, 'uploads/units/images/Apartment_21.jpeg', 'Apartment21', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(22, 2, 'uploads/units/images/Shop_1.jpeg', 'Shop1', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(23, 5, 'uploads/units/images/Shop_2.jpeg', 'Shop2', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(24, 8, 'uploads/units/images/Shop_3.jpeg', 'Shop3', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(25, 11, 'uploads/units/images/Shop_4.jpeg', 'Shop4', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(26, 14, 'uploads/units/images/Shop_5.jpeg', 'Shop5', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(27, 17, 'uploads/units/images/Shop_6.jpeg', 'Shop6', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(28, 20, 'uploads/units/images/Shop_7.jpeg', 'Shop7', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(29, 1, 'uploads/units/images/Room_1.jpeg', 'Room1', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(30, 4, 'uploads/units/images/Room_2.jpeg', 'Room2', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(31, 7, 'uploads/units/images/Room_3.jpeg', 'Room3', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(32, 10, 'uploads/units/images/Room_4.jpeg', 'Room4', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(33, 13, 'uploads/units/images/Room_5.jpeg', 'Room5', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(34, 16, 'uploads/units/images/Room_6.jpeg', 'Room6', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(35, 19, 'uploads/units/images/Room_7.jpeg', 'Room7', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(36, 1, 'uploads/units/images/Room_8.jpeg', 'Room8', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(37, 4, 'uploads/units/images/Room_9.jpeg', 'Room9', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(38, 7, 'uploads/units/images/Room_10.jpeg', 'Room10', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(39, 10, 'uploads/units/images/Room_11.jpeg', 'Room11', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(40, 13, 'uploads/units/images/Room_12.jpeg', 'Room12', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(41, 16, 'uploads/units/images/Room_13.jpeg', 'Room13', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(42, 19, 'uploads/units/images/Room_14.jpeg', 'Room14', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(43, 1, 'uploads/units/images/Room_15.jpeg', 'Room15', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(44, 4, 'uploads/units/images/Room_16.jpeg', 'Room16', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(45, 7, 'uploads/units/images/Room_17.jpeg', 'Room17', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(46, 10, 'uploads/units/images/Room_18.jpeg', 'Room18', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(47, 13, 'uploads/units/images/Room_19.jpeg', 'Room19', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(48, 16, 'uploads/units/images/Room_20.jpeg', 'Room20', '2025-03-02 08:30:37', '2025-03-02 08:30:37'),
(49, 19, 'uploads/units/images/Room_21.jpeg', 'Room21', '2025-03-02 08:30:37', '2025-03-02 08:30:37');

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
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
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
(1, 10, 1, '2023-01-01', '2023-12-31', NULL, 1, 1, '2025-03-02 08:28:14', '2025-03-02 08:28:14', 1, 'Rented', 25000.00),
(2, 9, 2, '2023-06-01', '2023-12-31', NULL, 1, 1, '2025-03-02 08:28:14', '2025-03-02 08:28:14', 1, 'Rented', 20000.00),
(3, 12, 4, NULL, NULL, '2024-12-15', 1, 1, '2025-03-02 08:28:14', '2025-03-02 08:28:14', 1, 'Sold', 100000.00),
(4, 12, 9, '2023-01-01', '2023-12-31', NULL, 1, 1, '2025-03-02 08:28:14', '2025-03-02 08:28:14', 1, 'Rented', 10000.00),
(5, 12, 14, '2023-06-01', '2023-12-31', NULL, 1, 1, '2025-03-02 08:28:14', '2025-03-02 08:28:14', 1, 'Rented', 10000.00),
(6, 9, 19, NULL, NULL, '2024-12-15', 1, 1, '2025-03-02 08:28:14', '2025-03-02 08:28:14', 1, 'Sold', 500000.00),
(7, 9, 6, '2023-01-01', '2023-12-31', NULL, 1, 1, '2025-03-02 08:28:14', '2025-03-02 08:28:14', 1, 'Rented', 15000.00),
(8, 9, 11, '2023-06-01', '2023-12-31', NULL, 1, 1, '2025-03-02 08:28:14', '2025-03-02 08:28:14', 1, 'Rented', 25000.00),
(9, 10, 3, '2025-03-01', '2025-09-01', NULL, 1, 1, '2025-03-02 08:28:14', '2025-03-02 08:28:14', 1, 'Rented', 1500.00),
(10, 10, 4, '2025-03-01', '2025-09-01', NULL, 1, 1, '2025-03-02 08:28:14', '2025-03-02 08:28:14', 1, 'Rented', 1500.00);

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
  `granted_by` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `cnic` varchar(25) NOT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
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
(1, 1, 'Rehan Manzoor', 'admin@gmail.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-1', '0300-0000001', 1, 'Male', 'uploads/users/images/1738263413_User_1.jpg', 6, 1, 1, '2024-11-24 13:13:44', '2025-03-02 08:11:38', '2024-12-01'),
(2, 2, 'Usman Iqbal', 'owner1@gmail.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-2', '0300-0000002', 1, 'Male', 'uploads/users/images/1738263414_User_2.jpg', 7, 1, 1, '2024-11-24 13:13:44', '2025-03-02 08:11:38', '2019-07-03'),
(3, 2, 'Abdullah Aasir', 'owner2@gmail.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-3', '0300-0000003', 1, 'Male', 'uploads/users/images/1738263430_User_3.jpg', 8, 1, 1, '2024-12-24 13:13:44', '2025-03-02 08:11:38', '2019-07-03'),
(4, 3, 'Arham Nasir', 'fa21-bse-062@example.com', '$2y$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-4', '0300-0000004', 1, 'Male', 'uploads/users/images/1738263443_User_4.jpg', 9, 1, 1, '2024-11-24 13:13:44', '2025-03-02 08:11:38', '2019-07-03'),
(5, 3, 'Syed Ibrahim', 'smibrahim297@example.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-5', '0300-0000005', 1, 'Male', 'uploads/users/images/1738263454_User_5.jpg', 10, 1, 1, '2024-12-15 09:21:46', '2025-03-02 08:11:49', '2024-12-15'),
(6, 3, 'Rehan Manzoor', 'rh7081789@example.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-6', '0300-0000006', 1, 'Male', 'uploads/users/images/1739383093_User_6.jpg', 11, 1, 1, '2024-12-17 01:48:25', '2025-03-02 08:11:38', '2024-12-16'),
(7, 3, 'Rehan Manzoor', 'fa21-bse-002@cuilahore.edu.pk', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-7', '0300-0000007', 1, 'Male', 'uploads/users/images/1740824784_User_7.jpg', 12, 1, 1, '2024-11-24 13:13:44', '2025-03-02 08:11:38', '2024-12-01'),
(8, 3, 'Usman Iqbal', 'fa21-bse-014@cuilahore.edu.pk', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-8', '0300-0000008', 1, 'Male', 'uploads/users/images/1740824785_User_8.jpg', 13, 1, 1, '2024-11-24 13:13:44', '2025-03-02 08:11:38', '2019-07-03'),
(9, 4, 'Abdullah Aasir', 'fa21-bse-119@cuilahore.edu.pk', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000000-9', '0300-00000999', 1, 'Male', 'uploads/users/images/1740824786_User_9.jpg', 14, 1, 1, '2024-12-24 13:13:44', '2025-03-04 12:04:21', '2019-07-03'),
(10, 4, 'Arham Nasir', 'Arham@example.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000001-0', '0300-0000010', 1, 'Male', 'uploads/users/images/1740824787_User_10.jpg', 15, 1, 1, '2024-11-24 13:13:44', '2025-03-02 08:11:38', '2019-07-03'),
(11, 4, 'Syed Ibrahim', 'smibrahim297@gmail.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000001-1', '0300-0000011', 1, 'Male', 'uploads/users/images/1740824788_User_11.jpg', 16, 1, 1, '2024-12-15 09:21:46', '2025-03-02 08:11:38', '2024-12-15'),
(12, 4, 'Rehan Manzoor', 'rh7081789@gmail.com', '$2a$12$yk.kQEOK1BYrrYEW1yG1Z.FmvVDAKFXMD.TWmsOsMy9Pmwh4HDcnS', NULL, '35202-0000001-2', '0300-0000012', 1, 'Male', 'uploads/users/images/1740824789_User_12.jpg', 17, 1, 1, '2024-12-17 01:48:25', '2025-03-02 08:11:38', '2024-12-16');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `update_staff_status` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
    IF OLD.status <> NEW.status THEN
        UPDATE staffmembers SET status = NEW.status WHERE user_id = NEW.id;
    END IF;
END
$$
DELIMITER ;

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
  ADD KEY `fk_dropdowntype_parent` (`parent_type_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `querypictures`
--
ALTER TABLE `querypictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rolepermissions`
--
ALTER TABLE `rolepermissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `userbuildingunits`
--
ALTER TABLE `userbuildingunits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `fk_dropdowntype_parent` FOREIGN KEY (`parent_type_id`) REFERENCES `dropdowntypes` (`id`);

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
