-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: jtl_typo3
-- ------------------------------------------------------
-- Server version	11.0.5-MariaDB-1:11.0.5+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `jtl_typo3`
--

/*!40000 DROP DATABASE IF EXISTS `jtl_typo3`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jtl_typo3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `jtl_typo3`;

--
-- Table structure for table `account_api_license_agreements`
--

DROP TABLE IF EXISTS `account_api_license_agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_api_license_agreements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `file` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `accepted_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id_file` (`account_id`,`file`)
) ENGINE=InnoDB AUTO_INCREMENT=848 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_deleted`
--

DROP TABLE IF EXISTS `account_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_deleted` (
  `id` int(11) NOT NULL,
  `customer_number` varchar(255) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `extra_address_line` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_email_changes`
--

DROP TABLE IF EXISTS `account_email_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_email_changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `email_current` varchar(50) NOT NULL,
  `email_new` varchar(50) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9227 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_locations`
--

DROP TABLE IF EXISTS `account_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nNoValidAddress` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_support`
--

DROP TABLE IF EXISTS `account_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned NOT NULL,
  `support_id` int(11) unsigned NOT NULL,
  `unique_price` decimal(15,4) unsigned DEFAULT NULL,
  `paid_until` date DEFAULT NULL,
  `booked_at` date NOT NULL,
  `terminated_on` datetime DEFAULT NULL,
  `terminated_to` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`),
  KEY `account_support_support_id_foreign` (`support_id`),
  CONSTRAINT `account_support_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_support_changes`
--

DROP TABLE IF EXISTS `account_support_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_support_changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL DEFAULT 0,
  `current_support_id` int(11) unsigned NOT NULL,
  `new_support_id` int(11) unsigned NOT NULL,
  `is_done` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_revoked` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `change_at` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `new_support_id` (`new_support_id`),
  KEY `account_support_changes_current_support_id_foreign` (`current_support_id`),
  CONSTRAINT `account_support_changes_current_support_id_foreign` FOREIGN KEY (`current_support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_support_changes_new_support_id_foreign` FOREIGN KEY (`new_support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_support_orders`
--

DROP TABLE IF EXISTS `account_support_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_support_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `price` decimal(15,4) unsigned NOT NULL,
  `is_paid` tinyint(4) NOT NULL DEFAULT 0,
  `is_storno` tinyint(4) NOT NULL DEFAULT 0,
  `booked_at` date NOT NULL,
  `booked_by` varchar(100) NOT NULL,
  `minimum_contract_period_until` date NOT NULL,
  `terminated_by` varchar(100) DEFAULT NULL,
  `terminated_on` date DEFAULT NULL,
  `terminated_to` date DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_support_tmp`
--

DROP TABLE IF EXISTS `account_support_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_support_tmp` (
  `account_id` int(11) NOT NULL,
  `support_id` int(11) unsigned NOT NULL DEFAULT 3,
  `paid_until` date NOT NULL DEFAULT '2020-01-01',
  `booked_at` date NOT NULL DEFAULT '2019-11-19',
  `created_at` datetime NOT NULL DEFAULT '2019-11-19 11:30:00',
  `updated_at` datetime NOT NULL DEFAULT '2019-11-19 11:30:00',
  KEY `support_id` (`support_id`),
  CONSTRAINT `account_support_tmp_ibfk_1` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_supports`
--

DROP TABLE IF EXISTS `account_supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_supports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `support_id` int(11) unsigned NOT NULL,
  `account_support_order_id` int(11) NOT NULL,
  `state` enum('TERMINATED','ACTIVE','BLOCKED','STORNO') NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`),
  KEY `support_id` (`support_id`),
  KEY `account_support_order_id` (`account_support_order_id`),
  KEY `account_supports_account_id_index` (`account_id`),
  CONSTRAINT `account_supports_ibfk_1` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`),
  CONSTRAINT `account_supports_ibfk_2` FOREIGN KEY (`account_support_order_id`) REFERENCES `account_support_orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4082 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_access`
--

DROP TABLE IF EXISTS `acl_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acl_account_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pin_code` varchar(15) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_acl_access_acl_account_id_idx` (`acl_account_id`),
  CONSTRAINT `fk_acl_access_acl_account_id` FOREIGN KEY (`acl_account_id`) REFERENCES `acl_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_access_roles`
--

DROP TABLE IF EXISTS `acl_access_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_access_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acl_access_id` int(10) unsigned NOT NULL,
  `acl_role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_access_id_acl_role_id_unique` (`acl_access_id`,`acl_role_id`),
  KEY `acl_access_id_UNIQUE` (`acl_access_id`),
  KEY `acl_role_id_UNIQUE` (`acl_role_id`),
  CONSTRAINT `fk_acl_access_roles_acl_access_id` FOREIGN KEY (`acl_access_id`) REFERENCES `acl_access` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acl_access_roles_acl_role_id` FOREIGN KEY (`acl_role_id`) REFERENCES `acl_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3456 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_accounts`
--

DROP TABLE IF EXISTS `acl_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `reset_code` varchar(15) DEFAULT NULL,
  `pin_code` varchar(15) DEFAULT NULL,
  `pin_code_created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=746 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_categories`
--

DROP TABLE IF EXISTS `acl_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_groups`
--

DROP TABLE IF EXISTS `acl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acl_category_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_acl_groups_acl_category_id_idx` (`acl_category_id`),
  CONSTRAINT `fk_acl_groups_acl_category_id` FOREIGN KEY (`acl_category_id`) REFERENCES `acl_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_permissions`
--

DROP TABLE IF EXISTS `acl_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acl_group_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `oauth_scopes` mediumtext DEFAULT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_acl_permissions_acl_group_id_idx` (`acl_group_id`),
  CONSTRAINT `fk_acl_permissions_acl_group_id` FOREIGN KEY (`acl_group_id`) REFERENCES `acl_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_role_permissions`
--

DROP TABLE IF EXISTS `acl_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_role_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acl_role_id` int(10) unsigned NOT NULL,
  `acl_permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_role_id_acl_permission_id_unique` (`acl_role_id`,`acl_permission_id`),
  KEY `acl_role_id_idx` (`acl_role_id`),
  KEY `acl_permission_id_idx` (`acl_permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73484 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_role_templates`
--

DROP TABLE IF EXISTS `acl_role_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_role_templates` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permissions` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acl_role_template_id` int(10) unsigned DEFAULT NULL,
  `acl_account_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_acl_roles_acl_account_id_idx` (`acl_account_id`),
  KEY `fk_acl_roles_acl_role_template_id_idx` (`acl_role_template_id`),
  CONSTRAINT `fk_acl_roles_acl_account_id` FOREIGN KEY (`acl_account_id`) REFERENCES `acl_accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3831 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aktionjtlconnect2018`
--

DROP TABLE IF EXISTS `aktionjtlconnect2018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aktionjtlconnect2018` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon` varchar(255) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aktionshipack2018`
--

DROP TABLE IF EXISTS `aktionshipack2018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aktionshipack2018` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `account_id` int(13) NOT NULL,
  `created_at` datetime NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_users`
--

DROP TABLE IF EXISTS `api_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_used` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `host` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `api_v1_license`
--

DROP TABLE IF EXISTS `api_v1_license`;
/*!50001 DROP VIEW IF EXISTS `api_v1_license`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `api_v1_license` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `_key`,
 1 AS `value`,
 1 AS `type`,
 1 AS `is_brand_free`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `api_v1_pos_device`
--

DROP TABLE IF EXISTS `api_v1_pos_device`;
/*!50001 DROP VIEW IF EXISTS `api_v1_pos_device`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `api_v1_pos_device` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `type`,
 1 AS `uid`,
 1 AS `updated_at`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `api_v1_pos_device_meta`
--

DROP TABLE IF EXISTS `api_v1_pos_device_meta`;
/*!50001 DROP VIEW IF EXISTS `api_v1_pos_device_meta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `api_v1_pos_device_meta` AS SELECT 
 1 AS `id`,
 1 AS `device_id`,
 1 AS `_key`,
 1 AS `value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `api_v1_pos_device_reset`
--

DROP TABLE IF EXISTS `api_v1_pos_device_reset`;
/*!50001 DROP VIEW IF EXISTS `api_v1_pos_device_reset`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `api_v1_pos_device_reset` AS SELECT 
 1 AS `id`,
 1 AS `device_id`,
 1 AS `code`,
 1 AS `received_at`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `api_v1_pos_payment_providers`
--

DROP TABLE IF EXISTS `api_v1_pos_payment_providers`;
/*!50001 DROP VIEW IF EXISTS `api_v1_pos_payment_providers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `api_v1_pos_payment_providers` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `device_id`,
 1 AS `state`,
 1 AS `updated_at`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `api_v1_product`
--

DROP TABLE IF EXISTS `api_v1_product`;
/*!50001 DROP VIEW IF EXISTS `api_v1_product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `api_v1_product` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `api_v1_shop`
--

DROP TABLE IF EXISTS `api_v1_shop`;
/*!50001 DROP VIEW IF EXISTS `api_v1_shop`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `api_v1_shop` AS SELECT 
 1 AS `id`,
 1 AS `product_id`,
 1 AS `license_key`,
 1 AS `domain`,
 1 AS `hash`,
 1 AS `uri`,
 1 AS `version`,
 1 AS `download_until`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `api_v1_shop_module`
--

DROP TABLE IF EXISTS `api_v1_shop_module`;
/*!50001 DROP VIEW IF EXISTS `api_v1_shop_module`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `api_v1_shop_module` AS SELECT 
 1 AS `id`,
 1 AS `product_id`,
 1 AS `user_id`,
 1 AS `shop_id`,
 1 AS `license_key`,
 1 AS `unlocked_at`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `api_v1_user`
--

DROP TABLE IF EXISTS `api_v1_user`;
/*!50001 DROP VIEW IF EXISTS `api_v1_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `api_v1_user` AS SELECT 
 1 AS `id`,
 1 AS `customer_group_id`,
 1 AS `email`,
 1 AS `password`,
 1 AS `given_name`,
 1 AS `family_name`,
 1 AS `salutation`,
 1 AS `phone`,
 1 AS `api_token`,
 1 AS `address_line_1`,
 1 AS `address_line_2`,
 1 AS `zip_code`,
 1 AS `city`,
 1 AS `country`,
 1 AS `company`,
 1 AS `tax_number`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `is_active`,
 1 AS `is_verified`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bitrix_companys`
--

DROP TABLE IF EXISTS `bitrix_companys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitrix_companys` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bitrix_contacts`
--

DROP TABLE IF EXISTS `bitrix_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitrix_contacts` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `contact_id` (`contact_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bitrix_country_mappings`
--

DROP TABLE IF EXISTS `bitrix_country_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitrix_country_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bitrix_program_category`
--

DROP TABLE IF EXISTS `bitrix_program_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitrix_program_category` (
  `id` int(11) NOT NULL,
  `programm_cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_programm_id` (`programm_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bitrix_program_status`
--

DROP TABLE IF EXISTS `bitrix_program_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitrix_program_status` (
  `id` int(11) NOT NULL,
  `programm_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_programm_status_key` (`programm_id`,`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bitrix_programs`
--

DROP TABLE IF EXISTS `bitrix_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitrix_programs` (
  `id` int(11) NOT NULL,
  `programm_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_programm_id` (`programm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bitrix_servicepartner_focus_service`
--

DROP TABLE IF EXISTS `bitrix_servicepartner_focus_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitrix_servicepartner_focus_service` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bitrix_sync_failed_jobs`
--

DROP TABLE IF EXISTS `bitrix_sync_failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitrix_sync_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4096 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bitrix_sync_migrations`
--

DROP TABLE IF EXISTS `bitrix_sync_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitrix_sync_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_account_consent`
--

DROP TABLE IF EXISTS `contract_account_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_account_consent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` bigint(20) unsigned NOT NULL,
  `kontakt_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` text NOT NULL,
  `consented_at` datetime NOT NULL DEFAULT current_timestamp(),
  `revoked_at` datetime DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  PRIMARY KEY (`id`),
  KEY `trechtsgrundlage_version_account_consent_kversion_index` (`contract_id`),
  KEY `trechtsgrundlage_version_account_consent_kaccount_index` (`account_id`),
  CONSTRAINT `contract_account_consent_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199721 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_auths`
--

DROP TABLE IF EXISTS `contract_auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_auths` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `internal_name` varchar(255) NOT NULL,
  `public_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_formats`
--

DROP TABLE IF EXISTS `contract_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_formats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `internal_name` varchar(255) NOT NULL,
  `public_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_type_format`
--

DROP TABLE IF EXISTS `contract_type_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_type_format` (
  `contract_type_id` bigint(20) unsigned NOT NULL,
  `contract_format_id` bigint(20) unsigned NOT NULL,
  KEY `contract_type_format_contract_type_id_foreign` (`contract_type_id`),
  KEY `contract_type_format_contract_format_id_foreign` (`contract_format_id`),
  CONSTRAINT `contract_type_format_contract_format_id_foreign` FOREIGN KEY (`contract_format_id`) REFERENCES `contract_formats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contract_type_format_contract_type_id_foreign` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_types`
--

DROP TABLE IF EXISTS `contract_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `internal_name` char(200) DEFAULT NULL,
  `requires_consent` tinyint(1) NOT NULL DEFAULT 0,
  `public_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contract_auth_id` bigint(20) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `leistung_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_types_contract_auth_id_foreign` (`contract_auth_id`),
  KEY `contract_types_leistung_id_foreign` (`leistung_id`),
  CONSTRAINT `contract_types_contract_auth_id_foreign` FOREIGN KEY (`contract_auth_id`) REFERENCES `contract_auths` (`id`),
  CONSTRAINT `contract_types_leistung_id_foreign` FOREIGN KEY (`leistung_id`) REFERENCES `portfolio_leistung` (`kLeistung`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_types_translations`
--

DROP TABLE IF EXISTS `contract_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_types_translations` (
  `id` int(11) NOT NULL,
  `translation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  `content_html2pdf` longtext DEFAULT NULL,
  `type_id` bigint(20) unsigned DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `kAccount` int(13) NOT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT 1,
  `version` varchar(255) DEFAULT NULL,
  `semver` varchar(11) DEFAULT '1.0.0',
  `internal_version_description` varchar(255) DEFAULT NULL,
  `external_version_description` varchar(255) DEFAULT NULL,
  `released_at` datetime DEFAULT NULL,
  `created_adminlogin_id` int(11) DEFAULT NULL,
  `updated_adminlogin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_contract_type_foreign` (`type_id`),
  CONSTRAINT `contracts_contract_type_foreign` FOREIGN KEY (`type_id`) REFERENCES `contract_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contractshistory`
--

DROP TABLE IF EXISTS `contractshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractshistory` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `admin_id` int(13) DEFAULT NULL,
  `contract_id` int(13) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `changelog` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctr_intervallglaettung`
--

DROP TABLE IF EXISTS `ctr_intervallglaettung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctr_intervallglaettung` (
  `kAccount` int(10) unsigned NOT NULL,
  `dRechnungsmonat` date NOT NULL,
  `cPosTyp` varchar(30) NOT NULL,
  `fGlaettung` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`kAccount`,`dRechnungsmonat`,`cPosTyp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctr_kohorte`
--

DROP TABLE IF EXISTS `ctr_kohorte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctr_kohorte` (
  `cPosTyp` varchar(20) NOT NULL,
  `nSumme` int(10) unsigned DEFAULT NULL,
  `nAnzahlKunden` int(10) unsigned DEFAULT NULL,
  `fSchnittProKunde` decimal(8,2) DEFAULT NULL,
  `dKohortenmonat` date NOT NULL,
  `dRechnungsmonat` date NOT NULL,
  PRIMARY KEY (`cPosTyp`,`dKohortenmonat`,`dRechnungsmonat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctr_kohortemeta`
--

DROP TABLE IF EXISTS `ctr_kohortemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctr_kohortemeta` (
  `kAccount` int(10) unsigned NOT NULL,
  `dErsteRechnung` date DEFAULT NULL,
  `dLetzteRechnung` date DEFAULT NULL,
  PRIMARY KEY (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctr_umsatz`
--

DROP TABLE IF EXISTS `ctr_umsatz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctr_umsatz` (
  `cPosTyp` varchar(20) NOT NULL,
  `dRechnungsmonat` date NOT NULL,
  `nSumme` int(10) unsigned DEFAULT NULL,
  `nAnzahlKunden` int(10) unsigned DEFAULT NULL,
  `nAbwanderungKunden` int(11) DEFAULT NULL,
  `nZuwanderungKunden` int(11) DEFAULT NULL,
  `fSchnittProKunde` decimal(8,2) DEFAULT NULL,
  `nUpsell` int(10) unsigned DEFAULT NULL,
  `nDownsell` int(10) unsigned DEFAULT NULL,
  `nAbwanderung` int(10) unsigned DEFAULT NULL,
  `nZuwanderung` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cPosTyp`,`dRechnungsmonat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customergroups`
--

DROP TABLE IF EXISTS `customergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_dpa_confirmation`
--

DROP TABLE IF EXISTS `exs_dpa_confirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_dpa_confirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_dpa_confirmation_history`
--

DROP TABLE IF EXISTS `exs_dpa_confirmation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_dpa_confirmation_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `accepted_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_order_item_metas`
--

DROP TABLE IF EXISTS `exs_order_item_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_order_item_metas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` int(10) unsigned NOT NULL,
  `name` varchar(127) NOT NULL,
  `value` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exs_order_item_metas_item_id_name_unique` (`order_item_id`,`name`),
  KEY `order_item_metas_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `order_item_metas_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `exs_order_items` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=207303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_order_items`
--

DROP TABLE IF EXISTS `exs_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `sku` varchar(127) DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `amount` decimal(30,2) NOT NULL,
  `tax` decimal(30,2) DEFAULT NULL,
  `tax_rate` decimal(30,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `exs_orders` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114524 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_order_metas`
--

DROP TABLE IF EXISTS `exs_order_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_order_metas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `name` varchar(127) NOT NULL,
  `value` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_metas_order_id_name_unique` (`order_id`,`name`),
  CONSTRAINT `order_metas_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `exs_orders` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=469938 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_order_refunds`
--

DROP TABLE IF EXISTS `exs_order_refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_order_refunds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `platform_fee` int(11) NOT NULL,
  `refund_amount` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `exs_order_refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `exs_order_refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `exs_orders` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_orders`
--

DROP TABLE IF EXISTS `exs_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(64) NOT NULL,
  `buyer_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `status` enum('CREATED','APPROVED','COMPLETED','CANCELED') NOT NULL,
  `payment_provider` varchar(127) DEFAULT NULL,
  `amount_total` decimal(30,2) NOT NULL DEFAULT 0.00,
  `platform_fee` decimal(30,2) NOT NULL DEFAULT 0.00,
  `tax_total` decimal(30,2) NOT NULL DEFAULT 0.00,
  `currency_code` varchar(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `canceled_at` timestamp NULL DEFAULT NULL,
  `no_invoice` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_buyer_id_foreign` (`buyer_id`),
  KEY `orders_seller_id_foreign` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109583 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_orders_backup`
--

DROP TABLE IF EXISTS `exs_orders_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_orders_backup` (
  `id` int(10) unsigned NOT NULL,
  `order_number` varchar(64) NOT NULL,
  `context_id` int(10) unsigned DEFAULT NULL,
  `buyer_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  `status` enum('CREATED','APPROVED','COMPLETED','CANCELED') NOT NULL,
  `payment_provider` varchar(127) DEFAULT NULL,
  `amount_total` decimal(30,2) NOT NULL DEFAULT 0.00,
  `platform_fee` decimal(30,2) NOT NULL DEFAULT 0.00,
  `tax_total` decimal(30,2) NOT NULL DEFAULT 0.00,
  `currency_code` varchar(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `canceled_at` timestamp NULL DEFAULT NULL,
  `no_invoice` tinyint(1) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_orders_paypalreport_details`
--

DROP TABLE IF EXISTS `exs_orders_paypalreport_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_orders_paypalreport_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CH` varchar(5) DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(255) DEFAULT NULL,
  `TRANSACTION_SUBTYPE` varchar(255) DEFAULT NULL,
  `COUNTERPARTY_ACCOUNT_ID` varchar(255) DEFAULT NULL,
  `COUNTERPARTY_TRANSACTION_TYPE` varchar(255) DEFAULT NULL,
  `COUNTERPARTY_TRANSACTION_SUBTYPE` varchar(255) DEFAULT NULL,
  `PAYPAL_REFERENCE_ID` varchar(50) DEFAULT NULL,
  `PAYPAL_TRANSACTION_ID` varchar(50) DEFAULT NULL,
  `INVOICE_ID` varchar(50) DEFAULT NULL,
  `CUSTOM_FIELD` varchar(100) DEFAULT NULL,
  `TRANSACTION_DATE` datetime DEFAULT NULL,
  `INTEGRATION_IDENTIFIER` varchar(255) DEFAULT NULL,
  `PP_FEES` decimal(10,4) DEFAULT NULL,
  `PP_FEES_PERCENTAGE` varchar(20) DEFAULT NULL,
  `PP_FEES_FIXED_AMOUNT` decimal(10,4) DEFAULT NULL,
  `PP_FEES_CURRENCY` varchar(5) DEFAULT NULL,
  `BASE_FX_RATE` decimal(10,4) DEFAULT NULL,
  `MARKUP_FX_RATE` decimal(10,4) DEFAULT NULL,
  `NET_FX_RATE` decimal(10,4) DEFAULT NULL,
  `TRANSACTION_CURRENCY` varchar(5) DEFAULT NULL,
  `TRANSACTION_AMOUNT` decimal(10,4) DEFAULT NULL,
  `DECLINE_CODE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INVOICE_ID` (`INVOICE_ID`),
  KEY `PAYPAL_REFERENCE_ID` (`PAYPAL_REFERENCE_ID`),
  KEY `PAYPAL_TRANSACTION_ID` (`PAYPAL_TRANSACTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18817 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_orders_paypalreport_pyt`
--

DROP TABLE IF EXISTS `exs_orders_paypalreport_pyt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_orders_paypalreport_pyt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CH` varchar(5) DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(255) DEFAULT NULL,
  `TRANSACTION_SUBTYPE` varchar(255) DEFAULT NULL,
  `SELLER_ACCOUNT_ID` varchar(50) DEFAULT NULL,
  `PAYPAL_REFERENCE_ID` varchar(50) DEFAULT NULL,
  `PAYPAL_TRANSACTION_ID` varchar(50) DEFAULT NULL,
  `INVOICE_ID` varchar(50) DEFAULT NULL,
  `CUSTOM_FIELD` varchar(100) DEFAULT NULL,
  `TRANSACTION_DATE` datetime DEFAULT NULL,
  `INTEGRATION_IDENTIFIER` varchar(50) DEFAULT NULL,
  `PAYMENT_INSTRUMENT_TYPE` varchar(50) DEFAULT NULL,
  `PAYMENT_INSTRUMENT_SUBTYPE` varchar(50) DEFAULT NULL,
  `CHECKOUT_CHANNEL` varchar(50) DEFAULT NULL,
  `DELAYED_DISBURSEMENT` varchar(5) DEFAULT NULL,
  `TRANSACTION_AMOUNT` decimal(10,4) DEFAULT NULL,
  `TRANSACTION_CURRENCY` varchar(5) DEFAULT NULL,
  `TRANSACTION_DEBIT_CREDIT_CODE` varchar(10) DEFAULT NULL,
  `PENDING_DISBURSEMENT_AMOUNT` decimal(10,4) DEFAULT NULL,
  `PENDING_DISBURSEMENT_AMOUNT_CURRENCY` varchar(5) DEFAULT NULL,
  `SELLER_AMOUNT` decimal(10,4) DEFAULT NULL,
  `SELLER_AMOUNT_CURRENCY` varchar(5) DEFAULT NULL,
  `PARTNER_FEE` decimal(10,4) DEFAULT NULL,
  `PARTNER_FEE_CURRENCY` varchar(5) DEFAULT NULL,
  `PARTNER_FEE_ACCOUNT_ID` varchar(50) DEFAULT NULL,
  `PP_FEES` decimal(10,4) DEFAULT NULL,
  `PP_FEES_CURRENCY` varchar(5) DEFAULT NULL,
  `PP_FEES_PERCENTAGE` varchar(20) DEFAULT NULL,
  `PP_FEES_FIXED_AMOUNT` decimal(10,4) DEFAULT NULL,
  `PP_FEES_XB_PERCENTAGE` varchar(20) DEFAULT NULL,
  `PP_FEES_XB_FIXED_AMOUNT` decimal(10,4) DEFAULT NULL,
  `PP_FEES_XB_TOTAL_AMOUNT` decimal(10,4) DEFAULT NULL,
  `CHARGEBACK_FEE` decimal(10,4) DEFAULT NULL,
  `CHARGEBACK_FEE_CURRENCY` varchar(5) DEFAULT NULL,
  `HOLD_AMOUNT` decimal(10,4) DEFAULT NULL,
  `HOLD_AMOUNT_CURRENCY` varchar(5) DEFAULT NULL,
  `RECOUP_AMOUNT` decimal(10,4) DEFAULT NULL,
  `RECOUP_AMOUNT_CURRENCY` varchar(5) DEFAULT NULL,
  `RECOUP_ACCOUNT_ID` varchar(50) DEFAULT NULL,
  `PAYABLE_AMOUNT` decimal(10,4) DEFAULT NULL,
  `PAYABLE_AMOUNT_CURRENCY` varchar(5) DEFAULT NULL,
  `PAYABLE_ACCOUNT_ID` varchar(50) DEFAULT NULL,
  `EXTERNAL_TRANSFER_AMOUNT` decimal(10,4) DEFAULT NULL,
  `EXTERNAL_TRANSFER_AMOUNT_CURRENCY` varchar(5) DEFAULT NULL,
  `COUNTERPARTY_ACCOUNT_ID` varchar(50) DEFAULT NULL,
  `SETTLEMENT_REFERENCE_ID` varchar(50) DEFAULT NULL,
  `STORE_ID` varchar(50) DEFAULT NULL,
  `TRANSACTION_STATUS` varchar(50) DEFAULT NULL,
  `DECLINE_CODE` varchar(50) DEFAULT NULL,
  `PAYOUT_REFERENCE_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INVOICE_ID` (`INVOICE_ID`),
  KEY `PAYPAL_REFERENCE_ID` (`PAYPAL_REFERENCE_ID`),
  KEY `PAYPAL_TRANSACTION_ID` (`PAYPAL_TRANSACTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16599 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_orders_paypalreport_stats`
--

DROP TABLE IF EXISTS `exs_orders_paypalreport_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_orders_paypalreport_stats` (
  `cReportType` varchar(100) NOT NULL,
  `nDatensaetze` int(10) unsigned DEFAULT NULL,
  `dDatum` date NOT NULL,
  PRIMARY KEY (`dDatum`,`cReportType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_orders_provisionsgutschrift`
--

DROP TABLE IF EXISTS `exs_orders_provisionsgutschrift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_orders_provisionsgutschrift` (
  `kOrdersProvisionsgutschrift` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `dRechnungsdatum` date DEFAULT NULL,
  `nGutschriftsnummer` int(10) unsigned DEFAULT NULL,
  `cGutschriftsnummer` varchar(15) DEFAULT NULL,
  `cZahlungsart` varchar(255) DEFAULT NULL,
  `cPDFDokumentPfad` varchar(255) DEFAULT NULL,
  `dPDFZugestellt` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kOrdersProvisionsgutschrift`),
  KEY `exs_orders_provisionsgutschrift_kAccount_index` (`kAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_orders_provisionsgutschriftpos`
--

DROP TABLE IF EXISTS `exs_orders_provisionsgutschriftpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_orders_provisionsgutschriftpos` (
  `kOrdersProvisionsgutschriftPos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kOrdersProvisionsgutschrift` int(10) unsigned DEFAULT NULL,
  `kOrdersProvisionsrechnungPos` int(10) unsigned DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `nAnzahl` int(10) unsigned DEFAULT NULL,
  `fBetrag` decimal(30,2) DEFAULT NULL,
  `fMwSt` decimal(30,2) DEFAULT NULL,
  `cPosTyp` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kOrdersProvisionsgutschriftPos`),
  KEY `exs_orders_provisionsgutschriftpos_gutschrift_index` (`kOrdersProvisionsgutschrift`),
  KEY `exs_kOrdersProvisionsrechnungPos_index` (`kOrdersProvisionsrechnungPos`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_orders_provisionsrechnung`
--

DROP TABLE IF EXISTS `exs_orders_provisionsrechnung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_orders_provisionsrechnung` (
  `kOrdersProvisionsrechnung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `dRechnungsdatum` date DEFAULT NULL,
  `nRechnungsnummer` int(10) unsigned DEFAULT NULL,
  `cRechnungsnummer` varchar(15) DEFAULT NULL,
  `cZahlungsart` varchar(255) DEFAULT NULL,
  `cPDFDokumentPfad` varchar(255) DEFAULT NULL,
  `dPDFZugestellt` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kOrdersProvisionsrechnung`),
  KEY `exs_orders_provisionsrechnung_kAccount_index` (`kAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=926 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_orders_provisionsrechnungpos`
--

DROP TABLE IF EXISTS `exs_orders_provisionsrechnungpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_orders_provisionsrechnungpos` (
  `kOrdersProvisionsrechnungPos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kOrdersProvisionsrechnung` int(10) unsigned DEFAULT NULL,
  `orders_id` int(10) unsigned DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `nAnzahl` int(10) unsigned DEFAULT NULL,
  `fBetrag` decimal(30,2) DEFAULT NULL,
  `fMwSt` decimal(30,2) DEFAULT NULL,
  `cPosTyp` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kOrdersProvisionsrechnungPos`),
  KEY `exs_orders_provisionsrechnungpos_kOrdersProvisionsrechnung_index` (`kOrdersProvisionsrechnung`),
  KEY `exs_orders_provisionsrechnungpos_orders_id_index` (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15146 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_pull_request`
--

DROP TABLE IF EXISTS `exs_pull_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_pull_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_seller_mailarchive`
--

DROP TABLE IF EXISTS `exs_seller_mailarchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_seller_mailarchive` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kAdminLogin` int(11) DEFAULT NULL,
  `exs_seller_id` int(11) DEFAULT NULL,
  `mail_type` int(11) DEFAULT NULL,
  `mail_content_html` longtext DEFAULT NULL,
  `mail_content_text` longtext DEFAULT NULL,
  `recipient_address` varchar(255) DEFAULT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_seller_marketplace`
--

DROP TABLE IF EXISTS `exs_seller_marketplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_seller_marketplace` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) unsigned NOT NULL,
  `partner_referral_id` varchar(255) DEFAULT NULL,
  `tracking_id` varchar(255) DEFAULT NULL,
  `merchant_id` varchar(30) DEFAULT NULL,
  `status` enum('onboarding','no_payments','confirm_email','approved') NOT NULL DEFAULT 'onboarding',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_seller_notes`
--

DROP TABLE IF EXISTS `exs_seller_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_seller_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `exs_seller_id` int(11) NOT NULL,
  `type` enum('info','warning') DEFAULT 'info',
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_seller_profile_localizations`
--

DROP TABLE IF EXISTS `exs_seller_profile_localizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_seller_profile_localizations` (
  `exs_seller_profile_id` int(11) NOT NULL,
  `locale` varchar(2) NOT NULL,
  `company_url` varchar(255) NOT NULL,
  `company_description` text NOT NULL,
  `contact_data_imprint` text NOT NULL,
  `seller_own_agb_url` varchar(255) NOT NULL,
  `service_partner_profile_key` varchar(255) NOT NULL,
  `solution_provider_profile_key` varchar(255) NOT NULL,
  PRIMARY KEY (`exs_seller_profile_id`,`locale`),
  KEY `locale` (`locale`),
  CONSTRAINT `exs_seller_profile_localizations_ibfk_1` FOREIGN KEY (`exs_seller_profile_id`) REFERENCES `exs_seller_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_seller_profiles`
--

DROP TABLE IF EXISTS `exs_seller_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_seller_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exs_seller_id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `seller_prefix` varchar(4) NOT NULL,
  `system_mail_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_name` (`company_name`),
  UNIQUE KEY `exs_seller_profiles_seller_prefix_unique` (`seller_prefix`),
  KEY `exs_seller_id` (`exs_seller_id`),
  CONSTRAINT `exs_seller_profiles_ibfk_1` FOREIGN KEY (`exs_seller_id`) REFERENCES `exs_sellers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_seller_request_history`
--

DROP TABLE IF EXISTS `exs_seller_request_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_seller_request_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `request_data` longtext DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `request_update` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_seller_statehistory`
--

DROP TABLE IF EXISTS `exs_seller_statehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_seller_statehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changed_by` int(11) NOT NULL,
  `exs_seller_id` int(11) NOT NULL,
  `from_onboarding_state` enum('onboarding','onboarded','rejected') DEFAULT NULL,
  `to_onboarding_state` enum('onboarding','onboarded','rejected') DEFAULT NULL,
  `from_listing_state` enum('onboarding','active','locked','terminated') NOT NULL DEFAULT 'onboarding',
  `to_listing_state` enum('onboarding','active','locked','terminated') NOT NULL DEFAULT 'onboarding',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exs_sellers`
--

DROP TABLE IF EXISTS `exs_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exs_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `offer_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `public_warning_notes` longtext DEFAULT NULL,
  `public_blocking_notes` longtext DEFAULT NULL,
  `certificate_state` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=missing, 1=InCheck, 2=Accepted, 3=Rejected ',
  `paypal_authorized_state` enum('authorized','pending','denied') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `onboarding_state` enum('onboarded','onboarding','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'onboarding',
  `listing_state` enum('onboarding','active','locked','terminated') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'onboarding',
  `state` enum('active','inactive','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bLicenseMigrationActive` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `exs_sellers_account_id_listing_state_index` (`account_id`,`listing_state`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `ext_license_v1`
--

DROP TABLE IF EXISTS `ext_license_v1`;
/*!50001 DROP VIEW IF EXISTS `ext_license_v1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ext_license_v1` AS SELECT 
 1 AS `kLizenz`,
 1 AS `kAccount`,
 1 AS `cKey`,
 1 AS `kKey`,
 1 AS `eTyp`,
 1 AS `bBrandFree`,
 1 AS `cName`,
 1 AS `kShop`,
 1 AS `kKaufprodukt`,
 1 AS `cLizenzkey`,
 1 AS `cDomain`,
 1 AS `cOutHash`,
 1 AS `cPfad`,
 1 AS `nLaufendeVersion`,
 1 AS `dDownloadBis`,
 1 AS `dErstellt`,
 1 AS `kShopModul`,
 1 AS `smkKaufProdukt`,
 1 AS `smkAccountGebunden`,
 1 AS `smkShop`,
 1 AS `smcLizenzkey`,
 1 AS `smdErstellt`,
 1 AS `smdFreigeschaltet`,
 1 AS `nMinShopVersion`,
 1 AS `nMinWawiVersion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `extension_availabilities`
--

DROP TABLE IF EXISTS `extension_availabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_availabilities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_availability_translations`
--

DROP TABLE IF EXISTS `extension_availability_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_availability_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `availability_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `availability_id` (`availability_id`,`locale_id`),
  KEY `extension_availibility_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_availability_translations_availability_id_foreign` FOREIGN KEY (`availability_id`) REFERENCES `extension_availabilities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_availibility_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_catchword_translations`
--

DROP TABLE IF EXISTS `extension_catchword_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_catchword_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catchword_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_catchword_translations_locale_id_foreign` (`locale_id`),
  KEY `extension_catchword_translations_catchword_id_foreign` (`catchword_id`) USING BTREE,
  CONSTRAINT `extension_catchword_translations_catchword_id_foreign` FOREIGN KEY (`catchword_id`) REFERENCES `extension_catchwords` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_catchword_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_catchwords`
--

DROP TABLE IF EXISTS `extension_catchwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_catchwords` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_categories`
--

DROP TABLE IF EXISTS `extension_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_categories_type_id_foreign` (`type_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `extension_categories_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `extension_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_category`
--

DROP TABLE IF EXISTS `extension_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_category` (
  `extension_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`extension_id`,`category_id`),
  KEY `extension_category_category_id_foreign` (`category_id`),
  CONSTRAINT `extension_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `extension_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_category_extension_id_foreign` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_category_translations`
--

DROP TABLE IF EXISTS `extension_category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_category_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `extension_category_translations_category_id_foreign` (`category_id`) USING BTREE,
  KEY `extension_category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `extension_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_certification_translations`
--

DROP TABLE IF EXISTS `extension_certification_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_certification_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `certification_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `extension_certification_translations_certification_id_foreign` (`certification_id`) USING BTREE,
  KEY `extension_certification_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_certification_translations_certification_id_foreign` FOREIGN KEY (`certification_id`) REFERENCES `extension_certifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_certification_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_certifications`
--

DROP TABLE IF EXISTS `extension_certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_certifications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_changelog_translations`
--

DROP TABLE IF EXISTS `extension_changelog_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_changelog_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `changelog_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_changelog_translations_changelog_id_foreign` (`changelog_id`) USING BTREE,
  KEY `extension_changelog_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_changelog_translations_changelog_id_foreign` FOREIGN KEY (`changelog_id`) REFERENCES `extension_changelogs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_changelog_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=653 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_changelogs`
--

DROP TABLE IF EXISTS `extension_changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_changelogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) unsigned NOT NULL,
  `version` varchar(255) NOT NULL,
  `published_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_changelogs_extension_id_foreign` (`extension_id`),
  CONSTRAINT `extension_changelogs_extension_id_foreign` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_compatibilities`
--

DROP TABLE IF EXISTS `extension_compatibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_compatibilities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `changelog_id` int(11) unsigned NOT NULL,
  `version_from` varchar(255) NOT NULL DEFAULT '',
  `version_to` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_compatibilities_changelog_id_foreign` (`changelog_id`),
  CONSTRAINT `extension_compatibilities_changelog_id_foreign` FOREIGN KEY (`changelog_id`) REFERENCES `extension_changelogs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=809 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_feature`
--

DROP TABLE IF EXISTS `extension_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_feature` (
  `extension_id` int(11) unsigned NOT NULL,
  `feature_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`extension_id`,`feature_id`),
  KEY `extension_feature_feature_id_foreign` (`feature_id`),
  CONSTRAINT `extension_feature_extension_id_foreign` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_feature_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `extension_features` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_feature_translations`
--

DROP TABLE IF EXISTS `extension_feature_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_feature_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `extension_feature_translations_feature_id_foreign` (`feature_id`) USING BTREE,
  KEY `extension_feature_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_feature_translations_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `extension_features` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_feature_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_features`
--

DROP TABLE IF EXISTS `extension_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_features` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `sort` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_image_anchor_translations`
--

DROP TABLE IF EXISTS `extension_image_anchor_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_image_anchor_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `anchor_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `extension_image_anchor_translations_anchor_id_foreign` (`anchor_id`) USING BTREE,
  KEY `extension_image_anchor_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_image_anchor_translations_anchor_id_foreign` FOREIGN KEY (`anchor_id`) REFERENCES `extension_image_anchors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_image_anchor_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_image_anchors`
--

DROP TABLE IF EXISTS `extension_image_anchors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_image_anchors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_image_translations`
--

DROP TABLE IF EXISTS `extension_image_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_image_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_image_translations_image_id_foreign` (`image_id`) USING BTREE,
  KEY `extension_image_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_image_translations_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `extension_images` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_image_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=982 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_images`
--

DROP TABLE IF EXISTS `extension_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) unsigned NOT NULL,
  `anchor_id` int(11) unsigned DEFAULT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_images_extension_id_foreign` (`extension_id`),
  KEY `extension_images_anchor_id` (`anchor_id`),
  CONSTRAINT `extension_images_anchor_id` FOREIGN KEY (`anchor_id`) REFERENCES `extension_image_anchors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_images_extension_id_foreign` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1964 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_price_feature_translations`
--

DROP TABLE IF EXISTS `extension_price_feature_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_price_feature_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `code` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `extension_price_feature_translations_feature_id_foreign` (`feature_id`) USING BTREE,
  KEY `extension_price_feature_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_price_feature_translations_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `extension_price_features` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_price_feature_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2873 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_price_features`
--

DROP TABLE IF EXISTS `extension_price_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_price_features` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `price_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_price_features_price_id_foreign` (`price_id`),
  CONSTRAINT `extension_price_features_price_id_foreign` FOREIGN KEY (`price_id`) REFERENCES `extension_prices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2873 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_price_translations`
--

DROP TABLE IF EXISTS `extension_price_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_price_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `price_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `note` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_price_translations_price_id_foreign` (`price_id`) USING BTREE,
  KEY `extension_price_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_price_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_price_translations_price_id_foreign` FOREIGN KEY (`price_id`) REFERENCES `extension_prices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=688 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_prices`
--

DROP TABLE IF EXISTS `extension_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_prices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) unsigned NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `subscription_price` decimal(15,4) DEFAULT 0.0000,
  `interval` int(11) unsigned DEFAULT 0 COMMENT 'Months',
  `url` varchar(255) DEFAULT '',
  `is_preview` tinyint(1) DEFAULT 0,
  `is_starting_price` tinyint(1) DEFAULT 0,
  `on_demand` tinyint(1) DEFAULT 0,
  `sort` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_prices_extension_id_foreign` (`extension_id`),
  CONSTRAINT `extension_prices_extension_id_foreign` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=692 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_specific_translations`
--

DROP TABLE IF EXISTS `extension_specific_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_specific_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specific_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_specific_translations_specific_id_index` (`specific_id`),
  KEY `extension_specific_translations_locale_id_index` (`locale_id`),
  CONSTRAINT `extension_specific_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_specific_translations_specific_id_foreign` FOREIGN KEY (`specific_id`) REFERENCES `extension_specifics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_specific_value_translations`
--

DROP TABLE IF EXISTS `extension_specific_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_specific_value_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_specific_value_translations_value_id_index` (`value_id`),
  KEY `extension_specific_value_translations_locale_id_index` (`locale_id`),
  CONSTRAINT `extension_specific_value_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_specific_value_translations_value_id_foreign` FOREIGN KEY (`value_id`) REFERENCES `extension_specific_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_specific_values`
--

DROP TABLE IF EXISTS `extension_specific_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_specific_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specific_id` int(10) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_specific_values_specific_id_index` (`specific_id`),
  KEY `extension_specific_values_code_index` (`code`),
  CONSTRAINT `extension_specific_values_specific_id_foreign` FOREIGN KEY (`specific_id`) REFERENCES `extension_specifics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_specifics`
--

DROP TABLE IF EXISTS `extension_specifics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_specifics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_statement_translations`
--

DROP TABLE IF EXISTS `extension_statement_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_statement_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `statement_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_statement_translations_statement_id_foreign` (`statement_id`),
  KEY `extension_statement_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_statement_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_statement_translations_statement_id_foreign` FOREIGN KEY (`statement_id`) REFERENCES `extension_statements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16277 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_statements`
--

DROP TABLE IF EXISTS `extension_statements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_statements` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) unsigned NOT NULL,
  `type` enum('short_desc','advantage') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_statements_extension_id_foreign` (`extension_id`),
  CONSTRAINT `extension_statements_extension_id_foreign` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_status`
--

DROP TABLE IF EXISTS `extension_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_status_translations`
--

DROP TABLE IF EXISTS `extension_status_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_status_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `extension_status_translations_status_id_foreign` (`status_id`) USING BTREE,
  KEY `extension_status_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_status_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_status_translations_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `extension_status` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_translations`
--

DROP TABLE IF EXISTS `extension_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `additional_caption` varchar(255) NOT NULL DEFAULT '',
  `catchword` varchar(255) DEFAULT '',
  `description` text NOT NULL,
  `additional_description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_translations_extension_id_foreign` (`extension_id`) USING BTREE,
  KEY `extension_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_translations_extension_id_foreign` FOREIGN KEY (`extension_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2423 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_type_translations`
--

DROP TABLE IF EXISTS `extension_type_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_type_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `extension_type_translations_type_id_foreign` (`type_id`) USING BTREE,
  KEY `extension_type_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `extension_type_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_type_translations_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `extension_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_types`
--

DROP TABLE IF EXISTS `extension_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extensions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `availability_id` int(11) unsigned DEFAULT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `status_id` int(11) unsigned NOT NULL,
  `catchword_id` int(11) unsigned DEFAULT NULL,
  `certification_id` int(11) unsigned DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `owner_type` enum('tech','service') NOT NULL,
  `company` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `email_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `documentation_url` varchar(255) NOT NULL,
  `dependence_url` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `demo_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_product_id_foreign` (`product_id`),
  KEY `extension_owner_id_foreign` (`owner_id`),
  KEY `extension_type_id_foreign` (`type_id`),
  KEY `extension_availability_id_foreign` (`availability_id`),
  KEY `extension_status_id_foreign` (`status_id`),
  KEY `extension_certification_id_foreign` (`certification_id`),
  KEY `extension_ catchword_id_foreign` (`catchword_id`),
  CONSTRAINT `extension_ catchword_id_foreign` FOREIGN KEY (`catchword_id`) REFERENCES `extension_catchwords` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_availability_id_foreign` FOREIGN KEY (`availability_id`) REFERENCES `extension_availabilities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_certification_id_foreign` FOREIGN KEY (`certification_id`) REFERENCES `extension_certifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `extension_status` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extension_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `extension_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ffn_di_authorizations`
--

DROP TABLE IF EXISTS `ffn_di_authorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ffn_di_authorizations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authorization_id` varchar(255) NOT NULL,
  `expose_id` varchar(255) DEFAULT NULL,
  `merchant_id` varchar(255) DEFAULT NULL,
  `fulfiller_id` varchar(255) DEFAULT NULL,
  `api_merchant_id` varchar(255) DEFAULT NULL,
  `api_fulfiller_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `response` longtext DEFAULT NULL,
  `criterias` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6216 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ffn_di_documents`
--

DROP TABLE IF EXISTS `ffn_di_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ffn_di_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1582 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ffn_di_exposes`
--

DROP TABLE IF EXISTS `ffn_di_exposes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ffn_di_exposes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `expose_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street_number` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `api_user_id` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `packages_per_month` bigint(20) unsigned NOT NULL,
  `employees` bigint(20) unsigned NOT NULL,
  `area` bigint(20) unsigned NOT NULL,
  `description` longtext DEFAULT NULL,
  `max_volume` bigint(20) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `active_since` varchar(255) NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `ebay_plus` tinyint(1) NOT NULL DEFAULT 0,
  `amazon_prime` tinyint(1) NOT NULL DEFAULT 0,
  `certified` tinyint(1) NOT NULL DEFAULT 0,
  `teased` tinyint(1) NOT NULL DEFAULT 0,
  `logo` varchar(255) DEFAULT NULL,
  `pre_fba` tinyint(1) NOT NULL DEFAULT 0,
  `max_cutoff` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=473 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ffn_di_failed_jobs`
--

DROP TABLE IF EXISTS `ffn_di_failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ffn_di_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ffn_di_migrations`
--

DROP TABLE IF EXISTS `ffn_di_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ffn_di_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ffn_di_user_fulfillers`
--

DROP TABLE IF EXISTS `ffn_di_user_fulfillers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ffn_di_user_fulfillers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `fulfiller_id` varchar(255) NOT NULL,
  `assigned_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4145 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ffn_di_user_merchants`
--

DROP TABLE IF EXISTS `ffn_di_user_merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ffn_di_user_merchants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `merchant_id` varchar(255) NOT NULL,
  `assigned_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4145 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ffn_di_user_roles`
--

DROP TABLE IF EXISTS `ffn_di_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ffn_di_user_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  `assigned_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8010 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ffn_di_user_warehouse_stats`
--

DROP TABLE IF EXISTS `ffn_di_user_warehouse_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ffn_di_user_warehouse_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `api_user_id` varchar(255) NOT NULL,
  `role` enum('Fulfiller','Merchant') NOT NULL,
  `type` enum('createdInbounds','createdOutbounds','shippedOutbounds') NOT NULL,
  `warehouse` varchar(255) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ffn_di_user_warehouse_stats_warehouse_date_index` (`warehouse`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=1926192 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ffn_di_users`
--

DROP TABLE IF EXISTS `ffn_di_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ffn_di_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `api_user_id` varchar(255) NOT NULL,
  `amazon_prime_by_seller` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ffn_di_users_api_user_id_index` (`api_user_id`),
  KEY `ffn_di_users_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7125 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fulfillment_users`
--

DROP TABLE IF EXISTS `fulfillment_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fulfillment_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `production_user_id` varchar(50) NOT NULL,
  `sandbox_user_id` varchar(50) NOT NULL,
  `tariff` varchar(50) DEFAULT NULL,
  `ebay_fulfillment_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5151 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hosting_mail_queue`
--

DROP TABLE IF EXISTS `hosting_mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hosting_mail_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_template` int(11) NOT NULL COMMENT 'const MAILVORLAGE_(*) in PHP',
  `reference_id` int(11) NOT NULL COMMENT 'PK in reference_table',
  `reference_name` varchar(45) DEFAULT NULL COMMENT 'only a hint',
  `additional_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional_data`)),
  `status` enum('new','sent','error') NOT NULL,
  `unique_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'UTC',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'UTC',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UX__hosting_mail_queue__unique_key` (`unique_key`),
  KEY `IX_hosting_mail_cron_status` (`status`),
  KEY `IX_hmq_reference_id_reference_name` (`reference_id`,`reference_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19615 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mailchimp_campaigns`
--

DROP TABLE IF EXISTS `mailchimp_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mailchimp_campaigns` (
  `id` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `recipients` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`recipients`)),
  `send_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_migrations`
--

DROP TABLE IF EXISTS `main_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_double_opt_in`
--

DROP TABLE IF EXISTS `mc_sync_double_opt_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_double_opt_in` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(10) unsigned DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `consented_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `mc_sync_double_opt_in_mc_sync_emails_id_fk` (`email_id`),
  CONSTRAINT `mc_sync_double_opt_in_mc_sync_emails_id_fk` FOREIGN KEY (`email_id`) REFERENCES `mc_sync_emails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_double_opt_out`
--

DROP TABLE IF EXISTS `mc_sync_double_opt_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_double_opt_out` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(10) unsigned NOT NULL,
  `hash` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp(),
  `consented_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mc_sync_double_opt_out_hash_unique` (`hash`),
  KEY `mc_sync_double_opt_out_mc_sync_emails_id_fk` (`email_id`),
  CONSTRAINT `mc_sync_double_opt_out_mc_sync_emails_id_fk` FOREIGN KEY (`email_id`) REFERENCES `mc_sync_emails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2414 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_email_tags`
--

DROP TABLE IF EXISTS `mc_sync_email_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_email_tags` (
  `email_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  KEY `mc_sync_email_tags_email_id_foreign` (`email_id`),
  KEY `mc_sync_email_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `mc_sync_email_tags_email_id_foreign` FOREIGN KEY (`email_id`) REFERENCES `mc_sync_emails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mc_sync_email_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `mc_sync_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_emails`
--

DROP TABLE IF EXISTS `mc_sync_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '1 kAccount, 2 Ansprechpartner, 3 Mailchimp, 4 Local',
  `action_needed` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '0 None, 1 Create, 2 Update, 3 Delete',
  `last_sync` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mc_sync_emails_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=99733 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_failed_jobs`
--

DROP TABLE IF EXISTS `mc_sync_failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_local_type_data`
--

DROP TABLE IF EXISTS `mc_sync_local_type_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_local_type_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mc_sync_local_type_data_mc_sync_emails_id_fk` (`email_id`),
  CONSTRAINT `mc_sync_local_type_data_mc_sync_emails_id_fk` FOREIGN KEY (`email_id`) REFERENCES `mc_sync_emails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1948 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_migrations`
--

DROP TABLE IF EXISTS `mc_sync_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_newsletter_histories`
--

DROP TABLE IF EXISTS `mc_sync_newsletter_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_newsletter_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mc_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT 0,
  `link` varchar(255) NOT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mc_sync_newsletter_histories_mc_id_unique` (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_newsletter_history_segment`
--

DROP TABLE IF EXISTS `mc_sync_newsletter_history_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_newsletter_history_segment` (
  `newsletter_history_id` int(10) unsigned NOT NULL,
  `segment_id` int(10) unsigned NOT NULL,
  KEY `mc_sync_newsletter_history_segment_segment_id_foreign` (`segment_id`),
  KEY `mc_sync_newsletter_his_seg_mc_sync_news_histories_id_fk` (`newsletter_history_id`),
  CONSTRAINT `mc_sync_newsletter_his_seg_mc_sync_news_histories_id_fk` FOREIGN KEY (`newsletter_history_id`) REFERENCES `mc_sync_newsletter_histories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mc_sync_newsletter_history_segment_mc_sync_segments_id_fk` FOREIGN KEY (`segment_id`) REFERENCES `mc_sync_segments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_newsletter_subscriptions`
--

DROP TABLE IF EXISTS `mc_sync_newsletter_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_newsletter_subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `newsletter_type_id` int(10) unsigned NOT NULL,
  `email_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mc_sync_nl_subs_email_id_newsletter_type_id_index` (`email_id`),
  KEY `mc_sync_newsletter_subscriptions_mc_sync_newsletter_types_id_fk` (`newsletter_type_id`),
  CONSTRAINT `mc_sync_newsletter_sub_mc_sync_emails_id_fk` FOREIGN KEY (`email_id`) REFERENCES `mc_sync_emails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mc_sync_newsletter_subscriptions_mc_sync_newsletter_types_id_fk` FOREIGN KEY (`newsletter_type_id`) REFERENCES `mc_sync_newsletter_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=176817 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_newsletter_types`
--

DROP TABLE IF EXISTS `mc_sync_newsletter_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_newsletter_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `interest_code` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `sort` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_segment_tag`
--

DROP TABLE IF EXISTS `mc_sync_segment_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_segment_tag` (
  `segment_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  KEY `mc_sync_segment_tag_tag_id_foreign` (`tag_id`),
  KEY `mc_sync_segment_tag_mc_sync_segments_id_fk` (`segment_id`),
  CONSTRAINT `mc_sync_segment_tag_mc_sync_segments_id_fk` FOREIGN KEY (`segment_id`) REFERENCES `mc_sync_segments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mc_sync_segment_tag_mc_sync_tags_id_fk` FOREIGN KEY (`tag_id`) REFERENCES `mc_sync_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_segments`
--

DROP TABLE IF EXISTS `mc_sync_segments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_segments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mc_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mc_sync_segments_mc_id_unique` (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_sync_tags`
--

DROP TABLE IF EXISTS `mc_sync_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_sync_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mc_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `longname` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mc_sync_tags_mc_id_unique` (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletter_blacklist_optout`
--

DROP TABLE IF EXISTS `newsletter_blacklist_optout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_blacklist_optout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `removed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newslettersettingstmp`
--

DROP TABLE IF EXISTS `newslettersettingstmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newslettersettingstmp` (
  `rid` int(13) NOT NULL AUTO_INCREMENT,
  `account_id` int(13) DEFAULT NULL,
  `status` char(20) DEFAULT NULL,
  `interests` char(250) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `newlsettersettingstmp_status_index` (`status`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2864 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `oauth_api_v1_user`
--

DROP TABLE IF EXISTS `oauth_api_v1_user`;
/*!50001 DROP VIEW IF EXISTS `oauth_api_v1_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `oauth_api_v1_user` AS SELECT 
 1 AS `id`,
 1 AS `customer_group_id`,
 1 AS `email`,
 1 AS `password`,
 1 AS `given_name`,
 1 AS `family_name`,
 1 AS `salutation`,
 1 AS `phone`,
 1 AS `api_token`,
 1 AS `address_line_1`,
 1 AS `address_line_2`,
 1 AS `zip_code`,
 1 AS `city`,
 1 AS `country`,
 1 AS `company`,
 1 AS `tax_number`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `is_active`,
 1 AS `is_verified`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orderdataprocessing`
--

DROP TABLE IF EXISTS `orderdataprocessing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdataprocessing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35836 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderdataprocessingfulfillment`
--

DROP TABLE IF EXISTS `orderdataprocessingfulfillment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdataprocessingfulfillment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderdataprocessingfulfillmenthistory`
--

DROP TABLE IF EXISTS `orderdataprocessingfulfillmenthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdataprocessingfulfillmenthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `accepted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1165 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
/*!50032 DROP TRIGGER IF EXISTS find_out_who_inserts */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 TRIGGER find_out_who_inserts AFTER INSERT ON orderdataprocessingfulfillmenthistory
    FOR EACH ROW BEGIN
    INSERT INTO orderdataprocessingfulfillmenthistorysqluser SET id = NEW.id, account_id = NEW.account_id, created_at = NEW.created_at, accepted_at = NEW.accepted_at, sql_user = USER();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orderdataprocessingfulfillmenthistorysqluser`
--

DROP TABLE IF EXISTS `orderdataprocessingfulfillmenthistorysqluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdataprocessingfulfillmenthistorysqluser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `sql_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1165 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderdataprocessinghistory`
--

DROP TABLE IF EXISTS `orderdataprocessinghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdataprocessinghistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `accepted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123172 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_absatzmarkt`
--

DROP TABLE IF EXISTS `portfolio_absatzmarkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_absatzmarkt` (
  `kAbsatzmarkt` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  `nSort` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`kAbsatzmarkt`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_angebot`
--

DROP TABLE IF EXISTS `portfolio_angebot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_angebot` (
  `kAngebot` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAbsatzmarkt` int(10) unsigned DEFAULT NULL,
  `kAdminLogin` int(10) unsigned DEFAULT NULL,
  `cAngebotsnummer` varchar(100) DEFAULT NULL,
  `cAngebotID` varchar(100) DEFAULT NULL,
  `cNameIntern` varchar(255) DEFAULT NULL,
  `cBeschreibungIntern` text DEFAULT NULL,
  `nAktiv` int(11) NOT NULL DEFAULT 0,
  `dAktualisiert` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kAngebot`),
  UNIQUE KEY `cAngebotID_unique` (`cAngebotID`),
  KEY `kAbsatzmarkt` (`kAbsatzmarkt`),
  KEY `kAbsatzmarkt_2` (`kAbsatzmarkt`),
  KEY `kAdminLogin` (`kAdminLogin`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_angeboti18n`
--

DROP TABLE IF EXISTS `portfolio_angeboti18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_angeboti18n` (
  `kAngebot` int(10) unsigned NOT NULL,
  `kSprache` int(10) unsigned NOT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  PRIMARY KEY (`kAngebot`,`kSprache`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_angebotleistung`
--

DROP TABLE IF EXISTS `portfolio_angebotleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_angebotleistung` (
  `kAngebot` int(10) unsigned NOT NULL,
  `kLeistung` int(10) unsigned NOT NULL,
  `nSort` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`kAngebot`,`kLeistung`),
  KEY `kLeistung` (`kLeistung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_angebotobjekt`
--

DROP TABLE IF EXISTS `portfolio_angebotobjekt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_angebotobjekt` (
  `kAngebotObjekt` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAngebot` int(10) unsigned NOT NULL,
  `kObjekt` int(10) unsigned NOT NULL,
  `kAdminLogin` int(10) unsigned NOT NULL,
  `cObjektID` varchar(255) DEFAULT NULL,
  `nSort` int(10) unsigned DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kAngebotObjekt`),
  UNIQUE KEY `UC_objectID` (`kAngebot`,`cObjektID`),
  KEY `kAngebot` (`kAngebot`),
  KEY `kObjekt` (`kObjekt`),
  KEY `cObjektID` (`cObjektID`)
) ENGINE=InnoDB AUTO_INCREMENT=1874 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_angebotobjektwert`
--

DROP TABLE IF EXISTS `portfolio_angebotobjektwert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_angebotobjektwert` (
  `kAngebotObjekt` int(10) unsigned NOT NULL,
  `kEigenschaft` int(10) unsigned NOT NULL,
  `kSprache` int(10) unsigned NOT NULL,
  `kAdminLogin` int(10) unsigned NOT NULL,
  `cWertVarchar` varchar(255) DEFAULT NULL,
  `nWertInt` int(11) DEFAULT NULL,
  `fWertDecimal` decimal(25,6) DEFAULT NULL,
  `dWertDatetime` datetime DEFAULT NULL,
  `cWertText` text DEFAULT NULL,
  `kWertlisteWert` int(11) DEFAULT NULL,
  PRIMARY KEY (`kAngebotObjekt`,`kEigenschaft`,`kSprache`),
  KEY `kEigenschaft` (`kEigenschaft`),
  KEY `kWertlisteWert` (`kWertlisteWert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_angebotplatzierung`
--

DROP TABLE IF EXISTS `portfolio_angebotplatzierung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_angebotplatzierung` (
  `kAngebot` int(10) unsigned NOT NULL,
  `kPlatzierung` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kAngebot`,`kPlatzierung`),
  KEY `kPlatzierung` (`kPlatzierung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_anwendung`
--

DROP TABLE IF EXISTS `portfolio_anwendung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_anwendung` (
  `kAnwendung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAnwendungParent` int(10) unsigned DEFAULT NULL,
  `kAdminLogin` int(10) unsigned DEFAULT NULL,
  `cNameIntern` varchar(255) DEFAULT NULL,
  `nSort` int(10) unsigned DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  PRIMARY KEY (`kAnwendung`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_anwendungi18n`
--

DROP TABLE IF EXISTS `portfolio_anwendungi18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_anwendungi18n` (
  `kAnwendung` int(10) unsigned NOT NULL,
  `kSprache` int(10) unsigned NOT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  PRIMARY KEY (`kAnwendung`,`kSprache`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_distributionstyp`
--

DROP TABLE IF EXISTS `portfolio_distributionstyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_distributionstyp` (
  `kDistributionstyp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAdminLogin` int(10) unsigned DEFAULT NULL,
  `cNameIntern` varchar(255) DEFAULT NULL,
  `nSort` int(10) unsigned DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  PRIMARY KEY (`kDistributionstyp`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_distributionstypi18n`
--

DROP TABLE IF EXISTS `portfolio_distributionstypi18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_distributionstypi18n` (
  `kDistributionstyp` int(10) unsigned NOT NULL,
  `kSprache` int(10) unsigned NOT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  PRIMARY KEY (`kDistributionstyp`,`kSprache`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_distributionstypplatzierung`
--

DROP TABLE IF EXISTS `portfolio_distributionstypplatzierung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_distributionstypplatzierung` (
  `kDistributionstyp` int(10) unsigned NOT NULL,
  `kPlatzierung` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kDistributionstyp`,`kPlatzierung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_eigenschaft`
--

DROP TABLE IF EXISTS `portfolio_eigenschaft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_eigenschaft` (
  `kEigenschaft` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kObjekt` int(10) unsigned NOT NULL,
  `kAdminLogin` int(10) unsigned NOT NULL,
  `kWertliste` int(10) unsigned DEFAULT NULL,
  `cFeldtyp` enum('Ganzzahl','Fließkommazahl','Kurztext','Langtext','Zeitpunkt','Bool','Wertliste') NOT NULL,
  `cNameIntern` varchar(255) NOT NULL,
  `cEigenschaftID` varchar(255) NOT NULL,
  `cBeschreibung` varchar(255) DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kEigenschaft`),
  KEY `kObjekt` (`kObjekt`),
  KEY `cEigenschaftID` (`cEigenschaftID`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_leistung`
--

DROP TABLE IF EXISTS `portfolio_leistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_leistung` (
  `kLeistung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kProduktfamilie` int(10) unsigned DEFAULT NULL,
  `kAnwendung` int(10) unsigned DEFAULT NULL,
  `kDistributionstyp` int(10) unsigned DEFAULT NULL,
  `kAdminLogin` int(10) unsigned DEFAULT NULL,
  `cLeistungsnummer` varchar(100) DEFAULT NULL,
  `cLeistungID` varchar(100) DEFAULT NULL,
  `cNameIntern` varchar(255) DEFAULT NULL,
  `cBeschreibungIntern` text DEFAULT NULL,
  `nAktiv` int(11) NOT NULL DEFAULT 0,
  `dAktualisiert` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kLeistung`),
  UNIQUE KEY `cLeistungID_unique` (`cLeistungID`),
  KEY `kProduktfamilie` (`kProduktfamilie`),
  KEY `kAnwendung` (`kAnwendung`),
  KEY `kDistributionstyp` (`kDistributionstyp`),
  KEY `kAdminLogin` (`kAdminLogin`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_leistungi18n`
--

DROP TABLE IF EXISTS `portfolio_leistungi18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_leistungi18n` (
  `kLeistung` int(10) unsigned NOT NULL,
  `kSprache` int(10) unsigned NOT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  PRIMARY KEY (`kLeistung`,`kSprache`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_leistungobjekt`
--

DROP TABLE IF EXISTS `portfolio_leistungobjekt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_leistungobjekt` (
  `kLeistungObjekt` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kLeistung` int(10) unsigned NOT NULL,
  `kObjekt` int(10) unsigned NOT NULL,
  `kAdminLogin` int(10) unsigned NOT NULL,
  `cObjektID` varchar(255) DEFAULT NULL,
  `nSort` int(10) unsigned DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kLeistungObjekt`),
  UNIQUE KEY `UC_objectID` (`kLeistung`,`cObjektID`),
  KEY `kLeistung` (`kLeistung`),
  KEY `kObjekt` (`kObjekt`),
  KEY `cObjektID` (`cObjektID`)
) ENGINE=InnoDB AUTO_INCREMENT=2190 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_leistungobjektwert`
--

DROP TABLE IF EXISTS `portfolio_leistungobjektwert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_leistungobjektwert` (
  `kLeistungObjekt` int(10) unsigned NOT NULL,
  `kEigenschaft` int(10) unsigned NOT NULL,
  `kSprache` int(10) unsigned NOT NULL,
  `kAdminLogin` int(10) unsigned NOT NULL,
  `cWertVarchar` varchar(255) DEFAULT NULL,
  `nWertInt` int(11) DEFAULT NULL,
  `fWertDecimal` decimal(25,6) DEFAULT NULL,
  `dWertDatetime` datetime DEFAULT NULL,
  `cWertText` text DEFAULT NULL,
  `kWertlisteWert` int(11) DEFAULT NULL,
  PRIMARY KEY (`kLeistungObjekt`,`kEigenschaft`,`kSprache`),
  KEY `kEigenschaft` (`kEigenschaft`),
  KEY `kWertlisteWert` (`kWertlisteWert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_objekt`
--

DROP TABLE IF EXISTS `portfolio_objekt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_objekt` (
  `kObjekt` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAdminLogin` int(10) unsigned NOT NULL,
  `cNameIntern` varchar(255) NOT NULL,
  `cBeschreibung` varchar(255) DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kObjekt`),
  KEY `kObjekt` (`kObjekt`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_platzierung`
--

DROP TABLE IF EXISTS `portfolio_platzierung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_platzierung` (
  `kPlatzierung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAdminLogin` int(10) unsigned DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `nSort` int(10) unsigned DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  PRIMARY KEY (`kPlatzierung`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_produktfamilie`
--

DROP TABLE IF EXISTS `portfolio_produktfamilie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_produktfamilie` (
  `kProduktfamilie` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAdminLogin` int(10) unsigned DEFAULT NULL,
  `cNameIntern` varchar(255) DEFAULT NULL,
  `nSort` int(10) unsigned DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  PRIMARY KEY (`kProduktfamilie`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_produktfamiliei18n`
--

DROP TABLE IF EXISTS `portfolio_produktfamiliei18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_produktfamiliei18n` (
  `kProduktfamilie` int(10) unsigned NOT NULL,
  `kSprache` int(10) unsigned NOT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  PRIMARY KEY (`kProduktfamilie`,`kSprache`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_sprache`
--

DROP TABLE IF EXISTS `portfolio_sprache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_sprache` (
  `kSprache` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cNameDE` varchar(100) DEFAULT NULL,
  `cNameEN` varchar(100) DEFAULT NULL,
  `cLanguageTag` varchar(10) DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned DEFAULT NULL,
  `nStandard` tinyint(3) unsigned DEFAULT NULL,
  `nSort` int(11) DEFAULT NULL,
  PRIMARY KEY (`kSprache`),
  KEY `cLanguageTag` (`cLanguageTag`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_wertliste`
--

DROP TABLE IF EXISTS `portfolio_wertliste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_wertliste` (
  `kWertliste` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAdminLogin` int(10) unsigned NOT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cBeschreibung` varchar(255) DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kWertliste`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_wertlistewert`
--

DROP TABLE IF EXISTS `portfolio_wertlistewert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_wertlistewert` (
  `kWertlisteWert` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kWertliste` int(10) unsigned DEFAULT NULL,
  `kAdminLogin` int(10) unsigned NOT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kWertlisteWert`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio_wertlistewerti18n`
--

DROP TABLE IF EXISTS `portfolio_wertlistewerti18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_wertlistewerti18n` (
  `kWertlisteWert` int(10) unsigned NOT NULL,
  `kSprache` int(10) unsigned NOT NULL,
  `cWert` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kWertlisteWert`,`kSprache`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_payment_docs`
--

DROP TABLE IF EXISTS `pos_payment_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_payment_docs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_id` int(10) NOT NULL,
  `path` varchar(192) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_payment_orders`
--

DROP TABLE IF EXISTS `pos_payment_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_payment_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_payment_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `price` double(16,4) NOT NULL,
  `booked_at` date DEFAULT NULL,
  `is_jtl` tinyint(4) NOT NULL DEFAULT 0,
  `terminated_by` varchar(50) NOT NULL DEFAULT '',
  `terminated_on` date DEFAULT NULL,
  `terminated_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pos_payment_id_idx` (`pos_payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2308 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_payment_providers`
--

DROP TABLE IF EXISTS `pos_payment_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_payment_providers` (
  `id` varchar(192) NOT NULL,
  `name` varchar(192) NOT NULL,
  `cost` decimal(16,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_payments`
--

DROP TABLE IF EXISTS `pos_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_payments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `device_id` int(11) NOT NULL,
  `payment_provider_id` varchar(192) NOT NULL,
  `confirmed_by` varchar(192) NOT NULL,
  `state` enum('pending','approved','denied') NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pos_payments_device_id` (`device_id`),
  KEY `pos_payments_payment_provider_id` (`payment_provider_id`),
  CONSTRAINT `pos_payments_device_id` FOREIGN KEY (`device_id`) REFERENCES `tdevice` (`kDevice`) ON DELETE NO ACTION,
  CONSTRAINT `pos_payments_payment_provider_id` FOREIGN KEY (`payment_provider_id`) REFERENCES `pos_payment_providers` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2318 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programm_bereiche`
--

DROP TABLE IF EXISTS `programm_bereiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programm_bereiche` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `programm_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bereich_programm` (`programm_id`),
  CONSTRAINT `bereich_programm` FOREIGN KEY (`programm_id`) REFERENCES `programme` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programm_status`
--

DROP TABLE IF EXISTS `programm_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programm_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programm_taccount`
--

DROP TABLE IF EXISTS `programm_taccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programm_taccount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `programm_id` int(11) unsigned NOT NULL,
  `programm_status_id` int(11) unsigned DEFAULT NULL,
  `taccount_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `taccount_programm` (`taccount_id`,`programm_id`),
  KEY `programm` (`programm_id`),
  KEY `status` (`programm_status_id`),
  CONSTRAINT `programm` FOREIGN KEY (`programm_id`) REFERENCES `programme` (`id`) ON DELETE CASCADE,
  CONSTRAINT `status` FOREIGN KEY (`programm_status_id`) REFERENCES `programm_status` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27221 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS programm_taccount_history_INSERT */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 trigger programm_taccount_history_INSERT
    after insert
    on programm_taccount
    for each row
    INSERT INTO programm_taccount_history (id, programm_id, programm_status_id, taccount_id, created_at, change_operation, change_at)
    VALUES (NEW.id, NEW.programm_id, NEW.programm_status_id, NEW.taccount_id, NEW.created_at, 'INSERT', NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS programm_taccount_history_UPDATE */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 trigger programm_taccount_history_UPDATE
    after update
    on programm_taccount
    for each row
    INSERT INTO programm_taccount_history (id, programm_id, programm_status_id, taccount_id, created_at, change_operation, change_at)
    VALUES (NEW.id, NEW.programm_id, NEW.programm_status_id, NEW.taccount_id, NEW.created_at, 'UPDATE', NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS programm_taccount_history_DELETE */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 trigger programm_taccount_history_DELETE
    after delete
    on programm_taccount
    for each row
    INSERT INTO programm_taccount_history (id, programm_id, programm_status_id, taccount_id, created_at, change_operation, change_at)
    VALUES (OLD.id, OLD.programm_id, OLD.programm_status_id, OLD.taccount_id, OLD.created_at, 'DELETE', NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `programm_taccount_bereich`
--

DROP TABLE IF EXISTS `programm_taccount_bereich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programm_taccount_bereich` (
  `programm_taccount_id` int(10) unsigned NOT NULL,
  `bereich_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`programm_taccount_id`,`bereich_id`),
  KEY `programm_taccount_bereich__fk` (`bereich_id`),
  CONSTRAINT `programm_taccount_bereich__fk` FOREIGN KEY (`bereich_id`) REFERENCES `programm_bereiche` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `programm_taccount_bereich_fk` FOREIGN KEY (`programm_taccount_id`) REFERENCES `programm_taccount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS programm_taccount_bereich_history_INSERT */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 trigger programm_taccount_bereich_history_INSERT
    after insert
    on programm_taccount_bereich
    for each row
    INSERT INTO programm_taccount_bereich_history (programm_taccount_id, bereich_id, created_at, change_operation, change_at) VALUES (NEW.programm_taccount_id, NEW.bereich_id, NEW.created_at, 'INSERT', NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS programm_taccount_bereich_history_UPDATE */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 trigger programm_taccount_bereich_history_UPDATE
    after update
    on programm_taccount_bereich
    for each row
    INSERT INTO programm_taccount_bereich_history (programm_taccount_id, bereich_id, created_at, change_operation, change_at)
    VALUES (NEW.programm_taccount_id, NEW.bereich_id, NEW.created_at, 'UPDATE', NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS programm_taccount_bereich_history_DELETE */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 trigger programm_taccount_bereich_history_DELETE
    after delete
    on programm_taccount_bereich
    for each row
    INSERT INTO programm_taccount_bereich_history (programm_taccount_id, bereich_id, created_at, change_operation, change_at)
    VALUES (OLD.programm_taccount_id, OLD.bereich_id, OLD.created_at, 'DELETE', NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `programm_taccount_bereich_history`
--

DROP TABLE IF EXISTS `programm_taccount_bereich_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programm_taccount_bereich_history` (
  `programm_taccount_id` int(10) unsigned DEFAULT NULL,
  `bereich_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `change_operation` varchar(20) DEFAULT NULL,
  `change_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programm_taccount_history`
--

DROP TABLE IF EXISTS `programm_taccount_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programm_taccount_history` (
  `id` int(10) unsigned DEFAULT NULL,
  `programm_id` int(10) unsigned DEFAULT NULL,
  `programm_status_id` int(10) unsigned DEFAULT NULL,
  `taccount_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `change_operation` varchar(20) DEFAULT NULL,
  `change_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programme`
--

DROP TABLE IF EXISTS `programme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programme` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue_history`
--

DROP TABLE IF EXISTS `queue_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `consumer` varchar(255) NOT NULL,
  `message_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL COMMENT 'new, working, error, failed, done',
  `errors` int(11) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `queue_history_message_id_index` (`message_id`),
  KEY `queue_history_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rechnungsdokumentfreigabe`
--

DROP TABLE IF EXISTS `rechnungsdokumentfreigabe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rechnungsdokumentfreigabe` (
  `kRechnungsdokumentfreigabe` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eDokument` enum('rechnung','gutschrift','provisionsrechnung','provisionsgutschrift') NOT NULL,
  `dFreigabe` datetime NOT NULL DEFAULT current_timestamp(),
  `cBearbeiter` varchar(255) NOT NULL,
  PRIMARY KEY (`kRechnungsdokumentfreigabe`),
  KEY `rechnungsdokumentfreigabe_edokument_dfreigabe_index` (`eDokument`,`dFreigabe`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reseller_interface_domain_price_history`
--

DROP TABLE IF EXISTS `reseller_interface_domain_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller_interface_domain_price_history` (
  `reseller_interface_domain_id` int(11) unsigned NOT NULL,
  `product_type` varchar(15) NOT NULL,
  `runtime` int(11) NOT NULL,
  `runtime_price` decimal(30,2) NOT NULL,
  `onetime_price` decimal(30,2) NOT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reseller_interface_domain_prices`
--

DROP TABLE IF EXISTS `reseller_interface_domain_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller_interface_domain_prices` (
  `reseller_interface_domain_id` int(11) unsigned NOT NULL,
  `product_type` varchar(15) NOT NULL,
  `runtime` int(11) NOT NULL,
  `runtime_price` decimal(30,2) NOT NULL,
  `onetime_price` decimal(30,2) NOT NULL,
  UNIQUE KEY `domain_id_product_type_runtime_unique` (`reseller_interface_domain_id`,`product_type`,`runtime`),
  KEY `product_type_idx` (`product_type`),
  KEY `runtime_idx` (`runtime`),
  KEY `reseller_interface_domain_id_idx` (`reseller_interface_domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reseller_interface_domains`
--

DROP TABLE IF EXISTS `reseller_interface_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller_interface_domains` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tld` varchar(15) NOT NULL,
  `cancellation_period` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tld_unique` (`tld`),
  KEY `tld_idx` (`tld`)
) ENGINE=InnoDB AUTO_INCREMENT=1440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `returndebitnote`
--

DROP TABLE IF EXISTS `returndebitnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returndebitnote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `paid` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_id` (`invoice_id`),
  KEY `paid` (`paid`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9359 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `returndebitnotes_mail`
--

DROP TABLE IF EXISTS `returndebitnotes_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returndebitnotes_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `returndebitnote_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `returndebitnote_id` (`returndebitnote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicepartner_rating_public_type_translations`
--

DROP TABLE IF EXISTS `servicepartner_rating_public_type_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicepartner_rating_public_type_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `public_type_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locale_id` (`locale_id`),
  KEY `sp_rating_public_type_translations_public_type_id_foreign` (`public_type_id`),
  CONSTRAINT `servicepartner_rating_public_type_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sp_rating_public_type_translations_public_type_id_foreign` FOREIGN KEY (`public_type_id`) REFERENCES `servicepartner_rating_public_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicepartner_rating_public_types`
--

DROP TABLE IF EXISTS `servicepartner_rating_public_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicepartner_rating_public_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicepartner_ratings`
--

DROP TABLE IF EXISTS `servicepartner_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicepartner_ratings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `servicepartner_id` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned NOT NULL DEFAULT 0,
  `locale_id` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_conflict` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `public_type_id` int(10) unsigned NOT NULL,
  `collaboration_started_at` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `servicepartner_id` (`servicepartner_id`),
  KEY `account_id` (`account_id`),
  KEY `is_active` (`is_active`),
  KEY `rating` (`rating`),
  KEY `locale_id` (`locale_id`),
  KEY `public_type_id` (`public_type_id`),
  KEY `is_conflict` (`is_conflict`),
  CONSTRAINT `servicepartner_ratings_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `servicepartner_ratings_public_type_id_foreign` FOREIGN KEY (`public_type_id`) REFERENCES `servicepartner_rating_public_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_connector_category_linkings`
--

DROP TABLE IF EXISTS `store_connector_category_linkings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_connector_category_linkings` (
  `endpoint_id` int(10) unsigned NOT NULL,
  `host_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`endpoint_id`),
  KEY `store_connector_category_linkings_host_id_index` (`host_id`),
  CONSTRAINT `store_connector_category_linkings_endpoint_id_foreign` FOREIGN KEY (`endpoint_id`) REFERENCES `extension_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_connector_image_linkings`
--

DROP TABLE IF EXISTS `store_connector_image_linkings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_connector_image_linkings` (
  `endpoint_id` int(10) unsigned NOT NULL,
  `host_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`endpoint_id`),
  KEY `store_connector_image_linkings_host_id_index` (`host_id`),
  CONSTRAINT `store_connector_image_linkings_endpoint_id_foreign` FOREIGN KEY (`endpoint_id`) REFERENCES `extension_images` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_connector_manufacturer_linkings`
--

DROP TABLE IF EXISTS `store_connector_manufacturer_linkings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_connector_manufacturer_linkings` (
  `endpoint_id` int(10) unsigned NOT NULL,
  `host_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`endpoint_id`),
  KEY `store_connector_manufacturer_linkings_host_id_index` (`host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_connector_migrations`
--

DROP TABLE IF EXISTS `store_connector_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_connector_migrations` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_connector_product_linkings`
--

DROP TABLE IF EXISTS `store_connector_product_linkings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_connector_product_linkings` (
  `endpoint_id` int(10) unsigned NOT NULL,
  `host_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`endpoint_id`),
  KEY `store_connector_product_linkings_host_id_index` (`host_id`),
  CONSTRAINT `store_connector_product_linkings_endpoint_id_foreign` FOREIGN KEY (`endpoint_id`) REFERENCES `extensions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_connector_specific_linkings`
--

DROP TABLE IF EXISTS `store_connector_specific_linkings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_connector_specific_linkings` (
  `endpoint_id` int(10) unsigned NOT NULL,
  `host_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`endpoint_id`),
  KEY `store_connector_specific_linkings_host_id_index` (`host_id`),
  CONSTRAINT `store_connector_specific_linkings_endpoint_id_foreign` FOREIGN KEY (`endpoint_id`) REFERENCES `extension_specifics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_connector_specific_value_linkings`
--

DROP TABLE IF EXISTS `store_connector_specific_value_linkings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_connector_specific_value_linkings` (
  `endpoint_id` int(10) unsigned NOT NULL,
  `host_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`endpoint_id`),
  KEY `store_connector_specific_value_linkings_host_id_index` (`host_id`),
  CONSTRAINT `store_connector_specific_value_linkings_endpoint_id_foreign` FOREIGN KEY (`endpoint_id`) REFERENCES `extension_specific_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `support_discounts`
--

DROP TABLE IF EXISTS `support_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `support_id` int(10) unsigned NOT NULL,
  `discount` double(4,2) NOT NULL,
  `created_at` date NOT NULL,
  `valid_until_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `support_id` (`support_id`),
  CONSTRAINT `support_discounts_support_id` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `support_translations`
--

DROP TABLE IF EXISTS `support_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `support_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `support_id` (`support_id`,`locale_id`),
  KEY `supporty_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `support_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_translations_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hours_reaction_time` int(11) NOT NULL DEFAULT 0,
  `price` decimal(15,4) DEFAULT 0.0000,
  `has_phone_support` tinyint(4) NOT NULL DEFAULT 0,
  `has_callback_service` tinyint(4) NOT NULL DEFAULT 0,
  `has_mail_service` tinyint(4) NOT NULL DEFAULT 0,
  `is_bookable` tinyint(4) unsigned DEFAULT 0,
  `is_visible` tinyint(4) unsigned DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3rdpartybuchung`
--

DROP TABLE IF EXISTS `t3rdpartybuchung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t3rdpartybuchung` (
  `k3rdPartyBuchung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `c3rdParty` varchar(50) DEFAULT NULL,
  `cLeistung` varchar(255) DEFAULT NULL,
  `cLeistungAddOnJSON` text DEFAULT NULL,
  `cBuchungResultJSON` text DEFAULT NULL,
  `cOrderId` varchar(50) DEFAULT NULL,
  `nServiceId` int(10) unsigned DEFAULT NULL,
  `dLastCommission` date DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`k3rdPartyBuchung`)
) ENGINE=InnoDB AUTO_INCREMENT=2988 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3rdpartycall`
--

DROP TABLE IF EXISTS `t3rdpartycall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t3rdpartycall` (
  `k3rdPartyCall` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `c3rdParty` varchar(50) DEFAULT NULL,
  `cTrigger` varchar(255) DEFAULT NULL,
  `cCall` varchar(50) DEFAULT NULL,
  `cStatusConnection` varchar(20) DEFAULT NULL,
  `cStatus` varchar(20) DEFAULT NULL,
  `cRequest` text DEFAULT NULL,
  `cResponse` text DEFAULT NULL,
  `cResult` text DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`k3rdPartyCall`),
  KEY `t3rdpartycall_dErstellt_index` (`dErstellt`)
) ENGINE=InnoDB AUTO_INCREMENT=85364 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t3rdpartyprovision`
--

DROP TABLE IF EXISTS `t3rdpartyprovision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t3rdpartyprovision` (
  `kAccount` int(10) unsigned DEFAULT NULL,
  `kServicepartner` int(10) unsigned DEFAULT 0,
  `dProvisionsfaelligkeit` date DEFAULT NULL,
  `fBetrag` decimal(10,2) DEFAULT NULL,
  `cAuszahlungsmonat` varchar(30) DEFAULT NULL,
  KEY `t3rdpartyprovision_kAccount_dProvisionsfaelligkeit_index` (`kAccount`,`dProvisionsfaelligkeit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tEAtarife`
--

DROP TABLE IF EXISTS `tEAtarife`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tEAtarife` (
  `kEAtarif` int(11) NOT NULL AUTO_INCREMENT,
  `cTarifname` varchar(250) DEFAULT NULL,
  `nBuchbar` int(11) DEFAULT NULL,
  `nBuchbarAdmin` tinyint(3) unsigned DEFAULT 0,
  `nWirdAbgerechnet` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `nAmazon` int(11) NOT NULL,
  `nSort` int(11) NOT NULL,
  `fKostenMonat` float(10,2) DEFAULT NULL,
  `fKostenTransaktion` float(10,2) NOT NULL,
  `nTransaktionenInkl` int(11) NOT NULL DEFAULT 0,
  `nKontenInkl` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fKostenKonto` decimal(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`kEAtarif`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabrechnungprodukt`
--

DROP TABLE IF EXISTS `tabrechnungprodukt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabrechnungprodukt` (
  `kAbrechnungProdukt` tinyint(3) unsigned NOT NULL,
  `cName` varchar(100) DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned DEFAULT 1,
  PRIMARY KEY (`kAbrechnungProdukt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabrechnungtransaktionen`
--

DROP TABLE IF EXISTS `tabrechnungtransaktionen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabrechnungtransaktionen` (
  `kAbrechnungTransaktionen` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAbrechnungProdukt` tinyint(3) unsigned DEFAULT NULL,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `kKey` int(10) unsigned NOT NULL DEFAULT 0,
  `cAbrechnungsmonat` varchar(10) DEFAULT NULL,
  `nTransaktionen` int(10) unsigned DEFAULT NULL,
  `nTransaktionen2` int(10) unsigned DEFAULT NULL,
  `dAbrufZeitpunkt` datetime DEFAULT NULL,
  PRIMARY KEY (`kAbrechnungTransaktionen`),
  UNIQUE KEY `tabrechnungtransaktionen_unique_uindex` (`kAbrechnungProdukt`,`kAccount`,`cAbrechnungsmonat`,`kKey`),
  KEY `tabrechnungtransaktionen_kAccount_cAbrechnungsmonat_index` (`kAccount`,`cAbrechnungsmonat`),
  KEY `tabrechnungtransaktionen_kKey_index` (`kKey`),
  KEY `tabrechnungtransaktionen_jobcheck_index` (`kAbrechnungProdukt`,`cAbrechnungsmonat`,`dAbrufZeitpunkt`)
) ENGINE=InnoDB AUTO_INCREMENT=910256 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabrechnungtransaktionenmeta`
--

DROP TABLE IF EXISTS `tabrechnungtransaktionenmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabrechnungtransaktionenmeta` (
  `kAbrechnungTransaktionenMeta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAbrechnungTransaktionen` int(10) unsigned DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kAbrechnungTransaktionenMeta`),
  KEY `tabrechnungtransaktionenmeta_kAbrechnungTransaktionen_index` (`kAbrechnungTransaktionen`)
) ENGINE=InnoDB AUTO_INCREMENT=589731 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabrechnungtransaktionenstats`
--

DROP TABLE IF EXISTS `tabrechnungtransaktionenstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabrechnungtransaktionenstats` (
  `kAbrechnungProdukt` tinyint(3) unsigned DEFAULT NULL,
  `cAbrechnungsmonat` varchar(10) DEFAULT NULL,
  `nKunden` int(10) unsigned DEFAULT NULL,
  `nKundenAktiv` int(11) NOT NULL DEFAULT 0,
  `nTransaktionen` int(10) unsigned DEFAULT NULL,
  `fDauerMin` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabrechnungvouchersabgerechnet`
--

DROP TABLE IF EXISTS `tabrechnungvouchersabgerechnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabrechnungvouchersabgerechnet` (
  `voucher_id` varchar(25) NOT NULL,
  `dZeitpunkt` datetime DEFAULT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabrechnungvouchersevents`
--

DROP TABLE IF EXISTS `tabrechnungvouchersevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabrechnungvouchersevents` (
  `kAbrechnungVouchersEvents` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `voucher_id` varchar(25) DEFAULT NULL,
  `cGutscheinnummer` varchar(100) DEFAULT NULL,
  `cEvent` enum('Activation','Recharge','Deactivation','Delete') DEFAULT NULL,
  `fWert` decimal(12,2) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kAbrechnungVouchersEvents`),
  KEY `tabrechnungvouchersevents_kAccount_dErstellt_index` (`kAccount`,`dErstellt`),
  KEY `tabrechnungvouchersevents_voucher_id_cEvent_index` (`voucher_id`,`cEvent`)
) ENGINE=InnoDB AUTO_INCREMENT=100592 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccount`
--

DROP TABLE IF EXISTS `taccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccount` (
  `kAccount` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kKundengruppe` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `kEbayKundenAccount` int(10) unsigned NOT NULL DEFAULT 0,
  `kPreisUser` int(11) unsigned NOT NULL DEFAULT 0,
  `kServicepartner` int(11) NOT NULL,
  `kTechnologiepartner` int(10) NOT NULL DEFAULT 0,
  `kBetreuer` int(11) NOT NULL,
  `cMail` varchar(255) DEFAULT NULL,
  `cMailRechnung` varchar(255) NOT NULL,
  `cBenutzername` varchar(250) NOT NULL,
  `cPasswort` varchar(255) DEFAULT NULL,
  `cKundennummer` varchar(255) DEFAULT NULL,
  `nDebitorennummer` int(11) NOT NULL,
  `cAnrede` enum('Herr','Frau','Firma') DEFAULT 'Herr',
  `cVorname` varchar(255) DEFAULT NULL,
  `cNachname` varchar(255) DEFAULT NULL,
  `cFirma` varchar(255) DEFAULT NULL,
  `cFirmenzusatz` varchar(255) NOT NULL,
  `cPLZ` varchar(255) DEFAULT NULL,
  `cOrt` varchar(255) DEFAULT NULL,
  `cAdresszusatz` varchar(255) NOT NULL,
  `cLand` varchar(255) DEFAULT NULL,
  `cTel` varchar(255) DEFAULT NULL,
  `cFax` varchar(255) DEFAULT NULL,
  `cStrasse` varchar(255) DEFAULT NULL,
  `cUSTID` varchar(255) DEFAULT NULL,
  `cBankinstitut` varchar(255) DEFAULT NULL,
  `cBankname` varchar(255) DEFAULT NULL,
  `nKontoNr` bigint(20) unsigned DEFAULT NULL,
  `nBLZ` bigint(20) unsigned DEFAULT NULL,
  `cKontoinhaber` varchar(255) NOT NULL,
  `cIBAN` varchar(255) NOT NULL,
  `cBIC` varchar(255) NOT NULL,
  `cSepaRef` varchar(255) NOT NULL,
  `dSepaRef` date DEFAULT NULL,
  `cSteuernummer` varchar(255) NOT NULL,
  `cUnternehmensprofil` varchar(255) NOT NULL DEFAULT '',
  `cRechtsform` varchar(255) NOT NULL DEFAULT '',
  `nSepaLastschrift` tinyint(4) NOT NULL DEFAULT 0,
  `nSepaChg` tinyint(4) NOT NULL DEFAULT 0,
  `nSepaFirmenMandat` tinyint(4) NOT NULL DEFAULT 0,
  `fGuthaben` float(10,2) NOT NULL,
  `cWawiVersion` varchar(255) NOT NULL,
  `cMsSQLVersion` varchar(255) NOT NULL,
  `cKommentar` longtext NOT NULL,
  `cEAInfo` text NOT NULL,
  `cEAKommentar` text NOT NULL,
  `cEATarif` varchar(250) NOT NULL,
  `cEATarifAlt` varchar(250) NOT NULL,
  `cEaStatus` varchar(250) NOT NULL,
  `cEaKuendigungGrund` longtext NOT NULL,
  `cEaKuendigungDurch` varchar(255) NOT NULL,
  `bEaCustomerCall` tinyint(4) NOT NULL,
  `cJTLToken` varchar(100) NOT NULL,
  `nAktiv` tinyint(3) unsigned DEFAULT 1,
  `nLastschrift` int(11) NOT NULL DEFAULT 0,
  `nKeineRechnung` tinyint(4) NOT NULL DEFAULT 0,
  `nKeineMahnung` tinyint(4) NOT NULL DEFAULT 0,
  `nKeineKuendigung` tinyint(4) NOT NULL DEFAULT 0,
  `nWichtig` int(11) NOT NULL,
  `nBeobachtung` int(11) NOT NULL DEFAULT 0,
  `nMigrationStop` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Benutzer wünscht keine Migration von Lizenzen in den EXS',
  `cHerkunft` varchar(255) DEFAULT NULL,
  `dErstelldatum` datetime DEFAULT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  `dEaStartdatum` datetime DEFAULT NULL,
  `dEaTestEndDatum` datetime DEFAULT NULL,
  `cAenderungDurch` varchar(255) NOT NULL,
  `nDatenGeprueft` tinyint(4) NOT NULL,
  `dLetzterLogin` datetime DEFAULT NULL,
  `bInitialNewsletter` tinyint(4) NOT NULL DEFAULT 0,
  `bBitrixSyncActive` tinyint(4) DEFAULT 1,
  `nBitrixSyncType` int(11) DEFAULT 1,
  `eInternalRole` varchar(5) DEFAULT NULL,
  `bSoftBan` tinyint(4) DEFAULT 0,
  `cEcomDataClientId` varchar(50) DEFAULT NULL,
  `cPublicId` varchar(36) NOT NULL,
  PRIMARY KEY (`kAccount`),
  UNIQUE KEY `cPublicId_unique` (`cPublicId`),
  UNIQUE KEY `cMail` (`cMail`),
  KEY `kEbayKundenAccount` (`kEbayKundenAccount`),
  KEY `cJTLToken` (`cJTLToken`),
  KEY `cFirma` (`cFirma`),
  KEY `cVorname` (`cVorname`),
  KEY `cNachname` (`cNachname`),
  KEY `kServicepartner` (`kServicepartner`),
  KEY `kKundengruppe` (`kKundengruppe`),
  KEY `taccount_cmail_index` (`cMail`)
) ENGINE=MyISAM AUTO_INCREMENT=89874 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
/*!50032 DROP TRIGGER IF EXISTS accountpruefung */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 TRIGGER `accountpruefung` AFTER INSERT ON `taccount` FOR EACH ROW BEGIN
INSERT INTO taccountpruefung(`kAccount`) VALUES (NEW.`kAccount`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `taccount_kommentare`
--

DROP TABLE IF EXISTS `taccount_kommentare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccount_kommentare` (
  `kKommentar` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kAdminLogin` int(11) NOT NULL,
  `cKommentar` longtext NOT NULL,
  `dErstellt` date NOT NULL,
  `nWichtig` tinyint(4) NOT NULL DEFAULT 0,
  `nBanner` tinyint(4) NOT NULL DEFAULT 0,
  `dUpdated` date DEFAULT NULL,
  PRIMARY KEY (`kKommentar`)
) ENGINE=MyISAM AUTO_INCREMENT=36324 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccount_support`
--

DROP TABLE IF EXISTS `taccount_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccount_support` (
  `kAccount` int(11) NOT NULL,
  `cWaWiVersion` varchar(255) NOT NULL,
  `cMsSQLServerVersion` varchar(255) NOT NULL,
  `cBetriebssystem` varchar(255) NOT NULL,
  `cBetriebsart` varchar(255) NOT NULL,
  `cAmeiseVersion` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountabrechnung`
--

DROP TABLE IF EXISTS `taccountabrechnung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountabrechnung` (
  `kAccount` int(10) unsigned NOT NULL,
  `cDUOAHNr` varchar(30) DEFAULT NULL,
  `cRechnungZahlungstext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountdatei`
--

DROP TABLE IF EXISTS `taccountdatei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountdatei` (
  `kDatei` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) DEFAULT NULL,
  `kAdminlogin` int(11) DEFAULT NULL,
  `cDateiname` varchar(255) DEFAULT NULL,
  `cDateityp` varchar(5) DEFAULT NULL,
  `cBeschreibung` varchar(255) DEFAULT NULL,
  `nStatus` tinyint(3) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kDatei`),
  KEY `kAccount` (`kAccount`),
  KEY `kAdminlogin` (`kAdminlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=50634 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccounthierachie`
--

DROP TABLE IF EXISTS `taccounthierachie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccounthierachie` (
  `kAccounthierachie` tinyint(3) unsigned DEFAULT NULL,
  `cName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccounthistory`
--

DROP TABLE IF EXISTS `taccounthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccounthistory` (
  `kAccountHistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAdminlogin` int(11) DEFAULT NULL,
  `kAccount` int(10) unsigned NOT NULL,
  `kKundengruppe` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `kEbayKundenAccount` int(10) unsigned NOT NULL,
  `kPreisUser` int(11) NOT NULL DEFAULT 0,
  `kServicepartner` int(11) NOT NULL,
  `kTechnologiepartner` int(10) NOT NULL DEFAULT 0,
  `kBetreuer` int(11) NOT NULL,
  `cMail` varchar(255) DEFAULT NULL,
  `cMailRechnung` varchar(255) NOT NULL,
  `cBenutzername` varchar(250) NOT NULL,
  `cPasswort` varchar(255) DEFAULT NULL,
  `cKundennummer` varchar(255) DEFAULT NULL,
  `nDebitorennummer` int(11) DEFAULT NULL,
  `cAnrede` enum('Herr','Frau') NOT NULL DEFAULT 'Herr',
  `cVorname` varchar(255) DEFAULT NULL,
  `cNachname` varchar(255) DEFAULT NULL,
  `cFirma` varchar(255) DEFAULT NULL,
  `cFirmenzusatz` varchar(255) NOT NULL,
  `cStrasse` varchar(255) DEFAULT NULL,
  `cPLZ` varchar(255) DEFAULT NULL,
  `cOrt` varchar(255) DEFAULT NULL,
  `cAdresszusatz` varchar(255) NOT NULL,
  `cLand` varchar(255) DEFAULT NULL,
  `cTel` varchar(255) DEFAULT NULL,
  `cFax` varchar(255) DEFAULT NULL,
  `cUSTID` varchar(255) DEFAULT NULL,
  `cBankinstitut` varchar(255) DEFAULT NULL,
  `cBankname` varchar(255) DEFAULT NULL,
  `nKontoNr` bigint(20) unsigned DEFAULT NULL,
  `nBLZ` bigint(20) unsigned DEFAULT NULL,
  `cKontoinhaber` varchar(255) NOT NULL,
  `cIBAN` varchar(255) NOT NULL,
  `cBIC` varchar(255) NOT NULL,
  `cSepaRef` varchar(255) NOT NULL,
  `dSepaRef` date DEFAULT NULL,
  `cSteuernummer` varchar(255) NOT NULL,
  `cUnternehmensprofil` varchar(255) NOT NULL DEFAULT '',
  `cRechtsform` varchar(255) NOT NULL DEFAULT '',
  `nSepaLastschrift` tinyint(4) NOT NULL DEFAULT 0,
  `nSepaChg` tinyint(4) NOT NULL DEFAULT 0,
  `nSepaFirmenMandat` tinyint(4) NOT NULL DEFAULT 0,
  `fGuthaben` float(10,2) NOT NULL,
  `cWawiVersion` varchar(255) NOT NULL,
  `cMsSQLVersion` varchar(255) NOT NULL,
  `cKommentar` text NOT NULL,
  `cEAInfo` text NOT NULL,
  `cEAKommentar` text NOT NULL,
  `cEATarif` varchar(250) NOT NULL,
  `cEATarifAlt` varchar(250) NOT NULL,
  `cEaStatus` varchar(250) NOT NULL,
  `cEaKuendigungGrund` longtext NOT NULL,
  `cEaKuendigungDurch` varchar(255) NOT NULL,
  `bEaCustomerCall` tinyint(4) NOT NULL,
  `cJTLToken` varchar(100) NOT NULL,
  `nAktiv` tinyint(3) unsigned DEFAULT 1,
  `nLastschrift` int(11) NOT NULL DEFAULT 0,
  `nKeineRechnung` tinyint(4) NOT NULL DEFAULT 0,
  `nKeineMahnung` tinyint(4) NOT NULL DEFAULT 0,
  `nKeineKuendigung` tinyint(4) NOT NULL DEFAULT 0,
  `nWichtig` int(11) NOT NULL,
  `nBeobachtung` int(11) NOT NULL DEFAULT 0,
  `nMigrationStop` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Benutzer wünscht keine Migration von Lizenzen in den EXS',
  `cHerkunft` varchar(255) DEFAULT NULL,
  `dErstelldatum` datetime DEFAULT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  `dEaStartdatum` datetime DEFAULT NULL,
  `dEaTestEndDatum` datetime DEFAULT NULL,
  `dGeloescht` datetime DEFAULT NULL,
  `cAenderungDurch` varchar(255) NOT NULL,
  `nDatenGeprueft` tinyint(4) NOT NULL,
  `dLetzterLogin` datetime DEFAULT NULL,
  `bInitialNewsletter` tinyint(4) NOT NULL DEFAULT 0,
  `bBitrixSyncActive` tinyint(4) DEFAULT 1,
  `nBitrixSyncType` int(11) DEFAULT 1,
  `eInternalRole` varchar(5) DEFAULT NULL,
  `bSoftBan` tinyint(4) DEFAULT 0,
  `cEcomDataClientId` varchar(50) DEFAULT NULL,
  `cPublicId` varchar(36) NOT NULL,
  PRIMARY KEY (`kAccountHistory`),
  KEY `kKundengruppe` (`kKundengruppe`)
) ENGINE=MyISAM AUTO_INCREMENT=350317 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountorganisation`
--

DROP TABLE IF EXISTS `taccountorganisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountorganisation` (
  `kAccountOrganisation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `kOrganisation` int(10) unsigned NOT NULL DEFAULT 0,
  `kAccounthierachie` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `kAccountverwaltung` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `kAccountumgebung` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nDSGVODeleteMoeglich` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nTestphaseMoeglich` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nKaufMoeglich` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nSupportMoeglich` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nNewsletterMoeglich` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nKritischeInfosMoeglich` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nProgrammteilnahmeMoeglich` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nKooperationenMoeglich` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dAktualisiertAm` datetime DEFAULT NULL,
  PRIMARY KEY (`kAccountOrganisation`),
  UNIQUE KEY `kAccount` (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountpruefung`
--

DROP TABLE IF EXISTS `taccountpruefung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountpruefung` (
  `kPruefung` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) DEFAULT NULL,
  `nPruefung` tinyint(4) DEFAULT 0,
  `dPruefung` datetime DEFAULT NULL,
  `nStatus` tinyint(4) NOT NULL DEFAULT 0,
  `nWahrscheinlichkeit` int(11) NOT NULL DEFAULT 0,
  `nKundenkonten` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`kPruefung`)
) ENGINE=InnoDB AUTO_INCREMENT=162826 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountpruefung_job`
--

DROP TABLE IF EXISTS `taccountpruefung_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountpruefung_job` (
  `kJob` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  PRIMARY KEY (`kJob`),
  KEY `kAccount` (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountpruefung_log`
--

DROP TABLE IF EXISTS `taccountpruefung_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountpruefung_log` (
  `kLog` int(11) NOT NULL AUTO_INCREMENT,
  `kPruefung` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `nWahrscheinlichkeit` int(11) NOT NULL,
  `xMatchingFields` text NOT NULL,
  PRIMARY KEY (`kLog`),
  KEY `kPruefung` (`kPruefung`,`kAccount`,`nWahrscheinlichkeit`)
) ENGINE=MyISAM AUTO_INCREMENT=237895 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountpruefung_whitelist`
--

DROP TABLE IF EXISTS `taccountpruefung_whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountpruefung_whitelist` (
  `kWhitelist` int(11) NOT NULL AUTO_INCREMENT,
  `kAccountA` int(11) NOT NULL DEFAULT 0,
  `kAccountB` int(11) NOT NULL DEFAULT 0,
  `nTyp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kWhitelist`),
  KEY `kAccountA` (`kAccountA`,`kAccountB`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountregistrierungszweck`
--

DROP TABLE IF EXISTS `taccountregistrierungszweck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountregistrierungszweck` (
  `kAccount` int(10) unsigned DEFAULT NULL,
  `kRegistrierungszweck` tinyint(3) unsigned DEFAULT NULL,
  KEY `taccountregistrierungszweck_kAccount_index` (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountrolle`
--

DROP TABLE IF EXISTS `taccountrolle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountrolle` (
  `kAccountRolle` int(10) unsigned NOT NULL,
  `cName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kAccountRolle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountsla`
--

DROP TABLE IF EXISTS `taccountsla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountsla` (
  `kAccountSLA` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) DEFAULT NULL,
  `kAdminlogin` int(11) DEFAULT 0,
  `kSLA` int(11) DEFAULT NULL,
  `cKey` varchar(50) DEFAULT NULL,
  `kKey` varchar(50) DEFAULT NULL,
  `dGueltigAb` datetime DEFAULT NULL,
  `dGueltigBis` datetime DEFAULT NULL,
  PRIMARY KEY (`kAccountSLA`),
  KEY `kAccount` (`kAccount`),
  KEY `kSLA` (`kSLA`)
) ENGINE=InnoDB AUTO_INCREMENT=15318 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountstatsbuha`
--

DROP TABLE IF EXISTS `taccountstatsbuha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountstatsbuha` (
  `kAccount` int(10) unsigned NOT NULL,
  `dRechnungErstelltErste` datetime DEFAULT NULL,
  `fRechnungSummeNettoLetzte` float(10,2) DEFAULT NULL,
  `fRechnungSummeBruttoLetzte` float(10,2) DEFAULT NULL,
  `fRechnungSummeNettoLetzteExklGuthaben` float(10,2) DEFAULT NULL,
  `fRechnungSummeBruttoLetzteExklGuthaben` float(10,2) DEFAULT NULL,
  `dRechnungErstelltLetzte` datetime DEFAULT NULL,
  `nRechnungAnzahl12Monate` smallint(5) unsigned DEFAULT NULL,
  `fRechnungSummeNetto12Monate` float(10,2) DEFAULT NULL,
  `fRechnungSummeBrutto12Monate` float(10,2) DEFAULT NULL,
  `fRechnungSummeNetto12MonateExklGuthaben` float(10,2) DEFAULT NULL,
  `fRechnungSummeBrutto12MonateExklGuthaben` float(10,2) DEFAULT NULL,
  `nRechnungAnzahlGesamt` smallint(5) unsigned DEFAULT NULL,
  `fRechnungSummeNettoGesamt` float(10,2) DEFAULT NULL,
  `fRechnungSummeBruttoGesamt` float(10,2) DEFAULT NULL,
  `fRechnungSummeNettoGesamtExklGuthaben` float(10,2) DEFAULT NULL,
  `fRechnungSummeBruttoGesamtExklGuthaben` float(10,2) DEFAULT NULL,
  `fRechnungRegulaerSummeNettoLetzte` float(10,2) DEFAULT NULL,
  `fRechnungRegulaerSummeBruttoLetzte` float(10,2) DEFAULT NULL,
  `fRechnungRegulaerSummeNettoLetzteExklGuthaben` float(10,2) DEFAULT NULL,
  `fRechnungRegulaerSummeBruttoLetzteExklGuthaben` float(10,2) DEFAULT NULL,
  `dRechnungRegulaerErstelltLetzte` datetime DEFAULT NULL,
  `fRechnungskorrekturSummeNettoLetzte` float(10,2) DEFAULT NULL,
  `fRechnungskorrekturSummeBruttoLetzte` float(10,2) DEFAULT NULL,
  `dRechnungskorrekturErstelltLetzte` datetime DEFAULT NULL,
  `fRechnungskorrekturSummeNetto12Monate` float(10,2) DEFAULT NULL,
  `fRechnungskorrekturSummeBrutto12Monate` float(10,2) DEFAULT NULL,
  `nRechnungskorrekturAnzahlGesamt` smallint(5) unsigned DEFAULT NULL,
  `fRechnungskorrekturSummeNettoGesamt` float(10,2) DEFAULT NULL,
  `fRechnungskorrekturSummeBruttoGesamt` float(10,2) DEFAULT NULL,
  `fProvisionSummeNettoLetzte` float(10,2) DEFAULT NULL,
  `fProvisionSummeBruttoLetzte` float(10,2) DEFAULT NULL,
  `dProvisionErstelltLetzte` datetime DEFAULT NULL,
  `fProvisionSummeNetto12Monate` float(10,2) DEFAULT NULL,
  `fProvisionSummeBrutto12Monate` float(10,2) DEFAULT NULL,
  `nProvisionAnzahlGesamt` smallint(5) unsigned DEFAULT NULL,
  `fProvisionSummeNettoGesamt` float(10,2) DEFAULT NULL,
  `fProvisionSummeBruttoGesamt` float(10,2) DEFAULT NULL,
  `fMahnungSummeNettoLetzte` float(10,2) DEFAULT NULL,
  `fMahnungSummeBruttoLetzte` float(10,2) DEFAULT NULL,
  `dMahnungErstelltLetzte` datetime DEFAULT NULL,
  `nMahnungAnzahlLetzte12Monate` smallint(5) unsigned DEFAULT NULL,
  `nMahnungAnzahlGesamt` smallint(5) unsigned DEFAULT NULL,
  `fInkassoSummeNettoLetzte` float(10,2) DEFAULT NULL,
  `fInkassoSummeBruttoLetzte` float(10,2) DEFAULT NULL,
  `dInkassoErstelltLetzte` datetime DEFAULT NULL,
  `nInkassoAnzahlLetzte12Monate` smallint(5) unsigned DEFAULT NULL,
  `nInkassoAnzahlGesamt` smallint(5) unsigned DEFAULT NULL,
  `fInkassoSummeNettoGesamt` float(10,2) DEFAULT NULL,
  `fInkassoSummeBruttoGesamt` float(10,2) DEFAULT NULL,
  `dRLSErstelltLetzte` datetime DEFAULT NULL,
  `nRLSErstelltLetzte12Monate` smallint(5) unsigned DEFAULT NULL,
  `nRLSAnzahlGesamt` smallint(5) unsigned DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  PRIMARY KEY (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountstatsprodukte`
--

DROP TABLE IF EXISTS `taccountstatsprodukte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountstatsprodukte` (
  `kAccount` int(10) unsigned NOT NULL,
  `cEazyauctionTarif` varchar(50) DEFAULT NULL,
  `dEazyauctionStart` datetime DEFAULT NULL,
  `cSupportTarif` varchar(20) DEFAULT NULL,
  `dSupportStart` datetime DEFAULT NULL,
  `cTrackAndTraceTarif` varchar(20) DEFAULT NULL,
  `dTrackAndTraceStart` datetime DEFAULT NULL,
  `nSearchTarife` smallint(5) unsigned DEFAULT 0,
  `cSearchURLs` varchar(255) DEFAULT NULL,
  `cSearchTarife` varchar(255) DEFAULT NULL,
  `dSearchStart` datetime DEFAULT NULL,
  `nHostingRDP` smallint(5) unsigned DEFAULT 0,
  `dHostingRDPStart` datetime DEFAULT NULL,
  `nHostingSQL` smallint(5) unsigned DEFAULT 0,
  `dHostingSQLStart` datetime DEFAULT NULL,
  `nHostingShop` smallint(5) unsigned DEFAULT 0,
  `cHostingShopURLs` text DEFAULT NULL,
  `dHostingShopStart` datetime DEFAULT NULL,
  `nHostingCloud` smallint(5) unsigned DEFAULT 0,
  `cHostingCloudTarif` varchar(255) DEFAULT NULL,
  `dHostingCloudStart` datetime DEFAULT NULL,
  `nShopLizenzenCFE` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenHOST` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenSTD` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenPRO` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenENT` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenDEV` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenTEST` smallint(5) unsigned DEFAULT 0,
  `cShopLizenzenURLs` text DEFAULT NULL,
  `dShopLizenzenStart` datetime DEFAULT NULL,
  `nEXSKaeufeKostenfrei` smallint(5) unsigned DEFAULT 0,
  `nEXSKaeufeKostenpflichtig` smallint(5) unsigned DEFAULT 0,
  `fEXSKaeufe` float(10,2) DEFAULT 0.00,
  `dEXSKaeufeStart` datetime DEFAULT NULL,
  `nDirektleistung` smallint(5) unsigned DEFAULT 0,
  `fDirektleistung` float(10,2) DEFAULT 0.00,
  `nWMS` smallint(5) unsigned DEFAULT 0,
  `dWMSStart` datetime DEFAULT NULL,
  `nWMSMDE` smallint(5) unsigned DEFAULT 0,
  `dWMSMDEStart` datetime DEFAULT NULL,
  `nWMSRollendeKommi` smallint(5) unsigned DEFAULT 0,
  `dWMSRollendeKommiStart` datetime DEFAULT NULL,
  `nWMSVersandboxen` smallint(5) unsigned DEFAULT 0,
  `dWMSVersandboxenStart` datetime DEFAULT NULL,
  `nWMSMHD` smallint(5) unsigned DEFAULT 0,
  `dWMSMHDStart` datetime DEFAULT NULL,
  `nWMSMobilerPacktisch` smallint(5) unsigned DEFAULT 0,
  `dWMSMobilerPacktischStart` datetime DEFAULT NULL,
  `nWMSIdentischeAuftraege` smallint(5) unsigned DEFAULT 0,
  `dWMSIdentischeAuftraegeStart` datetime DEFAULT NULL,
  `nWMSWaagen` smallint(5) unsigned DEFAULT 0,
  `dWMSWaagenStart` datetime DEFAULT NULL,
  `nPacktisch` smallint(5) unsigned DEFAULT 0,
  `dPacktischStart` datetime DEFAULT NULL,
  `nMultishop` smallint(5) unsigned DEFAULT 0,
  `dMultishopStart` datetime DEFAULT NULL,
  `nZahlungsmodul` smallint(5) unsigned DEFAULT 0,
  `dZahlungsmodulStart` datetime DEFAULT NULL,
  `nShippingLabels` smallint(5) unsigned DEFAULT 0,
  `dShippingLabelsStart` datetime DEFAULT NULL,
  `nServiceDesk` smallint(5) unsigned DEFAULT 0,
  `dServiceDeskStart` datetime DEFAULT NULL,
  `nConnectorKostenpflichtig` smallint(5) unsigned DEFAULT 0,
  `cConnectorKostenpflichtigTypen` varchar(255) DEFAULT NULL,
  `cConnectorKostenpflichtigURLs` varchar(255) DEFAULT NULL,
  `dConnectorKostenpflichtigStart` datetime DEFAULT NULL,
  `nConnectorKostenlos` smallint(5) unsigned DEFAULT 0,
  `cConnectorKostenlosTypen` varchar(255) DEFAULT NULL,
  `cConnectorKostenlosURLs` varchar(255) DEFAULT NULL,
  `dConnectorKostenlosStart` datetime DEFAULT NULL,
  `nTeilmengen` smallint(5) unsigned DEFAULT 0,
  `dTeilmengenStart` datetime DEFAULT NULL,
  `nPOS` smallint(5) unsigned DEFAULT 0,
  `cPOSFilialen` varchar(255) DEFAULT NULL,
  `dPOSStart` datetime DEFAULT NULL,
  `nPOSWebmanager` smallint(5) unsigned DEFAULT 0,
  `dPOSWebmanagerStart` datetime DEFAULT NULL,
  `nPOSInventar` smallint(5) unsigned DEFAULT 0,
  `dPOSInventarStart` datetime DEFAULT NULL,
  `nPOSBon` smallint(5) unsigned DEFAULT 0,
  `dPOSBonStart` datetime DEFAULT NULL,
  `nVouchers` smallint(5) unsigned DEFAULT 0,
  `dVouchersStart` datetime DEFAULT NULL,
  `nBI` smallint(5) unsigned DEFAULT 0,
  `dBIStart` datetime DEFAULT NULL,
  `nFFN` smallint(5) unsigned DEFAULT 0,
  `cFFNRollen` varchar(255) DEFAULT NULL,
  `dFFNStart` datetime DEFAULT NULL,
  `nPAP` smallint(5) unsigned DEFAULT 0,
  `dPAPStart` datetime DEFAULT NULL,
  `nPAPWorkbench` smallint(5) unsigned DEFAULT 0,
  `dPAPWorkbenchStart` datetime DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  PRIMARY KEY (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountstatsprodukte_history`
--

DROP TABLE IF EXISTS `taccountstatsprodukte_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountstatsprodukte_history` (
  `kAccount` int(10) unsigned DEFAULT NULL,
  `cEazyauctionTarif` varchar(50) DEFAULT NULL,
  `cSupportTarif` varchar(20) DEFAULT NULL,
  `cTrackAndTraceTarif` varchar(20) DEFAULT NULL,
  `nSearchTarife` smallint(5) unsigned DEFAULT 0,
  `nHostingRDP` smallint(5) unsigned DEFAULT 0,
  `nHostingSQL` smallint(5) unsigned DEFAULT 0,
  `nHostingShop` smallint(5) unsigned DEFAULT 0,
  `nHostingCloud` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenCFE` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenHOST` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenSTD` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenPRO` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenENT` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenDEV` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenTEST` smallint(5) unsigned DEFAULT 0,
  `nEXSKaeufeKostenfrei` smallint(5) unsigned DEFAULT 0,
  `nEXSKaeufeKostenpflichtig` smallint(5) unsigned DEFAULT 0,
  `nDirektleistung` smallint(5) unsigned DEFAULT 0,
  `nWMS` smallint(5) unsigned DEFAULT 0,
  `nWMSMDE` smallint(5) unsigned DEFAULT 0,
  `nWMSRollendeKommi` smallint(5) unsigned DEFAULT 0,
  `nWMSVersandboxen` smallint(5) unsigned DEFAULT 0,
  `nWMSMHD` smallint(5) unsigned DEFAULT 0,
  `nWMSMobilerPacktisch` smallint(5) unsigned DEFAULT 0,
  `nWMSIdentischeAuftraege` smallint(5) unsigned DEFAULT 0,
  `nWMSWaagen` smallint(5) unsigned DEFAULT 0,
  `nPacktisch` smallint(5) unsigned DEFAULT 0,
  `nMultishop` smallint(5) unsigned DEFAULT 0,
  `nZahlungsmodul` smallint(5) unsigned DEFAULT 0,
  `nShippingLabels` smallint(5) unsigned DEFAULT 0,
  `nServiceDesk` smallint(5) unsigned DEFAULT 0,
  `nConnectorKostenpflichtig` smallint(5) unsigned DEFAULT 0,
  `nConnectorKostenlos` smallint(5) unsigned DEFAULT 0,
  `nTeilmengen` smallint(5) unsigned DEFAULT 0,
  `nPOS` smallint(5) unsigned DEFAULT 0,
  `cPOSFilialen` varchar(255) DEFAULT NULL,
  `nPOSWebmanager` smallint(5) unsigned DEFAULT 0,
  `nPOSInventar` smallint(5) unsigned DEFAULT 0,
  `nPOSBon` smallint(5) unsigned DEFAULT 0,
  `nVouchers` smallint(5) unsigned DEFAULT 0,
  `nBI` smallint(5) unsigned DEFAULT 0,
  `nFFN` smallint(5) unsigned DEFAULT 0,
  `cFFNRollen` varchar(255) DEFAULT NULL,
  `nPAP` smallint(5) unsigned DEFAULT 0,
  `nPAPWorkbench` smallint(5) unsigned DEFAULT 0,
  `dAktualisiert` datetime DEFAULT NULL,
  KEY `taccountstatsprodukte_history_kaccount_index` (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountstatsprodukte_log`
--

DROP TABLE IF EXISTS `taccountstatsprodukte_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountstatsprodukte_log` (
  `kAccount` int(10) unsigned DEFAULT NULL,
  `cText` varchar(255) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountstatsprodukte_tmp`
--

DROP TABLE IF EXISTS `taccountstatsprodukte_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountstatsprodukte_tmp` (
  `kAccount` int(10) unsigned NOT NULL,
  `cEazyauctionTarif` varchar(50) DEFAULT NULL,
  `dEazyauctionStart` datetime DEFAULT NULL,
  `cSupportTarif` varchar(20) DEFAULT NULL,
  `dSupportStart` datetime DEFAULT NULL,
  `cTrackAndTraceTarif` varchar(20) DEFAULT NULL,
  `dTrackAndTraceStart` datetime DEFAULT NULL,
  `nSearchTarife` smallint(5) unsigned DEFAULT 0,
  `cSearchURLs` varchar(255) DEFAULT NULL,
  `cSearchTarife` varchar(255) DEFAULT NULL,
  `dSearchStart` datetime DEFAULT NULL,
  `nHostingRDP` smallint(5) unsigned DEFAULT 0,
  `dHostingRDPStart` datetime DEFAULT NULL,
  `nHostingSQL` smallint(5) unsigned DEFAULT 0,
  `dHostingSQLStart` datetime DEFAULT NULL,
  `nHostingShop` smallint(5) unsigned DEFAULT 0,
  `cHostingShopURLs` text DEFAULT NULL,
  `dHostingShopStart` datetime DEFAULT NULL,
  `nHostingCloud` smallint(5) unsigned DEFAULT 0,
  `cHostingCloudTarif` varchar(255) DEFAULT NULL,
  `dHostingCloudStart` datetime DEFAULT NULL,
  `nShopLizenzenCFE` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenHOST` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenSTD` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenPRO` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenENT` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenDEV` smallint(5) unsigned DEFAULT 0,
  `nShopLizenzenTEST` smallint(5) unsigned DEFAULT 0,
  `cShopLizenzenURLs` text DEFAULT NULL,
  `dShopLizenzenStart` datetime DEFAULT NULL,
  `nEXSKaeufeKostenfrei` smallint(5) unsigned DEFAULT 0,
  `nEXSKaeufeKostenpflichtig` smallint(5) unsigned DEFAULT 0,
  `fEXSKaeufe` float(10,2) DEFAULT 0.00,
  `dEXSKaeufeStart` datetime DEFAULT NULL,
  `nDirektleistung` smallint(5) unsigned DEFAULT 0,
  `fDirektleistung` float(10,2) DEFAULT 0.00,
  `nWMS` smallint(5) unsigned DEFAULT 0,
  `dWMSStart` datetime DEFAULT NULL,
  `nWMSMDE` smallint(5) unsigned DEFAULT 0,
  `dWMSMDEStart` datetime DEFAULT NULL,
  `nWMSRollendeKommi` smallint(5) unsigned DEFAULT 0,
  `dWMSRollendeKommiStart` datetime DEFAULT NULL,
  `nWMSVersandboxen` smallint(5) unsigned DEFAULT 0,
  `dWMSVersandboxenStart` datetime DEFAULT NULL,
  `nWMSMHD` smallint(5) unsigned DEFAULT 0,
  `dWMSMHDStart` datetime DEFAULT NULL,
  `nWMSMobilerPacktisch` smallint(5) unsigned DEFAULT 0,
  `dWMSMobilerPacktischStart` datetime DEFAULT NULL,
  `nWMSIdentischeAuftraege` smallint(5) unsigned DEFAULT 0,
  `dWMSIdentischeAuftraegeStart` datetime DEFAULT NULL,
  `nWMSWaagen` smallint(5) unsigned DEFAULT 0,
  `dWMSWaagenStart` datetime DEFAULT NULL,
  `nPacktisch` smallint(5) unsigned DEFAULT 0,
  `dPacktischStart` datetime DEFAULT NULL,
  `nMultishop` smallint(5) unsigned DEFAULT 0,
  `dMultishopStart` datetime DEFAULT NULL,
  `nZahlungsmodul` smallint(5) unsigned DEFAULT 0,
  `dZahlungsmodulStart` datetime DEFAULT NULL,
  `nShippingLabels` smallint(5) unsigned DEFAULT 0,
  `dShippingLabelsStart` datetime DEFAULT NULL,
  `nServiceDesk` smallint(5) unsigned DEFAULT 0,
  `dServiceDeskStart` datetime DEFAULT NULL,
  `nConnectorKostenpflichtig` smallint(5) unsigned DEFAULT 0,
  `cConnectorKostenpflichtigTypen` varchar(255) DEFAULT NULL,
  `cConnectorKostenpflichtigURLs` varchar(255) DEFAULT NULL,
  `dConnectorKostenpflichtigStart` datetime DEFAULT NULL,
  `nConnectorKostenlos` smallint(5) unsigned DEFAULT 0,
  `cConnectorKostenlosTypen` varchar(255) DEFAULT NULL,
  `cConnectorKostenlosURLs` varchar(255) DEFAULT NULL,
  `dConnectorKostenlosStart` datetime DEFAULT NULL,
  `nTeilmengen` smallint(5) unsigned DEFAULT 0,
  `dTeilmengenStart` datetime DEFAULT NULL,
  `nPOS` smallint(5) unsigned DEFAULT 0,
  `cPOSFilialen` varchar(255) DEFAULT NULL,
  `dPOSStart` datetime DEFAULT NULL,
  `nPOSWebmanager` smallint(5) unsigned DEFAULT 0,
  `dPOSWebmanagerStart` datetime DEFAULT NULL,
  `nPOSInventar` smallint(5) unsigned DEFAULT 0,
  `dPOSInventarStart` datetime DEFAULT NULL,
  `nPOSBon` smallint(5) unsigned DEFAULT 0,
  `dPOSBonStart` datetime DEFAULT NULL,
  `nVouchers` smallint(5) unsigned DEFAULT 0,
  `dVouchersStart` datetime DEFAULT NULL,
  `nBI` smallint(5) unsigned DEFAULT 0,
  `dBIStart` datetime DEFAULT NULL,
  `nFFN` smallint(5) unsigned DEFAULT 0,
  `cFFNRollen` varchar(255) DEFAULT NULL,
  `dFFNStart` datetime DEFAULT NULL,
  `nPAP` smallint(5) unsigned DEFAULT 0,
  `dPAPStart` datetime DEFAULT NULL,
  `nPAPWorkbench` smallint(5) unsigned DEFAULT 0,
  `dPAPWorkbenchStart` datetime DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  PRIMARY KEY (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountumgebung`
--

DROP TABLE IF EXISTS `taccountumgebung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountumgebung` (
  `kAccountumgebung` tinyint(3) unsigned DEFAULT NULL,
  `cName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taccountverwaltung`
--

DROP TABLE IF EXISTS `taccountverwaltung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taccountverwaltung` (
  `kAccountverwaltung` tinyint(3) unsigned DEFAULT NULL,
  `cName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tactionlog`
--

DROP TABLE IF EXISTS `tactionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tactionlog` (
  `kActionlog` int(11) NOT NULL AUTO_INCREMENT,
  `kAdminLogin` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `cMessage` longtext NOT NULL,
  `cFile` varchar(255) NOT NULL,
  `cParam` longtext NOT NULL,
  `cResponse` longtext NOT NULL,
  `dEingetragen` datetime NOT NULL,
  PRIMARY KEY (`kActionlog`)
) ENGINE=MyISAM AUTO_INCREMENT=184238 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tadminbenutzergruppen`
--

DROP TABLE IF EXISTS `tadminbenutzergruppen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tadminbenutzergruppen` (
  `kAdminBenutzergruppe` int(11) NOT NULL AUTO_INCREMENT,
  `cGruppenname` varchar(255) NOT NULL,
  PRIMARY KEY (`kAdminBenutzergruppe`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tadminbenutzergruppenrelation`
--

DROP TABLE IF EXISTS `tadminbenutzergruppenrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tadminbenutzergruppenrelation` (
  `kAdminBenutzergruppe` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tansprechpartner`
--

DROP TABLE IF EXISTS `tansprechpartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tansprechpartner` (
  `kAnsprechpartner` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(10) unsigned NOT NULL DEFAULT 0,
  `kTechnologiepartner` int(10) NOT NULL DEFAULT 0,
  `kAccount` int(10) NOT NULL DEFAULT 0,
  `cAnrede` varchar(255) NOT NULL,
  `cTitel` varchar(255) DEFAULT NULL,
  `cVorname` varchar(255) NOT NULL,
  `cNachname` varchar(255) NOT NULL,
  `cEmail` varchar(255) NOT NULL,
  `cTel` varchar(255) NOT NULL,
  `cMobil` varchar(255) DEFAULT NULL,
  `cFax` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  `cBild` varchar(255) DEFAULT NULL,
  `cRollen` varchar(255) DEFAULT '[]',
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `nSort` int(10) unsigned NOT NULL,
  `nEmailZeigen` tinyint(3) unsigned DEFAULT 1,
  `nNewsletter1` tinyint(3) unsigned DEFAULT 0,
  `nNewsletter2` tinyint(3) unsigned DEFAULT 0,
  `nNewsletter3` tinyint(3) unsigned DEFAULT 0,
  `nNewsletter4` tinyint(3) unsigned DEFAULT 0,
  `dGeaendert` datetime DEFAULT NULL,
  `nDsgvo` tinyint(3) NOT NULL,
  PRIMARY KEY (`kAnsprechpartner`),
  KEY `nAktiv` (`nAktiv`,`nSort`),
  KEY `kTechnologiepartner` (`kTechnologiepartner`),
  KEY `kAccount` (`kAccount`),
  KEY `kServicepartner` (`kServicepartner`),
  KEY `tsp_kAccount_cEmail_index` (`kAccount`,`cEmail`),
  KEY `tansprechpartner_cemail_index` (`cEmail`)
) ENGINE=MyISAM AUTO_INCREMENT=137193 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tanzahlmitarbeiter`
--

DROP TABLE IF EXISTS `tanzahlmitarbeiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tanzahlmitarbeiter` (
  `kAnzahlMitarbeiter` tinyint(4) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `nSort` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kAnzahlMitarbeiter`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tapiauth`
--

DROP TABLE IF EXISTS `tapiauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tapiauth` (
  `kAuth` int(11) NOT NULL AUTO_INCREMENT,
  `cToken` varchar(255) DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `dLastUse` datetime NOT NULL,
  PRIMARY KEY (`kAuth`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbackupserver`
--

DROP TABLE IF EXISTS `tbackupserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbackupserver` (
  `kBackupserver` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(250) NOT NULL,
  `cUser` longtext NOT NULL,
  `cPass` longtext NOT NULL,
  `dEingetragen` datetime NOT NULL,
  PRIMARY KEY (`kBackupserver`)
) ENGINE=MyISAM AUTO_INCREMENT=361 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbackupstatus`
--

DROP TABLE IF EXISTS `tbackupstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbackupstatus` (
  `kServer` int(11) NOT NULL,
  `kBackupserver` int(11) NOT NULL,
  `cPfad` varchar(250) NOT NULL,
  `cFilename` varchar(250) NOT NULL,
  `nSize` bigint(20) NOT NULL,
  `bAktuell` int(11) NOT NULL,
  `dFiletime` bigint(20) NOT NULL,
  `dEingetragen` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbankpruefung`
--

DROP TABLE IF EXISTS `tbankpruefung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbankpruefung` (
  `kPruefung` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `nErgebnis` int(11) DEFAULT NULL,
  `cHerkunft` varchar(255) DEFAULT NULL,
  `dPruefung` datetime DEFAULT NULL,
  `cBankinstitutALT` varchar(255) DEFAULT NULL,
  `cBankinstitutNEU` varchar(255) DEFAULT NULL,
  `nKontoNrALT` varchar(255) DEFAULT NULL,
  `nKontoNrNEU` varchar(255) DEFAULT NULL,
  `nBLZALT` bigint(20) DEFAULT NULL,
  `nBLZNEU` bigint(20) DEFAULT NULL,
  `cKontoinhaberALT` varchar(255) DEFAULT NULL,
  `cKontoinhaberNEU` varchar(255) DEFAULT NULL,
  `cIBANALT` varchar(255) DEFAULT NULL,
  `cIBANNEU` varchar(255) DEFAULT NULL,
  `cBICALT` varchar(255) DEFAULT NULL,
  `cBICNEU` varchar(255) DEFAULT NULL,
  `cBanknameALT` varchar(255) DEFAULT NULL,
  `cBanknameNEU` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kPruefung`),
  KEY `kAccount` (`kAccount`,`dPruefung`),
  KEY `cHerkunft` (`cHerkunft`)
) ENGINE=InnoDB AUTO_INCREMENT=17376 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblowfish`
--

DROP TABLE IF EXISTS `tblowfish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblowfish` (
  `cBlowfishKey` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`cBlowfishKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbranche`
--

DROP TABLE IF EXISTS `tbranche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbranche` (
  `kBranche` tinyint(4) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  `nSort` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`kBranche`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbrocken`
--

DROP TABLE IF EXISTS `tbrocken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbrocken` (
  `kBrocken` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kShop` int(10) unsigned NOT NULL,
  `cBrocken` text NOT NULL,
  `nNeuErstellen` tinyint(1) DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kBrocken`),
  KEY `kShop` (`kShop`,`nNeuErstellen`)
) ENGINE=MyISAM AUTO_INCREMENT=104453 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbrockenhistoryfailure`
--

DROP TABLE IF EXISTS `tbrockenhistoryfailure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbrockenhistoryfailure` (
  `kBrockenHistoryFailure` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cIP` varchar(255) NOT NULL,
  `cError` varchar(255) NOT NULL,
  `cPost` text NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kBrockenHistoryFailure`)
) ENGINE=MyISAM AUTO_INCREMENT=788849 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbrockenhistorysuccess`
--

DROP TABLE IF EXISTS `tbrockenhistorysuccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbrockenhistorysuccess` (
  `kBrockenHistorySuccess` int(11) NOT NULL AUTO_INCREMENT,
  `kShop` int(10) unsigned NOT NULL,
  `cIP` varchar(255) NOT NULL,
  `cPost` text NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kBrockenHistorySuccess`),
  KEY `kShop` (`kShop`)
) ENGINE=MyISAM AUTO_INCREMENT=491 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tclouddata`
--

DROP TABLE IF EXISTS `tclouddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tclouddata` (
  `kHostingPos` int(11) NOT NULL,
  `cPass` longtext NOT NULL,
  `cServerIP` longtext NOT NULL,
  KEY `kHostingPos` (`kHostingPos`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tconnectoraccountusage`
--

DROP TABLE IF EXISTS `tconnectoraccountusage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tconnectoraccountusage` (
  `kUsage` bigint(11) NOT NULL AUTO_INCREMENT,
  `kAccount` bigint(11) NOT NULL,
  `kLicense` bigint(11) NOT NULL,
  `kCredential` bigint(11) NOT NULL,
  `nOrders` int(11) NOT NULL DEFAULT 0,
  `dImportDate` date NOT NULL,
  PRIMARY KEY (`kUsage`),
  KEY `kAccount` (`kAccount`,`dImportDate`)
) ENGINE=InnoDB AUTO_INCREMENT=494384 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tconnectorcredentialsupdatecache`
--

DROP TABLE IF EXISTS `tconnectorcredentialsupdatecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tconnectorcredentialsupdatecache` (
  `kLicense` int(10) unsigned NOT NULL,
  `nConnectorTarifVorhanden` tinyint(3) unsigned DEFAULT NULL,
  `nUpdateNotwendig` tinyint(3) unsigned DEFAULT NULL,
  `nCredentialsId` int(10) unsigned DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  PRIMARY KEY (`kLicense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tconnectortarifbuchungen`
--

DROP TABLE IF EXISTS `tconnectortarifbuchungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tconnectortarifbuchungen` (
  `kBuchung` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kLicense` int(11) NOT NULL,
  `kTarif` int(11) NOT NULL,
  `bActive` tinyint(4) NOT NULL DEFAULT 1,
  `fKosten` float DEFAULT 0,
  `dGebuchtAm` datetime NOT NULL,
  `dGueltigAb` datetime DEFAULT NULL,
  `dGekuendigtZum` datetime DEFAULT NULL,
  `cGekuendigtDurch` char(120) DEFAULT NULL,
  `kBuchungNeu` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`kBuchung`),
  KEY `kAccount` (`kAccount`),
  KEY `kLicense` (`kLicense`),
  KEY `kTarif` (`kTarif`)
) ENGINE=InnoDB AUTO_INCREMENT=11704 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tconnectortarife`
--

DROP TABLE IF EXISTS `tconnectortarife`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tconnectortarife` (
  `kTarif` int(11) NOT NULL AUTO_INCREMENT,
  `kConnectorType` int(11) NOT NULL,
  `cTarifname` varchar(250) DEFAULT NULL,
  `nBuchbar` int(11) DEFAULT NULL,
  `nSort` int(11) NOT NULL,
  `fKostenMonat` float(10,2) DEFAULT NULL,
  `fKostenTransaktionen` float(10,2) NOT NULL,
  `nTransaktionenInkl` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kTarif`),
  KEY `kConnectorType` (`kConnectorType`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tconnectortarifhistory`
--

DROP TABLE IF EXISTS `tconnectortarifhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tconnectortarifhistory` (
  `kConnectortarifhistory` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kAdminlogin` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `kLicense` int(11) NOT NULL,
  `cSource` varchar(255) NOT NULL DEFAULT '' COMMENT 'Herkunft des Datensatzes - Kunde oder JTL',
  `cAction` varchar(255) NOT NULL DEFAULT '',
  `cTarifdataOld` longtext NOT NULL,
  `cTarifdataNew` longtext DEFAULT NULL,
  `dCreated_at` datetime NOT NULL,
  `dUpdated_at` datetime NOT NULL,
  PRIMARY KEY (`kConnectortarifhistory`)
) ENGINE=InnoDB AUTO_INCREMENT=952 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tcrawler`
--

DROP TABLE IF EXISTS `tcrawler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcrawler` (
  `alexarank` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `cms` varchar(255) NOT NULL,
  `certainty` varchar(255) NOT NULL,
  `tld` varchar(255) NOT NULL,
  `geocc2` varchar(255) NOT NULL,
  `cAdditional` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tcron`
--

DROP TABLE IF EXISTS `tcron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcron` (
  `kCron` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  `cDateiname` varchar(255) DEFAULT NULL,
  `nZyklusInSec` int(10) unsigned DEFAULT NULL,
  `cCronSyntax` varchar(50) DEFAULT NULL,
  `nMaxErwarteteLaufzeitInSec` int(10) unsigned DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kCron`),
  KEY `tcron_cDateiname_index` (`cDateiname`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tcrondurchlauf`
--

DROP TABLE IF EXISTS `tcrondurchlauf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcrondurchlauf` (
  `kCronDurchlauf` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kCron` smallint(5) unsigned DEFAULT NULL,
  `cDateiname` varchar(100) DEFAULT NULL,
  `cStatus` enum('RUNNING','SUCCESSFUL','ERROR') DEFAULT NULL,
  `cZusammenfassung` varchar(255) DEFAULT NULL,
  `cStats` text DEFAULT NULL,
  `cLog` mediumtext DEFAULT NULL,
  `nLaufzeitInMillisec` int(10) unsigned DEFAULT NULL,
  `nProduktiv` tinyint(3) unsigned DEFAULT NULL,
  `dGestartet` datetime DEFAULT NULL,
  `dBeendet` datetime DEFAULT NULL,
  PRIMARY KEY (`kCronDurchlauf`),
  KEY `tcrondurchlauf_dGestartet_index` (`dGestartet`),
  KEY `tcrondurchlauf_kCron_dGestartet_index` (`kCron`,`dGestartet`),
  KEY `tcrondurchlauf_cDateiname_dGestartet_index` (`cDateiname`,`dGestartet`),
  KEY `tcrondurchlauf_kCron_nProduktiv_index` (`kCron`,`nProduktiv`),
  KEY `tcrondurchlauf_cDateiname_nProduktiv_index` (`cDateiname`,`nProduktiv`,`kCronDurchlauf`)
) ENGINE=InnoDB AUTO_INCREMENT=2570439 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tcustomercare`
--

DROP TABLE IF EXISTS `tcustomercare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcustomercare` (
  `kCustomercare` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kKey` int(11) NOT NULL,
  `cKey` varchar(255) NOT NULL,
  `cHinweis` varchar(255) NOT NULL,
  `bSolved` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kCustomercare`)
) ENGINE=MyISAM AUTO_INCREMENT=2166 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tcustomercarelog`
--

DROP TABLE IF EXISTS `tcustomercarelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcustomercarelog` (
  `kCustomercarelog` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `cServiceName` varchar(255) NOT NULL,
  `cEmail` varchar(255) NOT NULL,
  `dGesendet` datetime NOT NULL,
  PRIMARY KEY (`kCustomercarelog`)
) ENGINE=MyISAM AUTO_INCREMENT=112383 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdatenabfrage`
--

DROP TABLE IF EXISTS `tdatenabfrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdatenabfrage` (
  `kDatenabfrage` int(11) NOT NULL AUTO_INCREMENT,
  `kAdminlogin` int(11) DEFAULT NULL,
  `kAccount` int(11) DEFAULT NULL,
  `cArt` varchar(255) DEFAULT NULL,
  `cKey` varchar(255) DEFAULT NULL,
  `kKey` int(11) DEFAULT NULL,
  `cGrund` varchar(255) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kDatenabfrage`)
) ENGINE=InnoDB AUTO_INCREMENT=45097 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdatenuebernahme`
--

DROP TABLE IF EXISTS `tdatenuebernahme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdatenuebernahme` (
  `kDatenuebernahme` int(11) NOT NULL AUTO_INCREMENT,
  `kErsteller` int(11) NOT NULL,
  `kKunde` int(11) NOT NULL,
  `cUebernahmeSystem` enum('Shop','WaWi') DEFAULT NULL,
  `cAltesSystem` varchar(255) NOT NULL,
  `cSqlVersion` varchar(255) NOT NULL,
  `cBetriebssystem` varchar(255) NOT NULL,
  `cKundennr` varchar(255) NOT NULL,
  `cKundename` varchar(255) NOT NULL,
  `cKundeemail` varchar(255) NOT NULL,
  `cKundetelefon` varchar(255) NOT NULL,
  `cBeratungsprotokoll` longtext NOT NULL,
  `cZeitaufwandGeschaetzt` varchar(255) NOT NULL,
  `cZusaetzlicheStunden` varchar(255) NOT NULL,
  `cProbleme` longtext NOT NULL,
  `bDatenVernichtet` enum('0','1') NOT NULL DEFAULT '0',
  `dDatenVernichted` datetime NOT NULL,
  `kDatenvernichtetDurch` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dAktualisiert` datetime NOT NULL,
  PRIMARY KEY (`kDatenuebernahme`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdatenuebernahmevorgang`
--

DROP TABLE IF EXISTS `tdatenuebernahmevorgang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdatenuebernahmevorgang` (
  `kDatenuebernahmevorgang` int(11) NOT NULL AUTO_INCREMENT,
  `kDatenuebernahme` int(11) NOT NULL,
  `kBearbeiter` int(11) NOT NULL,
  `cVorgang` text NOT NULL,
  `cZeitaufwand` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kDatenuebernahmevorgang`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdebugreport`
--

DROP TABLE IF EXISTS `tdebugreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdebugreport` (
  `kDebugReport` int(11) NOT NULL AUTO_INCREMENT,
  `cLog` text NOT NULL,
  `cKey` varchar(255) NOT NULL,
  `cValue` varchar(255) DEFAULT NULL,
  `dCreated` datetime NOT NULL,
  PRIMARY KEY (`kDebugReport`),
  KEY `cKey` (`cKey`)
) ENGINE=MyISAM AUTO_INCREMENT=788840 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdevice`
--

DROP TABLE IF EXISTS `tdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdevice` (
  `kDevice` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `nType` enum('POS') NOT NULL,
  `cId` varchar(36) NOT NULL,
  `dUpdated` datetime NOT NULL,
  `dCreated` datetime NOT NULL,
  PRIMARY KEY (`kDevice`),
  KEY `tdevice_kaccount_index` (`kAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=17066 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdevicemeta`
--

DROP TABLE IF EXISTS `tdevicemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdevicemeta` (
  `kDeviceMeta` int(11) NOT NULL AUTO_INCREMENT,
  `kDevice` int(11) NOT NULL,
  `_key` varchar(192) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`kDeviceMeta`),
  KEY `tdevicemeta_kdevice_index` (`kDevice`)
) ENGINE=InnoDB AUTO_INCREMENT=10282113 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdevicereset`
--

DROP TABLE IF EXISTS `tdevicereset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdevicereset` (
  `kDeviceReset` int(11) NOT NULL AUTO_INCREMENT,
  `kDevice` int(11) NOT NULL,
  `cCode` varchar(32) NOT NULL,
  `dReceived` datetime DEFAULT NULL,
  `dCreated` datetime NOT NULL,
  PRIMARY KEY (`kDeviceReset`)
) ENGINE=InnoDB AUTO_INCREMENT=1402 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdirektleistung`
--

DROP TABLE IF EXISTS `tdirektleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdirektleistung` (
  `kDirektleistung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kDirektleistungTyp` int(10) unsigned DEFAULT NULL,
  `cName` varchar(200) DEFAULT NULL,
  `kVorlageSystemmail` int(10) unsigned DEFAULT 0,
  `fBetragNetto` double DEFAULT NULL,
  `nSichtbar` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`kDirektleistung`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdirektleistungtyp`
--

DROP TABLE IF EXISTS `tdirektleistungtyp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdirektleistungtyp` (
  `kDirektleistungTyp` int(10) unsigned NOT NULL,
  `cLeistungstyp` varchar(100) DEFAULT NULL,
  `nSichtbarEmpfehlungsliste` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nSort` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`kDirektleistungTyp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdomainorder`
--

DROP TABLE IF EXISTS `tdomainorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdomainorder` (
  `kOrder` int(11) NOT NULL AUTO_INCREMENT,
  `cDomain` varchar(255) NOT NULL,
  `kHostingPos` int(11) NOT NULL,
  `nStatus` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kOrder`),
  KEY `cDomain` (`cDomain`),
  KEY `kHostingPos` (`kHostingPos`)
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdomainorderlog`
--

DROP TABLE IF EXISTS `tdomainorderlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdomainorderlog` (
  `kLog` int(11) NOT NULL AUTO_INCREMENT,
  `kOrder` int(11) NOT NULL,
  `cStep` varchar(255) NOT NULL,
  `cRequest` text DEFAULT NULL,
  `cResponse` text DEFAULT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kLog`)
) ENGINE=InnoDB AUTO_INCREMENT=15730 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdownloadprodukt`
--

DROP TABLE IF EXISTS `tdownloadprodukt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdownloadprodukt` (
  `kDownloadProdukt` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kKaufProdukt` int(11) NOT NULL DEFAULT 0,
  `cName` varchar(255) NOT NULL,
  `cBild` varchar(255) NOT NULL,
  `cBeschreibung` text DEFAULT NULL,
  `nSort` int(10) unsigned NOT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `nGruppe` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kDownloadProdukt`),
  KEY `nAktiv` (`nAktiv`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdownloadproduktversion`
--

DROP TABLE IF EXISTS `tdownloadproduktversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdownloadproduktversion` (
  `kDownloadProduktVersion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kDownloadProdukt` int(10) unsigned NOT NULL,
  `cChangelog` text NOT NULL,
  `cHinweisHosting` text DEFAULT NULL,
  `nBuild` tinyint(4) DEFAULT NULL,
  `eChannel` enum('Stable','Community Free','RC','Archiv') NOT NULL DEFAULT 'Stable',
  `cDatei` varchar(255) NOT NULL,
  `cVersion` varchar(255) NOT NULL,
  `cVersionSemver` varchar(255) DEFAULT NULL,
  `cURL` varchar(255) NOT NULL DEFAULT '',
  `nType` int(11) NOT NULL DEFAULT 0,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `nSort` int(10) unsigned NOT NULL,
  `nDL` int(10) unsigned DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kDownloadProduktVersion`),
  KEY `nAktiv` (`nAktiv`)
) ENGINE=MyISAM AUTO_INCREMENT=481 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tduk`
--

DROP TABLE IF EXISTS `tduk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tduk` (
  `kDuk` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cText` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dUpdated` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kDuk`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teabenutzername`
--

DROP TABLE IF EXISTS `teabenutzername`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teabenutzername` (
  `kEABenutzername` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) DEFAULT NULL,
  `kEbayKundenAccount` int(11) DEFAULT NULL,
  `kUserId` int(11) DEFAULT NULL,
  `cMerchantId` varchar(255) DEFAULT NULL,
  `cBenutzername` varchar(255) DEFAULT NULL,
  `eTyp` enum('eBay','Amazon') DEFAULT NULL,
  `dErstellt` date DEFAULT NULL,
  `dErfasst` datetime DEFAULT NULL,
  PRIMARY KEY (`kEABenutzername`),
  KEY `kAccount` (`kAccount`),
  KEY `kEbayBenutzer` (`kEbayKundenAccount`),
  KEY `cBenutzername` (`cBenutzername`),
  KEY `eTyp` (`eTyp`)
) ENGINE=InnoDB AUTO_INCREMENT=61410 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teakuendigungen`
--

DROP TABLE IF EXISTS `teakuendigungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teakuendigungen` (
  `kEakuendigungen` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `cJTLToken` varchar(250) NOT NULL,
  `dKuendigungZum` date NOT NULL,
  PRIMARY KEY (`kEakuendigungen`)
) ENGINE=MyISAM AUTO_INCREMENT=17062 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teakuendigungen_history`
--

DROP TABLE IF EXISTS `teakuendigungen_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teakuendigungen_history` (
  `kEaKuendigungHistory` int(11) NOT NULL AUTO_INCREMENT,
  `kAdminlogin` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `nKuendigungRB` int(11) NOT NULL,
  `nKuendigungSofort` int(11) NOT NULL,
  `nKuendigungAufheben` int(11) NOT NULL,
  `dKuendigungZum` date DEFAULT NULL,
  `dEingetragen` datetime NOT NULL,
  PRIMARY KEY (`kEaKuendigungHistory`)
) ENGINE=MyISAM AUTO_INCREMENT=20541 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teasync_failed`
--

DROP TABLE IF EXISTS `teasync_failed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teasync_failed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payload` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teatarifwechsel_history`
--

DROP TABLE IF EXISTS `teatarifwechsel_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teatarifwechsel_history` (
  `kEaTarifwwechselHistory` int(11) NOT NULL AUTO_INCREMENT,
  `kAdminLogin` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `cTarifNeu` varchar(250) NOT NULL,
  `cTarifAlt` varchar(250) NOT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  `dWechselZum` datetime NOT NULL,
  `bGewechselt` tinyint(4) NOT NULL,
  PRIMARY KEY (`kEaTarifwwechselHistory`)
) ENGINE=MyISAM AUTO_INCREMENT=40297 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempfehlungsliste`
--

DROP TABLE IF EXISTS `tempfehlungsliste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempfehlungsliste` (
  `kEmpfehlungsliste` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccountWerbende` int(10) unsigned NOT NULL,
  `kAnsprechpartner` int(10) unsigned NOT NULL DEFAULT 0,
  `kPlatzierung` int(10) unsigned DEFAULT 0,
  `cIdentifier` varchar(30) DEFAULT NULL,
  `cBundleAngebotsnummer` varchar(50) DEFAULT NULL,
  `cBundleReferenzlink` varchar(255) DEFAULT NULL,
  `cAnmerkung` text DEFAULT NULL,
  `cInternerName` varchar(100) DEFAULT NULL,
  `cBitrixLeadId` varchar(255) DEFAULT NULL,
  `nLinkAufrufe` int(11) NOT NULL DEFAULT 0,
  `nBuchungenNeukunde` int(10) unsigned NOT NULL DEFAULT 0,
  `nBuchungenBestandskunde` int(10) unsigned NOT NULL DEFAULT 0,
  `nPositionenNichtAbhakbar` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nGlobalerRabatt` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nGlobalerRabattMonate` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nAnzahlBearbeitungen` tinyint(3) unsigned DEFAULT 0,
  `nBundle` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dGueltigBis` datetime NOT NULL,
  `dGebucht` datetime DEFAULT NULL,
  `dBearbeitet` datetime DEFAULT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kEmpfehlungsliste`),
  KEY `tempfehlungsliste_cIdentifier_index` (`cIdentifier`),
  KEY `tempfehlungsliste_dErstellt_index` (`dErstellt`),
  KEY `tempfehlungsliste_dGebucht_index` (`dGebucht`),
  KEY `tempfehlungsliste_kAccountWerbende_index` (`kAccountWerbende`)
) ENGINE=InnoDB AUTO_INCREMENT=9057 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempfehlungslistebuchung`
--

DROP TABLE IF EXISTS `tempfehlungslistebuchung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempfehlungslistebuchung` (
  `kEmpfehlungslisteBuchung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kEmpfehlungslisteBuchungParent` int(10) unsigned DEFAULT NULL,
  `kEmpfehlungslistePos` int(10) unsigned DEFAULT NULL,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `kAccountWerbende` int(10) unsigned DEFAULT NULL,
  `kLic` int(10) unsigned DEFAULT NULL,
  `kLicense` int(10) unsigned DEFAULT NULL,
  `kHostingPos` int(10) unsigned DEFAULT NULL,
  `kSearch` int(10) unsigned DEFAULT NULL,
  `k3rdPartyBuchung` int(10) unsigned DEFAULT NULL,
  `cProdukt` varchar(100) DEFAULT NULL,
  `nProvisionsberechtigt` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `cProvisionsunberechtigtGrund` varchar(255) DEFAULT NULL,
  `dProvisionsberechtigungErloschen` datetime DEFAULT NULL,
  `cProvisionsberechtigungErloschenGrund` varchar(255) DEFAULT NULL,
  `nKundentyp` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kEmpfehlungslisteBuchung`),
  KEY `tempfehlungslistebuchung_kAccountWerbende_index` (`kAccountWerbende`),
  KEY `tempfehlungslistebuchung_kAccount_index` (`kAccount`),
  KEY `tempfehlungslistebuchung_kEmpfehlungslistePos_index` (`kEmpfehlungslistePos`),
  KEY `tempfehlungslistebuchung_kHostingPos_index` (`kHostingPos`),
  KEY `tempfehlungslistebuchung_kLic_index` (`kLic`),
  KEY `tempfehlungslistebuchung_kLicense_index` (`kLicense`),
  KEY `tempfehlungslistebuchung_kSearch_index` (`kSearch`)
) ENGINE=InnoDB AUTO_INCREMENT=29237 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempfehlungslistebuchungsfehler`
--

DROP TABLE IF EXISTS `tempfehlungslistebuchungsfehler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempfehlungslistebuchungsfehler` (
  `kEmpfehlungslistePos` int(10) unsigned NOT NULL,
  `kAccount` int(11) DEFAULT NULL,
  `cFehlercode` varchar(255) DEFAULT NULL,
  `cFehler` text DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kEmpfehlungslistePos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempfehlungslisteleistung`
--

DROP TABLE IF EXISTS `tempfehlungslisteleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempfehlungslisteleistung` (
  `kEmpfehlungslisteLeistung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cLeistung` varchar(255) DEFAULT NULL,
  `cProdukt` varchar(100) DEFAULT NULL,
  `cTarif` varchar(50) DEFAULT NULL,
  `cLeistungIdentifier` varchar(100) DEFAULT NULL,
  `cLeistungGroupIdentifier` varchar(100) DEFAULT NULL,
  `fPreisMonatlich` float(10,2) DEFAULT NULL,
  `fPreisEinmalig` float(10,2) DEFAULT NULL,
  `fPreisUeberTarif1` float(10,2) DEFAULT NULL,
  `fPreisUeberTarif2` float(10,2) DEFAULT NULL,
  `cForeignKeyReferenz` varchar(100) DEFAULT NULL,
  `kForeignKeyWert` int(10) unsigned DEFAULT NULL,
  `nVolumenlizenz` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nKostenfreieLizenzen` tinyint(4) NOT NULL DEFAULT 0,
  `cProduktfamilie` varchar(100) DEFAULT NULL,
  `cMoreInfoLink` varchar(255) DEFAULT NULL,
  `cTooltip` text DEFAULT NULL,
  `nRabbatierbar` tinyint(3) unsigned DEFAULT 1,
  `nSEPANotwendig` tinyint(3) unsigned DEFAULT 1,
  `kVorlageSystemmail` int(11) DEFAULT 0,
  `nSort` int(10) unsigned DEFAULT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  PRIMARY KEY (`kEmpfehlungslisteLeistung`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempfehlungslistenichtbuchung`
--

DROP TABLE IF EXISTS `tempfehlungslistenichtbuchung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempfehlungslistenichtbuchung` (
  `kEmpfehlungslistePos` int(10) unsigned NOT NULL,
  `nAktivNichtGebucht` tinyint(3) unsigned DEFAULT NULL,
  `nPositionBereitsGebucht` tinyint(3) unsigned DEFAULT NULL,
  `cBereitsGebuchtDetails` varchar(255) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kEmpfehlungslistePos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempfehlungslistepartneroptin`
--

DROP TABLE IF EXISTS `tempfehlungslistepartneroptin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempfehlungslistepartneroptin` (
  `kAccount` int(10) unsigned DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  UNIQUE KEY `tempfehlungslistepartneroptin_kAccount_uindex` (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempfehlungslistepos`
--

DROP TABLE IF EXISTS `tempfehlungslistepos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempfehlungslistepos` (
  `kEmpfehlungslistePos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kEmpfehlungsliste` int(10) unsigned NOT NULL,
  `kEmpfehlungslistePosParent` int(10) unsigned NOT NULL,
  `kEmpfehlungslisteLeistung` int(10) unsigned NOT NULL,
  `nAnzahl` int(10) unsigned DEFAULT NULL,
  `nAnzahlVeraenderbar` tinyint(3) unsigned DEFAULT 0,
  `cDetailsJSON` text DEFAULT NULL,
  `nErfolgreichGebucht` int(10) unsigned NOT NULL DEFAULT 0,
  `nBuchungsfehler` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`kEmpfehlungslistePos`),
  KEY `tempfehlungslistepos_kEmpfehlungsliste_index` (`kEmpfehlungsliste`),
  KEY `tempfehlungslistepos_kEmpfehlungslisteLeistung_index` (`kEmpfehlungslisteLeistung`)
) ENGINE=InnoDB AUTO_INCREMENT=47929 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempfehlungslistezugang`
--

DROP TABLE IF EXISTS `tempfehlungslistezugang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempfehlungslistezugang` (
  `kAccount` int(10) unsigned NOT NULL,
  `cTyp` varchar(50) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terfahren`
--

DROP TABLE IF EXISTS `terfahren`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terfahren` (
  `kErfahren` int(11) NOT NULL AUTO_INCREMENT,
  `kQuelle` int(11) NOT NULL DEFAULT 0,
  `kAccount` int(11) NOT NULL DEFAULT 0,
  `cBeschreibung` varchar(255) DEFAULT '0',
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kErfahren`),
  UNIQUE KEY `kAccount` (`kAccount`),
  KEY `kQuelle` (`kQuelle`)
) ENGINE=InnoDB AUTO_INCREMENT=65795 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='"Wodurch haben Sie von JTL-Software erfahren?"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terfahrenquelle`
--

DROP TABLE IF EXISTS `terfahrenquelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terfahrenquelle` (
  `kQuelle` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(50) NOT NULL,
  PRIMARY KEY (`kQuelle`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terweiterterstatus`
--

DROP TABLE IF EXISTS `terweiterterstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terweiterterstatus` (
  `kStatus` int(11) NOT NULL AUTO_INCREMENT,
  `cStatusText` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`kStatus`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terweiterung`
--

DROP TABLE IF EXISTS `terweiterung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terweiterung` (
  `kErweiterung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kErweiterungKategorie` int(10) unsigned NOT NULL,
  `kServicepartner` int(10) unsigned NOT NULL DEFAULT 0,
  `kTechnologiepartner` int(10) NOT NULL DEFAULT 0,
  `cName` varchar(255) NOT NULL,
  `cBeschreibung` text NOT NULL,
  `cKurzBeschreibung` varchar(255) NOT NULL,
  `cUrl` varchar(255) NOT NULL,
  `cVersion` varchar(10) NOT NULL,
  `cPluginID` varchar(255) NOT NULL,
  `fPreisNetto` double NOT NULL,
  `bHighlight` tinyint(1) NOT NULL DEFAULT 0,
  `bJtlVerkauf` tinyint(1) NOT NULL DEFAULT 0,
  `dAktualisiert` int(10) NOT NULL,
  `dErstellt` int(10) NOT NULL,
  `bDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `bMarktplatz` tinyint(1) DEFAULT 0,
  `cKompVon` varchar(255) DEFAULT NULL,
  `cKompBis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kErweiterung`),
  KEY `kServicepartner` (`kServicepartner`),
  KEY `kErweiterungKategorie` (`kErweiterungKategorie`),
  KEY `kTechnologiepartner` (`kTechnologiepartner`),
  FULLTEXT KEY `cName` (`cName`,`cBeschreibung`,`cKurzBeschreibung`)
) ENGINE=MyISAM AUTO_INCREMENT=717 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terweiterungbilder`
--

DROP TABLE IF EXISTS `terweiterungbilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terweiterungbilder` (
  `kErweiterungbilder` int(10) NOT NULL AUTO_INCREMENT,
  `kErweiterung` int(10) unsigned NOT NULL,
  `cPfad` varchar(255) NOT NULL,
  `bStandard` tinyint(1) NOT NULL,
  PRIMARY KEY (`kErweiterungbilder`),
  KEY `kErweiterung` (`kErweiterung`)
) ENGINE=MyISAM AUTO_INCREMENT=2254 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terweiterungkategorie`
--

DROP TABLE IF EXISTS `terweiterungkategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terweiterungkategorie` (
  `kErweiterungkategorie` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kVaterkategorie` int(10) unsigned NOT NULL DEFAULT 0,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kErweiterungkategorie`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terweiterungredirect`
--

DROP TABLE IF EXISTS `terweiterungredirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terweiterungredirect` (
  `kErweiterungdownload` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kErweiterung` int(10) unsigned NOT NULL,
  `cIP` varchar(255) NOT NULL,
  `dErstellt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kErweiterungdownload`),
  KEY `kErweiterung` (`kErweiterung`)
) ENGINE=MyISAM AUTO_INCREMENT=146416 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terweiterungview`
--

DROP TABLE IF EXISTS `terweiterungview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terweiterungview` (
  `kErweiterungview` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kErweiterung` int(10) unsigned NOT NULL,
  `cIP` varchar(255) NOT NULL,
  `dErstellt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kErweiterungview`),
  KEY `kErweiterung` (`kErweiterung`)
) ENGINE=MyISAM AUTO_INCREMENT=8814 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tevent`
--

DROP TABLE IF EXISTS `tevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tevent` (
  `kEvent` int(11) NOT NULL AUTO_INCREMENT,
  `eKategorie` enum('','ROADSHOW') NOT NULL DEFAULT '',
  `cName` varchar(255) DEFAULT NULL,
  `cLogo` varchar(255) DEFAULT NULL,
  `dDatumBeginn` date DEFAULT NULL,
  `dDatumEnde` date DEFAULT NULL,
  `cStrasse` varchar(255) DEFAULT NULL,
  `cOrt` varchar(255) DEFAULT NULL,
  `cOrtName` varchar(255) DEFAULT NULL,
  `cPLZ` varchar(10) DEFAULT NULL,
  `cLand` varchar(255) DEFAULT NULL,
  `cKurzbeschreibung` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  `nTerminBuchen` tinyint(4) DEFAULT 0,
  `nAktiv` tinyint(4) NOT NULL DEFAULT 0,
  `cLink` varchar(255) DEFAULT '0',
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `dErstellt` datetime DEFAULT NULL,
  `dAenderung` datetime DEFAULT NULL,
  PRIMARY KEY (`kEvent`),
  KEY `dDatumBeginn` (`dDatumBeginn`),
  KEY `dDatumEnde` (`dDatumEnde`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tfremdlizenz`
--

DROP TABLE IF EXISTS `tfremdlizenz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tfremdlizenz` (
  `kFremdlizenz` int(11) NOT NULL AUTO_INCREMENT,
  `kErweiterung` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `cDomain` varchar(100) NOT NULL,
  `cRechnungsnr` varchar(100) NOT NULL,
  `cKommentar` longtext NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kFremdlizenz`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tfulfillment`
--

DROP TABLE IF EXISTS `tfulfillment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tfulfillment` (
  `kFN` varchar(255) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `kLicense` int(11) DEFAULT NULL,
  `cToken` varchar(255) DEFAULT NULL,
  `dCreated` datetime DEFAULT NULL,
  `dUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`kFN`),
  UNIQUE KEY `kAccount` (`kAccount`),
  UNIQUE KEY `kLicense` (`kLicense`),
  UNIQUE KEY `cToken` (`cToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tfulfillmenterror`
--

DROP TABLE IF EXISTS `tfulfillmenterror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tfulfillmenterror` (
  `kError` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `cBody` text DEFAULT NULL,
  `cPost` text DEFAULT NULL,
  `nHTTPCode` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kError`),
  KEY `kAccount` (`kAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tgeschaeftsform`
--

DROP TABLE IF EXISTS `tgeschaeftsform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tgeschaeftsform` (
  `kGeschaeftsform` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kGeschaeftsform`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tguthaben`
--

DROP TABLE IF EXISTS `tguthaben`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tguthaben` (
  `kGuthaben` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `fGuthaben` float(10,2) NOT NULL,
  `cGuthabenGrund` varchar(255) NOT NULL,
  `dGuthabenErstellt` date DEFAULT NULL,
  PRIMARY KEY (`kGuthaben`)
) ENGINE=MyISAM AUTO_INCREMENT=4666 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tguthabenverrechnet`
--

DROP TABLE IF EXISTS `tguthabenverrechnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tguthabenverrechnet` (
  `kGuthabenVerrechnet` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kRechnung` int(11) NOT NULL,
  `fBetrag` float(10,2) NOT NULL,
  `dGuthabenVerrechnet` date DEFAULT NULL,
  PRIMARY KEY (`kGuthabenVerrechnet`)
) ENGINE=MyISAM AUTO_INCREMENT=5432 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thilfsmittel`
--

DROP TABLE IF EXISTS `thilfsmittel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thilfsmittel` (
  `kHilfsmittel` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kHilfsmittelRubrik` int(10) unsigned DEFAULT NULL,
  `cName` varchar(100) DEFAULT NULL,
  `cErgaenzungName` varchar(50) DEFAULT NULL,
  `cErgaenzung` text DEFAULT NULL,
  `nErgaenzungDownload` tinyint(3) unsigned DEFAULT NULL,
  `cURLName` varchar(50) DEFAULT NULL,
  `cURL` varchar(255) DEFAULT NULL,
  `nURLAktion` tinyint(3) unsigned DEFAULT NULL,
  `cEinverstaendnis` text DEFAULT NULL,
  `cEinverstaendnisHilfetext` text DEFAULT NULL,
  `cDownloadButtonName` varchar(50) NOT NULL DEFAULT 'Download',
  `cDateiPfad` varchar(255) DEFAULT NULL,
  `cUrlDownloadExtern` varchar(255) DEFAULT NULL,
  `dTermin` datetime DEFAULT NULL,
  `dGueltigAb` datetime DEFAULT NULL,
  `dGueltigBis` datetime DEFAULT NULL,
  `nDownloadCounter` int(10) unsigned DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  `cBearbeiter` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kHilfsmittel`),
  KEY `ix_kHilfsmittelRubrik` (`kHilfsmittelRubrik`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thilfsmittelrubrik`
--

DROP TABLE IF EXISTS `thilfsmittelrubrik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thilfsmittelrubrik` (
  `kHilfsmittelRubrik` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(75) DEFAULT NULL,
  `cInternerKommentar` varchar(200) DEFAULT NULL,
  `nSort` tinyint(3) unsigned DEFAULT NULL,
  `cDescription` text DEFAULT NULL,
  `cDescriptionImage` varchar(255) DEFAULT NULL,
  `cParentPagePath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`kHilfsmittelRubrik`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thilfsmittelsichtbarkeit`
--

DROP TABLE IF EXISTS `thilfsmittelsichtbarkeit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thilfsmittelsichtbarkeit` (
  `kHilfsmittel` int(10) unsigned DEFAULT NULL,
  `kAccountRolle` int(10) unsigned DEFAULT NULL,
  KEY `ix` (`kHilfsmittel`,`kAccountRolle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thosting`
--

DROP TABLE IF EXISTS `thosting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thosting` (
  `kHosting` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `cKommentar` text DEFAULT NULL,
  `nLastschrift` tinyint(3) unsigned DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `nLocked` tinyint(4) DEFAULT 0,
  `cNotfallMail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kHosting`),
  KEY `kAccount` (`kAccount`),
  KEY `nAktiv` (`nAktiv`),
  KEY `nLastschrift` (`nLastschrift`)
) ENGINE=MyISAM AUTO_INCREMENT=10613 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingamazonpayaktion`
--

DROP TABLE IF EXISTS `thostingamazonpayaktion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingamazonpayaktion` (
  `kHostingPos` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kHostingPos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingdawandaaktion`
--

DROP TABLE IF EXISTS `thostingdawandaaktion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingdawandaaktion` (
  `kHostingPos` int(13) NOT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kHostingPos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingdomaincheck`
--

DROP TABLE IF EXISTS `thostingdomaincheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingdomaincheck` (
  `kDomaincheck` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) DEFAULT NULL,
  `cDomain` varchar(255) NOT NULL,
  `cTLD` varchar(10) NOT NULL,
  `bValid` tinyint(4) NOT NULL,
  `bAvailable` tinyint(4) NOT NULL,
  `cWhoIsXmlResponse` text DEFAULT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kDomaincheck`)
) ENGINE=InnoDB AUTO_INCREMENT=10753 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostinginitialdaten`
--

DROP TABLE IF EXISTS `thostinginitialdaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostinginitialdaten` (
  `kHostingInitialDaten` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kHostingPos` int(11) NOT NULL,
  `kServer` int(11) NOT NULL,
  `cBenutzer` blob NOT NULL,
  `cBenutzerPasswort` blob NOT NULL,
  `cDBName` blob NOT NULL,
  `cDBPasswort` blob NOT NULL,
  `cDomain` varchar(250) NOT NULL,
  `cServerPfad` blob NOT NULL,
  `cBenutzerRechte` blob NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kHostingInitialDaten`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingkuendigungdatensicherung`
--

DROP TABLE IF EXISTS `thostingkuendigungdatensicherung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingkuendigungdatensicherung` (
  `kDatensicherung` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `nDatensicherung` tinyint(4) NOT NULL DEFAULT 0,
  `dDatensicherung` date DEFAULT NULL,
  `cDatensicherungUhrzeit` varchar(50) DEFAULT NULL,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `nErledigt` tinyint(4) NOT NULL DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  `dErledigt` datetime DEFAULT NULL,
  PRIMARY KEY (`kDatensicherung`),
  KEY `kHostingPos` (`kHostingPos`),
  KEY `kAccount` (`kAccount`),
  KEY `kAdminlogin` (`kAdminlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=5452 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingkuendigungdomain`
--

DROP TABLE IF EXISTS `thostingkuendigungdomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingkuendigungdomain` (
  `kDomain` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) NOT NULL DEFAULT 0,
  `kAccount` int(11) NOT NULL,
  `cDomain` varchar(255) NOT NULL,
  `ePosTyp` enum('','ZUSATZDOMAIN','MODUL') NOT NULL,
  `nDomain` tinyint(4) NOT NULL,
  `nErledigt` tinyint(4) NOT NULL DEFAULT 0,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `dErledigt` datetime DEFAULT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kDomain`),
  KEY `kAccount` (`kAccount`),
  KEY `kAdminlogin` (`kAdminlogin`),
  KEY `kHostingPos` (`kHostingPos`)
) ENGINE=InnoDB AUTO_INCREMENT=5119 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingkuendigunggruende`
--

DROP TABLE IF EXISTS `thostingkuendigunggruende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingkuendigunggruende` (
  `kGrund` int(11) NOT NULL AUTO_INCREMENT,
  `cText` varchar(255) NOT NULL,
  `nSort` tinyint(4) NOT NULL,
  PRIMARY KEY (`kGrund`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingkuendigunggrund`
--

DROP TABLE IF EXISTS `thostingkuendigunggrund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingkuendigunggrund` (
  `kGrund` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) NOT NULL,
  `cGrund` text NOT NULL,
  `kAuswahl` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `nErledigt` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kGrund`),
  KEY `kHostingPos` (`kHostingPos`),
  KEY `kAdminlogin` (`kAdminlogin`,`nErledigt`)
) ENGINE=InnoDB AUTO_INCREMENT=7315 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingkuendigungsearch`
--

DROP TABLE IF EXISTS `thostingkuendigungsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingkuendigungsearch` (
  `kKuendigungSearch` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) NOT NULL,
  `kSearch` int(11) NOT NULL,
  `nSearch` tinyint(4) NOT NULL COMMENT '1 weiterverwenden, 2 loeschen / nicht weiterverwenden',
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `nErledigt` tinyint(4) NOT NULL DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  `dErledigt` datetime DEFAULT NULL,
  PRIMARY KEY (`kKuendigungSearch`),
  UNIQUE KEY `kHostingPos` (`kHostingPos`),
  UNIQUE KEY `kSearch` (`kSearch`)
) ENGINE=InnoDB AUTO_INCREMENT=1757 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingleistung`
--

DROP TABLE IF EXISTS `thostingleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingleistung` (
  `kProduktLeistung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kKaufProdukt` int(11) NOT NULL,
  `cName` varchar(255) NOT NULL,
  `cInfo` text NOT NULL,
  `nKostenMonat` float NOT NULL DEFAULT 0,
  `nKostenEinrichtung` float NOT NULL DEFAULT 0,
  `bSichtbar` int(11) NOT NULL,
  `bDomainRequired` tinyint(4) NOT NULL DEFAULT 0,
  `cRechnungposTyp` varchar(30) NOT NULL,
  `nSort` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kProduktLeistung`),
  KEY `bDomainRequired` (`bDomainRequired`,`nSort`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingleistungextra`
--

DROP TABLE IF EXISTS `thostingleistungextra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingleistungextra` (
  `kProduktLeistungExtra` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kKaufProdukt` int(11) NOT NULL DEFAULT 0,
  `kProduktLeistungGruppe` int(10) NOT NULL,
  `cName` varchar(255) NOT NULL,
  `cBeschreibung` varchar(255) NOT NULL DEFAULT '',
  `eType` enum('','SELECT','INPUT','CHECKBOX') NOT NULL,
  `ePosTyp` enum('','MODUL','ZUSATZDOMAIN','ZUSATZMANDANT') NOT NULL,
  `eData` text NOT NULL,
  `nKostenMonat` float NOT NULL DEFAULT 0,
  `nKostenEinrichtung` float NOT NULL DEFAULT 0,
  `bRequire` tinyint(1) NOT NULL DEFAULT 0,
  `nMehrfach` enum('0','1') NOT NULL DEFAULT '0',
  `cURL` varchar(255) NOT NULL,
  `nInklusive` tinyint(4) NOT NULL DEFAULT 0,
  `nSort` int(11) DEFAULT NULL,
  PRIMARY KEY (`kProduktLeistungExtra`),
  KEY `nInklusive` (`nInklusive`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingleistungextradomain`
--

DROP TABLE IF EXISTS `thostingleistungextradomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingleistungextradomain` (
  `kHostingLeistungExtraDomain` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  `fPreis` float(10,2) DEFAULT NULL,
  `nSort` int(11) DEFAULT NULL,
  PRIMARY KEY (`kHostingLeistungExtraDomain`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingleistunggruppe`
--

DROP TABLE IF EXISTS `thostingleistunggruppe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingleistunggruppe` (
  `kProduktLeistungGruppe` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kProduktLeistung` int(10) unsigned NOT NULL,
  `cName` varchar(255) NOT NULL,
  `bPrice` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`kProduktLeistungGruppe`),
  KEY `kProduktLeistung` (`kProduktLeistung`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingleistungmerkmal`
--

DROP TABLE IF EXISTS `thostingleistungmerkmal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingleistungmerkmal` (
  `kMerkmal` int(11) NOT NULL AUTO_INCREMENT,
  `kProduktLeistung` int(11) NOT NULL,
  `cKey` varchar(255) NOT NULL,
  `cValue` varchar(255) NOT NULL,
  `nSort` tinyint(4) NOT NULL,
  PRIMARY KEY (`kMerkmal`),
  KEY `kProduktLeistung` (`kProduktLeistung`),
  KEY `nSort` (`nSort`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingpos`
--

DROP TABLE IF EXISTS `thostingpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingpos` (
  `kHostingPos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kVaterHostingPos` int(10) unsigned NOT NULL DEFAULT 0,
  `kHosting` int(10) unsigned DEFAULT NULL,
  `kHostingLeistung` int(10) NOT NULL DEFAULT 0,
  `kHostingLeistungExtra` int(10) NOT NULL DEFAULT 0,
  `kHostingPosUpgrade` varchar(50) NOT NULL DEFAULT '',
  `kServer` int(10) unsigned NOT NULL DEFAULT 0,
  `ePosTyp` enum('','MODUL','ZUSATZDOMAIN','ZUSATZMANDANT') NOT NULL DEFAULT '',
  `eStatus` enum('AKTIV','BEARBEITUNG','GEKUENDIGT','INAKTIV','OFFEN','ENTFERNT') NOT NULL DEFAULT 'BEARBEITUNG',
  `eKuendigungDurch` enum('JTL-Admin','Email','Kundencenter','Fax','Post','Ticketsystem','SPERRE','') NOT NULL DEFAULT '',
  `cStatusErweitert` varchar(250) NOT NULL DEFAULT 'Kein Eintrag',
  `cKommentar` longtext NOT NULL,
  `cNotiz` text DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `fKostenMonat` double DEFAULT NULL,
  `fKostenEinrichtung` double DEFAULT NULL,
  `nAbrechnungsintervall` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `nLaufzeit` tinyint(4) NOT NULL DEFAULT 1,
  `cHostingDomain` varchar(255) NOT NULL DEFAULT '',
  `cAdminName` varchar(255) NOT NULL DEFAULT '',
  `cAdminPass` varchar(255) DEFAULT NULL,
  `cEinrichtungWunschTermin` varchar(50) DEFAULT NULL,
  `cSyncName` varchar(255) NOT NULL DEFAULT '',
  `cSyncPass` varchar(255) DEFAULT NULL,
  `cHostingName` varchar(255) DEFAULT NULL,
  `cHostingPasswort` varchar(255) NOT NULL DEFAULT '',
  `cTestShopUrl` varchar(255) NOT NULL DEFAULT '',
  `cDomainKuendigung` varchar(250) NOT NULL DEFAULT '',
  `nDatenUebernahme` int(11) NOT NULL DEFAULT 0,
  `nDatenbankUebernahme` int(11) NOT NULL DEFAULT 0,
  `nServertyp` int(11) DEFAULT NULL,
  `cDetailstatusText` text DEFAULT NULL,
  `nServerUpgrade` tinyint(4) NOT NULL DEFAULT 0,
  `nFTPDaten` tinyint(4) NOT NULL DEFAULT 0,
  `cFTPDaten` blob DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  `dAktivSeit` date DEFAULT NULL,
  `dZuletztAbgerechnetBis` date DEFAULT NULL,
  `dAbbestellt` datetime DEFAULT NULL,
  `dAbbestelltZum` datetime DEFAULT NULL,
  `dZuletztBearbeitet` datetime DEFAULT NULL,
  PRIMARY KEY (`kHostingPos`),
  KEY `kHosting` (`kHosting`),
  KEY `kVaterHostingPos` (`kVaterHostingPos`),
  KEY `kHostingLeistung` (`kHostingLeistung`),
  KEY `kServer` (`kServer`),
  KEY `ePosTyp` (`ePosTyp`),
  KEY `eStatus` (`eStatus`),
  KEY `cHostingDomain` (`cHostingDomain`),
  KEY `cName` (`cName`),
  KEY `dErstellt` (`dErstellt`),
  KEY `dAktivSeit` (`dAktivSeit`),
  KEY `dZuletztAbgerechnetBis` (`dZuletztAbgerechnetBis`)
) ENGINE=MyISAM AUTO_INCREMENT=44472 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingpos_20200113`
--

DROP TABLE IF EXISTS `thostingpos_20200113`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingpos_20200113` (
  `kHostingPos` int(10) unsigned NOT NULL DEFAULT 0,
  `kVaterHostingPos` int(10) unsigned NOT NULL DEFAULT 0,
  `kHosting` int(10) unsigned DEFAULT NULL,
  `kHostingLeistung` int(10) NOT NULL DEFAULT 0,
  `kHostingLeistungExtra` int(10) NOT NULL DEFAULT 0,
  `kHostingPosUpgrade` varchar(50) NOT NULL DEFAULT '',
  `kServer` int(10) unsigned NOT NULL DEFAULT 0,
  `ePosTyp` enum('','MODUL','ZUSATZDOMAIN','ZUSATZMANDANT') NOT NULL DEFAULT '',
  `eStatus` enum('AKTIV','BEARBEITUNG','GEKUENDIGT','INAKTIV','OFFEN','ENTFERNT') NOT NULL DEFAULT 'BEARBEITUNG',
  `eKuendigungDurch` enum('JTL-Admin','Email','Kundencenter','Fax','Post','Ticketsystem','SPERRE','') NOT NULL DEFAULT '',
  `cStatusErweitert` varchar(250) NOT NULL DEFAULT 'Kein Eintrag',
  `cKommentar` longtext NOT NULL,
  `cNotiz` text DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `fKostenMonat` double DEFAULT NULL,
  `fKostenEinrichtung` double DEFAULT NULL,
  `nAbrechnungsintervall` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `nLaufzeit` tinyint(4) NOT NULL DEFAULT 1,
  `cHostingDomain` varchar(255) NOT NULL DEFAULT '',
  `cAdminName` varchar(255) NOT NULL DEFAULT '',
  `cEinrichtungWunschTermin` varchar(50) NOT NULL DEFAULT '',
  `cSyncName` varchar(255) NOT NULL DEFAULT '',
  `cHostingPasswort` varchar(255) NOT NULL DEFAULT '',
  `cTestShopUrl` varchar(255) NOT NULL DEFAULT '',
  `cDomainKuendigung` varchar(250) NOT NULL DEFAULT '',
  `nDatenUebernahme` int(11) NOT NULL DEFAULT 0,
  `nDatenbankUebernahme` int(11) NOT NULL DEFAULT 0,
  `nServertyp` int(11) DEFAULT NULL,
  `cDetailstatusText` text NOT NULL,
  `nServerUpgrade` tinyint(4) NOT NULL DEFAULT 0,
  `nFTPDaten` tinyint(4) NOT NULL DEFAULT 0,
  `cFTPDaten` blob DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  `dAktivSeit` date DEFAULT NULL,
  `dZuletztAbgerechnetBis` date DEFAULT NULL,
  `dAbbestellt` datetime DEFAULT NULL,
  `dAbbestelltZum` datetime DEFAULT NULL,
  `dZuletztBearbeitet` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingpos_changed`
--

DROP TABLE IF EXISTS `thostingpos_changed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingpos_changed` (
  `kHostingPos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kVaterHostingPos` int(10) unsigned NOT NULL DEFAULT 0,
  `kHosting` int(10) unsigned DEFAULT NULL,
  `kHostingLeistung` int(10) NOT NULL DEFAULT 0,
  `kHostingLeistungExtra` int(10) NOT NULL DEFAULT 0,
  `kHostingPosUpgrade` varchar(50) NOT NULL DEFAULT '',
  `kServer` int(10) unsigned NOT NULL DEFAULT 0,
  `ePosTyp` enum('','MODUL','ZUSATZDOMAIN','ZUSATZMANDANT') NOT NULL DEFAULT '',
  `eStatus` enum('AKTIV','BEARBEITUNG','GEKUENDIGT','INAKTIV','OFFEN','ENTFERNT') NOT NULL DEFAULT 'BEARBEITUNG',
  `eKuendigungDurch` enum('JTL-Admin','Email','Kundencenter','Fax','Post','Ticketsystem','SPERRE','') NOT NULL DEFAULT '',
  `cStatusErweitert` varchar(250) NOT NULL DEFAULT 'Kein Eintrag',
  `cKommentar` longtext NOT NULL,
  `cNotiz` text DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `fKostenMonat` double DEFAULT NULL,
  `fKostenEinrichtung` double DEFAULT NULL,
  `nAbrechnungsintervall` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `nLaufzeit` tinyint(4) NOT NULL DEFAULT 1,
  `cHostingDomain` varchar(255) NOT NULL DEFAULT '',
  `cAdminName` varchar(255) NOT NULL DEFAULT '',
  `cEinrichtungWunschTermin` varchar(50) NOT NULL DEFAULT '',
  `cSyncName` varchar(255) NOT NULL DEFAULT '',
  `cHostingPasswort` varchar(255) NOT NULL DEFAULT '',
  `cTestShopUrl` varchar(255) NOT NULL DEFAULT '',
  `cDomainKuendigung` varchar(250) NOT NULL DEFAULT '',
  `nDatenUebernahme` int(11) NOT NULL DEFAULT 0,
  `nDatenbankUebernahme` int(11) NOT NULL DEFAULT 0,
  `nServertyp` int(11) DEFAULT NULL,
  `cDetailstatusText` text NOT NULL,
  `nServerUpgrade` tinyint(4) NOT NULL DEFAULT 0,
  `nFTPDaten` tinyint(4) NOT NULL DEFAULT 0,
  `cFTPDaten` blob DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  `dAktivSeit` date DEFAULT NULL,
  `dZuletztAbgerechnetBis` date DEFAULT NULL,
  `dAbbestellt` datetime DEFAULT NULL,
  `dAbbestelltZum` datetime DEFAULT NULL,
  `dZuletztBearbeitet` datetime DEFAULT NULL,
  PRIMARY KEY (`kHostingPos`),
  KEY `kHosting` (`kHosting`),
  KEY `kVaterHostingPos` (`kVaterHostingPos`),
  KEY `kHostingLeistung` (`kHostingLeistung`),
  KEY `kServer` (`kServer`),
  KEY `ePosTyp` (`ePosTyp`),
  KEY `eStatus` (`eStatus`),
  KEY `cHostingDomain` (`cHostingDomain`),
  KEY `cName` (`cName`),
  KEY `dErstellt` (`dErstellt`),
  KEY `dAktivSeit` (`dAktivSeit`),
  KEY `dZuletztAbgerechnetBis` (`dZuletztAbgerechnetBis`)
) ENGINE=MyISAM AUTO_INCREMENT=28753 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingposactive`
--

DROP TABLE IF EXISTS `thostingposactive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingposactive` (
  `kHostingLeistung` int(11) NOT NULL,
  `kHostingLeistungExtra` varchar(50) NOT NULL,
  `cMonat` varchar(50) NOT NULL,
  `nAnzahl` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kHostingLeistung`,`kHostingLeistungExtra`,`cMonat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingposdomainauthcode`
--

DROP TABLE IF EXISTS `thostingposdomainauthcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingposdomainauthcode` (
  `kAuthCode` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) NOT NULL,
  `cDomain` varchar(255) NOT NULL,
  `cAuthCode` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kAuthCode`),
  KEY `kHostingPos` (`kHostingPos`),
  KEY `cDomain` (`cDomain`)
) ENGINE=InnoDB AUTO_INCREMENT=9149 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingposextra`
--

DROP TABLE IF EXISTS `thostingposextra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingposextra` (
  `kHostingPosExtra` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(10) unsigned DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cWert` varchar(255) DEFAULT NULL,
  `nAufRechnung` tinyint(3) unsigned DEFAULT NULL,
  `cDomainUebernahme` varchar(255) NOT NULL,
  `cDomainKuendigung` varchar(250) NOT NULL,
  PRIMARY KEY (`kHostingPosExtra`),
  KEY `kHostingPos` (`kHostingPos`),
  KEY `cName` (`cName`)
) ENGINE=MyISAM AUTO_INCREMENT=12615 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingposextrahistory`
--

DROP TABLE IF EXISTS `thostingposextrahistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingposextrahistory` (
  `kHostingPosExtraHistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kHostingPosExtra` int(10) unsigned NOT NULL,
  `kHostingPos` int(10) unsigned DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `cWert` varchar(255) DEFAULT NULL,
  `nAufRechnung` tinyint(3) unsigned DEFAULT NULL,
  `cDomainUebernahme` varchar(255) NOT NULL,
  `cDomainKuendigung` varchar(250) NOT NULL,
  `dGeloescht` datetime NOT NULL,
  `bErledigt` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`kHostingPosExtraHistory`)
) ENGINE=MyISAM AUTO_INCREMENT=6976 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingposhistory`
--

DROP TABLE IF EXISTS `thostingposhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingposhistory` (
  `kHostingPosHistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) NOT NULL,
  `kVaterHostingPos` int(10) unsigned NOT NULL DEFAULT 0,
  `kHosting` int(10) unsigned DEFAULT NULL,
  `kHostingLeistung` int(10) NOT NULL DEFAULT 0,
  `kHostingLeistungExtra` int(10) NOT NULL DEFAULT 0,
  `kHostingPosUpgrade` varchar(50) NOT NULL DEFAULT '',
  `kServer` int(10) unsigned NOT NULL DEFAULT 0,
  `ePosTyp` enum('','MODUL','ZUSATZDOMAIN','ZUSATZMANDANT') NOT NULL DEFAULT '',
  `eStatus` enum('AKTIV','BEARBEITUNG','GEKUENDIGT','INAKTIV','OFFEN','ENTFERNT') NOT NULL DEFAULT 'BEARBEITUNG',
  `eKuendigungDurch` enum('JTL-Admin','Email','Kundencenter','Fax','Post','Ticketsystem','SPERRE','') NOT NULL DEFAULT '',
  `cStatusErweitert` longtext NOT NULL,
  `cKommentar` longtext NOT NULL,
  `cNotiz` text DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `fKostenMonat` double DEFAULT NULL,
  `fKostenEinrichtung` double DEFAULT NULL,
  `nAbrechnungsintervall` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `nLaufzeit` tinyint(4) NOT NULL DEFAULT 1,
  `cHostingDomain` varchar(255) NOT NULL DEFAULT '',
  `cAdminName` varchar(255) NOT NULL DEFAULT '',
  `cAdminPass` varchar(255) DEFAULT NULL,
  `cEinrichtungWunschTermin` varchar(50) DEFAULT '',
  `cSyncName` varchar(255) NOT NULL DEFAULT '',
  `cSyncPass` varchar(255) DEFAULT NULL,
  `cHostingName` varchar(255) DEFAULT NULL,
  `cHostingPasswort` varchar(255) NOT NULL DEFAULT '',
  `cTestShopUrl` varchar(255) NOT NULL DEFAULT '',
  `cDomainKuendigung` varchar(250) NOT NULL DEFAULT '',
  `nDatenUebernahme` int(11) NOT NULL,
  `nDatenbankUebernahme` int(11) NOT NULL DEFAULT 0,
  `nServertyp` int(11) DEFAULT NULL,
  `cDetailstatusText` text DEFAULT NULL,
  `nServerUpgrade` tinyint(4) NOT NULL DEFAULT 0,
  `nFTPDaten` tinyint(4) NOT NULL DEFAULT 0,
  `cFTPDaten` blob DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  `dAktivSeit` date DEFAULT NULL,
  `dZuletztAbgerechnetBis` date DEFAULT NULL,
  `dAbbestellt` datetime DEFAULT NULL,
  `dAbbestelltZum` datetime DEFAULT NULL,
  `dZuletztBearbeitet` datetime DEFAULT NULL,
  `dGeloescht` datetime DEFAULT NULL,
  `bErledigt` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`kHostingPosHistory`),
  KEY `kHostingPos` (`kHostingPos`),
  KEY `kVaterHostingPos` (`kVaterHostingPos`),
  KEY `kHosting` (`kHosting`),
  KEY `kHostingLeistung` (`kHostingLeistung`),
  KEY `kHostingLeistungExtra` (`kHostingLeistungExtra`),
  KEY `kServer` (`kServer`),
  KEY `eStatus` (`eStatus`),
  KEY `dGeloescht` (`dGeloescht`),
  KEY `cHostingDomain` (`cHostingDomain`),
  KEY `cName` (`cName`),
  KEY `dAktivSeit` (`dAktivSeit`),
  KEY `dZuletztAbgerechnetBis` (`dZuletztAbgerechnetBis`)
) ENGINE=MyISAM AUTO_INCREMENT=44778 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingposlizenz`
--

DROP TABLE IF EXISTS `thostingposlizenz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingposlizenz` (
  `kHostingPos` int(11) NOT NULL,
  `kLizenz` int(11) NOT NULL,
  PRIMARY KEY (`kHostingPos`,`kLizenz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingpossearch`
--

DROP TABLE IF EXISTS `thostingpossearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingpossearch` (
  `kHostingPos` int(11) NOT NULL,
  `kSearch` int(11) NOT NULL,
  PRIMARY KEY (`kHostingPos`,`kSearch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingpossperre`
--

DROP TABLE IF EXISTS `thostingpossperre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingpossperre` (
  `kSperre` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) NOT NULL,
  `kAuftrag` int(11) NOT NULL,
  `dAuftrag` datetime NOT NULL,
  `kSperrung` int(11) NOT NULL,
  `dSperrung` datetime DEFAULT NULL,
  `kAufgehoben` int(11) NOT NULL,
  `dAufgehoben` datetime DEFAULT NULL,
  `kGeloest` int(11) DEFAULT 0,
  `dGeloest` datetime DEFAULT NULL,
  `kBereich` tinyint(1) NOT NULL,
  `kGrund` tinyint(1) NOT NULL,
  `cGrund` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cIntVermerk` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nStatus` tinyint(1) NOT NULL DEFAULT 1,
  `dKuendigung` datetime DEFAULT NULL,
  PRIMARY KEY (`kSperre`),
  KEY `kAdminlogin` (`kAuftrag`),
  KEY `kSperrung` (`kSperrung`),
  KEY `kAufgehoben` (`kAufgehoben`),
  KEY `kGeloest` (`kGeloest`),
  KEY `kHostingPos` (`kHostingPos`)
) ENGINE=InnoDB AUTO_INCREMENT=3076 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingpossperrebereich`
--

DROP TABLE IF EXISTS `thostingpossperrebereich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingpossperrebereich` (
  `kBereich` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kBereich`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingpossperregrund`
--

DROP TABLE IF EXISTS `thostingpossperregrund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingpossperregrund` (
  `kGrund` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kGrund`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingpossperrehistory`
--

DROP TABLE IF EXISTS `thostingpossperrehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingpossperrehistory` (
  `kHistory` int(11) NOT NULL AUTO_INCREMENT,
  `kSperre` int(11) DEFAULT NULL,
  `kHostingPos` int(11) NOT NULL,
  `kAuftrag` int(11) NOT NULL,
  `dAuftrag` datetime NOT NULL,
  `kSperrung` int(11) NOT NULL,
  `dSperrung` datetime DEFAULT NULL,
  `kAufgehoben` int(11) NOT NULL,
  `dAufgehoben` datetime DEFAULT NULL,
  `kGeloest` int(11) DEFAULT 0,
  `dGeloest` datetime DEFAULT NULL,
  `kBereich` tinyint(1) NOT NULL,
  `kGrund` tinyint(1) NOT NULL,
  `cGrund` varchar(255) NOT NULL,
  `cIntVermerk` text NOT NULL,
  `nStatus` tinyint(1) NOT NULL DEFAULT 1,
  `dKuendigung` datetime DEFAULT NULL,
  PRIMARY KEY (`kHistory`),
  KEY `kAdminlogin` (`kAuftrag`),
  KEY `kSperrung` (`kSperrung`),
  KEY `kAufgehoben` (`kAufgehoben`),
  KEY `kGeloest` (`kGeloest`),
  KEY `kHostingPos` (`kHostingPos`)
) ENGINE=InnoDB AUTO_INCREMENT=2219 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingpostag`
--

DROP TABLE IF EXISTS `thostingpostag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingpostag` (
  `kHostingPosTag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(10) unsigned DEFAULT NULL,
  `kTag` int(10) unsigned DEFAULT NULL,
  `kAdminLogin` int(11) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kHostingPosTag`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingposupgrade`
--

DROP TABLE IF EXISTS `thostingposupgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingposupgrade` (
  `kUpgrade` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPosAlt` int(11) NOT NULL,
  `kHostingPosNeu` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  PRIMARY KEY (`kUpgrade`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingredisinstanz`
--

DROP TABLE IF EXISTS `thostingredisinstanz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingredisinstanz` (
  `kInstanz` int(11) NOT NULL AUTO_INCREMENT,
  `kServer` int(11) DEFAULT NULL,
  `kHostingPos` int(11) DEFAULT NULL,
  `nPort` int(11) DEFAULT NULL,
  `cPasswort` blob DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  PRIMARY KEY (`kInstanz`),
  KEY `kServer` (`kServer`),
  KEY `kHostingPos` (`kHostingPos`)
) ENGINE=InnoDB AUTO_INCREMENT=7916 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingredisserver`
--

DROP TABLE IF EXISTS `thostingredisserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingredisserver` (
  `kServer` int(11) NOT NULL AUTO_INCREMENT,
  `cDomain` varchar(50) NOT NULL,
  `cIP` varchar(50) NOT NULL,
  `nAktiv` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kServer`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingsqldata`
--

DROP TABLE IF EXISTS `thostingsqldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingsqldata` (
  `kHostingsqldata` varchar(255) NOT NULL,
  `kHostingPos` int(11) NOT NULL,
  `cInstanceShort` text NOT NULL,
  `cPort` text NOT NULL,
  `cSqlPassword` text NOT NULL,
  `cSqlUser` text NOT NULL,
  `cSqlUserPass` text NOT NULL,
  `dUpdate` datetime DEFAULT NULL,
  `kAdminlogin` int(11) DEFAULT NULL,
  KEY `kHostingPos` (`kHostingPos`),
  KEY `kAdminlogin` (`kAdminlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=365 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingsqlinstallqueue`
--

DROP TABLE IF EXISTS `thostingsqlinstallqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingsqlinstallqueue` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(13) NOT NULL DEFAULT 0,
  `kHostingsqldata` int(13) NOT NULL DEFAULT 0,
  `instancename` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `instanceuser` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `kHostingPos` (`kHostingPos`),
  KEY `kHostingsqldata` (`kHostingsqldata`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingsslzertifikat`
--

DROP TABLE IF EXISTS `thostingsslzertifikat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingsslzertifikat` (
  `kSSLZertifikat` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) DEFAULT NULL,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `cOrderID` varchar(50) DEFAULT NULL,
  `cCSR` text DEFAULT NULL,
  `cPKey` text DEFAULT NULL,
  `cCRT` text DEFAULT NULL,
  `cCA` text DEFAULT NULL,
  `dAusstellung` date DEFAULT NULL,
  `dGeandert` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kSSLZertifikat`),
  UNIQUE KEY `kHostingPos` (`kHostingPos`)
) ENGINE=InnoDB AUTO_INCREMENT=1221 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingsslzertifikathistory`
--

DROP TABLE IF EXISTS `thostingsslzertifikathistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingsslzertifikathistory` (
  `kSSLZertifikat` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) DEFAULT NULL,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `cOrderID` varchar(50) DEFAULT NULL,
  `cCSR` text DEFAULT NULL,
  `cPKey` text DEFAULT NULL,
  `cCRT` text DEFAULT NULL,
  `cCA` text DEFAULT NULL,
  `dAusstellung` date DEFAULT NULL,
  `dGeandert` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kSSLZertifikat`),
  UNIQUE KEY `kHostingPos` (`kHostingPos`)
) ENGINE=InnoDB AUTO_INCREMENT=1217 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingtraffic`
--

DROP TABLE IF EXISTS `thostingtraffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingtraffic` (
  `kHostingTraffic` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) NOT NULL,
  `nTraffic` bigint(20) NOT NULL,
  `nTrafficLimit` bigint(20) NOT NULL DEFAULT 0,
  `bOveruse` int(11) NOT NULL,
  `cServer` varchar(20) NOT NULL,
  `dTrafficMonat` date NOT NULL,
  `dLastUpdated` datetime NOT NULL,
  PRIMARY KEY (`kHostingTraffic`),
  KEY `kHostingPos` (`kHostingPos`),
  KEY `cServer` (`cServer`),
  KEY `dTrafficMonat` (`dTrafficMonat`)
) ENGINE=MyISAM AUTO_INCREMENT=126425 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingtraffic_error`
--

DROP TABLE IF EXISTS `thostingtraffic_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingtraffic_error` (
  `kHostingTraffic_error` int(11) NOT NULL AUTO_INCREMENT,
  `cErrorText` varchar(250) DEFAULT NULL,
  `cServer` varchar(20) NOT NULL,
  `dEingetragen` datetime DEFAULT NULL,
  PRIMARY KEY (`kHostingTraffic_error`)
) ENGINE=MyISAM AUTO_INCREMENT=790 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingupgrade`
--

DROP TABLE IF EXISTS `thostingupgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingupgrade` (
  `kHostingUpgrade` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) NOT NULL,
  `eStatus` enum('OFFEN','ABGESCHLOSSEN') DEFAULT 'OFFEN',
  `dErstellt` datetime NOT NULL,
  `dMailVersendet` datetime NOT NULL,
  PRIMARY KEY (`kHostingUpgrade`),
  KEY `kHostingPos` (`kHostingPos`),
  KEY `eStatus` (`eStatus`)
) ENGINE=MyISAM AUTO_INCREMENT=356 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingversionsupdate`
--

DROP TABLE IF EXISTS `thostingversionsupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingversionsupdate` (
  `kHostingPos` int(10) unsigned NOT NULL,
  `nVersion` int(10) unsigned NOT NULL,
  `nBuild` tinyint(4) unsigned DEFAULT NULL,
  `nVersionZiel` int(10) unsigned NOT NULL,
  `nBuildZiel` tinyint(4) unsigned DEFAULT NULL,
  `nVersionAlt` int(10) unsigned DEFAULT NULL,
  `nBuildAlt` tinyint(4) unsigned DEFAULT NULL,
  `nUpdate` tinyint(4) DEFAULT 0,
  `nError` tinyint(4) DEFAULT 0,
  `cError` text DEFAULT NULL,
  `dErstellt` datetime NOT NULL,
  `dDatum` date DEFAULT NULL,
  `cUhrzeit` varchar(50) NOT NULL,
  `dLastUpdate` datetime NOT NULL,
  PRIMARY KEY (`kHostingPos`),
  KEY `nUpdate` (`nUpdate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thostingwebspace`
--

DROP TABLE IF EXISTS `thostingwebspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thostingwebspace` (
  `kWebspace` int(11) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(11) DEFAULT NULL,
  `nVerbrauch` int(11) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `dGeandert` datetime DEFAULT NULL,
  PRIMARY KEY (`kWebspace`),
  UNIQUE KEY `kHostingPos` (`kHostingPos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_data`
--

DROP TABLE IF EXISTS `ticket_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `ticket_number` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `agent` varchar(255) NOT NULL,
  `first_response` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10683 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_ratings`
--

DROP TABLE IF EXISTS `ticket_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `result_quality` tinyint(4) NOT NULL DEFAULT 0,
  `consultation_expertise` tinyint(4) NOT NULL DEFAULT 0,
  `kindness` tinyint(4) NOT NULL DEFAULT 0,
  `reliability` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `internal_comment` text DEFAULT NULL,
  `not_valid` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `rate_again` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `not_valid` (`not_valid`),
  KEY `created_at` (`created_at`),
  KEY `result_quality` (`result_quality`),
  KEY `consultation_expertise` (`consultation_expertise`),
  KEY `kindness` (`kindness`),
  KEY `reliability` (`reliability`),
  CONSTRAINT `ticket_ratings_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1118279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `otrs_id` int(11) DEFAULT NULL,
  `zammad_id` int(11) DEFAULT NULL,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `status_id` tinyint(4) NOT NULL DEFAULT 1,
  `is_accessible` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_zammad_id_unique` (`zammad_id`),
  KEY `account_id` (`account_id`),
  KEY `created` (`created_at`),
  KEY `status_id` (`status_id`),
  KEY `contact_id` (`contact_id`),
  KEY `active` (`is_accessible`)
) ENGINE=InnoDB AUTO_INCREMENT=1118779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tickets_otrs_content`
--

DROP TABLE IF EXISTS `tickets_otrs_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_otrs_content` (
  `TicketID` int(10) unsigned NOT NULL,
  `TicketNumber` varchar(40) DEFAULT NULL,
  `Queue` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `FirstResponse` datetime DEFAULT NULL,
  `Priority` varchar(40) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  `Owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `tickets_otrs_content_created_index` (`Created`),
  KEY `tickets_otrs_content_created_priority_index` (`Created`,`Priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tinkasso`
--

DROP TABLE IF EXISTS `tinkasso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinkasso` (
  `kRechnung` int(11) NOT NULL,
  `nStatus` tinyint(4) NOT NULL DEFAULT 0,
  `nGesendet` tinyint(4) NOT NULL DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  PRIMARY KEY (`kRechnung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tinstallationsservice`
--

DROP TABLE IF EXISTS `tinstallationsservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinstallationsservice` (
  `kLizenz` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tiplog`
--

DROP TABLE IF EXISTS `tiplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kaccount` int(10) NOT NULL,
  `action` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(255) DEFAULT NULL,
  `xip` varchar(255) DEFAULT NULL,
  `agent` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=924920 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tiplog_uuid`
--

DROP TABLE IF EXISTS `tiplog_uuid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiplog_uuid` (
  `id` char(36) NOT NULL,
  `kaccount` int(10) NOT NULL,
  `action` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(255) DEFAULT NULL,
  `xip` varchar(255) DEFAULT NULL,
  `agent` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tjtlshippingversanddienstleister`
--

DROP TABLE IF EXISTS `tjtlshippingversanddienstleister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tjtlshippingversanddienstleister` (
  `kVersanddienstleister` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kVersanddienstleister`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tjtltesten`
--

DROP TABLE IF EXISTS `tjtltesten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tjtltesten` (
  `kJtlTesten` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `kEmpfehlungslistePos` int(10) unsigned DEFAULT NULL,
  `kTestshop` int(10) unsigned DEFAULT NULL,
  `k3rdPartyBuchung` int(10) unsigned DEFAULT NULL,
  `eStatus` enum('offen','erstellt','fehler') DEFAULT NULL,
  `nDemodaten` tinyint(3) unsigned DEFAULT NULL,
  `cFehler` text DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kJtlTesten`),
  KEY `tjtltesten_kAccount_index` (`kAccount`),
  KEY `tjtltesten_kEmpfehlungslistePos_index` (`kEmpfehlungslistePos`),
  KEY `tjtltesten_k3rdPartyBuchung_index` (`k3rdPartyBuchung`),
  KEY `tjtltesten_kTestshop_index` (`kTestshop`,`eStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tkategorie`
--

DROP TABLE IF EXISTS `tkategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tkategorie` (
  `kKategorie` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `nSort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kKategorie`),
  KEY `nAktiv` (`nAktiv`,`nSort`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tkaufprodukt`
--

DROP TABLE IF EXISTS `tkaufprodukt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tkaufprodukt` (
  `kKaufprodukt` int(10) unsigned NOT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `eTyp` enum('Shop','ShopModul') NOT NULL,
  `nMinShopVersion` int(10) unsigned DEFAULT 0,
  `nMinWawiVersion` varchar(255) DEFAULT NULL,
  `cMinWawiVersion` varchar(255) DEFAULT NULL,
  `cWikiLink` varchar(255) NOT NULL,
  `cShopLink` varchar(255) NOT NULL,
  PRIMARY KEY (`kKaufprodukt`),
  KEY `eTyp` (`eTyp`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tkaufproduktdownload`
--

DROP TABLE IF EXISTS `tkaufproduktdownload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tkaufproduktdownload` (
  `kKaufproduktDownload` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kKaufprodukt` int(10) unsigned NOT NULL,
  `nVersion` int(10) unsigned DEFAULT NULL,
  `cPfad` varchar(255) DEFAULT NULL,
  `cChangelog` text DEFAULT NULL,
  `dReleasedatum` date DEFAULT NULL,
  PRIMARY KEY (`kKaufproduktDownload`),
  KEY `dReleasedatum` (`dReleasedatum`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tkuendigung`
--

DROP TABLE IF EXISTS `tkuendigung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tkuendigung` (
  `kKuendigung` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kHostingPos` int(11) NOT NULL,
  `cHTML` longtext NOT NULL,
  `cText` longtext NOT NULL,
  `nAnzahlGesendet` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dVersendet` datetime NOT NULL,
  PRIMARY KEY (`kKuendigung`),
  KEY `kAccount` (`kAccount`),
  KEY `kHostingPos` (`kHostingPos`)
) ENGINE=MyISAM AUTO_INCREMENT=3656 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tkundenmail`
--

DROP TABLE IF EXISTS `tkundenmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tkundenmail` (
  `kKundenmail` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `cBetreff` varchar(255) DEFAULT NULL,
  `cHtml` longtext DEFAULT NULL,
  `cText` longtext DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `dZuletztVersendet` datetime DEFAULT NULL,
  PRIMARY KEY (`kKundenmail`)
) ENGINE=MyISAM AUTO_INCREMENT=1855 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tland`
--

DROP TABLE IF EXISTS `tland`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tland` (
  `kLand` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `cISO` varchar(255) NOT NULL,
  `nSort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kLand`),
  KEY `cISO` (`cISO`),
  KEY `nSort` (`nSort`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tland_ext`
--

DROP TABLE IF EXISTS `tland_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tland_ext` (
  `cISO` varchar(5) NOT NULL DEFAULT '',
  `cDeutsch` varchar(255) DEFAULT NULL,
  `cEnglisch` varchar(255) DEFAULT NULL,
  `nEU` tinyint(3) unsigned DEFAULT NULL,
  `nSort` int(11) NOT NULL,
  `cKontinent` varchar(255) DEFAULT NULL,
  `nSEPA` tinyint(4) NOT NULL DEFAULT 0,
  `cRegex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cISO`),
  KEY `cISO` (`cISO`),
  KEY `nSEPA` (`nSEPA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tleistung`
--

DROP TABLE IF EXISTS `tleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tleistung` (
  `kLeistung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kProdukt` int(10) DEFAULT NULL,
  `kZertifikat` int(10) DEFAULT NULL,
  `cName` varchar(255) NOT NULL,
  `cText` varchar(255) DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `nSort` int(10) unsigned NOT NULL,
  `nAufrufe` int(10) NOT NULL,
  PRIMARY KEY (`kLeistung`),
  KEY `nAktiv` (`nAktiv`,`nSort`),
  KEY `kProdukt` (`kProdukt`),
  KEY `kZertifikat` (`kZertifikat`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tleistungaufrufe`
--

DROP TABLE IF EXISTS `tleistungaufrufe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tleistungaufrufe` (
  `kLAufruf` int(10) NOT NULL AUTO_INCREMENT,
  `kLeistung` int(10) NOT NULL,
  `dDatum` datetime NOT NULL,
  PRIMARY KEY (`kLAufruf`),
  KEY `kLeistung` (`kLeistung`,`dDatum`)
) ENGINE=InnoDB AUTO_INCREMENT=1645357 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlic`
--

DROP TABLE IF EXISTS `tlic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlic` (
  `kLic` int(10) NOT NULL AUTO_INCREMENT,
  `kBundle` int(10) DEFAULT 0,
  `kLicense` int(10) NOT NULL,
  `kAccount` int(10) NOT NULL,
  `kApplication` int(10) NOT NULL,
  `fAmount` decimal(16,4) unsigned NOT NULL DEFAULT 0.0000,
  `eEdition` enum('','Standard','Professional','Enterprise') NOT NULL,
  `eTyp` enum('','Lease','Buy','Hosting') NOT NULL,
  `nActive` tinyint(4) NOT NULL,
  `nLimited` int(10) unsigned NOT NULL,
  `cLicenseKey` varchar(255) DEFAULT NULL,
  `dExpires` datetime DEFAULT NULL,
  `bSuspended` tinyint(4) NOT NULL DEFAULT 0,
  `dSuspendedUntil` datetime DEFAULT NULL,
  `dCancelOn` datetime DEFAULT NULL,
  `nCancelBy` tinyint(4) DEFAULT NULL,
  `dCancelTo` date DEFAULT NULL,
  `nStatus` int(10) DEFAULT 0 COMMENT '0 Testphase, 1 Produktiv, 2 Dev',
  `nSupport` int(10) DEFAULT 0,
  `dProductive` date DEFAULT NULL,
  `nDiscount` tinyint(4) NOT NULL DEFAULT 0,
  `dCreated` datetime NOT NULL,
  `dUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`kLic`),
  KEY `kAccount` (`kAccount`),
  KEY `kLicense` (`kLicense`),
  KEY `kBundle` (`kBundle`),
  KEY `nStatus` (`nStatus`),
  KEY `kapplication` (`kApplication`),
  KEY `cLicenseKeyIndex` (`cLicenseKey`)
) ENGINE=InnoDB AUTO_INCREMENT=206962 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Abrechnung / Verwaltungs Tabelle für jtl_license.tlicense';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
/*!50032 DROP TRIGGER IF EXISTS insert_write_tlichistory */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 TRIGGER `insert_write_tlichistory` AFTER INSERT ON `tlic` FOR EACH ROW BEGIN    
INSERT INTO tlichistory (kLic, kBundle, kLicense, kAccount, kApplication, fAmount, eEdition, eTyp, nActive, nLimited, cLicenseKey, dExpires, bSuspended, dSuspendedUntil, dCancelOn, nCancelBy, dCancelTo, nStatus, nSupport, dProductive, nDiscount, dCreated, dUpdated, dHistoryCreated)    VALUES (NEW.kLic, NEW.kBundle, NEW.kLicense, NEW.kAccount, NEW.kApplication, NEW.fAmount, NEW.eEdition, NEW.eTyp, NEW.nActive, NEW.nLimited, NEW.cLicenseKey, NEW.dExpires, NEW.bSuspended, NEW.dSuspendedUntil, NEW.dCancelOn, NEW.nCancelBy, NEW.dCancelTo, NEW.nStatus, NEW.nSupport, NEW.dProductive, NEW.nDiscount, NEW.dCreated, NEW.dUpdated, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
/*!50032 DROP TRIGGER IF EXISTS update_write_tlichistory */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 TRIGGER `update_write_tlichistory` AFTER UPDATE ON `tlic` FOR EACH ROW BEGIN    
INSERT INTO tlichistory (kLic, kBundle, kLicense, kAccount, kApplication, fAmount, eEdition, eTyp, nActive, nLimited, cLicenseKey, dExpires, bSuspended, dSuspendedUntil, dCancelOn, nCancelBy, dCancelTo, nStatus, nSupport, dProductive, nDiscount, dCreated, dUpdated, dHistoryCreated)    VALUES (NEW.kLic, NEW.kBundle, NEW.kLicense, NEW.kAccount, NEW.kApplication, NEW.fAmount, NEW.eEdition, NEW.eTyp, NEW.nActive, NEW.nLimited, NEW.cLicenseKey, NEW.dExpires, NEW.bSuspended, NEW.dSuspendedUntil, NEW.dCancelOn, NEW.nCancelBy, NEW.dCancelTo, NEW.nStatus, NEW.nSupport, NEW.dProductive, NEW.nDiscount, NEW.dCreated, NEW.dUpdated, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
/*!50032 DROP TRIGGER IF EXISTS delete_write_tlichistory */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 TRIGGER `delete_write_tlichistory` BEFORE DELETE ON `tlic` FOR EACH ROW BEGIN    
INSERT INTO tlichistory (kLic, kBundle, kLicense, kAccount, kApplication, fAmount, eEdition, eTyp, nActive, nLimited, cLicenseKey, dExpires, bSuspended, dSuspendedUntil, dCancelOn, nCancelBy, dCancelTo, nStatus, nSupport, dProductive, nDiscount, dCreated, dUpdated, dHistoryCreated) VALUES (OLD.kLic, 0, OLD.kLicense, OLD.kAccount, OLD.kApplication, 0, '', '', 1, 0, OLD.cLicenseKey, OLD.dExpires, 0, NULL, NULL, NULL, NULL, OLD.nStatus, OLD.nSupport, OLD.dProductive, 0, OLD.dCreated, OLD.dUpdated, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tlicapplication`
--

DROP TABLE IF EXISTS `tlicapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicapplication` (
  `kApplication` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kApplicationMain` int(11) unsigned DEFAULT 0,
  `cName` varchar(255) NOT NULL,
  `cDescription` varchar(255) DEFAULT NULL,
  `bUser` tinyint(4) NOT NULL DEFAULT 0,
  `nMaxVolumeUser` int(11) NOT NULL DEFAULT 0,
  `bPurchasable` tinyint(4) NOT NULL DEFAULT 0,
  `cType` varchar(255) DEFAULT NULL,
  `cProduct` varchar(50) DEFAULT NULL,
  `cProvider` varchar(255) DEFAULT NULL,
  `cForeignSystemId` varchar(255) DEFAULT NULL,
  `cForeignSystemCategory` varchar(255) DEFAULT NULL,
  `nTestDays` int(11) DEFAULT NULL,
  `nProlongTestDays` int(11) unsigned NOT NULL DEFAULT 0,
  `nProlongTestAmount` int(11) unsigned NOT NULL DEFAULT 0,
  `cAdditionalInfo` varchar(255) DEFAULT NULL,
  `fAmount` decimal(16,4) unsigned DEFAULT NULL,
  `nInterval` tinyint(4) DEFAULT 1,
  `cLink` varchar(255) DEFAULT NULL,
  `cVideo` varchar(255) DEFAULT NULL,
  `cKcUrl` varchar(255) DEFAULT NULL,
  `cStoreUrl` varchar(255) DEFAULT NULL,
  `cNeededMetas` text DEFAULT NULL,
  PRIMARY KEY (`kApplication`),
  KEY `cType` (`cType`),
  KEY `kApplicationMain` (`kApplicationMain`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicapplication_old`
--

DROP TABLE IF EXISTS `tlicapplication_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicapplication_old` (
  `kApplication` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kApplicationMain` int(11) unsigned DEFAULT 0,
  `cName` varchar(255) NOT NULL,
  `cDescription` varchar(255) DEFAULT NULL,
  `cType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kApplication`),
  KEY `cType` (`cType`),
  KEY `kApplicationMain` (`kApplicationMain`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicapplicationrequirement`
--

DROP TABLE IF EXISTS `tlicapplicationrequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicapplicationrequirement` (
  `kLicApplicationRequirement` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kApplication` int(10) unsigned NOT NULL,
  `cKey` varchar(255) NOT NULL,
  `cValue` varchar(255) NOT NULL,
  PRIMARY KEY (`kLicApplicationRequirement`),
  KEY `kApplication` (`kApplication`,`cKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicapplicationtypedesc`
--

DROP TABLE IF EXISTS `tlicapplicationtypedesc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicapplicationtypedesc` (
  `kDesc` int(11) NOT NULL AUTO_INCREMENT,
  `kApplication` int(11) DEFAULT NULL,
  `cType` varchar(50) DEFAULT NULL,
  `cWikiURL` varchar(255) DEFAULT NULL,
  `cVideoURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kDesc`),
  KEY `kApplication` (`kApplication`),
  KEY `cType` (`cType`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicapplicationversion`
--

DROP TABLE IF EXISTS `tlicapplicationversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicapplicationversion` (
  `kLicApplicationVersion` int(11) NOT NULL AUTO_INCREMENT,
  `kApplication` int(11) NOT NULL,
  `cVersion` varchar(10) DEFAULT NULL,
  `cKompVon` varchar(10) DEFAULT NULL,
  `cKompBis` varchar(10) DEFAULT NULL,
  `cType` varchar(50) DEFAULT NULL,
  `dRelease` date DEFAULT NULL,
  `cFile` varchar(255) DEFAULT NULL,
  `nDownloads` int(10) unsigned NOT NULL DEFAULT 0,
  `cRequirementsURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kLicApplicationVersion`),
  KEY `kApplication` (`kApplication`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tliccode`
--

DROP TABLE IF EXISTS `tliccode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tliccode` (
  `kCode` int(11) NOT NULL AUTO_INCREMENT,
  `kExtId` int(11) NOT NULL DEFAULT 0,
  `cOrderNr` varchar(20) NOT NULL,
  `cMail` varchar(255) NOT NULL DEFAULT '0',
  `kServicepartner` int(11) NOT NULL DEFAULT 0,
  `kLicense` int(11) DEFAULT 0,
  `eType` enum('','subscription','product') DEFAULT NULL COMMENT 'Typ des Codes (Produkt, Subskription)',
  `kAccount` int(11) DEFAULT 0,
  `cCode` varchar(29) DEFAULT '0',
  `kApplication` int(11) DEFAULT 0,
  `eEdition` enum('','Standard','Professional','Enterprise') NOT NULL,
  `cType` varchar(50) DEFAULT NULL COMMENT 'Typ der Applikation',
  `cDomain` varchar(255) DEFAULT NULL,
  `dCreated` datetime DEFAULT NULL,
  `cCreatedBy` varchar(255) DEFAULT NULL,
  `dUsed` datetime DEFAULT NULL,
  PRIMARY KEY (`kCode`),
  KEY `cCode` (`cCode`),
  KEY `cType` (`cType`),
  KEY `kApplication` (`kApplication`),
  KEY `kServicepartner` (`kServicepartner`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tliccustomercaremail`
--

DROP TABLE IF EXISTS `tliccustomercaremail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tliccustomercaremail` (
  `kLicMail` int(11) NOT NULL AUTO_INCREMENT,
  `kLic` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kLicMail`),
  KEY `kLic` (`kLic`)
) ENGINE=InnoDB AUTO_INCREMENT=53053 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicdeactivationlog`
--

DROP TABLE IF EXISTS `tlicdeactivationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicdeactivationlog` (
  `kLicDeactivationLog` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kLic` int(10) unsigned DEFAULT 0,
  `kUser` int(10) unsigned DEFAULT 0,
  `kLicense` int(10) unsigned DEFAULT 0,
  `nLicUpdated` tinyint(3) unsigned DEFAULT 0,
  `nUserUpdated` tinyint(3) unsigned DEFAULT 0,
  `nLicenseUpdated` tinyint(3) unsigned DEFAULT 0,
  `nDeactivationSuccessful` tinyint(3) unsigned DEFAULT 0,
  `dCancelTo` datetime DEFAULT NULL,
  `dCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`kLicDeactivationLog`),
  KEY `tlicdeactivationlog_dDeactivation_index` (`dCreated`),
  KEY `tlicdeactivationlog_kLicUser_index` (`kUser`),
  KEY `tlicdeactivationlog_kLic_index` (`kLic`),
  KEY `tlicdeactivationlog_kLicense_index` (`kLicense`)
) ENGINE=InnoDB AUTO_INCREMENT=20498 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicenseapihistory`
--

DROP TABLE IF EXISTS `tlicenseapihistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicenseapihistory` (
  `kLicenseApiHistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned NOT NULL,
  `kLicense` int(10) unsigned NOT NULL,
  `kOrder` int(10) unsigned NOT NULL,
  `kPurchaseProduct` int(10) unsigned NOT NULL,
  `cPaymentMethod` varchar(255) NOT NULL,
  `cParam` varchar(255) NOT NULL,
  `dCreated` datetime NOT NULL,
  PRIMARY KEY (`kLicenseApiHistory`),
  KEY `kAccount` (`kAccount`,`kLicense`),
  KEY `kAccount_2` (`kAccount`,`kOrder`)
) ENGINE=MyISAM AUTO_INCREMENT=9905 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlichistory`
--

DROP TABLE IF EXISTS `tlichistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlichistory` (
  `kLicHistory` int(10) NOT NULL AUTO_INCREMENT,
  `kLic` int(10) NOT NULL,
  `kBundle` int(10) DEFAULT 0,
  `kLicense` int(10) NOT NULL,
  `kAccount` int(10) NOT NULL,
  `kApplication` int(10) NOT NULL,
  `fAmount` decimal(16,4) unsigned NOT NULL DEFAULT 0.0000,
  `eEdition` enum('','Standard','Professional','Enterprise') NOT NULL,
  `eTyp` enum('','Lease','Buy','Hosting') NOT NULL,
  `nActive` tinyint(4) NOT NULL,
  `nLimited` int(10) unsigned NOT NULL,
  `cLicenseKey` varchar(255) DEFAULT NULL,
  `dExpires` datetime DEFAULT NULL,
  `bSuspended` tinyint(4) NOT NULL DEFAULT 0,
  `dSuspendedUntil` datetime DEFAULT NULL,
  `dCancelOn` datetime DEFAULT NULL,
  `nCancelBy` tinyint(4) DEFAULT 0,
  `dCancelTo` date DEFAULT NULL,
  `nStatus` int(10) DEFAULT 0,
  `nSupport` int(10) DEFAULT 0,
  `dProductive` date DEFAULT NULL,
  `nDiscount` tinyint(4) NOT NULL DEFAULT 0,
  `dCreated` datetime DEFAULT NULL,
  `dUpdated` datetime DEFAULT NULL,
  `dHistoryCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`kLicHistory`),
  KEY `kAccount` (`kAccount`),
  KEY `kLicense` (`kLicense`),
  KEY `kBundle` (`kBundle`),
  KEY `kLic` (`kLic`),
  KEY `dHistoryCreated` (`dHistoryCreated`),
  KEY `dCreated` (`dCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=617060 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='History für tlic';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicremoteapplicationcode`
--

DROP TABLE IF EXISTS `tlicremoteapplicationcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicremoteapplicationcode` (
  `kCode` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cCode` char(36) NOT NULL,
  `kApplication` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kCode`),
  KEY `tlicremoteapplicationcode_ccode_index` (`cCode`),
  KEY `tlicremoteapplicationcode_kapplication_index` (`kApplication`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicrequirement`
--

DROP TABLE IF EXISTS `tlicrequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicrequirement` (
  `kLicRequirement` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kRequirement` int(10) unsigned NOT NULL DEFAULT 0,
  `kLicense` int(10) unsigned NOT NULL,
  `cKey` varchar(255) NOT NULL,
  `cValue` varchar(255) NOT NULL,
  PRIMARY KEY (`kLicRequirement`),
  KEY `kLicense` (`kLicense`,`cKey`),
  KEY `kRequirement` (`kRequirement`)
) ENGINE=MyISAM AUTO_INCREMENT=296621 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
/*!50032 DROP TRIGGER IF EXISTS tlicrequirementafterupdate */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 TRIGGER `tlicrequirementafterupdate` AFTER UPDATE ON `tlicrequirement` FOR EACH ROW BEGIN
	INSERT INTO tlicrequirementhistory SET kLicRequirement = NEW.kLicRequirement, kRequirement = NEW.kRequirement, kLicense = NEW.kLicense, cKey = new.cKey, cValue = new.cValue, dCreated = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tlicrequirement_backup`
--

DROP TABLE IF EXISTS `tlicrequirement_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicrequirement_backup` (
  `kLicRequirement` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kRequirement` int(10) unsigned NOT NULL DEFAULT 0,
  `kLicense` int(10) unsigned NOT NULL,
  `cKey` varchar(255) NOT NULL,
  `cValue` varchar(255) NOT NULL,
  PRIMARY KEY (`kLicRequirement`),
  KEY `kLicense` (`kLicense`,`cKey`),
  KEY `kRequirement` (`kRequirement`)
) ENGINE=MyISAM AUTO_INCREMENT=633 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicrequirementhistory`
--

DROP TABLE IF EXISTS `tlicrequirementhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicrequirementhistory` (
  `kLicRequirementHistory` int(11) NOT NULL AUTO_INCREMENT,
  `kLicRequirement` int(11) DEFAULT NULL,
  `kRequirement` int(11) DEFAULT NULL,
  `kLicense` int(11) DEFAULT NULL,
  `cKey` varchar(255) DEFAULT NULL,
  `cValue` varchar(255) DEFAULT NULL,
  `dCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`kLicRequirementHistory`),
  KEY `kLicense` (`kLicense`),
  KEY `cKey` (`cKey`),
  KEY `kRequirement` (`kRequirement`),
  KEY `kLicRequirement` (`kLicRequirement`)
) ENGINE=InnoDB AUTO_INCREMENT=3298843 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicsupport`
--

DROP TABLE IF EXISTS `tlicsupport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicsupport` (
  `kSupport` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) DEFAULT NULL,
  `nType` tinyint(4) DEFAULT NULL,
  `dCreated` datetime DEFAULT NULL,
  `dCancelTo` date DEFAULT NULL,
  `dCancelOn` datetime DEFAULT NULL,
  PRIMARY KEY (`kSupport`),
  KEY `kAccount` (`kAccount`),
  KEY `nType` (`nType`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlictest`
--

DROP TABLE IF EXISTS `tlictest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlictest` (
  `kTest` int(11) NOT NULL AUTO_INCREMENT,
  `kApplication` int(11) NOT NULL DEFAULT 0,
  `kLicense` int(11) DEFAULT NULL,
  `cType` varchar(50) DEFAULT NULL,
  `kAccount` int(11) DEFAULT NULL,
  `dCreated` datetime DEFAULT NULL,
  `dExpires` datetime DEFAULT NULL,
  `cEditor` varchar(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`kTest`),
  KEY `kLicense` (`kLicense`),
  KEY `kAccount` (`kAccount`),
  KEY `dExpires` (`dExpires`),
  KEY `kApplication` (`kApplication`)
) ENGINE=InnoDB AUTO_INCREMENT=53299 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlicuser`
--

DROP TABLE IF EXISTS `tlicuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlicuser` (
  `kUser` int(11) NOT NULL AUTO_INCREMENT,
  `kApplication` int(10) unsigned NOT NULL,
  `kLicense` int(10) unsigned NOT NULL,
  `nActive` tinyint(3) unsigned NOT NULL,
  `nDiscount` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dCreated` datetime NOT NULL,
  `dCancelTo` date DEFAULT NULL,
  `dCancelOn` datetime DEFAULT NULL,
  `nCancelBy` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`kUser`),
  KEY `kApplication` (`kApplication`,`kLicense`),
  KEY `tlicuser_kApplication_kLicense_nActive_kUser_index` (`kApplication`,`kLicense`,`nActive`,`kUser`)
) ENGINE=InnoDB AUTO_INCREMENT=438051 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenz`
--

DROP TABLE IF EXISTS `tlizenz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenz` (
  `kLizenz` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned NOT NULL,
  `cKey` varchar(255) NOT NULL,
  `kKey` int(10) unsigned NOT NULL,
  `eTyp` enum('std','dev','test','host','zeit','vmc','free','pro','ent','com') NOT NULL,
  `bBrandFree` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kLizenz`),
  KEY `cKey` (`cKey`,`kKey`),
  KEY `kAccount` (`kAccount`),
  KEY `eTyp` (`eTyp`)
) ENGINE=MyISAM AUTO_INCREMENT=157349 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenzdomainhistory`
--

DROP TABLE IF EXISTS `tlizenzdomainhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenzdomainhistory` (
  `kLizenzdomainhistory` int(11) NOT NULL AUTO_INCREMENT,
  `kLizenz` int(11) NOT NULL,
  `cDomainOld` varchar(255) NOT NULL,
  `cDomainNew` varchar(255) NOT NULL,
  `cChangedBy` varchar(255) NOT NULL,
  `dChanged` datetime NOT NULL,
  PRIMARY KEY (`kLizenzdomainhistory`)
) ENGINE=MyISAM AUTO_INCREMENT=61155 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenzgruppe`
--

DROP TABLE IF EXISTS `tlizenzgruppe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenzgruppe` (
  `kLizenzgruppe` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL DEFAULT 0,
  `cTitel` varchar(50) NOT NULL DEFAULT '0',
  `cBeschreibung` varchar(255) DEFAULT '0',
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kLizenzgruppe`),
  KEY `kAccount` (`kAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=5219 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenzhistory`
--

DROP TABLE IF EXISTS `tlizenzhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenzhistory` (
  `kLizenzHistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kLizenz` int(10) unsigned NOT NULL,
  `kAccount` int(10) unsigned NOT NULL,
  `cKey` varchar(255) NOT NULL,
  `kKey` int(10) unsigned NOT NULL,
  `eTyp` enum('std','dev','test','host','zeit','vmc','free','pro','ent','com') NOT NULL,
  `bBrandFree` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kLizenzHistory`),
  KEY `cKey` (`cKey`,`kKey`)
) ENGINE=MyISAM AUTO_INCREMENT=54402 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenzingruppe`
--

DROP TABLE IF EXISTS `tlizenzingruppe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenzingruppe` (
  `kLizenzingruppe` int(11) NOT NULL AUTO_INCREMENT,
  `kLizenz` int(11) DEFAULT NULL,
  `kLizenzgruppe` int(11) DEFAULT NULL,
  PRIMARY KEY (`kLizenzingruppe`),
  KEY `kLizenz` (`kLizenz`),
  KEY `kLizenzgruppe` (`kLizenzgruppe`)
) ENGINE=InnoDB AUTO_INCREMENT=12183 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenzmigration`
--

DROP TABLE IF EXISTS `tlizenzmigration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenzmigration` (
  `kLizenzmigration` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kSeller` int(11) NOT NULL,
  `kAccountKunde` int(11) DEFAULT NULL,
  `cExtensionID` varchar(255) NOT NULL DEFAULT '',
  `cEmail` varchar(255) NOT NULL DEFAULT '',
  `cCustomerCompany` varchar(255) DEFAULT NULL,
  `dSubscriptionGueltigBis` date NOT NULL,
  `cDomain` varchar(255) DEFAULT NULL,
  `cErrorMessage` text DEFAULT NULL,
  `nEmailCustomerMatch` int(11) DEFAULT NULL,
  `nCompanyCustomerMatch` int(11) DEFAULT NULL,
  `nMatchingStatus` varchar(255) DEFAULT NULL COMMENT '1 = success; 2 = warning; 3 = error; 4 = manuell',
  `nStatus` int(11) NOT NULL DEFAULT 1 COMMENT '1 = in Bearbeitung; 2 = Erfolgreich migriert; 3 = manuelle Zuordnung erforderlich; 4 = Nicht zuzuordnen',
  `dErfolgreichMigriert` datetime DEFAULT NULL,
  `dNichtZuzuordnen` datetime DEFAULT NULL,
  `dLastCheck` datetime DEFAULT NULL,
  `dErstellt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`kLizenzmigration`)
) ENGINE=InnoDB AUTO_INCREMENT=1538 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenzmigration_actions`
--

DROP TABLE IF EXISTS `tlizenzmigration_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenzmigration_actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kAdminlogin` int(11) NOT NULL,
  `action` varchar(255) NOT NULL DEFAULT '',
  `payload` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `finished_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenzownerhistory`
--

DROP TABLE IF EXISTS `tlizenzownerhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenzownerhistory` (
  `kLizenz` int(11) NOT NULL,
  `kAccountAlt` int(11) NOT NULL,
  `kAccountNeu` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `dUmgestellt` datetime NOT NULL,
  KEY `kLizenz` (`kLizenz`),
  KEY `kAccountAlt` (`kAccountAlt`),
  KEY `kAccountNeu` (`kAccountNeu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenzsearch`
--

DROP TABLE IF EXISTS `tlizenzsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenzsearch` (
  `kLizenz` int(11) NOT NULL DEFAULT 0,
  `kSearch` int(11) NOT NULL DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kLizenz`,`kSearch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenzstats`
--

DROP TABLE IF EXISTS `tlizenzstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenzstats` (
  `kShop` int(11) unsigned NOT NULL,
  `nShopVersion` int(11) unsigned NOT NULL,
  `nWawiVersion` int(11) unsigned NOT NULL,
  `nAnfragen` int(11) unsigned NOT NULL,
  `dErstellt` datetime NOT NULL DEFAULT current_timestamp(),
  `dZuletzt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `kShop` (`kShop`,`nShopVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tlizenzupgrade`
--

DROP TABLE IF EXISTS `tlizenzupgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlizenzupgrade` (
  `kLizenzUpgrade` int(11) NOT NULL AUTO_INCREMENT,
  `kLizenz` int(11) NOT NULL,
  `eStatus` enum('OFFEN','ABGESCHLOSSEN') DEFAULT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kLizenzUpgrade`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmahnlauf`
--

DROP TABLE IF EXISTS `tmahnlauf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmahnlauf` (
  `kMahnlauf` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kRechnung` int(11) NOT NULL,
  `nMahnstufe` tinyint(4) NOT NULL,
  `dTimestamp` datetime NOT NULL,
  PRIMARY KEY (`kMahnlauf`),
  KEY `kAccount` (`kAccount`),
  KEY `kRechnung` (`kRechnung`)
) ENGINE=InnoDB AUTO_INCREMENT=34448 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmahnung`
--

DROP TABLE IF EXISTS `tmahnung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmahnung` (
  `kMahnung` int(11) NOT NULL AUTO_INCREMENT,
  `kRechnung` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `nMahnstufe` int(11) NOT NULL,
  `cBetreff` varchar(255) DEFAULT NULL,
  `cNachrichtHtml` longtext DEFAULT NULL,
  `cNachrichtText` longtext DEFAULT NULL,
  `dVersendet` date DEFAULT NULL,
  PRIMARY KEY (`kMahnung`),
  KEY `kRechnung` (`kRechnung`),
  KEY `kAccount` (`kAccount`)
) ENGINE=MyISAM AUTO_INCREMENT=72406 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmailchimp`
--

DROP TABLE IF EXISTS `tmailchimp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmailchimp` (
  `EMAIL` varchar(255) NOT NULL,
  `STATUS` enum('','subscribed','unsubscribed','pending','cleaned') NOT NULL,
  `MERGE_FIELDS` text DEFAULT NULL,
  `INTERESTS` text DEFAULT NULL,
  `BLACKLIST` tinyint(4) NOT NULL DEFAULT 0,
  `KEY` varchar(50) NOT NULL DEFAULT '0',
  `KEY_VAL` varchar(50) NOT NULL DEFAULT '0',
  `CREATED` datetime NOT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `FAILURES` tinyint(4) NOT NULL DEFAULT 0,
  `LAST_SYNC` datetime DEFAULT NULL,
  `HTTP_CODE` smallint(6) DEFAULT NULL,
  `LAST_RESPONSE` text DEFAULT NULL,
  `LAST_CONTENT` text DEFAULT NULL,
  PRIMARY KEY (`EMAIL`),
  KEY `STATUS` (`STATUS`),
  KEY `BLACKLIST` (`BLACKLIST`),
  KEY `KEY` (`KEY`),
  KEY `KEY_VAL` (`KEY_VAL`),
  KEY `LAST_SYNC` (`LAST_SYNC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmailchimp_webhook`
--

DROP TABLE IF EXISTS `tmailchimp_webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmailchimp_webhook` (
  `WEBHOOK` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `DATA` text NOT NULL,
  `FIRED` datetime NOT NULL,
  PRIMARY KEY (`WEBHOOK`),
  KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=10911 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmailqueue`
--

DROP TABLE IF EXISTS `tmailqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmailqueue` (
  `kMailQueue` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kVorlage` int(10) unsigned DEFAULT NULL,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `cDataJSON` mediumtext DEFAULT NULL,
  `cTriggerFile` varchar(255) DEFAULT NULL,
  `cStatus` enum('offen','versendet','fehler') DEFAULT NULL,
  `cFehler` varchar(255) DEFAULT NULL,
  `dZuVersendenAm` datetime DEFAULT NULL,
  `dVersendetAm` datetime DEFAULT NULL,
  `dErstelltAm` datetime DEFAULT NULL,
  PRIMARY KEY (`kMailQueue`),
  KEY `tmailqueue_dVersendetAm_cStatus_index` (`dVersendetAm`,`cStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmergehistory`
--

DROP TABLE IF EXISTS `tmergehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmergehistory` (
  `kMergeHistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cKey` varchar(255) NOT NULL,
  `kKey` int(10) unsigned NOT NULL,
  `kAccount` int(10) unsigned NOT NULL,
  `kAccountTarget` int(10) unsigned NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kMergeHistory`),
  KEY `kAccountTarget` (`kAccountTarget`)
) ENGINE=MyISAM AUTO_INCREMENT=7065 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmodulkey`
--

DROP TABLE IF EXISTS `tmodulkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmodulkey` (
  `kModulKey` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cModul` varchar(255) NOT NULL DEFAULT '',
  `cKey` varchar(60) DEFAULT NULL,
  `cFirma` varchar(255) DEFAULT NULL,
  `nAnzahlFreischaltungen` int(10) unsigned DEFAULT 0,
  `dGueltigAb` date DEFAULT NULL,
  PRIMARY KEY (`kModulKey`)
) ENGINE=MyISAM AUTO_INCREMENT=2530 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmodulkeyfreischaltung`
--

DROP TABLE IF EXISTS `tmodulkeyfreischaltung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmodulkeyfreischaltung` (
  `kModulKey` int(10) unsigned DEFAULT NULL,
  `cIP` varchar(255) DEFAULT NULL,
  `dDatum` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmodulkeyfreischaltung_fehler`
--

DROP TABLE IF EXISTS `tmodulkeyfreischaltung_fehler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmodulkeyfreischaltung_fehler` (
  `cIP` varchar(255) DEFAULT NULL,
  `cFirma` varchar(255) NOT NULL DEFAULT '',
  `cKey` varchar(12) NOT NULL DEFAULT '',
  `dDatum` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_keys`
--

DROP TABLE IF EXISTS `tmp_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_keys` (
  `kLicense` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmulticonvert`
--

DROP TABLE IF EXISTS `tmulticonvert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmulticonvert` (
  `kAccount` int(11) NOT NULL,
  `kLizenz` int(11) NOT NULL,
  `kLicense` int(11) NOT NULL,
  `cLizenzkey` varchar(255) NOT NULL,
  `dConvert` datetime NOT NULL,
  PRIMARY KEY (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tnews`
--

DROP TABLE IF EXISTS `tnews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tnews` (
  `kNews` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cBetreff` varchar(255) NOT NULL,
  `cText` text NOT NULL,
  `cShopIcon` varchar(255) NOT NULL,
  `cVorschauText` text NOT NULL,
  `cVorschauHome` varchar(255) NOT NULL,
  `cMetaTitle` varchar(255) NOT NULL,
  `cMetaDescription` varchar(255) NOT NULL,
  `cMetaKeywords` varchar(255) NOT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `nKommentierbar` tinyint(4) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dGueltigVon` datetime NOT NULL,
  PRIMARY KEY (`kNews`),
  KEY `nAktiv` (`nAktiv`,`dGueltigVon`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tnewskategorie`
--

DROP TABLE IF EXISTS `tnewskategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tnewskategorie` (
  `kNewsKategorie` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `cBeschreibung` text NOT NULL,
  `cMetaTitle` varchar(255) NOT NULL,
  `cMetaDescription` varchar(255) NOT NULL,
  `nSort` tinyint(3) unsigned NOT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `dLetzteAktualisierung` datetime NOT NULL,
  PRIMARY KEY (`kNewsKategorie`),
  KEY `nAktiv` (`nAktiv`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tnewskategorienews`
--

DROP TABLE IF EXISTS `tnewskategorienews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tnewskategorienews` (
  `kNewsKategorieNews` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kNews` int(10) unsigned NOT NULL,
  `kNewsKategorie` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kNewsKategorieNews`),
  KEY `kNews` (`kNews`),
  KEY `kNewsKategorie` (`kNewsKategorie`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tnewskommentar`
--

DROP TABLE IF EXISTS `tnewskommentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tnewskommentar` (
  `kNewsKommentar` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kNews` int(10) unsigned NOT NULL,
  `kKunde` int(10) unsigned NOT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `cName` varchar(255) NOT NULL,
  `cEmail` varchar(255) NOT NULL,
  `cKommentar` text NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kNewsKommentar`),
  KEY `kNews` (`kNews`,`nAktiv`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tnewsletterblacklist`
--

DROP TABLE IF EXISTS `tnewsletterblacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tnewsletterblacklist` (
  `kNewsletterBlacklist` int(11) NOT NULL AUTO_INCREMENT,
  `cEmail` varchar(250) NOT NULL,
  `dHinzugefuegt` datetime NOT NULL,
  PRIMARY KEY (`kNewsletterBlacklist`)
) ENGINE=MyISAM AUTO_INCREMENT=11465 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tnewsletterempfaenger`
--

DROP TABLE IF EXISTS `tnewsletterempfaenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tnewsletterempfaenger` (
  `kNewsletterEmpfaenger` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nAktiv` int(10) unsigned NOT NULL DEFAULT 0,
  `cAnrede` varchar(255) NOT NULL,
  `cTitel` varchar(255) DEFAULT NULL,
  `cVorname` varchar(255) NOT NULL,
  `cNachname` varchar(255) NOT NULL,
  `cEmail` varchar(255) NOT NULL,
  `cOptCode` varchar(255) NOT NULL,
  `cLoeschCode` varchar(255) NOT NULL,
  `dEingetragen` datetime NOT NULL,
  `dLetzterNewsletter` datetime DEFAULT NULL,
  PRIMARY KEY (`kNewsletterEmpfaenger`),
  KEY `cEmail` (`cEmail`)
) ENGINE=MyISAM AUTO_INCREMENT=6773 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tnewsletterempfaengerhistory`
--

DROP TABLE IF EXISTS `tnewsletterempfaengerhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tnewsletterempfaengerhistory` (
  `kNewsletterEmpfaengerHistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cAnrede` varchar(255) NOT NULL,
  `cTitel` varchar(255) DEFAULT NULL,
  `cVorname` varchar(255) NOT NULL,
  `cNachname` varchar(255) NOT NULL,
  `cEmail` varchar(255) NOT NULL,
  `cOptCode` varchar(255) DEFAULT NULL,
  `cLoeschCode` varchar(255) DEFAULT NULL,
  `cAktion` varchar(255) NOT NULL,
  `dAusgetragen` datetime NOT NULL,
  `dEingetragen` datetime NOT NULL,
  `dLetzterNewsletter` datetime DEFAULT NULL,
  PRIMARY KEY (`kNewsletterEmpfaengerHistory`)
) ENGINE=MyISAM AUTO_INCREMENT=3500 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tnewsmonatsuebersicht`
--

DROP TABLE IF EXISTS `tnewsmonatsuebersicht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tnewsmonatsuebersicht` (
  `kNewsMonatsUebersicht` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `nMonat` int(10) unsigned NOT NULL,
  `nJahr` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kNewsMonatsUebersicht`),
  KEY `nMonat` (`nMonat`,`nJahr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tnummern`
--

DROP TABLE IF EXISTS `tnummern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tnummern` (
  `nKundennummer` int(10) unsigned DEFAULT NULL,
  `nDebitorennummer` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tonboarding`
--

DROP TABLE IF EXISTS `tonboarding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tonboarding` (
  `kOnboarding` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL DEFAULT 0,
  `kAdminlogin` int(11) DEFAULT NULL,
  `nMinuten` int(11) DEFAULT NULL,
  `cKommentar` varchar(255) DEFAULT NULL,
  `dDatum` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kOnboarding`),
  KEY `kAdminlogin` (`kAdminlogin`),
  KEY `kAccount` (`kAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `toptin`
--

DROP TABLE IF EXISTS `toptin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toptin` (
  `kOptin` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kLeistung` int(10) unsigned NOT NULL,
  `cHash` varchar(255) NOT NULL,
  `jJson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`jJson`)),
  `dErstellt` datetime NOT NULL DEFAULT current_timestamp(),
  `dBenutzt` datetime DEFAULT NULL,
  PRIMARY KEY (`kOptin`),
  UNIQUE KEY `toptin_chash_unique` (`cHash`),
  KEY `toptin_kLeistung_index` (`kLeistung`),
  CONSTRAINT `toptin_kleistung_foreign` FOREIGN KEY (`kLeistung`) REFERENCES `portfolio_leistung` (`kLeistung`)
) ENGINE=InnoDB AUTO_INCREMENT=132868 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `torganisation`
--

DROP TABLE IF EXISTS `torganisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torganisation` (
  `kOrganisation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  `cPublicName` varchar(255) DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned DEFAULT NULL,
  `dAktualisiertAm` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kOrganisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpartnereinladung`
--

DROP TABLE IF EXISTS `tpartnereinladung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpartnereinladung` (
  `kPartnereinladung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `cAnrede` varchar(20) DEFAULT NULL,
  `cNachname` varchar(255) DEFAULT NULL,
  `cEmail` varchar(255) DEFAULT NULL,
  `cKommentar` varchar(255) DEFAULT NULL,
  `cIdentifier` varchar(40) DEFAULT NULL,
  `cTyp` enum('Servicepartner','Steuerberater') DEFAULT NULL,
  `nLinkAufrufe` int(10) unsigned DEFAULT 0,
  `dVertragseinsicht` datetime DEFAULT NULL,
  `dAkzeptiert` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `nDeleted` tinyint(3) unsigned DEFAULT 0,
  PRIMARY KEY (`kPartnereinladung`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpasswortvergessen`
--

DROP TABLE IF EXISTS `tpasswortvergessen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpasswortvergessen` (
  `kAccount` int(11) NOT NULL,
  `cHash` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kAccount`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpilotdatei`
--

DROP TABLE IF EXISTS `tpilotdatei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpilotdatei` (
  `kDatei` int(11) NOT NULL AUTO_INCREMENT,
  `kProgramm` int(11) NOT NULL,
  `cDatei` varchar(255) NOT NULL,
  `cVersion` varchar(255) NOT NULL,
  `cBeschreibung` text NOT NULL,
  `nDownloads` int(11) NOT NULL DEFAULT 0,
  `nAktiv` tinyint(4) NOT NULL DEFAULT 1,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kDatei`),
  KEY `kProgramm` (`kProgramm`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpilotfreigabe`
--

DROP TABLE IF EXISTS `tpilotfreigabe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpilotfreigabe` (
  `kDatei` int(11) NOT NULL DEFAULT 0,
  `kAccount` int(11) NOT NULL DEFAULT 0,
  `dFreigabe` datetime DEFAULT NULL,
  PRIMARY KEY (`kDatei`,`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpilotprogramm`
--

DROP TABLE IF EXISTS `tpilotprogramm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpilotprogramm` (
  `kProgramm` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `cBeschreibung` text NOT NULL,
  `cMail` varchar(255) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `dGueltigBis` date DEFAULT NULL,
  `dErstellt` datetime NOT NULL,
  `bSichtbarkeit` tinyint(4) DEFAULT 0,
  `cDatenschutzrichtlinie` text DEFAULT NULL,
  `bOffenerDownload` tinyint(4) DEFAULT 0,
  `nHilfsmittelRubrik` int(11) DEFAULT NULL,
  `cCode` varchar(15) DEFAULT NULL,
  `cIdentifier` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kProgramm`),
  UNIQUE KEY `tpilotprogramm_cidentifier_unique` (`cIdentifier`),
  KEY `dGueltigBis` (`dGueltigBis`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpilotprogramm_tlicapplication`
--

DROP TABLE IF EXISTS `tpilotprogramm_tlicapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpilotprogramm_tlicapplication` (
  `program_id` int(10) unsigned NOT NULL,
  `application_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`program_id`,`application_id`),
  CONSTRAINT `pilot_program_lic_application_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `tpilotprogramm` (`kProgramm`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpilotsperre`
--

DROP TABLE IF EXISTS `tpilotsperre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpilotsperre` (
  `kAccount` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `cGrund` text NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kAccount`),
  KEY `kAdminlogin` (`kAdminlogin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpilotteilnehmer`
--

DROP TABLE IF EXISTS `tpilotteilnehmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpilotteilnehmer` (
  `kProgramm` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dAbmeldung` datetime DEFAULT NULL,
  `dTeilnahme` datetime DEFAULT NULL,
  `dGesperrt` datetime DEFAULT NULL,
  `cNotiz` text DEFAULT NULL,
  `bFreigegeben` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`kProgramm`,`kAccount`),
  KEY `tpilotteilnehmer_kAccount_index` (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tplaneritem`
--

DROP TABLE IF EXISTS `tplaneritem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tplaneritem` (
  `kPlaneritem` int(11) NOT NULL AUTO_INCREMENT,
  `kAdminuser` int(11) NOT NULL,
  `timeFrom` time NOT NULL,
  `timeTill` time NOT NULL,
  `bFullday` enum('0','1') DEFAULT '0',
  `bPublic` enum('0','1') NOT NULL DEFAULT '0',
  `cTitle` varchar(255) NOT NULL,
  `cDescription` longtext NOT NULL,
  `dDateStart` date NOT NULL,
  `dDateEnd` date NOT NULL,
  `dCreated` datetime NOT NULL,
  `dEdited` datetime DEFAULT NULL,
  `dDeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`kPlaneritem`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpremiumservice`
--

DROP TABLE IF EXISTS `tpremiumservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpremiumservice` (
  `kPremiumservice` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kLizenz` int(11) NOT NULL,
  `kLicense` int(11) NOT NULL DEFAULT 0,
  `kAdminlogin` int(11) NOT NULL,
  `eServiceArt` enum('rundum','install','wawiclient','wawiserver','updateshop','installconnector','wawidbreparatur','installshipping') NOT NULL,
  `cNotiz` text NOT NULL,
  `dEingetragen` datetime NOT NULL,
  `dErledigt` datetime NOT NULL,
  PRIMARY KEY (`kPremiumservice`)
) ENGINE=MyISAM AUTO_INCREMENT=799 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
/*!50032 DROP TRIGGER IF EXISTS tpremiumserviceafterupdate */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 TRIGGER `tpremiumserviceafterupdate` AFTER UPDATE ON `tpremiumservice` FOR EACH ROW BEGIN
	INSERT INTO tpremiumservicehistory SET kPremiumservice = NEW.kPremiumservice, kAccount = NEW.kAccount, kLizenz = NEW.kLizenz, kLicense = NEW.kLicense, kAdminlogin = NEW.kAdminlogin, eServiceArt = NEW.eServiceArt, cNotiz = NEW.cNotiz, dEingetragen = NEW.dEingetragen, dErledigt = NEW.dErledigt,dGeaendert = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tpremiumservicehistory`
--

DROP TABLE IF EXISTS `tpremiumservicehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpremiumservicehistory` (
  `kPremiumserviceHistory` int(11) NOT NULL AUTO_INCREMENT,
  `kPremiumservice` int(11) NOT NULL DEFAULT 0,
  `kAccount` int(11) NOT NULL,
  `kLizenz` int(11) NOT NULL,
  `kLicense` int(11) NOT NULL DEFAULT 0,
  `kAdminlogin` int(11) NOT NULL,
  `eServiceArt` enum('rundum','install','wawiclient','wawiserver','updateshop','installconnector','wawidbreparatur','installshipping') NOT NULL,
  `cNotiz` text NOT NULL,
  `dEingetragen` datetime NOT NULL,
  `dErledigt` datetime NOT NULL,
  `dGeaendert` datetime NOT NULL,
  PRIMARY KEY (`kPremiumserviceHistory`)
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tpremiumservicenotiz`
--

DROP TABLE IF EXISTS `tpremiumservicenotiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpremiumservicenotiz` (
  `kNotiz` int(11) NOT NULL AUTO_INCREMENT,
  `kPremiumservice` int(11) NOT NULL DEFAULT 0,
  `cNotiz` text NOT NULL,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kNotiz`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tprodukt`
--

DROP TABLE IF EXISTS `tprodukt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tprodukt` (
  `kProdukt` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `cBildPfad` varchar(255) DEFAULT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `nSort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kProdukt`),
  KEY `nAktiv` (`nAktiv`,`nSort`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tprotokoll`
--

DROP TABLE IF EXISTS `tprotokoll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tprotokoll` (
  `kProtokoll` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kZertifikatanfrage` int(10) unsigned NOT NULL,
  `cBearbeiter` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cAnmerkung` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dPruefdatum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kProtokoll`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tprotokollanlage`
--

DROP TABLE IF EXISTS `tprotokollanlage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tprotokollanlage` (
  `kProtokollAnlage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kProtokoll` int(10) unsigned NOT NULL,
  `cID` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cPfad` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`kProtokollAnlage`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tprotokollkriterium`
--

DROP TABLE IF EXISTS `tprotokollkriterium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tprotokollkriterium` (
  `kProtokollkriterium` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cTitel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cBeschreibung` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nSort` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kProtokollkriterium`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tprotokollvorgang`
--

DROP TABLE IF EXISTS `tprotokollvorgang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tprotokollvorgang` (
  `kProtokollvorgang` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kProtokoll` int(10) unsigned NOT NULL,
  `kProtokollkriterium` int(10) unsigned NOT NULL,
  `nStatus` int(1) NOT NULL,
  `cNotiz` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`kProtokollvorgang`)
) ENGINE=MyISAM AUTO_INCREMENT=841 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trechnung`
--

DROP TABLE IF EXISTS `trechnung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trechnung` (
  `kRechnung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `kHosting` int(10) unsigned DEFAULT NULL,
  `cRechnungsart` varchar(255) NOT NULL,
  `nRechnungsnummer` int(10) unsigned DEFAULT NULL,
  `cRechnungsnummer` varchar(20) DEFAULT NULL,
  `cRechnungsmonat` varchar(255) DEFAULT NULL,
  `cKommentar` text DEFAULT NULL,
  `dRechnungsdatum` date DEFAULT NULL,
  `cZahlungsart` varchar(255) NOT NULL DEFAULT 'LS',
  `cStatus` varchar(30) DEFAULT NULL,
  `dBezahlt` date DEFAULT NULL,
  `dAusgebucht` datetime DEFAULT NULL,
  `nRLS` tinyint(4) DEFAULT 0,
  `dInkasso` datetime DEFAULT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  PRIMARY KEY (`kRechnung`),
  KEY `nRechnungsnummer` (`nRechnungsnummer`,`cRechnungsmonat`),
  KEY `kAccount` (`kAccount`),
  KEY `kHosting` (`kHosting`),
  KEY `cRechnungsnummer` (`cRechnungsnummer`),
  KEY `trechnung_krechnung_kaccount_drechnungsdatum_index` (`kRechnung`,`kAccount`,`dRechnungsdatum`)
) ENGINE=MyISAM AUTO_INCREMENT=1077694 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trechnungdirektleistung`
--

DROP TABLE IF EXISTS `trechnungdirektleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trechnungdirektleistung` (
  `kRechnungDirektleistung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAdminlogin` int(11) DEFAULT NULL,
  `kAccount` int(11) DEFAULT NULL,
  `kRechnungPos` int(11) NOT NULL DEFAULT 0,
  `kDirektleistungTyp` int(10) unsigned DEFAULT NULL,
  `kKaufprodukt` int(10) unsigned DEFAULT 0,
  `kEmpfehlungslistePos` int(10) unsigned DEFAULT 0,
  `cName` varchar(200) DEFAULT NULL,
  `fBetragNetto` double DEFAULT NULL,
  `nDeleted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kRechnungDirektleistung`),
  KEY `kAccount` (`kAccount`),
  KEY `kRechnungPos` (`kRechnungPos`)
) ENGINE=MyISAM AUTO_INCREMENT=2250 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trechnungdirektleistungtag`
--

DROP TABLE IF EXISTS `trechnungdirektleistungtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trechnungdirektleistungtag` (
  `kRechnungDirektleistungTag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kRechnungDirektleistung` int(10) unsigned DEFAULT NULL,
  `kTag` int(10) unsigned DEFAULT NULL,
  `kAdminLogin` int(11) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kRechnungDirektleistungTag`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trechnungerstellung`
--

DROP TABLE IF EXISTS `trechnungerstellung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trechnungerstellung` (
  `kAccount` int(10) unsigned NOT NULL DEFAULT 0,
  `cRechnungsmonat` varchar(20) NOT NULL DEFAULT '',
  `cKommentar` text DEFAULT NULL,
  `dRechnungErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kAccount`,`cRechnungsmonat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trechnungpos`
--

DROP TABLE IF EXISTS `trechnungpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trechnungpos` (
  `kRechnungPos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kRechnung` int(10) unsigned DEFAULT NULL,
  `kHostingPos` int(10) unsigned NOT NULL,
  `kSearch` int(11) NOT NULL DEFAULT 0,
  `kRepricer` int(11) NOT NULL DEFAULT 0,
  `kUserAmaRep` int(11) NOT NULL DEFAULT 0,
  `kLic` int(11) NOT NULL DEFAULT 0,
  `account_support_orders_id` int(10) unsigned NOT NULL DEFAULT 0,
  `kTrackAndTraceBuchung` int(10) unsigned NOT NULL DEFAULT 0,
  `kConnectorBuchung` int(10) unsigned NOT NULL DEFAULT 0,
  `kRechnungDirektleistung` int(11) NOT NULL DEFAULT 0,
  `cName` text DEFAULT NULL,
  `fBetrag` double DEFAULT NULL,
  `fOffen` double NOT NULL DEFAULT 0,
  `fMwSt` double(4,2) DEFAULT NULL,
  `cPosTyp` varchar(30) NOT NULL,
  `nNichtProvisionierbar` tinyint(3) unsigned DEFAULT 0,
  PRIMARY KEY (`kRechnungPos`),
  KEY `kRechnung` (`kRechnung`),
  KEY `kHostingPos` (`kHostingPos`),
  KEY `kSearch` (`kSearch`),
  KEY `kRepricer` (`kRepricer`),
  KEY `kUserAmaRep` (`kUserAmaRep`)
) ENGINE=MyISAM AUTO_INCREMENT=3231976 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trechnungskorrektur`
--

DROP TABLE IF EXISTS `trechnungskorrektur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trechnungskorrektur` (
  `kRechnungskorrektur` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned DEFAULT NULL,
  `kRechnung` int(10) unsigned DEFAULT NULL,
  `kAdminLogin` int(10) unsigned DEFAULT NULL,
  `nRechnungskorrekturnummer` int(11) DEFAULT NULL,
  `cRechnungskorrekturnummer` varchar(15) DEFAULT NULL,
  `cDruckAnmerkung` text DEFAULT NULL,
  `cInternerKommentar` text DEFAULT NULL,
  `cEmailText` text DEFAULT NULL,
  `cZahlungsart` varchar(50) DEFAULT NULL,
  `cPDFDokumentPfad` varchar(255) DEFAULT NULL,
  `cStatus` enum('intern','zugestellt','ausgezahlt') DEFAULT NULL,
  `dPDFZugestellt` datetime DEFAULT NULL,
  `dAusgezahlt` datetime DEFAULT NULL,
  `dFiBuExport` datetime DEFAULT NULL,
  `dBearbeitet` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kRechnungskorrektur`),
  KEY `cRechnungskorrekturnummer` (`cRechnungskorrekturnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=1219 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trechnungskorrekturpos`
--

DROP TABLE IF EXISTS `trechnungskorrekturpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trechnungskorrekturpos` (
  `kRechnungskorrekturPos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kRechnungskorrektur` int(10) unsigned DEFAULT NULL,
  `nPosNr` smallint(5) unsigned DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `fBetragNetto` decimal(30,2) DEFAULT NULL,
  `fMwSt` decimal(30,2) DEFAULT NULL,
  PRIMARY KEY (`kRechnungskorrekturPos`)
) ENGINE=InnoDB AUTO_INCREMENT=2099 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trechnungskorrekturzahlung`
--

DROP TABLE IF EXISTS `trechnungskorrekturzahlung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trechnungskorrekturzahlung` (
  `kRechnungskorrekturZahlung` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kRechnungskorrektur` int(10) unsigned DEFAULT NULL,
  `kRechnung` int(10) unsigned DEFAULT NULL,
  `kAdminLogin` int(10) unsigned DEFAULT NULL,
  `fBetrag` decimal(30,2) DEFAULT NULL,
  `cZahlungsart` enum('Ueberweisung','Verrechnung','Guthaben') DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kRechnungskorrekturZahlung`)
) ENGINE=InnoDB AUTO_INCREMENT=1245 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trechnungvw`
--

DROP TABLE IF EXISTS `trechnungvw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trechnungvw` (
  `kRechnungsVW` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cRechnungsnummer` varchar(255) DEFAULT NULL,
  `dRechnungsdatum` date DEFAULT NULL,
  `kKey` int(10) unsigned DEFAULT NULL,
  `cSystem` varchar(255) DEFAULT NULL,
  `nSigniert` tinyint(3) unsigned DEFAULT 0,
  `nVerifiziert` tinyint(3) unsigned DEFAULT 0,
  `nVersendet` tinyint(3) unsigned DEFAULT 0,
  `cDateiname` varchar(255) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kRechnungsVW`),
  KEY `kKey` (`kKey`)
) ENGINE=MyISAM AUTO_INCREMENT=1194048 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treferenz`
--

DROP TABLE IF EXISTS `treferenz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treferenz` (
  `kReferenz` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(10) unsigned NOT NULL,
  `kProdukt` int(10) unsigned DEFAULT NULL,
  `kAccount` int(10) DEFAULT NULL,
  `cName` varchar(255) NOT NULL,
  `cGeschaeftsfuehrer` varchar(255) NOT NULL,
  `nJTLAktivSeit` int(11) NOT NULL,
  `cBildPfad` varchar(255) DEFAULT NULL,
  `cURL` varchar(255) NOT NULL,
  `cSortiment` varchar(255) NOT NULL,
  `kBranche` tinyint(4) NOT NULL,
  `kAnzahlMitarbeiter` tinyint(4) NOT NULL,
  `kVersandvolumen` tinyint(4) NOT NULL,
  `cAnsprechpartnerName` varchar(255) NOT NULL,
  `cAnsprechpartnerMail` varchar(255) NOT NULL,
  `kFokus1` tinyint(4) NOT NULL,
  `kFokus2` tinyint(4) NOT NULL,
  `kWeitere1` tinyint(4) DEFAULT NULL,
  `kWeitere2` tinyint(4) DEFAULT NULL,
  `kWeitere3` tinyint(4) DEFAULT NULL,
  `kWeitere4` tinyint(4) DEFAULT NULL,
  `kWeitere5` tinyint(4) DEFAULT NULL,
  `kPlugin1` int(11) DEFAULT NULL,
  `kPlugin2` int(11) DEFAULT NULL,
  `kPlugin3` int(11) DEFAULT NULL,
  `kPlugin4` int(11) DEFAULT NULL,
  `kPlugin5` int(11) DEFAULT NULL,
  `kPlugin6` int(11) DEFAULT NULL,
  `kPlugin7` int(11) DEFAULT NULL,
  `kPlugin8` int(11) DEFAULT NULL,
  `kPlugin9` int(11) DEFAULT NULL,
  `kPlugin10` int(11) DEFAULT NULL,
  `dProjektbeginn` date DEFAULT NULL,
  `cProjektdauer` varchar(50) NOT NULL,
  `kProjektkosten` tinyint(4) NOT NULL,
  `cBeschreibung` text NOT NULL,
  `kServicepartner1` int(11) NOT NULL,
  `kServicepartner2` int(11) NOT NULL,
  `kServicepartner3` int(11) NOT NULL,
  `kTechnologiepartner1` int(11) DEFAULT NULL,
  `kTechnologiepartner2` int(11) DEFAULT NULL,
  `kTechnologiepartner3` int(11) DEFAULT NULL,
  `cDienstleister1` varchar(255) DEFAULT NULL,
  `cDienstleister2` varchar(255) DEFAULT NULL,
  `cDienstleister3` varchar(255) DEFAULT NULL,
  `nAktiv` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `nSort` int(10) unsigned NOT NULL,
  `nBewertet` tinyint(1) NOT NULL DEFAULT 0,
  `nNichtVerkn` tinyint(1) NOT NULL DEFAULT 0,
  `nGewichtungJTL` tinyint(4) NOT NULL DEFAULT 0,
  `dErstellt` datetime DEFAULT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  PRIMARY KEY (`kReferenz`),
  KEY `nAktiv` (`nAktiv`,`nSort`),
  KEY `nBewertet` (`nBewertet`,`nNichtVerkn`),
  KEY `nGewichtungJTL` (`nGewichtungJTL`),
  KEY `kServicepartner` (`kServicepartner`)
) ENGINE=MyISAM AUTO_INCREMENT=3103 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treferenzbewertung`
--

DROP TABLE IF EXISTS `treferenzbewertung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treferenzbewertung` (
  `kReferenzBewertung` int(10) NOT NULL AUTO_INCREMENT,
  `kReferenz` int(10) NOT NULL,
  `nErreichbarkeit` int(10) NOT NULL,
  `nZuverlaessigkeit` int(10) NOT NULL,
  `nQualitaet` int(10) NOT NULL,
  `nPreisLeistung` int(10) NOT NULL,
  `cKundenkommentar` text NOT NULL,
  `nOeffentlich` tinyint(4) NOT NULL,
  `nZufrieden` tinyint(4) NOT NULL,
  `nWeiterempfehlen` tinyint(4) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kReferenzBewertung`),
  KEY `kReferenz` (`kReferenz`)
) ENGINE=MyISAM AUTO_INCREMENT=597 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treferenzbilder`
--

DROP TABLE IF EXISTS `treferenzbilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treferenzbilder` (
  `kBild` int(11) NOT NULL AUTO_INCREMENT,
  `kReferenz` int(11) NOT NULL,
  `cBeschreibung` varchar(255) DEFAULT NULL,
  `cBild` varchar(50) DEFAULT NULL,
  `eTyp` enum('','Screenshot','Logo','Impression') DEFAULT NULL,
  `eTypDetail` enum('','Default','Startseite','Detailseite','Firmenlogo','Portrait Geschäftsführung','Team-/Gruppenfoto','Außenansicht Unternehmen','Foto Büro & Verwaltung','Foto Lager & Versand') DEFAULT NULL,
  PRIMARY KEY (`kBild`),
  KEY `kReferenz` (`kReferenz`)
) ENGINE=InnoDB AUTO_INCREMENT=1541 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treferenzen`
--

DROP TABLE IF EXISTS `treferenzen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treferenzen` (
  `kReferenzen` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kKategorie` int(10) unsigned NOT NULL,
  `kServicepartner` int(10) unsigned DEFAULT NULL,
  `cName` varchar(255) NOT NULL,
  `cMail` varchar(255) DEFAULT NULL,
  `cURL` varchar(255) NOT NULL,
  `cBeschreibung` text DEFAULT NULL,
  `cBildPfad` varchar(255) NOT NULL,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `nHighlight` tinyint(4) NOT NULL DEFAULT 0,
  `nSort` int(10) unsigned NOT NULL,
  `cOverlayTitel` varchar(255) NOT NULL,
  `cOverlayText` varchar(255) NOT NULL,
  `dBenachrichtigt` datetime DEFAULT NULL,
  PRIMARY KEY (`kReferenzen`),
  KEY `nAktiv` (`nAktiv`,`nSort`),
  KEY `kServicepartner` (`kServicepartner`)
) ENGINE=MyISAM AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treferenzgeschaeftsbereich`
--

DROP TABLE IF EXISTS `treferenzgeschaeftsbereich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treferenzgeschaeftsbereich` (
  `kReferenzGeschaeftsbereich` int(11) NOT NULL AUTO_INCREMENT,
  `kReferenz` int(11) NOT NULL,
  `eType` enum('','LAGER','VERTRIEB','MARKETING') NOT NULL,
  `kGeschaeftsbereich` int(11) DEFAULT NULL,
  `cCustom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kReferenzGeschaeftsbereich`),
  KEY `kReferenz` (`kReferenz`)
) ENGINE=InnoDB AUTO_INCREMENT=8777 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treferenzgeschaeftsbereiche`
--

DROP TABLE IF EXISTS `treferenzgeschaeftsbereiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treferenzgeschaeftsbereiche` (
  `kGeschaeftsbereich` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  `eTyp` enum('LAGER','VERTRIEB','MARKETING') DEFAULT NULL,
  `nSort` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`kGeschaeftsbereich`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treferenzleistung`
--

DROP TABLE IF EXISTS `treferenzleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treferenzleistung` (
  `kReferenzLeistung` int(11) NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(10) NOT NULL,
  `kReferenz` int(11) NOT NULL,
  `kLeistung` int(11) NOT NULL,
  PRIMARY KEY (`kReferenzLeistung`),
  KEY `kServicepartner` (`kServicepartner`)
) ENGINE=InnoDB AUTO_INCREMENT=38833 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treferenzlog`
--

DROP TABLE IF EXISTS `treferenzlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treferenzlog` (
  `kReferenzLog` int(11) NOT NULL AUTO_INCREMENT,
  `kReferenz` int(11) DEFAULT NULL,
  `kAdminlogin` int(11) DEFAULT 0,
  `cAktion` varchar(255) DEFAULT NULL,
  `cNachricht` varchar(255) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kReferenzLog`)
) ENGINE=InnoDB AUTO_INCREMENT=4033 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tregistrierungszweck`
--

DROP TABLE IF EXISTS `tregistrierungszweck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tregistrierungszweck` (
  `kRegistrierungszweck` tinyint(3) unsigned DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trepricer`
--

DROP TABLE IF EXISTS `trepricer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trepricer` (
  `kRepricer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned NOT NULL,
  `cName` varchar(255) NOT NULL,
  `cMerchantId` varchar(255) NOT NULL,
  `cProjectId` varchar(255) NOT NULL,
  `cAuthHash` varchar(255) NOT NULL,
  `cAuthToken` varchar(255) DEFAULT NULL,
  `cServerUrl` varchar(255) NOT NULL,
  `cTarif` varchar(255) NOT NULL,
  `nState` tinyint(1) unsigned NOT NULL,
  `bLocked` tinyint(1) unsigned DEFAULT 0,
  `dCreated` datetime NOT NULL,
  `dTerminateTo` datetime DEFAULT NULL,
  PRIMARY KEY (`kRepricer`),
  KEY `cServerUrl` (`cServerUrl`)
) ENGINE=MyISAM AUTO_INCREMENT=474 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trepricer_customercare`
--

DROP TABLE IF EXISTS `trepricer_customercare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trepricer_customercare` (
  `kAccount` int(11) NOT NULL AUTO_INCREMENT,
  `nProductsCount` int(11) NOT NULL,
  `nMailverschickt` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dAktualisiert` datetime NOT NULL,
  PRIMARY KEY (`kAccount`)
) ENGINE=MyISAM AUTO_INCREMENT=30122 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trepricerabrechnung`
--

DROP TABLE IF EXISTS `trepricerabrechnung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trepricerabrechnung` (
  `kAccount` int(10) unsigned DEFAULT NULL,
  `kUser` int(10) unsigned NOT NULL,
  `cName` varchar(100) DEFAULT NULL,
  `nAbrechenbareTage` tinyint(3) unsigned DEFAULT NULL,
  `nSKUs` int(10) unsigned DEFAULT NULL,
  `fKosten` float(10,2) DEFAULT NULL,
  `nKostenfrei` tinyint(3) unsigned DEFAULT NULL,
  `dProduktiv` datetime DEFAULT NULL,
  `cZeitraum` varchar(10) NOT NULL,
  PRIMARY KEY (`cZeitraum`,`kUser`),
  KEY `trepricerabrechnung_kAccount_cZeitraum_index` (`kAccount`,`cZeitraum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trepricerevent`
--

DROP TABLE IF EXISTS `trepricerevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trepricerevent` (
  `kRepricerEvent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned NOT NULL,
  `nType` tinyint(4) NOT NULL COMMENT '1 = User löschen, 2 = Testzeitraum verlängern',
  `cLog` text NOT NULL,
  `dCreated` datetime NOT NULL,
  PRIMARY KEY (`kRepricerEvent`),
  KEY `kAccount` (`kAccount`,`nType`,`dCreated`)
) ENGINE=MyISAM AUTO_INCREMENT=290 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trepricerkuendigung`
--

DROP TABLE IF EXISTS `trepricerkuendigung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trepricerkuendigung` (
  `kRepricer` int(11) NOT NULL,
  `dKuendigungZum` date DEFAULT NULL,
  `dGekuendigt` datetime DEFAULT NULL,
  `bKuendigungErfolgreich` tinyint(1) NOT NULL DEFAULT 0,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `dKuendigungAm` datetime DEFAULT NULL,
  PRIMARY KEY (`kRepricer`),
  KEY `kAdminlogin` (`kAdminlogin`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trepricerlog`
--

DROP TABLE IF EXISTS `trepricerlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trepricerlog` (
  `kLog` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cContent` text NOT NULL,
  `fVersion` double unsigned NOT NULL,
  `dCreated` datetime NOT NULL,
  PRIMARY KEY (`kLog`),
  KEY `fVersion` (`fVersion`),
  KEY `dCreated` (`dCreated`)
) ENGINE=MyISAM AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trepricertarifhistory`
--

DROP TABLE IF EXISTS `trepricertarifhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trepricertarifhistory` (
  `kRepricerTarifHistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned NOT NULL,
  `kAdminlogin` int(10) unsigned DEFAULT 0,
  `kRepricer` int(10) unsigned NOT NULL,
  `cMode` varchar(255) NOT NULL,
  `cExecutionPerson` varchar(255) NOT NULL,
  `dChanged` datetime NOT NULL,
  PRIMARY KEY (`kRepricerTarifHistory`),
  KEY `kAccount` (`kAccount`,`kAdminlogin`,`kRepricer`)
) ENGINE=MyISAM AUTO_INCREMENT=422 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsearch`
--

DROP TABLE IF EXISTS `tsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsearch` (
  `kSearch` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned NOT NULL,
  `cUrl` varchar(255) NOT NULL,
  `cProjectId` varchar(255) NOT NULL,
  `cAuthHash` varchar(255) NOT NULL,
  `cServerUrl` varchar(255) NOT NULL,
  `cTarif` varchar(255) NOT NULL,
  `nState` tinyint(4) NOT NULL COMMENT '0 = Test, 1 = Produktiv, 2 = Kostenlos, 3 = Gekündigt',
  `bLocked` enum('0','1') NOT NULL DEFAULT '0',
  `dErstellt` datetime NOT NULL,
  `dTerminateTo` datetime DEFAULT NULL,
  PRIMARY KEY (`kSearch`),
  KEY `cServerUrl` (`cServerUrl`)
) ENGINE=MyISAM AUTO_INCREMENT=7984 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsearch_customercare`
--

DROP TABLE IF EXISTS `tsearch_customercare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsearch_customercare` (
  `kSearch` int(11) NOT NULL,
  `nCoreCount` int(11) NOT NULL,
  `nMailverschickt` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dAktualisiert` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsearchevent`
--

DROP TABLE IF EXISTS `tsearchevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsearchevent` (
  `kSearchEvent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned NOT NULL,
  `nType` tinyint(4) NOT NULL COMMENT '1 = Usershop löschen, 2 = Testzeitraum verlängern',
  `cLog` text NOT NULL,
  `dCreated` datetime NOT NULL,
  PRIMARY KEY (`kSearchEvent`),
  KEY `kAccount` (`kAccount`,`nType`,`dCreated`)
) ENGINE=MyISAM AUTO_INCREMENT=5378 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsearchhistory`
--

DROP TABLE IF EXISTS `tsearchhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsearchhistory` (
  `kSearchHistory` int(11) NOT NULL AUTO_INCREMENT,
  `kSearch` int(10) DEFAULT NULL,
  `kAccount` int(10) unsigned NOT NULL,
  `cUrl` varchar(255) NOT NULL,
  `cProjectId` varchar(255) NOT NULL,
  `cAuthHash` varchar(255) NOT NULL,
  `cServerUrl` varchar(255) NOT NULL,
  `cTarif` varchar(255) NOT NULL,
  `nState` tinyint(4) NOT NULL COMMENT '0 = Test, 1 = Produktiv, 2 = Kostenlos, 3 = Gekündigt',
  `bLocked` enum('0','1') NOT NULL DEFAULT '0',
  `dErstellt` datetime NOT NULL,
  `dEingetragen` datetime NOT NULL,
  PRIMARY KEY (`kSearchHistory`),
  KEY `cServerUrl` (`cServerUrl`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsearchkuendigung`
--

DROP TABLE IF EXISTS `tsearchkuendigung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsearchkuendigung` (
  `kSearch` int(11) NOT NULL,
  `dKuendigungZum` date DEFAULT NULL,
  `dKuendigungAm` datetime DEFAULT NULL,
  `dGekuendigt` datetime DEFAULT NULL,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kSearch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsearchkuendigunghistory`
--

DROP TABLE IF EXISTS `tsearchkuendigunghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsearchkuendigunghistory` (
  `kSearchkuendigung` int(11) NOT NULL AUTO_INCREMENT,
  `kSearch` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `cAction` enum('quit','recall') DEFAULT 'quit',
  `cAenderungDurch` varchar(255) NOT NULL,
  `dKuendigungZum` date DEFAULT NULL,
  `dEingetragen` datetime DEFAULT NULL,
  PRIMARY KEY (`kSearchkuendigung`)
) ENGINE=MyISAM AUTO_INCREMENT=2229 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsearchtarife`
--

DROP TABLE IF EXISTS `tsearchtarife`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsearchtarife` (
  `kSearchtarif` int(11) NOT NULL AUTO_INCREMENT,
  `cTarifname` varchar(255) NOT NULL,
  `cAnzeigename` varchar(255) NOT NULL,
  `fPreis` float(10,2) NOT NULL,
  `nBuchbar` int(11) NOT NULL,
  `nSort` int(11) NOT NULL,
  PRIMARY KEY (`kSearchtarif`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsearchtarifhistory`
--

DROP TABLE IF EXISTS `tsearchtarifhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsearchtarifhistory` (
  `kSearchtarifhistory` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `kSearch` int(11) NOT NULL,
  `cTarifalt` varchar(255) NOT NULL,
  `cTarifneu` varchar(255) NOT NULL,
  `cAenderungDurch` varchar(255) NOT NULL,
  `dGeaendert` datetime NOT NULL,
  PRIMARY KEY (`kSearchtarifhistory`)
) ENGINE=MyISAM AUTO_INCREMENT=2849 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tserver`
--

DROP TABLE IF EXISTS `tserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tserver` (
  `kServer` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `cIP` varchar(255) NOT NULL,
  `cServerAdmin` varchar(255) NOT NULL,
  `cServerPass` varchar(255) NOT NULL,
  `eServertyp` enum('sql','sqlstandard','shop','shop3','shop4') NOT NULL DEFAULT 'shop4',
  `use_for_install` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`kServer`)
) ENGINE=MyISAM AUTO_INCREMENT=579 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tservicepartner`
--

DROP TABLE IF EXISTS `tservicepartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tservicepartner` (
  `kServicepartner` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAnsprechpartner` int(11) DEFAULT NULL,
  `kLand` int(10) unsigned NOT NULL,
  `kGeschaeftsform` tinyint(3) unsigned DEFAULT NULL,
  `cFirmensitz` varchar(255) NOT NULL,
  `nGruendungsjahr` int(11) NOT NULL DEFAULT 0,
  `cUSTID` varchar(255) DEFAULT NULL,
  `cHRNR` varchar(255) DEFAULT NULL,
  `cHROrt` varchar(255) DEFAULT NULL,
  `cGesellschafter` varchar(255) DEFAULT NULL,
  `cFirma` varchar(255) NOT NULL,
  `cStrasse` varchar(255) NOT NULL,
  `cAdresszusatz` varchar(255) DEFAULT NULL,
  `cPLZ` varchar(255) NOT NULL,
  `cOrt` varchar(255) NOT NULL,
  `cEmail` varchar(255) NOT NULL DEFAULT '',
  `cWWW` varchar(255) DEFAULT NULL,
  `cOnlineshop` varchar(255) DEFAULT NULL,
  `cBildPfad` varchar(255) DEFAULT NULL,
  `cLogoPfad` varchar(255) NOT NULL DEFAULT '',
  `cBild1` varchar(255) DEFAULT NULL,
  `cBild2` varchar(255) DEFAULT NULL,
  `cBild3` varchar(255) DEFAULT NULL,
  `cBild4` varchar(255) DEFAULT NULL,
  `cBeschreibung1` text NOT NULL,
  `cBeschreibung2` text NOT NULL,
  `cBeschreibung3` text NOT NULL,
  `cBeschreibung4` text NOT NULL,
  `cBeschreibung` text DEFAULT NULL,
  `cKurzbeschreibung` varchar(140) DEFAULT NULL,
  `cVermerkung` text DEFAULT NULL,
  `kKundensegment1` tinyint(1) DEFAULT NULL,
  `kKundensegment2` tinyint(1) DEFAULT NULL,
  `kKundensegment3` tinyint(1) DEFAULT NULL,
  `kAnvisierteProjektgroessen` tinyint(1) DEFAULT NULL,
  `kBisherigeProjektgroessen` tinyint(1) DEFAULT NULL,
  `nMitarbeiterFirma` tinyint(4) DEFAULT NULL,
  `nMitarbeiterJTL` tinyint(4) DEFAULT NULL,
  `nMitarbeiterNetzwerk` tinyint(4) DEFAULT NULL,
  `cFacebook` varchar(255) DEFAULT NULL,
  `cXING` varchar(255) DEFAULT NULL,
  `cTwitter` varchar(255) DEFAULT NULL,
  `cYouTube` varchar(255) DEFAULT NULL,
  `dLat` double NOT NULL DEFAULT 0,
  `dLng` double NOT NULL DEFAULT 0,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `nRestricted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nPremium` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nSort` int(10) unsigned NOT NULL DEFAULT 0,
  `nAufrufe` int(10) NOT NULL DEFAULT 0,
  `fMalus` double NOT NULL DEFAULT 1,
  `nVertragGesendet` int(11) NOT NULL,
  `nProjektNews` int(11) NOT NULL DEFAULT 1,
  `dErstellt` datetime NOT NULL DEFAULT current_timestamp(),
  `dAuslastungBis` date DEFAULT NULL,
  `dGeaendert` datetime NOT NULL DEFAULT current_timestamp(),
  `badgestatus` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kServicepartner`),
  KEY `nAktiv` (`nAktiv`,`nSort`),
  KEY `cFirma` (`cFirma`)
) ENGINE=MyISAM AUTO_INCREMENT=1600 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tservicepartneraufrufe`
--

DROP TABLE IF EXISTS `tservicepartneraufrufe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tservicepartneraufrufe` (
  `kSPAufruf` int(10) NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(10) NOT NULL,
  `dDatum` datetime NOT NULL,
  PRIMARY KEY (`kSPAufruf`),
  KEY `kServicepartner` (`kServicepartner`,`dDatum`)
) ENGINE=InnoDB AUTO_INCREMENT=606676 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tservicepartnerhistory`
--

DROP TABLE IF EXISTS `tservicepartnerhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tservicepartnerhistory` (
  `kHistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(10) unsigned NOT NULL,
  `kAnsprechpartner` int(11) DEFAULT NULL,
  `kLand` int(10) unsigned NOT NULL,
  `kGeschaeftsform` tinyint(3) unsigned DEFAULT NULL,
  `cFirmensitz` varchar(255) NOT NULL,
  `nGruendungsjahr` int(11) NOT NULL,
  `cUSTID` varchar(255) DEFAULT NULL,
  `cHRNR` varchar(255) DEFAULT NULL,
  `cHROrt` varchar(255) DEFAULT NULL,
  `cGesellschafter` varchar(255) DEFAULT NULL,
  `cFirma` varchar(255) NOT NULL,
  `cStrasse` varchar(255) NOT NULL,
  `cAdresszusatz` varchar(255) DEFAULT NULL,
  `cPLZ` varchar(255) NOT NULL,
  `cOrt` varchar(255) NOT NULL,
  `cEmail` varchar(255) NOT NULL,
  `cWWW` varchar(255) DEFAULT NULL,
  `cOnlineshop` varchar(255) DEFAULT NULL,
  `cBildPfad` varchar(255) DEFAULT NULL,
  `cLogoPfad` varchar(255) NOT NULL,
  `cBild1` varchar(255) DEFAULT NULL,
  `cBild2` varchar(255) DEFAULT NULL,
  `cBild3` varchar(255) DEFAULT NULL,
  `cBild4` varchar(255) DEFAULT NULL,
  `cBeschreibung1` text NOT NULL,
  `cBeschreibung2` text NOT NULL,
  `cBeschreibung3` text NOT NULL,
  `cBeschreibung4` text NOT NULL,
  `cBeschreibung` text DEFAULT NULL,
  `cKurzbeschreibung` varchar(140) DEFAULT NULL,
  `cVermerkung` text DEFAULT NULL,
  `kKundensegment1` tinyint(1) DEFAULT NULL,
  `kKundensegment2` tinyint(1) DEFAULT NULL,
  `kKundensegment3` tinyint(1) DEFAULT NULL,
  `kAnvisierteProjektgroessen` tinyint(1) DEFAULT NULL,
  `kBisherigeProjektgroessen` tinyint(1) DEFAULT NULL,
  `nMitarbeiterFirma` tinyint(4) DEFAULT NULL,
  `nMitarbeiterJTL` tinyint(4) DEFAULT NULL,
  `nMitarbeiterNetzwerk` tinyint(4) DEFAULT NULL,
  `cFacebook` varchar(255) DEFAULT NULL,
  `cXING` varchar(255) DEFAULT NULL,
  `cTwitter` varchar(255) DEFAULT NULL,
  `cYouTube` varchar(255) DEFAULT NULL,
  `dLat` double NOT NULL DEFAULT 0,
  `dLng` double NOT NULL DEFAULT 0,
  `nAktiv` tinyint(3) unsigned NOT NULL,
  `nPremium` tinyint(3) unsigned NOT NULL,
  `nSort` int(10) unsigned NOT NULL,
  `nAufrufe` int(10) NOT NULL,
  `fMalus` double NOT NULL DEFAULT 1,
  `nVertragGesendet` int(11) NOT NULL,
  `nProjektNews` int(11) NOT NULL DEFAULT 1,
  `dErstellt` datetime NOT NULL,
  `dAuslastungBis` date DEFAULT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  `badgestatus` tinyint(4) NOT NULL DEFAULT 0,
  `dUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`kHistory`),
  KEY `nAktiv` (`nAktiv`,`nSort`),
  KEY `cFirma` (`cFirma`),
  KEY `kServicepartner` (`kServicepartner`)
) ENGINE=MyISAM AUTO_INCREMENT=11509 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tservicepartnerstatechange`
--

DROP TABLE IF EXISTS `tservicepartnerstatechange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tservicepartnerstatechange` (
  `kId` int(11) NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(11) NOT NULL,
  `nAktivOLD` tinyint(4) NOT NULL,
  `nAktivNEW` tinyint(4) NOT NULL,
  `dCreated` datetime NOT NULL,
  PRIMARY KEY (`kId`),
  KEY `kServicepartner` (`kServicepartner`)
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tshop`
--

DROP TABLE IF EXISTS `tshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tshop` (
  `kShop` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kKaufprodukt` int(10) unsigned NOT NULL,
  `cLizenzkey` varchar(255) NOT NULL,
  `cDomain` varchar(255) NOT NULL,
  `cOutHash` varchar(255) NOT NULL,
  `cPfad` varchar(255) DEFAULT NULL,
  `nLaufendeVersion` int(10) unsigned NOT NULL,
  `dDownloadBis` date DEFAULT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kShop`),
  KEY `cOutHash` (`cOutHash`),
  KEY `cLizenzkey` (`cLizenzkey`),
  KEY `cDomain` (`cDomain`)
) ENGINE=MyISAM AUTO_INCREMENT=104277 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tshophistory`
--

DROP TABLE IF EXISTS `tshophistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tshophistory` (
  `kShophistory` int(10) NOT NULL AUTO_INCREMENT,
  `kShop` int(10) unsigned NOT NULL,
  `kKaufprodukt` int(10) unsigned NOT NULL,
  `cLizenzkey` varchar(255) NOT NULL,
  `cDomain` varchar(255) NOT NULL,
  `cOutHash` varchar(255) NOT NULL,
  `cPfad` varchar(255) DEFAULT NULL,
  `nLaufendeVersion` int(10) unsigned NOT NULL,
  `dDownloadBis` date DEFAULT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kShophistory`),
  KEY `cOutHash` (`cOutHash`),
  KEY `cLizenzkey` (`cLizenzkey`),
  KEY `cDomain` (`cDomain`)
) ENGINE=MyISAM AUTO_INCREMENT=26919 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tshopifytransactiondata`
--

DROP TABLE IF EXISTS `tshopifytransactiondata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tshopifytransactiondata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(64) DEFAULT '',
  `charge_id` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `license_id` int(11) DEFAULT NULL,
  `credentials_id` int(11) NOT NULL,
  `cost_per_transaction` double DEFAULT NULL,
  `monthly_base_price` double DEFAULT NULL,
  `monthly_cost_limit` double DEFAULT NULL,
  `monthly_free_transactions` int(11) NOT NULL DEFAULT 0,
  `trial_days` int(11) NOT NULL DEFAULT 0,
  `activated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tshopmodul`
--

DROP TABLE IF EXISTS `tshopmodul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tshopmodul` (
  `kShopModul` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kKaufprodukt` int(10) unsigned NOT NULL,
  `kAccountGebunden` int(10) unsigned DEFAULT 0,
  `kShop` int(10) unsigned DEFAULT 0,
  `cLizenzkey` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dFreigeschaltet` datetime DEFAULT NULL,
  PRIMARY KEY (`kShopModul`),
  KEY `kShop` (`kShop`),
  KEY `cLizenzkey` (`cLizenzkey`)
) ENGINE=MyISAM AUTO_INCREMENT=53071 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tshopmodul_history`
--

DROP TABLE IF EXISTS `tshopmodul_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tshopmodul_history` (
  `kShopModulHistory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kShopModul` int(10) unsigned NOT NULL,
  `kKaufprodukt` int(10) unsigned NOT NULL,
  `kAccountGebunden` int(10) unsigned DEFAULT 0,
  `kShop` int(10) unsigned DEFAULT 0,
  `cLizenzkey` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dFreigeschaltet` datetime DEFAULT NULL,
  PRIMARY KEY (`kShopModulHistory`),
  KEY `kShop` (`kShop`),
  KEY `cLizenzkey` (`cLizenzkey`)
) ENGINE=MyISAM AUTO_INCREMENT=30003 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tshopmodulhistory`
--

DROP TABLE IF EXISTS `tshopmodulhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tshopmodulhistory` (
  `kShopModulHistory` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) unsigned DEFAULT NULL,
  `kShop` int(11) unsigned DEFAULT NULL,
  `kShopModul` int(10) unsigned DEFAULT NULL,
  `cLizenzkey` varchar(255) DEFAULT NULL,
  `cError` varchar(255) NOT NULL,
  `eAktion` enum('Add','Del') NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kShopModulHistory`)
) ENGINE=MyISAM AUTO_INCREMENT=65159 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tshopversion`
--

DROP TABLE IF EXISTS `tshopversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tshopversion` (
  `kShopVersion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nVersion` int(3) NOT NULL,
  `nBuild` tinyint(4) NOT NULL,
  `eChannel` enum('Stable','Community Free') NOT NULL DEFAULT 'Stable',
  `nType` int(1) NOT NULL DEFAULT 0 COMMENT '0=recommended, 1=feature, 2=critical',
  `cURL` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dAvailableSince` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kShopVersion`),
  KEY `nVersion` (`nVersion`,`kShopVersion`),
  KEY `dAvailableSince` (`dAvailableSince`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsi_plesk_log`
--

DROP TABLE IF EXISTS `tsi_plesk_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsi_plesk_log` (
  `kLog` int(11) NOT NULL AUTO_INCREMENT,
  `cRequest` text DEFAULT NULL,
  `cResponse` text DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kLog`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsla`
--

DROP TABLE IF EXISTS `tsla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsla` (
  `kSLA` int(11) NOT NULL AUTO_INCREMENT,
  `cSLA` tinytext NOT NULL,
  `eType` enum('','Standard','Servicepartner','Premium') NOT NULL,
  `cBeschreibung` varchar(50) NOT NULL,
  `nPrio` int(11) NOT NULL,
  PRIMARY KEY (`kSLA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspauslastung`
--

DROP TABLE IF EXISTS `tspauslastung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspauslastung` (
  `kSPAuslastung` int(11) NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(11) DEFAULT NULL,
  `dAuslastungBis` date DEFAULT NULL,
  PRIMARY KEY (`kSPAuslastung`),
  UNIQUE KEY `kServicepartner` (`kServicepartner`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspbeschwerde`
--

DROP TABLE IF EXISTS `tspbeschwerde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspbeschwerde` (
  `kBeschwerde` int(11) NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(11) DEFAULT NULL,
  `kAccount` int(11) DEFAULT NULL,
  `kAdminlogin` int(11) DEFAULT NULL,
  `nPrio` tinyint(4) DEFAULT NULL,
  `cTitel` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kBeschwerde`),
  KEY `kServicepartner` (`kServicepartner`),
  KEY `kAccount` (`kAccount`),
  KEY `kAdminlogin` (`kAdminlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspeinsteigerschulung`
--

DROP TABLE IF EXISTS `tspeinsteigerschulung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspeinsteigerschulung` (
  `kServicepartner` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kServicepartner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsperweiterung`
--

DROP TABLE IF EXISTS `tsperweiterung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsperweiterung` (
  `kServicepartner` int(11) NOT NULL,
  `kErweiterung` int(11) NOT NULL,
  PRIMARY KEY (`kServicepartner`,`kErweiterung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspgutschrift`
--

DROP TABLE IF EXISTS `tspgutschrift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspgutschrift` (
  `kSPGutschrift` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) DEFAULT NULL,
  `nGutschriftsnummer` int(11) DEFAULT NULL,
  `cGutschriftsnummer` varchar(15) DEFAULT NULL,
  `cRechnungsmonat` varchar(255) DEFAULT NULL,
  `dRechnungsdatum` date DEFAULT NULL,
  `cKommentar` text DEFAULT NULL,
  `cPDFDokumentPfad` varchar(255) DEFAULT NULL,
  `dPDFZugestellt` datetime DEFAULT NULL,
  `dAusgezahlt` datetime DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kSPGutschrift`),
  KEY `tspgutschrift_cGutschriftsnummer_index` (`cGutschriftsnummer`)
) ENGINE=MyISAM AUTO_INCREMENT=5297 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspgutschriftpos`
--

DROP TABLE IF EXISTS `tspgutschriftpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspgutschriftpos` (
  `kSPGutschriftPos` int(11) NOT NULL AUTO_INCREMENT,
  `kSPGutschrift` int(11) DEFAULT NULL,
  `kSPProvMeldungProdukt` int(11) DEFAULT NULL,
  `cName` varchar(255) DEFAULT NULL,
  `fBetrag` double DEFAULT NULL,
  `fMwSt` double DEFAULT NULL,
  PRIMARY KEY (`kSPGutschriftPos`)
) ENGINE=MyISAM AUTO_INCREMENT=45901 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspgutschriftposprovisionsdetail`
--

DROP TABLE IF EXISTS `tspgutschriftposprovisionsdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspgutschriftposprovisionsdetail` (
  `kSPGutschriftPosProvisionsdetail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kSPGutschriftPos` int(11) DEFAULT NULL,
  `kEmpfehlungslisteBuchung` int(10) unsigned DEFAULT NULL,
  `kRechnungPos` int(10) unsigned DEFAULT NULL,
  `cRechnungsmonat` varchar(20) DEFAULT NULL,
  `fProvisionssatz` decimal(8,2) DEFAULT NULL,
  `fBetragProvision` decimal(10,2) DEFAULT NULL,
  `dRechnungBezahlt` date DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kSPGutschriftPosProvisionsdetail`),
  KEY `tspgutschriftposprovisionsdetail_cRechnungsmonat_index` (`cRechnungsmonat`),
  KEY `tspgutschriftposprovisionsdetail_kEmpfehlungslisteBuchung_index` (`kEmpfehlungslisteBuchung`),
  KEY `tspgutschriftposprovisionsdetail_kRechnungPos_index` (`kRechnungPos`),
  KEY `tspgutschriftposprovisionsdetail_kSPGutschriftPos_index` (`kSPGutschriftPos`)
) ENGINE=InnoDB AUTO_INCREMENT=43999 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspkundensegment`
--

DROP TABLE IF EXISTS `tspkundensegment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspkundensegment` (
  `kKundensegment` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kKundensegment`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspleistung`
--

DROP TABLE IF EXISTS `tspleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspleistung` (
  `kServicepartner` int(10) unsigned NOT NULL,
  `kLeistung` int(10) unsigned NOT NULL,
  `eType` enum('FOKUS','LEISTUNG','ERWEITERT') DEFAULT NULL,
  `cText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kServicepartner`,`kLeistung`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspleistungsscore`
--

DROP TABLE IF EXISTS `tspleistungsscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspleistungsscore` (
  `kServicepartner` int(10) unsigned NOT NULL,
  `kLeistung` int(10) unsigned NOT NULL,
  `fLeistungsscore` double DEFAULT NULL,
  PRIMARY KEY (`kServicepartner`,`kLeistung`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspnetzwerk`
--

DROP TABLE IF EXISTS `tspnetzwerk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspnetzwerk` (
  `kServicepartner` int(11) NOT NULL,
  `kZusammenarbeit` int(11) NOT NULL,
  `cText` varchar(255) DEFAULT NULL,
  `dBestaetigt` datetime DEFAULT NULL,
  `dAbgelehnt` datetime DEFAULT NULL,
  PRIMARY KEY (`kServicepartner`,`kZusammenarbeit`),
  KEY `dBestaetigt` (`dBestaetigt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsponboarding`
--

DROP TABLE IF EXISTS `tsponboarding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsponboarding` (
  `kOnboarding` int(11) NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kOnboarding`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprodukt`
--

DROP TABLE IF EXISTS `tspprodukt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprodukt` (
  `kServicepartner` int(10) unsigned NOT NULL,
  `kProdukt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kServicepartner`,`kProdukt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprojekt`
--

DROP TABLE IF EXISTS `tspprojekt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprojekt` (
  `kSPProjekt` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kServicepartner` int(11) DEFAULT 0,
  `kAdminLoginFreischaltung` int(11) NOT NULL,
  `cName` varchar(255) NOT NULL,
  `cBeschreibung` longtext NOT NULL,
  `cDatei1` varchar(255) DEFAULT NULL,
  `cDatei2` varchar(255) DEFAULT NULL,
  `cDatei3` varchar(255) DEFAULT NULL,
  `dFertigstellung` date DEFAULT NULL,
  `dBeginn` date DEFAULT NULL,
  `cProjektDauer` text DEFAULT NULL,
  `nBudget` int(11) NOT NULL,
  `nZertifikatPflicht` int(11) NOT NULL,
  `nViews` int(11) DEFAULT 0,
  `nStatus` enum('0','1','2','3','10','99') DEFAULT '0',
  `dErstellt` datetime NOT NULL,
  `dAktiviert` datetime DEFAULT NULL,
  `dFeedbackMail` datetime DEFAULT NULL,
  PRIMARY KEY (`kSPProjekt`)
) ENGINE=MyISAM AUTO_INCREMENT=3295 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprojektangebot`
--

DROP TABLE IF EXISTS `tspprojektangebot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprojektangebot` (
  `kSPProjektAngebot` int(11) NOT NULL AUTO_INCREMENT,
  `kSPProjekt` int(11) NOT NULL,
  `kServicepartner` int(11) NOT NULL,
  `cNachricht` longtext NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kSPProjektAngebot`)
) ENGINE=MyISAM AUTO_INCREMENT=18159 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprojektgroessen`
--

DROP TABLE IF EXISTS `tspprojektgroessen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprojektgroessen` (
  `kProjektgroesse` tinyint(4) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kProjektgroesse`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprojektjobs`
--

DROP TABLE IF EXISTS `tspprojektjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprojektjobs` (
  `kJob` int(11) NOT NULL AUTO_INCREMENT,
  `cJobname` varchar(255) NOT NULL,
  `cJobOptions` text DEFAULT NULL,
  `dLastrun` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`kJob`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprojektleistung`
--

DROP TABLE IF EXISTS `tspprojektleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprojektleistung` (
  `kSPProjektleistung` int(11) NOT NULL AUTO_INCREMENT,
  `kSPProjekt` int(11) NOT NULL,
  `kLeistung` int(11) NOT NULL,
  PRIMARY KEY (`kSPProjektleistung`)
) ENGINE=MyISAM AUTO_INCREMENT=14791 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprojektsperre`
--

DROP TABLE IF EXISTS `tspprojektsperre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprojektsperre` (
  `kSPProjektsperre` int(11) NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(11) NOT NULL,
  `cSperrgrund` text NOT NULL,
  `dSperreVom` datetime NOT NULL,
  `dSperreBis` datetime NOT NULL,
  PRIMARY KEY (`kSPProjektsperre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprojektupload`
--

DROP TABLE IF EXISTS `tspprojektupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprojektupload` (
  `kSPProjektUpload` int(11) NOT NULL AUTO_INCREMENT,
  `kSPProjekt` int(11) NOT NULL,
  `cFilenameOriginal` varchar(255) NOT NULL,
  `cFilenameUpload` varchar(255) NOT NULL,
  `cContentType` varchar(255) NOT NULL,
  `cSession` varchar(255) NOT NULL,
  `dUpload` datetime NOT NULL,
  PRIMARY KEY (`kSPProjektUpload`)
) ENGINE=MyISAM AUTO_INCREMENT=903 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprojektview`
--

DROP TABLE IF EXISTS `tspprojektview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprojektview` (
  `kSPProjektview` int(11) NOT NULL AUTO_INCREMENT,
  `kSPProjekt` int(11) NOT NULL,
  `kServicepartner` int(11) NOT NULL,
  PRIMARY KEY (`kSPProjektview`)
) ENGINE=MyISAM AUTO_INCREMENT=63487 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprovmeldung`
--

DROP TABLE IF EXISTS `tspprovmeldung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprovmeldung` (
  `kSPProvMeldung` int(11) NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(11) DEFAULT NULL,
  `kAccount` int(11) DEFAULT NULL,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `cKundeVorname` varchar(255) DEFAULT NULL,
  `cKundeNachname` varchar(255) DEFAULT NULL,
  `cKundeFirma` varchar(255) DEFAULT NULL,
  `cKundeStrasse` varchar(255) DEFAULT NULL,
  `cKundePLZ` varchar(10) DEFAULT NULL,
  `cKundeOrt` varchar(255) DEFAULT NULL,
  `cKundeLand` varchar(255) DEFAULT NULL,
  `cKundeEmail` varchar(255) DEFAULT NULL,
  `cKundeTel` varchar(255) DEFAULT NULL,
  `cKundeURL` varchar(255) DEFAULT NULL,
  `eStatus` enum('OFFEN','AKTIV','ABGESCHLOSSEN','KEINKUNDE','ABGELEHNT') NOT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `dGeandert` datetime DEFAULT NULL,
  PRIMARY KEY (`kSPProvMeldung`),
  KEY `kServicepartner` (`kServicepartner`),
  KEY `kAccount` (`kAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=2380 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprovmeldungnotiz`
--

DROP TABLE IF EXISTS `tspprovmeldungnotiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprovmeldungnotiz` (
  `kSPProvmeldungNotiz` int(11) NOT NULL AUTO_INCREMENT,
  `kSPProvMeldung` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `kServicepartner` int(11) NOT NULL,
  `cKommentar` longtext NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kSPProvmeldungNotiz`)
) ENGINE=MyISAM AUTO_INCREMENT=2322 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprovmeldungprodukt`
--

DROP TABLE IF EXISTS `tspprovmeldungprodukt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprovmeldungprodukt` (
  `kSPProvMeldungProdukt` int(11) NOT NULL AUTO_INCREMENT,
  `kSPProvMeldung` int(11) NOT NULL,
  `eProdukt` enum('Wawi-Hosting','Shop-Hosting','SQL-Hosting','JTL-eazyAuction','JTL-Search','JTL-Wawi-Repricer','JTL-Web-Repricer','JTL-WMS','JTL-Connector') NOT NULL,
  `cId` varchar(255) DEFAULT NULL,
  `cGrund` varchar(255) NOT NULL DEFAULT '',
  `nProvision` int(11) DEFAULT 0,
  `kHostingPos` int(11) DEFAULT 0,
  `kSearch` int(11) DEFAULT 0,
  `kRepricer` int(11) DEFAULT 0,
  `kUserAmaRep` int(11) DEFAULT 0,
  `kEbayKundenAccount` int(11) DEFAULT 0,
  `kAccountWMS` int(11) DEFAULT 0,
  `kConnector` int(11) DEFAULT 0,
  `eStatus` enum('OFFEN','AKTIV','AUSBEZAHLT','NICHT GEBUCHT','BEREITSVERKNUEPFT','ABGELEHNT') NOT NULL,
  `nAnderweitigVerknuepft` tinyint(4) DEFAULT NULL,
  `dErstellt` datetime NOT NULL,
  `dGeandert` datetime DEFAULT NULL,
  PRIMARY KEY (`kSPProvMeldungProdukt`),
  KEY `kSPProvMeldung` (`kSPProvMeldung`)
) ENGINE=InnoDB AUTO_INCREMENT=3237 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspprovmeldungprodukthistory`
--

DROP TABLE IF EXISTS `tspprovmeldungprodukthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspprovmeldungprodukthistory` (
  `kSPProvmeldungProduktHistory` int(11) NOT NULL AUTO_INCREMENT,
  `kSPProvMeldung` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `eProdukt` varchar(255) NOT NULL,
  `cId` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dGeloescht` datetime NOT NULL,
  PRIMARY KEY (`kSPProvmeldungProduktHistory`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspreferenz`
--

DROP TABLE IF EXISTS `tspreferenz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspreferenz` (
  `kServicepartner` int(11) NOT NULL,
  `kReferenz` int(11) NOT NULL,
  PRIMARY KEY (`kServicepartner`,`kReferenz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspschulung`
--

DROP TABLE IF EXISTS `tspschulung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspschulung` (
  `kSchulung` int(11) NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(11) NOT NULL,
  `cThema` varchar(255) NOT NULL,
  `dTermin` date NOT NULL,
  `tUhrzeit` time NOT NULL,
  `fPreis` float NOT NULL,
  `cUrl` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `nAktiv` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kSchulung`),
  KEY `kServicepartner` (`kServicepartner`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tspstandort`
--

DROP TABLE IF EXISTS `tspstandort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tspstandort` (
  `kSPStandort` int(11) NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(11) NOT NULL,
  `kLand` int(11) NOT NULL,
  `cStrasse` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cHausNr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cOrt` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cPLZ` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cAdresszusatz` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cMail` varchar(255) NOT NULL,
  `cTel` varchar(255) NOT NULL,
  `dLat` double NOT NULL DEFAULT 0,
  `dLng` double NOT NULL DEFAULT 0,
  `nAktiv` tinyint(4) NOT NULL DEFAULT 0,
  `dErstellt` datetime DEFAULT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  PRIMARY KEY (`kSPStandort`),
  KEY `kServicepartner` (`kServicepartner`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tstammtisch`
--

DROP TABLE IF EXISTS `tstammtisch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tstammtisch` (
  `kStammtisch` int(11) NOT NULL AUTO_INCREMENT,
  `dDatum` date NOT NULL,
  `dUhrzeit` time NOT NULL,
  `cOrt1` varchar(255) DEFAULT NULL,
  `cOrt2` varchar(255) DEFAULT NULL,
  `nAktiv` tinyint(1) DEFAULT 1,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kStammtisch`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tstammtischteilnehmer`
--

DROP TABLE IF EXISTS `tstammtischteilnehmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tstammtischteilnehmer` (
  `kTeilnehmer` int(11) NOT NULL AUTO_INCREMENT,
  `kStammtisch` int(11) DEFAULT NULL,
  `cAnrede` varchar(255) DEFAULT NULL,
  `cVorname` varchar(255) DEFAULT NULL,
  `cNachname` varchar(255) DEFAULT NULL,
  `cFirma` varchar(255) DEFAULT NULL,
  `cMail` varchar(255) DEFAULT NULL,
  `cKommentar` text DEFAULT NULL,
  `nAktiv` tinyint(1) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  PRIMARY KEY (`kTeilnehmer`),
  KEY `kStammtisch` (`kStammtisch`)
) ENGINE=InnoDB AUTO_INCREMENT=4495 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tstatistik`
--

DROP TABLE IF EXISTS `tstatistik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tstatistik` (
  `kStatistik` int(11) NOT NULL AUTO_INCREMENT,
  `cBereich` varchar(50) NOT NULL,
  `cDaten` varchar(50) NOT NULL,
  `nJahr` int(11) DEFAULT NULL,
  `cJSON` text NOT NULL,
  `dUpdated` datetime NOT NULL,
  PRIMARY KEY (`kStatistik`),
  KEY `cTyp` (`cBereich`),
  KEY `cBereich` (`cDaten`),
  KEY `nJahr` (`nJahr`)
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tstoerungblacklist`
--

DROP TABLE IF EXISTS `tstoerungblacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tstoerungblacklist` (
  `kAccount` int(11) NOT NULL,
  UNIQUE KEY `kAccount` (`kAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsubscription`
--

DROP TABLE IF EXISTS `tsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsubscription` (
  `kSubscription` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kLizenz` int(10) unsigned NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `cAdminuser` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dGueltigBis` date NOT NULL,
  PRIMARY KEY (`kSubscription`),
  KEY `kLizenz` (`kLizenz`)
) ENGINE=MyISAM AUTO_INCREMENT=34165 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsubscriptionmail`
--

DROP TABLE IF EXISTS `tsubscriptionmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsubscriptionmail` (
  `kSubscriptionmail` int(11) NOT NULL AUTO_INCREMENT,
  `kLizenz` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `dZuletztVersendet` datetime NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kSubscriptionmail`)
) ENGINE=MyISAM AUTO_INCREMENT=12359 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupport`
--

DROP TABLE IF EXISTS `tsupport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupport` (
  `kSupport` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) unsigned NOT NULL,
  `kSupportLeistung` int(10) unsigned NOT NULL,
  `nLevel` tinyint(3) unsigned NOT NULL,
  `dGueltigBis` datetime NOT NULL,
  `dGueltigAb` datetime NOT NULL,
  PRIMARY KEY (`kSupport`),
  KEY `kAccount` (`kAccount`)
) ENGINE=MyISAM AUTO_INCREMENT=882 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportanfragen`
--

DROP TABLE IF EXISTS `tsupportanfragen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportanfragen` (
  `kSupportAnfragen` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `cTicketNr` varchar(50) NOT NULL DEFAULT '0',
  `cTicketID` int(11) DEFAULT NULL,
  `cSubject` varchar(255) NOT NULL,
  `cMessage` longtext NOT NULL,
  `dErstellt` datetime NOT NULL,
  PRIMARY KEY (`kSupportAnfragen`),
  UNIQUE KEY `cTicketID` (`cTicketID`),
  KEY `cTicketNr` (`cTicketNr`)
) ENGINE=MyISAM AUTO_INCREMENT=151332 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcase`
--

DROP TABLE IF EXISTS `tsupportcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcase` (
  `kSupportcase` bigint(20) NOT NULL AUTO_INCREMENT,
  `kSupportcaseQuelle` int(11) NOT NULL,
  `kSupportcaseAnliegen` int(11) NOT NULL,
  `kSupportcaseStatus` int(11) NOT NULL,
  `kSupportcaseWikiEintrag` int(11) NOT NULL,
  `kKunde` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `kErsteller` int(11) NOT NULL,
  `cFirma` varchar(255) NOT NULL,
  `cAnsprechpartner` varchar(255) NOT NULL,
  `cTelefon` varchar(255) NOT NULL,
  `cEmail` varchar(255) NOT NULL,
  `cOtrsTicket` varchar(255) NOT NULL,
  `cCaseTitel` text NOT NULL,
  `cCaseNotiz` longtext NOT NULL,
  `cCaseLoesung` longtext NOT NULL,
  `cDevTicket` varchar(255) NOT NULL,
  `cForenlink` text NOT NULL,
  `cArbeiten` longtext NOT NULL,
  `cKundenfreundlichkeitText` longtext NOT NULL,
  `cWikilink` text NOT NULL,
  `bTeamviewer` enum('1','0') DEFAULT '0',
  `bEntwicklerHilfe` enum('1','0') DEFAULT '0',
  `bKostenpflichtig` enum('1','0') DEFAULT '0',
  `bPremium` enum('0','1') NOT NULL DEFAULT '0',
  `bWmsPremium` int(11) NOT NULL,
  `nSchwierigkeitsgrad` int(11) NOT NULL,
  `nKundenfreundlichkeit` int(11) NOT NULL,
  `nDauer` int(11) NOT NULL,
  `nPreis` float NOT NULL,
  `nMitarbeiter` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dWiedervorlage` datetime NOT NULL,
  `dGeschlossen` datetime NOT NULL,
  PRIMARY KEY (`kSupportcase`)
) ENGINE=InnoDB AUTO_INCREMENT=59165 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcaseanliegen`
--

DROP TABLE IF EXISTS `tsupportcaseanliegen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcaseanliegen` (
  `kSupportcaseAnliegen` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kSupportcaseAnliegen`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcasebereichmissing`
--

DROP TABLE IF EXISTS `tsupportcasebereichmissing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcasebereichmissing` (
  `kSupportcase` int(11) NOT NULL,
  `kSupportcaseProdukt` int(11) NOT NULL,
  `cText` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcasebereichmissinghistory`
--

DROP TABLE IF EXISTS `tsupportcasebereichmissinghistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcasebereichmissinghistory` (
  `kSupportcaseHistory` int(11) NOT NULL,
  `kSupportcaseProdukt` int(11) NOT NULL,
  `cText` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcasedevstatus`
--

DROP TABLE IF EXISTS `tsupportcasedevstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcasedevstatus` (
  `kSupportcaseDevStatus` int(11) NOT NULL AUTO_INCREMENT,
  `kSupportcase` int(11) NOT NULL,
  `kDevTicketID` int(11) NOT NULL,
  `cDevStatus` varchar(255) NOT NULL,
  `cFixedVersion` varchar(255) NOT NULL,
  `dZuletztGeprueft` datetime NOT NULL,
  `dAbgeschlossen` datetime NOT NULL,
  PRIMARY KEY (`kSupportcaseDevStatus`)
) ENGINE=MyISAM AUTO_INCREMENT=1396 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcasehistory`
--

DROP TABLE IF EXISTS `tsupportcasehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcasehistory` (
  `kSupportcaseHistory` bigint(20) NOT NULL AUTO_INCREMENT,
  `kSupportcase` bigint(20) NOT NULL,
  `kSupportcaseQuelle` int(11) NOT NULL,
  `kSupportcaseAnliegen` int(11) NOT NULL,
  `kSupportcaseStatus` int(11) NOT NULL,
  `kSupportcaseWikiEintrag` int(11) NOT NULL,
  `kKunde` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `kErsteller` int(11) NOT NULL,
  `kAdminloginChanged` int(11) NOT NULL,
  `cFirma` varchar(255) NOT NULL,
  `cAnsprechpartner` varchar(255) NOT NULL,
  `cTelefon` varchar(255) NOT NULL,
  `cEmail` varchar(255) NOT NULL,
  `cOtrsTicket` varchar(255) NOT NULL,
  `cCaseTitel` text NOT NULL,
  `cCaseNotiz` longtext NOT NULL,
  `cCaseLoesung` longtext NOT NULL,
  `cDevTicket` varchar(255) NOT NULL,
  `cForenlink` text NOT NULL,
  `cArbeiten` longtext NOT NULL,
  `cKundenfreundlichkeitText` longtext NOT NULL,
  `cWikilink` text NOT NULL,
  `bTeamviewer` enum('1','0') DEFAULT '0',
  `bEntwicklerHilfe` enum('1','0') DEFAULT '0',
  `bKostenpflichtig` enum('1','0') DEFAULT '0',
  `bPremium` enum('0','1') NOT NULL DEFAULT '0',
  `bWmsPremium` int(11) NOT NULL,
  `nSchwierigkeitsgrad` int(11) NOT NULL,
  `nKundenfreundlichkeit` int(11) NOT NULL,
  `nDauer` int(11) NOT NULL,
  `nPreis` float NOT NULL,
  `nMitarbeiter` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dGeaendert` datetime NOT NULL,
  `dWiedervorlage` datetime NOT NULL,
  `dGeschlossen` datetime NOT NULL,
  PRIMARY KEY (`kSupportcaseHistory`)
) ENGINE=InnoDB AUTO_INCREMENT=20077 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcaseprodukt`
--

DROP TABLE IF EXISTS `tsupportcaseprodukt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcaseprodukt` (
  `kSupportcaseProdukt` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kSupportcaseProdukt`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcaseproduktbereich`
--

DROP TABLE IF EXISTS `tsupportcaseproduktbereich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcaseproduktbereich` (
  `kSupportcaseProduktBereich` int(11) NOT NULL AUTO_INCREMENT,
  `kSupportcaseProdukt` int(11) NOT NULL,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kSupportcaseProduktBereich`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcaseproduktbereichrelation`
--

DROP TABLE IF EXISTS `tsupportcaseproduktbereichrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcaseproduktbereichrelation` (
  `kSupportcase` bigint(20) NOT NULL,
  `kSupportcaseProduktBereich` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcaseproduktbereichrelationhistory`
--

DROP TABLE IF EXISTS `tsupportcaseproduktbereichrelationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcaseproduktbereichrelationhistory` (
  `kSupportcaseHistory` bigint(20) NOT NULL,
  `kSupportcaseProduktBereich` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcaseproduktrelation`
--

DROP TABLE IF EXISTS `tsupportcaseproduktrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcaseproduktrelation` (
  `kSupportcase` bigint(20) NOT NULL,
  `kSupportcaseProdukt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcaseproduktrelationhistory`
--

DROP TABLE IF EXISTS `tsupportcaseproduktrelationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcaseproduktrelationhistory` (
  `kSupportcaseHistory` bigint(20) NOT NULL,
  `kSupportcaseProdukt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcasequelle`
--

DROP TABLE IF EXISTS `tsupportcasequelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcasequelle` (
  `kSupportcaseQuelle` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kSupportcaseQuelle`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcasestatus`
--

DROP TABLE IF EXISTS `tsupportcasestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcasestatus` (
  `kSupportcasestatus` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kSupportcasestatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportcasewikieintrag`
--

DROP TABLE IF EXISTS `tsupportcasewikieintrag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportcasewikieintrag` (
  `kSupportcaseWikiEintrag` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kSupportcaseWikiEintrag`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsupportleistung`
--

DROP TABLE IF EXISTS `tsupportleistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsupportleistung` (
  `kSupportLeistung` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) DEFAULT NULL,
  `cInfo` text DEFAULT NULL,
  `nLevel` int(11) NOT NULL,
  PRIMARY KEY (`kSupportLeistung`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttag`
--

DROP TABLE IF EXISTS `ttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttag` (
  `kTag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cNameIntern` varchar(50) DEFAULT NULL,
  `cName` varchar(50) DEFAULT NULL,
  `cFarbe` varchar(30) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `nSort` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`kTag`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttaggruppe`
--

DROP TABLE IF EXISTS `ttaggruppe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttaggruppe` (
  `kTagGruppe` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cNameIntern` varchar(50) DEFAULT NULL,
  `cName` varchar(50) DEFAULT NULL,
  `dErstellt` datetime DEFAULT NULL,
  `nSort` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`kTagGruppe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttaggruppetag`
--

DROP TABLE IF EXISTS `ttaggruppetag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttaggruppetag` (
  `kTagGruppeTag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kTagGruppe` int(10) unsigned DEFAULT NULL,
  `kTag` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`kTagGruppeTag`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttechnologiepartner`
--

DROP TABLE IF EXISTS `ttechnologiepartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttechnologiepartner` (
  `kTechnologiepartner` int(11) NOT NULL AUTO_INCREMENT,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `eKategorie` enum('','Zahlungsanbieter','Versand','Sicherheit-und-Recht','Marketing','Softwarepartner','Hostingpartner') NOT NULL,
  `cName` varchar(255) NOT NULL,
  `cKurzbeschreibung` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  `cMetaTitle` varchar(55) DEFAULT NULL,
  `cMetaDesc` varchar(156) DEFAULT NULL,
  `cLogo` varchar(255) DEFAULT NULL,
  `cVideoLink` varchar(255) DEFAULT NULL,
  `cLogoMaterialLink` varchar(255) DEFAULT NULL,
  `eStatus` enum('OFFEN','AKTION','FREIGESCHALTET','GEKUENDIGT') DEFAULT NULL,
  `nLandingpage` tinyint(4) DEFAULT NULL COMMENT '0 = deaktiviert, 1 = aktiviert',
  `dErstellt` datetime DEFAULT NULL,
  `dFreigabe` datetime DEFAULT NULL,
  `dAenderung` datetime DEFAULT NULL,
  `nSort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kTechnologiepartner`),
  KEY `nSort` (`nSort`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
/*!50032 DROP TRIGGER IF EXISTS ttechnologiepartnerafterupdate */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 TRIGGER `ttechnologiepartnerafterupdate` AFTER UPDATE ON `ttechnologiepartner` FOR EACH ROW BEGIN
	INSERT INTO ttechnologiepartnerhistory SET kTechnologiepartner = NEW.kTechnologiepartner, kAdminlogin = NEW.kTechnologiepartner, cName = NEW.cName, cKurzbeschreibung = NEW.cKurzbeschreibung, cBeschreibung = NEW.cBeschreibung, cLogo = NEW.cLogo, cVideoLink = NEW.cVideoLink, cLogoMaterialLink = NEW.cLogoMaterialLink, eStatus = NEW.eStatus, nLandingpage = NEW.nLandingpage, dErstellt = NEW.dErstellt, dFreigabe = NEW.dFreigabe, dAenderung = NEW.dAenderung;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ttechnologiepartneraenderung`
--

DROP TABLE IF EXISTS `ttechnologiepartneraenderung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttechnologiepartneraenderung` (
  `kTechnologiepartnerAenderung` int(11) NOT NULL AUTO_INCREMENT,
  `kTechnologiepartner` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `eKategorie` enum('','Zahlungsanbieter','Versand','Sicherheit-und-Recht','Marketing','Softwarepartner','Hostingpartner') NOT NULL,
  `cName` varchar(255) NOT NULL,
  `cKurzbeschreibung` varchar(255) NOT NULL,
  `cBeschreibung` text NOT NULL,
  `cLogo` varchar(255) DEFAULT NULL,
  `dAenderung` datetime NOT NULL,
  PRIMARY KEY (`kTechnologiepartnerAenderung`),
  UNIQUE KEY `kTechnologiepartner` (`kTechnologiepartner`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttechnologiepartnerhistory`
--

DROP TABLE IF EXISTS `ttechnologiepartnerhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttechnologiepartnerhistory` (
  `kTechnologiepartnerHistory` int(11) NOT NULL AUTO_INCREMENT,
  `kTechnologiepartner` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL DEFAULT 0,
  `eKategorie` enum('','Zahlungsanbieter','Versand','Sicherheit-und-Recht','Marketing','Softwarepartner','Hostingpartner') NOT NULL,
  `cName` varchar(255) NOT NULL DEFAULT '0',
  `cKurzbeschreibung` varchar(255) DEFAULT NULL,
  `cBeschreibung` text DEFAULT NULL,
  `cLogo` varchar(255) DEFAULT NULL,
  `cVideoLink` varchar(255) DEFAULT NULL,
  `cLogoMaterialLink` varchar(255) DEFAULT NULL,
  `eStatus` enum('OFFEN','AKTION','FREIGESCHALTET','GEKUENDIGT') DEFAULT NULL,
  `nLandingpage` tinyint(4) DEFAULT NULL COMMENT '0 = deaktiviert, 1 = aktiviert',
  `dErstellt` datetime DEFAULT NULL,
  `dFreigabe` datetime DEFAULT NULL,
  `dAenderung` datetime DEFAULT NULL,
  PRIMARY KEY (`kTechnologiepartnerHistory`)
) ENGINE=InnoDB AUTO_INCREMENT=810 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttechnologiepartnerkategorie`
--

DROP TABLE IF EXISTS `ttechnologiepartnerkategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttechnologiepartnerkategorie` (
  `kTechnologiepartnerKategorie` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kTechnologiepartnerKategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttechnologiepartnerkategorierel`
--

DROP TABLE IF EXISTS `ttechnologiepartnerkategorierel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttechnologiepartnerkategorierel` (
  `kTechnologiepartnerKategorieRel` int(11) NOT NULL AUTO_INCREMENT,
  `kTechnologiepartner` int(11) NOT NULL,
  `kTechnologiepartnerKategorie` int(11) NOT NULL,
  PRIMARY KEY (`kTechnologiepartnerKategorieRel`),
  KEY `kTechnologiepartner` (`kTechnologiepartner`),
  KEY `kTechnologiepartnerKategorie` (`kTechnologiepartnerKategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tteilzahlungen`
--

DROP TABLE IF EXISTS `tteilzahlungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tteilzahlungen` (
  `kTeilzahlung` int(11) NOT NULL AUTO_INCREMENT,
  `kRechnung` int(11) NOT NULL,
  `kRechnungskorrektur` int(11) DEFAULT NULL,
  `kAccount` int(11) NOT NULL,
  `kAdminLogin` int(11) NOT NULL,
  `fBetrag` float(10,2) NOT NULL,
  `dEingetragen` datetime NOT NULL,
  PRIMARY KEY (`kTeilzahlung`),
  KEY `kRechnung` (`kRechnung`),
  KEY `kAccount` (`kAccount`)
) ENGINE=MyISAM AUTO_INCREMENT=1841 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttestbarershop`
--

DROP TABLE IF EXISTS `ttestbarershop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttestbarershop` (
  `kShop` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `cURL` varchar(255) NOT NULL,
  `nSort` int(11) NOT NULL,
  PRIMARY KEY (`kShop`),
  KEY `nSort` (`nSort`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttestshop_anfrage`
--

DROP TABLE IF EXISTS `ttestshop_anfrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttestshop_anfrage` (
  `kTestshop` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kShop` int(10) unsigned DEFAULT NULL,
  `kWarenwirtschaft` int(10) unsigned DEFAULT NULL,
  `kServerId` int(11) NOT NULL DEFAULT 0,
  `kAccount` int(10) unsigned DEFAULT 1,
  `cLizenzkey` varchar(255) DEFAULT NULL,
  `cKonfikey` varchar(255) DEFAULT NULL,
  `cUID` varchar(255) DEFAULT NULL,
  `eType` enum('Shop3','Shop4','Shop5','Shopware','Magento','Gambio','OXID','PrestaShop') DEFAULT NULL,
  `cVersion` varchar(12) DEFAULT NULL,
  `cFirma` varchar(255) NOT NULL DEFAULT '',
  `cAnrede` varchar(1) NOT NULL DEFAULT '',
  `cVorname` varchar(255) NOT NULL DEFAULT '',
  `cNachname` varchar(255) NOT NULL DEFAULT '',
  `cEMail` varchar(255) NOT NULL DEFAULT '',
  `cNachricht` text DEFAULT NULL,
  `cShopDir` varchar(255) NOT NULL DEFAULT '',
  `cDatabase` varchar(255) NOT NULL DEFAULT '',
  `cDBUser` varchar(255) NOT NULL DEFAULT '',
  `cDBPass` varchar(255) NOT NULL DEFAULT '',
  `cFTPUser` varchar(255) NOT NULL DEFAULT '',
  `cFTPPass` varchar(255) NOT NULL DEFAULT '',
  `cSyncUser` varchar(255) NOT NULL DEFAULT '',
  `cSyncPass` varchar(255) NOT NULL DEFAULT '',
  `nDemoData` int(1) NOT NULL DEFAULT 0 COMMENT '0=nicht füllen, 1=mit daten füllen, 2=gefüllt',
  `eAPI` int(1) NOT NULL DEFAULT 0 COMMENT '0=Website, 1=WawiWizard',
  `cCryptKey` varchar(255) NOT NULL DEFAULT '',
  `bCreated` tinyint(1) NOT NULL DEFAULT 0,
  `dDatum` int(10) DEFAULT NULL,
  `dAngelegt` datetime DEFAULT NULL,
  `bLoeschungVorgemerkt` enum('y','n') NOT NULL DEFAULT 'n',
  `dLoeschungVorgemerkt` date DEFAULT NULL,
  `nKeineKundenemailVersenden` tinyint(3) unsigned DEFAULT 0,
  `nJTLTestenBundle` tinyint(3) unsigned DEFAULT 0,
  PRIMARY KEY (`kTestshop`),
  KEY `kLizenz` (`cUID`,`eType`),
  KEY `cLizenzkey` (`cLizenzkey`),
  KEY `idx_ttsa_cemail` (`cEMail`),
  KEY `ttestshop_anfrage_cEMail_index` (`cEMail`)
) ENGINE=MyISAM AUTO_INCREMENT=38981 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttestshopserver`
--

DROP TABLE IF EXISTS `ttestshopserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttestshopserver` (
  `kTestshopserver` int(11) NOT NULL AUTO_INCREMENT,
  `eType` enum('Shop3','Shop4','Shop5','Shopware','Magento','Gambio','OXID','PrestaShop') NOT NULL,
  `cRemoteUrl` varchar(255) NOT NULL,
  `cShopHost` varchar(255) NOT NULL,
  `cShopUrl` varchar(255) NOT NULL,
  `cShopLicense` varchar(255) NOT NULL,
  `cKonfiLicense` varchar(255) NOT NULL,
  `cServerAdmin` blob NOT NULL,
  `cServerPass` blob NOT NULL,
  `bDefault` int(11) NOT NULL DEFAULT 0,
  `bLocked` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kTestshopserver`),
  KEY `eType` (`eType`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttestsqlaccounts`
--

DROP TABLE IF EXISTS `ttestsqlaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttestsqlaccounts` (
  `id` int(13) NOT NULL AUTO_INCREMENT,
  `vorname` char(150) DEFAULT NULL,
  `nachname` char(150) DEFAULT NULL,
  `anrede` set('Herr','Frau') DEFAULT NULL,
  `firma` char(150) DEFAULT NULL,
  `email` char(200) DEFAULT NULL,
  `nachricht` text DEFAULT NULL,
  `status` set('AKTIV','OFFEN','GELOESCHT','ABGELAUFEN','INLOESCHUNG') DEFAULT 'OFFEN',
  `serverid` int(13) DEFAULT NULL,
  `instanzid` char(50) NOT NULL,
  `sapass` char(50) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `instanzuser` char(50) DEFAULT NULL,
  `instanzpass` char(50) DEFAULT NULL,
  `erstellt` datetime DEFAULT current_timestamp(),
  `ablauf` datetime DEFAULT NULL,
  `verlaengert` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttestsqlserver`
--

DROP TABLE IF EXISTS `ttestsqlserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttestsqlserver` (
  `serverid` int(13) NOT NULL AUTO_INCREMENT,
  `ipaddr` varchar(40) DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`serverid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttrackandtracetarifbuchungen`
--

DROP TABLE IF EXISTS `ttrackandtracetarifbuchungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttrackandtracetarifbuchungen` (
  `kBuchung` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kTarif` int(11) NOT NULL,
  `bActive` tinyint(4) NOT NULL DEFAULT 1,
  `fKosten` float DEFAULT 0,
  `dGebuchtAm` datetime NOT NULL,
  `dGueltigAb` datetime DEFAULT NULL,
  `dGekuendigtZum` datetime DEFAULT NULL,
  `cGekuendigtDurch` char(120) DEFAULT NULL,
  `kBuchungNeu` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`kBuchung`),
  KEY `ttbuchungen_kAccount_dGueltigAb_dGekuendigtZum_index` (`kAccount`,`dGueltigAb`,`dGekuendigtZum`),
  KEY `ttbuchungen_kBuchung_kBuchung_kBuchung_index` (`kAccount`,`dGueltigAb`,`dGekuendigtZum`)
) ENGINE=InnoDB AUTO_INCREMENT=6417 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ttrackandtracetarife`
--

DROP TABLE IF EXISTS `ttrackandtracetarife`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ttrackandtracetarife` (
  `kTarif` int(11) NOT NULL AUTO_INCREMENT,
  `cTarifname` varchar(250) DEFAULT NULL,
  `nBuchbar` int(11) DEFAULT NULL,
  `nSort` int(11) NOT NULL,
  `fKostenMonat` float(10,2) DEFAULT NULL,
  `fKostenPakete` float(10,2) NOT NULL,
  `nPaketeInkl` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kTarif`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tversandvolumen`
--

DROP TABLE IF EXISTS `tversandvolumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tversandvolumen` (
  `kVersandvolumen` tinyint(4) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `nSort` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kVersandvolumen`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tverteiler`
--

DROP TABLE IF EXISTS `tverteiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tverteiler` (
  `kVerteiler` int(10) NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) NOT NULL,
  `cRolle` varchar(255) NOT NULL,
  `cMail` varchar(255) NOT NULL,
  `dGeaendert` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dErstellt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`kVerteiler`),
  KEY `kAccount_idx` (`kAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=9907 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcase`
--

DROP TABLE IF EXISTS `tvertriebcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcase` (
  `kVertriebcase` int(11) NOT NULL AUTO_INCREMENT,
  `kErsteller` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `kBearbeiter` int(11) NOT NULL,
  `kAdminBenutzergruppe` int(11) NOT NULL,
  `cVorname` varchar(255) NOT NULL,
  `cNachname` varchar(255) NOT NULL,
  `cFirma` varchar(255) NOT NULL,
  `cTel` varchar(255) NOT NULL,
  `cMail` varchar(255) NOT NULL,
  `cStrasse` varchar(255) NOT NULL,
  `cPLZ` varchar(255) NOT NULL,
  `cOrt` varchar(255) NOT NULL,
  `cLand` varchar(255) NOT NULL,
  `cBeschreibung` text NOT NULL,
  `cKommentar` text NOT NULL,
  `cOtrsTicket` varchar(255) NOT NULL,
  `nAnzahlMitarbeiter` int(11) NOT NULL,
  `nAnzahlMitarbeiterLager` int(11) NOT NULL,
  `nBestellungenProMonat` int(11) NOT NULL,
  `nArtikelImSortiment` int(11) NOT NULL,
  `nLagerflaeche` int(11) NOT NULL,
  `nEbayAccounts` int(11) NOT NULL,
  `nAmazonAccounts` int(11) NOT NULL,
  `eStatus` enum('offen','in Bearbeitung','Wiedervorlage','geschlossen') NOT NULL DEFAULT 'offen',
  `dErstellt` datetime NOT NULL,
  `dWiedervorlage` date NOT NULL,
  `nHerkunft` tinyint(4) NOT NULL DEFAULT 0,
  `nAufmerksam` tinyint(4) NOT NULL DEFAULT 0,
  `kB2B` tinyint(4) NOT NULL DEFAULT 0,
  `kBranche` tinyint(4) NOT NULL DEFAULT 0,
  `dZuletztbearbeitet` datetime NOT NULL,
  `cWWW` varchar(255) NOT NULL,
  `kServicepartner` int(11) NOT NULL DEFAULT 0,
  `nServicepartnerZufriedenheit` tinyint(4) NOT NULL DEFAULT 0,
  `cServicepartnerZufriedenheitBegruendung` text NOT NULL,
  PRIMARY KEY (`kVertriebcase`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
/*!50032 DROP TRIGGER IF EXISTS tvertriebcaseOnUpdate */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 TRIGGER `tvertriebcaseOnUpdate` BEFORE UPDATE ON `tvertriebcase` FOR EACH ROW BEGIN
    INSERT INTO tvertriebcasehistory SET 
    kVertriebcase = OLD.kVertriebcase, 
    kErsteller = OLD.kErsteller,
    kAccount = OLD.kAccount,
    kBearbeiter = OLD.kBearbeiter,
    kAdminBenutzergruppe = OLD.kAdminBenutzergruppe,
    cVorname = OLD.cVorname,
    cNachname = OLD.cNachname,
    cFirma = OLD.cFirma,
    cTel = OLD.cTel,
    cMail = OLD.cMail,
    cStrasse = OLD.cStrasse,
    cPLZ = OLD.cPLZ,
    cOrt = OLD.cOrt,
    cLand = OLD.cLand,
    cBeschreibung = OLD.cBeschreibung,
    cKommentar = OLD.cKommentar,
    nAnzahlMitarbeiter = OLD.nAnzahlMitarbeiter,
    nAnzahlMitarbeiterLager = OLD.nAnzahlMitarbeiterLager,
    nBestellungenProMonat = OLD.nBestellungenProMonat,
    nArtikelImSortiment = OLD.nArtikelImSortiment,
    nLagerflaeche = OLD.nLagerflaeche,
    nEbayAccounts = OLD.nEbayAccounts,
    nAmazonAccounts = OLD.nAmazonAccounts,
    eStatus = OLD.eStatus,
    dErstellt = OLD.dErstellt,
    dWiedervorlage = OLD.dWiedervorlage,
    dZuletztBearbeitet = OLD.dZuletztBearbeitet,
    dHistoryEintrag = now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tvertriebcasealteprodukte`
--

DROP TABLE IF EXISTS `tvertriebcasealteprodukte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcasealteprodukte` (
  `kVertriebcasealteprodukte` int(11) NOT NULL AUTO_INCREMENT,
  `kVertriebcaseproduktekategorie` int(11) NOT NULL,
  `cProduktname` varchar(255) NOT NULL,
  PRIMARY KEY (`kVertriebcasealteprodukte`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcasealteprodukterelation`
--

DROP TABLE IF EXISTS `tvertriebcasealteprodukterelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcasealteprodukterelation` (
  `kVertriebcasealteprodukterelation` int(11) NOT NULL AUTO_INCREMENT,
  `kVertriebcase` int(11) NOT NULL,
  `kVertriebcasealteprodukte` int(11) NOT NULL,
  PRIMARY KEY (`kVertriebcasealteprodukterelation`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcaseaufmerksam`
--

DROP TABLE IF EXISTS `tvertriebcaseaufmerksam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcaseaufmerksam` (
  `kAufmerksam` int(11) NOT NULL AUTO_INCREMENT,
  `cAufmerksam` varchar(255) NOT NULL,
  PRIMARY KEY (`kAufmerksam`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcaseb2b`
--

DROP TABLE IF EXISTS `tvertriebcaseb2b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcaseb2b` (
  `kB2B` int(11) NOT NULL AUTO_INCREMENT,
  `cB2B` varchar(255) NOT NULL,
  PRIMARY KEY (`kB2B`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcasebranche`
--

DROP TABLE IF EXISTS `tvertriebcasebranche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcasebranche` (
  `kBranche` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  PRIMARY KEY (`kBranche`),
  KEY `cName` (`cName`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcaseherkunft`
--

DROP TABLE IF EXISTS `tvertriebcaseherkunft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcaseherkunft` (
  `kHerkunft` int(11) NOT NULL AUTO_INCREMENT,
  `cHerkunft` varchar(255) NOT NULL,
  PRIMARY KEY (`kHerkunft`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcasehistory`
--

DROP TABLE IF EXISTS `tvertriebcasehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcasehistory` (
  `kVertriebcasehistory` int(11) NOT NULL AUTO_INCREMENT,
  `kVertriebcase` int(11) NOT NULL,
  `kErsteller` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `kBearbeiter` int(11) NOT NULL,
  `kAdminBenutzergruppe` int(11) NOT NULL,
  `cVorname` varchar(255) NOT NULL,
  `cNachname` varchar(255) NOT NULL,
  `cFirma` varchar(255) NOT NULL,
  `cTel` varchar(255) NOT NULL,
  `cMail` varchar(255) NOT NULL,
  `cStrasse` varchar(255) NOT NULL,
  `cPLZ` varchar(255) NOT NULL,
  `cOrt` varchar(255) NOT NULL,
  `cLand` varchar(255) NOT NULL,
  `cBeschreibung` text NOT NULL,
  `cKommentar` text NOT NULL,
  `nAnzahlMitarbeiter` int(11) NOT NULL,
  `nAnzahlMitarbeiterLager` int(11) NOT NULL,
  `nBestellungenProMonat` int(11) NOT NULL,
  `nArtikelImSortiment` int(11) NOT NULL,
  `nLagerflaeche` int(11) NOT NULL,
  `nEbayAccounts` int(11) NOT NULL,
  `nAmazonAccounts` int(11) NOT NULL,
  `eStatus` enum('offen','in Bearbeitung','Wiedervorlage','geschlossen') NOT NULL DEFAULT 'offen',
  `dErstellt` datetime NOT NULL,
  `dWiedervorlage` date NOT NULL,
  `dZuletztbearbeitet` datetime NOT NULL,
  `dHistoryEintrag` datetime NOT NULL,
  PRIMARY KEY (`kVertriebcasehistory`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcaseprodukt`
--

DROP TABLE IF EXISTS `tvertriebcaseprodukt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcaseprodukt` (
  `kVertriebcaseprodukt` int(11) NOT NULL AUTO_INCREMENT,
  `kVertriebcaseproduktekategorie` int(11) NOT NULL,
  `cProduktname` varchar(255) NOT NULL,
  PRIMARY KEY (`kVertriebcaseprodukt`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcaseproduktanforderungen`
--

DROP TABLE IF EXISTS `tvertriebcaseproduktanforderungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcaseproduktanforderungen` (
  `kVertriebcaseproduktanforderungen` int(11) NOT NULL AUTO_INCREMENT,
  `kVertriebcaseproduktrelation` int(11) NOT NULL,
  `cAnforderung` text NOT NULL,
  `cWichtigkeit` varchar(255) NOT NULL,
  `bDone` int(11) NOT NULL,
  `kBenutzerMarkedDone` int(11) NOT NULL,
  `dMarkedDone` datetime NOT NULL,
  PRIMARY KEY (`kVertriebcaseproduktanforderungen`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcaseproduktekategorie`
--

DROP TABLE IF EXISTS `tvertriebcaseproduktekategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcaseproduktekategorie` (
  `kVertriebcaseproduktekategorie` int(11) NOT NULL AUTO_INCREMENT,
  `cKategoriename` varchar(255) NOT NULL,
  PRIMARY KEY (`kVertriebcaseproduktekategorie`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcaseproduktrelation`
--

DROP TABLE IF EXISTS `tvertriebcaseproduktrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcaseproduktrelation` (
  `kVertriebcaseproduktrelation` int(11) NOT NULL AUTO_INCREMENT,
  `kVertriebcase` int(11) NOT NULL,
  `kVertriebcaseprodukt` int(11) NOT NULL,
  `kVertriebcaseStatus` int(11) NOT NULL,
  `cAnderesProdukt` text NOT NULL,
  `cKommentar` text NOT NULL,
  PRIMARY KEY (`kVertriebcaseproduktrelation`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
/*!50032 DROP TRIGGER IF EXISTS tvertriebcaseproduktrelationOnUpdate */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`jtl_typo3`@`localhost`*/ /*!50003 TRIGGER `tvertriebcaseproduktrelationOnUpdate` BEFORE UPDATE ON `tvertriebcaseproduktrelation` FOR EACH ROW BEGIN
    INSERT INTO tvertriebcaseproduktrelationhistory SET kVertriebcase = OLD.kVertriebcase, kVertriebcaseprodukt = OLD.kVertriebcaseprodukt, kVertriebcaseStatus = OLD.kVertriebcaseStatus, cAnderesProdukt = OLD.cAnderesProdukt, cKommentar = OLD.cKommentar, dHistoryEintrag = now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tvertriebcaseproduktrelationhistory`
--

DROP TABLE IF EXISTS `tvertriebcaseproduktrelationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcaseproduktrelationhistory` (
  `kVertriebcaseproduktrelationhistory` int(11) NOT NULL AUTO_INCREMENT,
  `kVertriebcaseproduktrelation` int(11) NOT NULL,
  `kVertriebcase` int(11) NOT NULL,
  `kVertriebcaseprodukt` int(11) NOT NULL,
  `kVertriebcaseStatus` int(11) NOT NULL,
  `cAnderesProdukt` text NOT NULL,
  `cKommentar` text NOT NULL,
  `dHistoryEintrag` datetime NOT NULL,
  PRIMARY KEY (`kVertriebcaseproduktrelationhistory`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcaseproduktstatus`
--

DROP TABLE IF EXISTS `tvertriebcaseproduktstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcaseproduktstatus` (
  `kVertriebcaseProduktstatus` int(11) NOT NULL AUTO_INCREMENT,
  `cStatusname` varchar(255) NOT NULL,
  PRIMARY KEY (`kVertriebcaseProduktstatus`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcasesonstigealteprodukte`
--

DROP TABLE IF EXISTS `tvertriebcasesonstigealteprodukte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcasesonstigealteprodukte` (
  `kVertriebcasesonstigealteprodukte` int(11) NOT NULL AUTO_INCREMENT,
  `kVertriebcase` int(11) NOT NULL,
  `kVertriebcaseproduktekategorie` int(11) NOT NULL,
  `cProduktname` varchar(255) NOT NULL,
  PRIMARY KEY (`kVertriebcasesonstigealteprodukte`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvertriebcaseverlauf`
--

DROP TABLE IF EXISTS `tvertriebcaseverlauf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvertriebcaseverlauf` (
  `kVertriebcaseverlauf` int(11) NOT NULL AUTO_INCREMENT,
  `kVertriebcase` int(11) NOT NULL,
  `kVertriebcaseprodukt` int(11) NOT NULL,
  `kAdminlogin` int(11) NOT NULL,
  `cTaetigkeit` text NOT NULL,
  `cTaetigkeitNext` text NOT NULL,
  `dEingetragen` datetime NOT NULL,
  PRIMARY KEY (`kVertriebcaseverlauf`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvoplaender`
--

DROP TABLE IF EXISTS `tvoplaender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvoplaender` (
  `cLand` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`cLand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvorlage`
--

DROP TABLE IF EXISTS `tvorlage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvorlage` (
  `kVorlage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kLastEditor` int(11) DEFAULT NULL,
  `kHeaderVorlage` int(11) DEFAULT NULL,
  `kFooterVorlage` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cBetreff` varchar(255) NOT NULL,
  `cSalutationText` text DEFAULT NULL,
  `cText` text NOT NULL,
  `cSalutationHTML` text DEFAULT NULL,
  `cHTML` text NOT NULL,
  `cAdditionalText` text DEFAULT NULL,
  `cAdditionalHTML` text DEFAULT NULL,
  `cBannerText` text DEFAULT NULL,
  `cBannerHTML` text DEFAULT NULL,
  `cFooterText` text DEFAULT NULL,
  `cFooterHTML` text DEFAULT NULL,
  `nAktiv` tinyint(4) NOT NULL DEFAULT 1,
  `nIntern` tinyint(4) NOT NULL DEFAULT 0,
  `cNote` text DEFAULT NULL,
  `dUpdated` int(10) NOT NULL,
  PRIMARY KEY (`kVorlage`)
) ENGINE=MyISAM AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvorlage_kategorie`
--

DROP TABLE IF EXISTS `tvorlage_kategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvorlage_kategorie` (
  `kVorlage` int(11) NOT NULL,
  `kKategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvorlagenkategoriegruppen`
--

DROP TABLE IF EXISTS `tvorlagenkategoriegruppen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvorlagenkategoriegruppen` (
  `kVorlagenkategoriegruppe` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `nSort` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`kVorlagenkategoriegruppe`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tvorlagenkategorien`
--

DROP TABLE IF EXISTS `tvorlagenkategorien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvorlagenkategorien` (
  `kKategorie` int(11) NOT NULL AUTO_INCREMENT,
  `kVorlagenkategoriegruppe` int(11) NOT NULL,
  `cName` varchar(255) NOT NULL,
  `nSort` int(11) NOT NULL DEFAULT 10000,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`kKategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twarenwirtschaft`
--

DROP TABLE IF EXISTS `twarenwirtschaft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twarenwirtschaft` (
  `kWarenwirtschaft` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(255) NOT NULL,
  `cURL` varchar(255) NOT NULL,
  `nSort` int(11) NOT NULL,
  PRIMARY KEY (`kWarenwirtschaft`),
  KEY `nSort` (`nSort`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twawicluster`
--

DROP TABLE IF EXISTS `twawicluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twawicluster` (
  `kclid` int(13) NOT NULL AUTO_INCREMENT,
  `kcl` char(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`kclid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twawiclusternodes`
--

DROP TABLE IF EXISTS `twawiclusternodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twawiclusternodes` (
  `knid` int(13) NOT NULL AUTO_INCREMENT,
  `cNodeHost` char(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kclid` int(13) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`knid`),
  KEY `kclid` (`kclid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twawihostingpos`
--

DROP TABLE IF EXISTS `twawihostingpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twawihostingpos` (
  `pid` int(13) NOT NULL AUTO_INCREMENT,
  `kHostingPos` int(10) NOT NULL DEFAULT 0,
  `nodeid` int(10) NOT NULL DEFAULT 0,
  `hostid` int(10) NOT NULL DEFAULT 0,
  `cluster` varchar(50) DEFAULT NULL,
  `packageid` varchar(50) DEFAULT NULL,
  `ipaddr` varchar(50) DEFAULT NULL,
  `hostname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` blob DEFAULT NULL,
  `status` enum('READY','ONINSTALL','WAITING') NOT NULL DEFAULT 'ONINSTALL',
  `checkcount` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pid`),
  KEY `kHostingPos` (`kHostingPos`)
) ENGINE=InnoDB AUTO_INCREMENT=912 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twawipackages`
--

DROP TABLE IF EXISTS `twawipackages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twawipackages` (
  `kpid` int(13) NOT NULL AUTO_INCREMENT,
  `kProduktLeistung` int(13) NOT NULL DEFAULT 0,
  `cPackage` char(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `memory` int(12) NOT NULL DEFAULT 0,
  `cores` int(4) NOT NULL DEFAULT 0,
  `sockets` int(4) NOT NULL DEFAULT 0,
  `hdd` int(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`kpid`),
  KEY `kProduktLeistung` (`kProduktLeistung`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twawirepricerhistory`
--

DROP TABLE IF EXISTS `twawirepricerhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twawirepricerhistory` (
  `kWawiRepricerHistory` int(10) NOT NULL AUTO_INCREMENT,
  `kAccount` int(10) NOT NULL,
  `kUser` int(10) NOT NULL,
  `kAdminlogin` int(10) NOT NULL,
  `cMode` varchar(255) NOT NULL,
  `cExecutionPerson` varchar(255) NOT NULL,
  `dChanged` datetime NOT NULL,
  PRIMARY KEY (`kWawiRepricerHistory`),
  KEY `kAccount` (`kAccount`,`kUser`)
) ENGINE=MyISAM AUTO_INCREMENT=1548 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twawirepricerkuendigung`
--

DROP TABLE IF EXISTS `twawirepricerkuendigung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twawirepricerkuendigung` (
  `kUser` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `dKuendigungZum` date DEFAULT NULL,
  `dKuendigungAm` datetime DEFAULT NULL,
  `kAdminlogin` int(11) DEFAULT 0,
  PRIMARY KEY (`kUser`),
  KEY `kAccount` (`kAccount`),
  KEY `kAdminlogin` (`kAdminlogin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twiedervorlage`
--

DROP TABLE IF EXISTS `twiedervorlage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twiedervorlage` (
  `kWiedervorlage` int(11) NOT NULL AUTO_INCREMENT,
  `kAdminUser` int(11) NOT NULL,
  `kAssignedTo` int(11) NOT NULL,
  `kAccount` int(11) NOT NULL,
  `kGruppenfreigabe` int(11) NOT NULL,
  `kWiedervorlageReason` int(11) DEFAULT NULL,
  `cGrund` longtext NOT NULL,
  `cKommentar` longtext NOT NULL,
  `dWiedervorlage` date NOT NULL,
  `dErstellt` date NOT NULL,
  `dAktualisiert` datetime DEFAULT NULL,
  PRIMARY KEY (`kWiedervorlage`)
) ENGINE=MyISAM AUTO_INCREMENT=50919 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twiedervorlage_reasons`
--

DROP TABLE IF EXISTS `twiedervorlage_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twiedervorlage_reasons` (
  `kWiedervorlageReason` int(11) NOT NULL AUTO_INCREMENT,
  `cText` text NOT NULL,
  `bHidden` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`kWiedervorlageReason`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twiedervorlagegruppenfreigabe`
--

DROP TABLE IF EXISTS `twiedervorlagegruppenfreigabe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twiedervorlagegruppenfreigabe` (
  `kWiedervorlage` int(11) NOT NULL,
  `kGruppe` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twiedervorlagetag`
--

DROP TABLE IF EXISTS `twiedervorlagetag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twiedervorlagetag` (
  `kWiedervorlage` int(11) NOT NULL,
  `kTag` int(10) unsigned NOT NULL,
  `kAdminLogin` int(11) DEFAULT NULL,
  `dErstellt` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`kWiedervorlage`,`kTag`),
  KEY `twiedervorlagetag_ktag_foreign` (`kTag`),
  CONSTRAINT `twiedervorlagetag_ktag_foreign` FOREIGN KEY (`kTag`) REFERENCES `ttag` (`kTag`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tzeitlizenz`
--

DROP TABLE IF EXISTS `tzeitlizenz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tzeitlizenz` (
  `kZeitLizenz` int(11) NOT NULL AUTO_INCREMENT,
  `kAccount` int(11) NOT NULL,
  `kLizenz` int(11) NOT NULL,
  `kShopModul` int(11) NOT NULL,
  `kKaufProdukt` int(11) NOT NULL,
  `kAccountGebunden` int(11) NOT NULL,
  `kShop` int(11) NOT NULL,
  `cLizenzkey` varchar(255) NOT NULL,
  `nAbgelaufen` int(11) NOT NULL,
  `nUmgewandelt` int(11) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dLetzteErinnerung` datetime DEFAULT NULL,
  `dGueltigBis` datetime NOT NULL,
  PRIMARY KEY (`kZeitLizenz`)
) ENGINE=MyISAM AUTO_INCREMENT=9793 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tzertifikat`
--

DROP TABLE IF EXISTS `tzertifikat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tzertifikat` (
  `kZertifikat` int(10) NOT NULL AUTO_INCREMENT,
  `kProdukt` int(10) DEFAULT NULL,
  `cName` varchar(255) NOT NULL,
  `cZertifizierung` varchar(255) NOT NULL,
  `cVorraussetzung` varchar(255) NOT NULL,
  `cBeschreibung` text NOT NULL,
  `cBildPfad` varchar(255) NOT NULL,
  `cHTML` text NOT NULL,
  `nSort` int(11) NOT NULL DEFAULT 0,
  `fPreis` double NOT NULL,
  `nAktiv` tinyint(4) NOT NULL,
  PRIMARY KEY (`kZertifikat`),
  KEY `cName` (`cName`),
  KEY `nSort` (`nSort`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tzertifikatanfrage`
--

DROP TABLE IF EXISTS `tzertifikatanfrage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tzertifikatanfrage` (
  `kZertifikatanfrage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kServicepartner` int(10) unsigned NOT NULL DEFAULT 0,
  `kTechnologiepartner` int(10) NOT NULL DEFAULT 0,
  `kAnsprechpartner` int(10) unsigned NOT NULL,
  `kErweiterung` int(10) NOT NULL,
  `cNotiz` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cDatei` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nStatus` int(1) unsigned NOT NULL DEFAULT 0,
  `dEingang` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kZertifikatanfrage`),
  KEY `kTechnologiepartner` (`kTechnologiepartner`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tzertifikatgewichtung`
--

DROP TABLE IF EXISTS `tzertifikatgewichtung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tzertifikatgewichtung` (
  `kGewichtung` int(11) NOT NULL AUTO_INCREMENT,
  `kLeistung` int(11) DEFAULT NULL,
  `kZertifikat` tinyint(4) DEFAULT NULL,
  `nGewichtung` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`kGewichtung`),
  KEY `kLeistung` (`kLeistung`),
  KEY `kZertifikat` (`kZertifikat`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tzertifikatprotokoll`
--

DROP TABLE IF EXISTS `tzertifikatprotokoll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tzertifikatprotokoll` (
  `kZertifikatprotokoll` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kZertifikatanfrage` int(10) unsigned NOT NULL,
  `cBearbeiter` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nStatus` int(10) unsigned NOT NULL,
  `cNotizIntern` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cNotizExtern` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dErstellt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`kZertifikatprotokoll`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tzertifizierung`
--

DROP TABLE IF EXISTS `tzertifizierung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tzertifizierung` (
  `kZertifizierung` int(10) NOT NULL AUTO_INCREMENT,
  `kZertifikat` int(10) NOT NULL,
  `kServicepartner` int(10) NOT NULL,
  `cAnrede` enum('Herr','Frau') NOT NULL,
  `cVorname` varchar(255) NOT NULL,
  `cNachname` varchar(255) NOT NULL,
  `cMail` varchar(255) NOT NULL,
  `cTel` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dGueltigBis` date NOT NULL,
  `dGeaendert` datetime NOT NULL,
  `nAktiv` int(11) NOT NULL DEFAULT 1,
  `bUrkunde` mediumblob NOT NULL,
  PRIMARY KEY (`kZertifizierung`),
  KEY `kZertifikat` (`kZertifikat`,`kServicepartner`)
) ENGINE=MyISAM AUTO_INCREMENT=783 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tzertifizierunghistoryprovision`
--

DROP TABLE IF EXISTS `tzertifizierunghistoryprovision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tzertifizierunghistoryprovision` (
  `kZertifizierung` int(10) NOT NULL,
  `kZertifikat` int(10) NOT NULL,
  `kServicepartner` int(10) NOT NULL,
  `cVorname` varchar(255) NOT NULL,
  `cNachname` varchar(255) NOT NULL,
  `dErstellt` datetime NOT NULL,
  `dGueltigBis` date NOT NULL,
  `dGeaendert` datetime DEFAULT NULL,
  `nAktiv` int(11) NOT NULL DEFAULT 1,
  `dZeitpunkt` date NOT NULL,
  PRIMARY KEY (`kZertifizierung`,`dZeitpunkt`),
  KEY `tzertifizierunghistoryprovision_sp_provi_index` (`kServicepartner`,`dZeitpunkt`),
  KEY `tzertifizierunghistoryprovision_kZertifikat_index` (`kZertifikat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_activated_events`
--

DROP TABLE IF EXISTS `vc_di_activated_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_activated_events` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `voucher_id` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `status_before` tinyint(1) NOT NULL DEFAULT 0,
  `valid_until_before` datetime DEFAULT NULL,
  `status_after` tinyint(1) NOT NULL DEFAULT 0,
  `valid_until_after` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vc_di_activated_events_user_id_index` (`user_id`),
  KEY `vc_di_activated_events_voucher_id_index` (`voucher_id`),
  KEY `vc_di_activated_events_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_canceled_events`
--

DROP TABLE IF EXISTS `vc_di_canceled_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_canceled_events` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `voucher_id` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `usage_amount` double(8,2) NOT NULL,
  `initial_amount` double(8,2) NOT NULL,
  `remaining_amount` double(8,2) NOT NULL,
  `used_amount` double(8,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vc_di_canceled_events_user_id_index` (`user_id`),
  KEY `vc_di_canceled_events_voucher_id_index` (`voucher_id`),
  KEY `vc_di_canceled_events_client_id_index` (`client_id`),
  KEY `vc_di_canceled_events_order_number_index` (`order_number`),
  KEY `vc_di_canceled_events_usage_amount_index` (`usage_amount`),
  KEY `vc_di_canceled_events_initial_amount_index` (`initial_amount`),
  KEY `vc_di_canceled_events_remaining_amount_index` (`remaining_amount`),
  KEY `vc_di_canceled_events_used_amount_index` (`used_amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_charged_events`
--

DROP TABLE IF EXISTS `vc_di_charged_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_charged_events` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `voucher_id` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `usage_amount` double(8,2) NOT NULL,
  `initial_amount` double(8,2) NOT NULL,
  `remaining_amount` double(8,2) NOT NULL,
  `used_amount` double(8,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vc_di_charged_events_user_id_index` (`user_id`),
  KEY `vc_di_charged_events_voucher_id_index` (`voucher_id`),
  KEY `vc_di_charged_events_client_id_index` (`client_id`),
  KEY `vc_di_charged_events_order_number_index` (`order_number`),
  KEY `vc_di_charged_events_usage_amount_index` (`usage_amount`),
  KEY `vc_di_charged_events_initial_amount_index` (`initial_amount`),
  KEY `vc_di_charged_events_remaining_amount_index` (`remaining_amount`),
  KEY `vc_di_charged_events_used_amount_index` (`used_amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_client_groups`
--

DROP TABLE IF EXISTS `vc_di_client_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_client_groups` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_clients`
--

DROP TABLE IF EXISTS `vc_di_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_clients` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_group_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `connected_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_code_request_events`
--

DROP TABLE IF EXISTS `vc_di_code_request_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_code_request_events` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `voucher_id` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vc_di_code_request_events_user_id_index` (`user_id`),
  KEY `vc_di_code_request_events_voucher_id_index` (`voucher_id`),
  KEY `vc_di_code_request_events_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_created_events`
--

DROP TABLE IF EXISTS `vc_di_created_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_created_events` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `voucher_id` varchar(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `custom_id` varchar(255) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `gui` tinyint(1) NOT NULL DEFAULT 0,
  `taxable` tinyint(1) NOT NULL DEFAULT 0,
  `tax_rate` varchar(255) DEFAULT NULL,
  `validity_value` double(8,2) DEFAULT NULL,
  `validity_interval` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vc_di_created_events_amount_index` (`amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_deactivated_events`
--

DROP TABLE IF EXISTS `vc_di_deactivated_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_deactivated_events` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `voucher_id` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `status_before` tinyint(1) NOT NULL DEFAULT 0,
  `valid_until_before` datetime DEFAULT NULL,
  `status_after` tinyint(1) NOT NULL DEFAULT 0,
  `valid_until_after` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vc_di_deactivated_events_user_id_index` (`user_id`),
  KEY `vc_di_deactivated_events_voucher_id_index` (`voucher_id`),
  KEY `vc_di_deactivated_events_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_deleted_events`
--

DROP TABLE IF EXISTS `vc_di_deleted_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_deleted_events` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `voucher_id` varchar(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `custom_id` varchar(255) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `gui` tinyint(1) NOT NULL DEFAULT 0,
  `taxable` tinyint(1) NOT NULL DEFAULT 0,
  `tax_rate` varchar(255) DEFAULT NULL,
  `validity_value` double(8,2) DEFAULT NULL,
  `validity_interval` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vc_di_deleted_events_amount_index` (`amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_failed_jobs`
--

DROP TABLE IF EXISTS `vc_di_failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62572 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_migrations`
--

DROP TABLE IF EXISTS `vc_di_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_recharged_events`
--

DROP TABLE IF EXISTS `vc_di_recharged_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_recharged_events` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `voucher_id` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `usage_amount` double(8,2) NOT NULL,
  `initial_amount` double(8,2) NOT NULL,
  `remaining_amount` double(8,2) NOT NULL,
  `used_amount` double(8,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vc_di_recharged_events_user_id_index` (`user_id`),
  KEY `vc_di_recharged_events_voucher_id_index` (`voucher_id`),
  KEY `vc_di_recharged_events_client_id_index` (`client_id`),
  KEY `vc_di_recharged_events_order_number_index` (`order_number`),
  KEY `vc_di_recharged_events_usage_amount_index` (`usage_amount`),
  KEY `vc_di_recharged_events_initial_amount_index` (`initial_amount`),
  KEY `vc_di_recharged_events_remaining_amount_index` (`remaining_amount`),
  KEY `vc_di_recharged_events_used_amount_index` (`used_amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vc_di_users`
--

DROP TABLE IF EXISTS `vc_di_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vc_di_users` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zammad_companies`
--

DROP TABLE IF EXISTS `zammad_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zammad_companies` (
  `kAccount` int(10) unsigned NOT NULL,
  `zammad_company_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`kAccount`,`zammad_company_id`),
  UNIQUE KEY `zammad_companies_kaccount_unique` (`kAccount`),
  UNIQUE KEY `zammad_companies_zammad_company_id_unique` (`zammad_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zammad_contacts`
--

DROP TABLE IF EXISTS `zammad_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zammad_contacts` (
  `kAnsprechpartner` int(10) unsigned NOT NULL,
  `zammad_user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`kAnsprechpartner`,`zammad_user_id`),
  UNIQUE KEY `zammad_contacts_kansprechpartner_unique` (`kAnsprechpartner`),
  UNIQUE KEY `zammad_contacts_zammad_user_id_unique` (`zammad_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `jtl_typo3`
--

USE `jtl_typo3`;

--
-- Final view structure for view `api_v1_license`
--

/*!50001 DROP VIEW IF EXISTS `api_v1_license`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `api_v1_license` AS select `tlizenz`.`kLizenz` AS `id`,`tlizenz`.`kAccount` AS `user_id`,`tlizenz`.`cKey` AS `_key`,`tlizenz`.`kKey` AS `value`,`tlizenz`.`eTyp` AS `type`,`tlizenz`.`bBrandFree` AS `is_brand_free` from `tlizenz` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `api_v1_pos_device`
--

/*!50001 DROP VIEW IF EXISTS `api_v1_pos_device`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `api_v1_pos_device` AS select `tdevice`.`kDevice` AS `id`,`tdevice`.`kAccount` AS `user_id`,`tdevice`.`nType` AS `type`,`tdevice`.`cId` AS `uid`,`tdevice`.`dUpdated` AS `updated_at`,`tdevice`.`dCreated` AS `created_at` from `tdevice` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `api_v1_pos_device_meta`
--

/*!50001 DROP VIEW IF EXISTS `api_v1_pos_device_meta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `api_v1_pos_device_meta` AS select `tdevicemeta`.`kDeviceMeta` AS `id`,`tdevicemeta`.`kDevice` AS `device_id`,`tdevicemeta`.`_key` AS `_key`,`tdevicemeta`.`value` AS `value` from `tdevicemeta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `api_v1_pos_device_reset`
--

/*!50001 DROP VIEW IF EXISTS `api_v1_pos_device_reset`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `api_v1_pos_device_reset` AS select `tdevicereset`.`kDeviceReset` AS `id`,`tdevicereset`.`kDevice` AS `device_id`,`tdevicereset`.`cCode` AS `code`,`tdevicereset`.`dReceived` AS `received_at`,`tdevicereset`.`dCreated` AS `created_at` from `tdevicereset` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `api_v1_pos_payment_providers`
--

/*!50001 DROP VIEW IF EXISTS `api_v1_pos_payment_providers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `api_v1_pos_payment_providers` AS select `pos_payments`.`payment_provider_id` AS `id`,`pos_payments`.`account_id` AS `user_id`,`pos_payments`.`device_id` AS `device_id`,`pos_payments`.`state` AS `state`,`pos_payments`.`updated_at` AS `updated_at`,`pos_payments`.`created_at` AS `created_at` from `pos_payments` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `api_v1_product`
--

/*!50001 DROP VIEW IF EXISTS `api_v1_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `api_v1_product` AS select `tkaufprodukt`.`kKaufprodukt` AS `id`,`tkaufprodukt`.`cName` AS `name`,`tkaufprodukt`.`eTyp` AS `type` from `tkaufprodukt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `api_v1_shop`
--

/*!50001 DROP VIEW IF EXISTS `api_v1_shop`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `api_v1_shop` AS select `tshop`.`kShop` AS `id`,`tshop`.`kKaufprodukt` AS `product_id`,`tshop`.`cLizenzkey` AS `license_key`,`tshop`.`cDomain` AS `domain`,`tshop`.`cOutHash` AS `hash`,`tshop`.`cPfad` AS `uri`,`tshop`.`nLaufendeVersion` AS `version`,`tshop`.`dDownloadBis` AS `download_until`,`tshop`.`dErstellt` AS `created_at` from `tshop` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `api_v1_shop_module`
--

/*!50001 DROP VIEW IF EXISTS `api_v1_shop_module`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `api_v1_shop_module` AS select `tshopmodul`.`kShopModul` AS `id`,`tshopmodul`.`kKaufprodukt` AS `product_id`,`tshopmodul`.`kAccountGebunden` AS `user_id`,`tshopmodul`.`kShop` AS `shop_id`,`tshopmodul`.`cLizenzkey` AS `license_key`,`tshopmodul`.`dFreigeschaltet` AS `unlocked_at`,`tshopmodul`.`dErstellt` AS `created_at` from `tshopmodul` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `api_v1_user`
--

/*!50001 DROP VIEW IF EXISTS `api_v1_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `api_v1_user` AS select `taccount`.`kAccount` AS `id`,`taccount`.`kKundengruppe` AS `customer_group_id`,`taccount`.`cMail` AS `email`,`taccount`.`cPasswort` AS `password`,`taccount`.`cVorname` AS `given_name`,`taccount`.`cNachname` AS `family_name`,`taccount`.`cAnrede` AS `salutation`,`taccount`.`cTel` AS `phone`,`taccount`.`cJTLToken` AS `api_token`,`taccount`.`cStrasse` AS `address_line_1`,`taccount`.`cAdresszusatz` AS `address_line_2`,`taccount`.`cPLZ` AS `zip_code`,`taccount`.`cOrt` AS `city`,`taccount`.`cLand` AS `country`,`taccount`.`cFirma` AS `company`,`taccount`.`cUSTID` AS `tax_number`,`taccount`.`dErstelldatum` AS `created_at`,`taccount`.`dGeaendert` AS `updated_at`,`taccount`.`nAktiv` AS `is_active`,`taccount`.`nDatenGeprueft` AS `is_verified` from `taccount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ext_license_v1`
--

/*!50001 DROP VIEW IF EXISTS `ext_license_v1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ext_license_v1` AS select `tlizenz`.`kLizenz` AS `kLizenz`,`tlizenz`.`kAccount` AS `kAccount`,`tlizenz`.`cKey` AS `cKey`,`tlizenz`.`kKey` AS `kKey`,`tlizenz`.`eTyp` AS `eTyp`,`tlizenz`.`bBrandFree` AS `bBrandFree`,`tkaufprodukt`.`cName` AS `cName`,`tshop`.`kShop` AS `kShop`,`tshop`.`kKaufprodukt` AS `kKaufprodukt`,`tshop`.`cLizenzkey` AS `cLizenzkey`,`tshop`.`cDomain` AS `cDomain`,`tshop`.`cOutHash` AS `cOutHash`,`tshop`.`cPfad` AS `cPfad`,`tshop`.`nLaufendeVersion` AS `nLaufendeVersion`,`tshop`.`dDownloadBis` AS `dDownloadBis`,`tshop`.`dErstellt` AS `dErstellt`,`tshopmodul`.`kShopModul` AS `kShopModul`,`tshopmodul`.`kKaufprodukt` AS `smkKaufProdukt`,`tshopmodul`.`kAccountGebunden` AS `smkAccountGebunden`,`tshopmodul`.`kShop` AS `smkShop`,`tshopmodul`.`cLizenzkey` AS `smcLizenzkey`,`tshopmodul`.`dErstellt` AS `smdErstellt`,`tshopmodul`.`dFreigeschaltet` AS `smdFreigeschaltet`,`tkaufprodukt`.`nMinShopVersion` AS `nMinShopVersion`,`tkaufprodukt`.`nMinWawiVersion` AS `nMinWawiVersion` from ((((`tlizenz` join `taccount` on(`taccount`.`kAccount` = `tlizenz`.`kAccount`)) left join `tshop` on(`tlizenz`.`kKey` = `tshop`.`kShop` and `tlizenz`.`cKey` = 'Shop')) left join `tshopmodul` on(`tlizenz`.`kKey` = `tshopmodul`.`kShopModul` and `tlizenz`.`cKey` = 'ShopModul')) left join `tkaufprodukt` on(`tkaufprodukt`.`kKaufprodukt` = `tshop`.`kKaufprodukt` or `tkaufprodukt`.`kKaufprodukt` = `tshopmodul`.`kKaufprodukt`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oauth_api_v1_user`
--

/*!50001 DROP VIEW IF EXISTS `oauth_api_v1_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jtl_typo3`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `oauth_api_v1_user` AS select `taccount`.`kAccount` AS `id`,`taccount`.`kKundengruppe` AS `customer_group_id`,`taccount`.`cMail` AS `email`,`taccount`.`cPasswort` AS `password`,`taccount`.`cVorname` AS `given_name`,`taccount`.`cNachname` AS `family_name`,`taccount`.`cAnrede` AS `salutation`,`taccount`.`cTel` AS `phone`,`taccount`.`cJTLToken` AS `api_token`,`taccount`.`cStrasse` AS `address_line_1`,`taccount`.`cAdresszusatz` AS `address_line_2`,`taccount`.`cPLZ` AS `zip_code`,`taccount`.`cOrt` AS `city`,`taccount`.`cLand` AS `country`,`taccount`.`cFirma` AS `company`,`taccount`.`cUSTID` AS `tax_number`,`taccount`.`dErstelldatum` AS `created_at`,`taccount`.`dGeaendert` AS `updated_at`,`taccount`.`nAktiv` AS `is_active`,`taccount`.`nDatenGeprueft` AS `is_verified` from `taccount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-29 20:33:58
