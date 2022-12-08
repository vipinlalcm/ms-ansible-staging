-- MySQL dump 10.13  Distrib 5.6.15, for Linux (x86_64)
--
-- Host: localhost    Database: health1_live
-- ------------------------------------------------------
-- Server version	5.6.15-63.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `action_log`
--

DROP TABLE IF EXISTS `action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_log` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `action` mediumtext COLLATE utf8_bin,
  `affected_entity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_email` mediumtext COLLATE utf8_bin,
  `user_ipaddress` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_rpc_administrator`
--

DROP TABLE IF EXISTS `admin_rpc_administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_rpc_administrator` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` mediumtext COLLATE utf8_bin,
  `username` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `username_idx` (`username`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_rpc_session`
--

DROP TABLE IF EXISTS `admin_rpc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_rpc_session` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `access_time` double DEFAULT NULL,
  `administrator` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_ipaddress` mediumtext COLLATE utf8_bin,
  `idle_timeout` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_time` double DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `access_time_idx` (`access_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alert_incident`
--

DROP TABLE IF EXISTS `alert_incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_incident` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alert_incident_alerters`
--

DROP TABLE IF EXISTS `alert_incident_alerters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_incident_alerters` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_incident` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alerter` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  PRIMARY KEY (`alert_incident`,`alerter`),
  KEY `alerter_idx` (`alerter`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alert_incident_alerts`
--

DROP TABLE IF EXISTS `alert_incident_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_incident_alerts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_incident` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  PRIMARY KEY (`alert_incident`,`alert`),
  KEY `alerter_idx` (`alert`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alert_incident_devices`
--

DROP TABLE IF EXISTS `alert_incident_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_incident_devices` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_incident` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`alert_incident`,`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alert_note`
--

DROP TABLE IF EXISTS `alert_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_note` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerter` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `incident` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `note_subject` mediumtext COLLATE utf8_bin,
  `note_text` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`),
  KEY `alerter_idx` (`alerter`),
  KEY `incident_idx` (`incident`),
  KEY `alert_idx` (`alert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alert_sender`
--

DROP TABLE IF EXISTS `alert_sender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_sender` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `hostname` mediumtext COLLATE utf8_bin,
  `port` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alert_time_period`
--

DROP TABLE IF EXISTS `alert_time_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_time_period` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT NULL,
  `alert_state` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `day_of_week` bigint(20) DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `end_day_of_month` bigint(20) DEFAULT NULL,
  `end_day_of_week` bigint(20) DEFAULT NULL,
  `end_hour` bigint(20) DEFAULT NULL,
  `end_minute` bigint(20) DEFAULT NULL,
  `end_month` bigint(20) DEFAULT NULL,
  `end_year` bigint(20) DEFAULT NULL,
  `interval_type` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_day_of_month` bigint(20) DEFAULT NULL,
  `start_day_of_week` bigint(20) DEFAULT NULL,
  `start_hour` bigint(20) DEFAULT NULL,
  `start_minute` bigint(20) DEFAULT NULL,
  `start_month` bigint(20) DEFAULT NULL,
  `start_year` bigint(20) DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time_zone` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `target_idx` (`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attribute_type` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `value` blob,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_contract`
--

DROP TABLE IF EXISTS `billing_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_contract` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `billing_agreement` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_order` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_period` mediumtext COLLATE utf8_bin,
  `billing_period_start` bigint(20) DEFAULT NULL,
  `cancel_timestamp` bigint(20) DEFAULT NULL,
  `cc_expiration_notification_sent_ts` bigint(20) DEFAULT NULL,
  `cc_update_order_ref` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `currency` mediumtext COLLATE utf8_bin,
  `end_timestamp` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `payment_method` mediumtext COLLATE utf8_bin,
  `payment_method_expire_date` mediumtext COLLATE utf8_bin,
  `payment_method_masked_number` mediumtext COLLATE utf8_bin,
  `purchase_payment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` mediumtext COLLATE utf8_bin,
  `vat` bigint(20) DEFAULT NULL,
  `next_billing_period_start` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `billing_order_idx` (`billing_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_contract_product_bundle`
--

DROP TABLE IF EXISTS `billing_contract_product_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_contract_product_bundle` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `amount` bigint(20) DEFAULT NULL,
  `billing_contract` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `product_bundle` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_log`
--

DROP TABLE IF EXISTS `billing_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_log` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `billed_amount` tinyblob,
  `billed_currency` mediumtext COLLATE utf8_bin,
  `completed` tinyint(1) DEFAULT NULL,
  `contract` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `period_end` bigint(20) DEFAULT NULL,
  `period_start` bigint(20) DEFAULT NULL,
  `purchase_payment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `receipt_number` mediumtext COLLATE utf8_bin,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_email` mediumtext COLLATE utf8_bin,
  `vat_amount` tinyblob,
  `vat_percent` bigint(20) DEFAULT NULL,
  `recurring_payment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_log_line`
--

DROP TABLE IF EXISTS `billing_log_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_log_line` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `billed_amount` tinyblob,
  `billed_type` mediumtext COLLATE utf8_bin,
  `billed_units` bigint(20) DEFAULT NULL,
  `billing_log` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `item_description` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `vat_amount` tinyblob,
  `vat_percent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `billing_log_idx` (`billing_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_order`
--

DROP TABLE IF EXISTS `billing_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_order` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `billing_contract` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_promotion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_ipaddress` mediumtext COLLATE utf8_bin,
  `coupon_code` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `discount` bigint(20) DEFAULT NULL,
  `order_organisation_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` mediumtext COLLATE utf8_bin,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_email` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_order_product_bundle`
--

DROP TABLE IF EXISTS `billing_order_product_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_order_product_bundle` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `amount` bigint(20) DEFAULT NULL,
  `billing_order` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `product_bundle` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_payment_agreement`
--

DROP TABLE IF EXISTS `billing_payment_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_payment_agreement` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `amount` tinyblob,
  `cc_update_order_ref` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reference_number` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_promotion`
--

DROP TABLE IF EXISTS `billing_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_promotion` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `coupon_code` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `current_usage` bigint(20) DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `end_date` bigint(20) DEFAULT NULL,
  `is_global` tinyint(1) DEFAULT NULL,
  `max_usage` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `purchase_discount_1_month` bigint(20) DEFAULT NULL,
  `purchase_discount_1_year` bigint(20) DEFAULT NULL,
  `purchase_discount_3_month` bigint(20) DEFAULT NULL,
  `purchase_discount_5_year` bigint(20) DEFAULT NULL,
  `purchase_discount_6_month` bigint(20) DEFAULT NULL,
  `recurring_discount_1_month` bigint(20) DEFAULT NULL,
  `recurring_discount_1_year` bigint(20) DEFAULT NULL,
  `recurring_discount_3_month` bigint(20) DEFAULT NULL,
  `recurring_discount_5_year` bigint(20) DEFAULT NULL,
  `recurring_discount_6_month` bigint(20) DEFAULT NULL,
  `start_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_promotion_pricing_bundles`
--

DROP TABLE IF EXISTS `billing_promotion_pricing_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_promotion_pricing_bundles` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_promotion` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `pricing_bundle` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`billing_promotion`,`pricing_bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_purchase_payment`
--

DROP TABLE IF EXISTS `billing_purchase_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_purchase_payment` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `billing_agreement` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_contract` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_log` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_period_end` bigint(20) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `payment_amount` tinyblob,
  `payment_amount_ex_vat` tinyblob,
  `payment_order_ref` mediumtext COLLATE utf8_bin,
  `payment_session_ref` mediumtext COLLATE utf8_bin,
  `state` mediumtext COLLATE utf8_bin,
  `transaction_number` mediumtext COLLATE utf8_bin,
  `transaction_ref` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_recurring_payment`
--

DROP TABLE IF EXISTS `billing_recurring_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_recurring_payment` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `billing_agreement` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_contract` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_log` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_period_end` bigint(20) DEFAULT NULL,
  `billing_period_start` bigint(20) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `payment_amount` tinyblob,
  `payment_amount_ex_vat` tinyblob,
  `payment_method` mediumtext COLLATE utf8_bin,
  `state` mediumtext COLLATE utf8_bin,
  `transaction_number` mediumtext COLLATE utf8_bin,
  `transaction_ref` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blob_cache`
--

DROP TABLE IF EXISTS `blob_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blob_cache` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `data` mediumblob,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `updated` double DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `caching_multi_location_probe_command`
--

DROP TABLE IF EXISTS `caching_multi_location_probe_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caching_multi_location_probe_command` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `combined_monitor_job_args` longblob,
  `created` double DEFAULT NULL,
  `location_results` longblob,
  `status` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `component_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `component_type` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `max_update_interval` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prune_if_empty` tinyint(1) DEFAULT NULL,
  `update_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`),
  KEY `component_group_idx` (`component_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `component_group`
--

DROP TABLE IF EXISTS `component_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component_group` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prune_if_empty` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `parent_idx` (`parent`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_log`
--

DROP TABLE IF EXISTS `credit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_log` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `log_type` mediumtext COLLATE utf8_bin,
  `monitor_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `num_credits` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_name` mediumtext COLLATE utf8_bin,
  `user_pager_number` mediumtext COLLATE utf8_bin,
  `contact` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_name` mediumtext COLLATE utf8_bin,
  `contact_pager_number` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `user_idx` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delegator`
--

DROP TABLE IF EXISTS `delegator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegator` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `average_age_pending_jobs` bigint(20) DEFAULT NULL,
  `completed_jobs_since_startup` bigint(20) DEFAULT NULL,
  `completed_jobs_since_startup_per_minute` bigint(20) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `db_query_counter` bigint(20) DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegatorrpc_port` int(11) DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `frontrpc_port` int(11) DEFAULT NULL,
  `heartbeat` bigint(20) DEFAULT NULL,
  `hostname` mediumtext COLLATE utf8_bin,
  `num_currently_monitored_devices` bigint(20) DEFAULT NULL,
  `num_currently_monitored_monitors` bigint(20) DEFAULT NULL,
  `num_currently_monitored_organisations` bigint(20) DEFAULT NULL,
  `num_currently_monitored_snmp_monitors` bigint(20) DEFAULT NULL,
  `num_jobs_in_pending_queue` bigint(20) DEFAULT NULL,
  `num_old_jobs_in_pending_queue` bigint(20) DEFAULT NULL,
  `num_running_jobs` bigint(20) DEFAULT NULL,
  `priority` bigint(20) DEFAULT NULL,
  `proberpc_port` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delegator_group`
--

DROP TABLE IF EXISTS `delegator_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegator_group` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `log_database` mediumtext COLLATE utf8_bin,
  `log_hostname` mediumtext COLLATE utf8_bin,
  `log_password` mediumtext COLLATE utf8_bin,
  `log_port` int(11) DEFAULT NULL,
  `log_username` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `provisioning_enabled` tinyint(1) DEFAULT NULL,
  `rrd_store` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `update_queue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `value_store` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delegator_helper`
--

DROP TABLE IF EXISTS `delegator_helper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegator_helper` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `frontrpc_port` int(11) DEFAULT NULL,
  `hostname` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_disable_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `api_key` mediumtext COLLATE utf8_bin,
  `compiled_alert_time_periods` blob,
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `hlreporter_timestamp` bigint(20) DEFAULT NULL,
  `hostname` mediumtext COLLATE utf8_bin,
  `icon_image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ip_address` mediumtext COLLATE utf8_bin,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `os_string` mediumtext COLLATE utf8_bin,
  `uptime_log_timestamp` bigint(20) DEFAULT NULL,
  `uptime_metric` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_seconds` bigint(20) DEFAULT NULL,
  `uptime_series_blob_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `use_snmp_components` tinyint(1) DEFAULT NULL,
  `device_tag_names` blob,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_group_idx` (`device_group`),
  KEY `hostname_255__idx` (`hostname`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_alert`
--

DROP TABLE IF EXISTS `device_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_alert` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ack_time` bigint(20) DEFAULT NULL,
  `ack_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ack_user_email` mediumtext COLLATE utf8_bin,
  `ack_user_name` mediumtext COLLATE utf8_bin,
  `acked` tinyint(1) DEFAULT NULL,
  `alert_sender` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerter` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `close_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `close_user_email` mediumtext COLLATE utf8_bin,
  `close_user_name` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `end_timestamp` bigint(20) DEFAULT NULL,
  `error_msg` mediumtext COLLATE utf8_bin,
  `last_alert_sent_timestamp` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `needs_delivery` tinyint(1) DEFAULT NULL,
  `num_notifications_sent` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_timestamp` bigint(20) DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `alerter_idx` (`alerter`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_alert_user_contacts`
--

DROP TABLE IF EXISTS `device_alert_user_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_alert_user_contacts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_contact` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device`,`user_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_alert_user_groups`
--

DROP TABLE IF EXISTS `device_alert_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_alert_user_groups` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device`,`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_alert_users`
--

DROP TABLE IF EXISTS `device_alert_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_alert_users` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_all_active_alerts`
--

DROP TABLE IF EXISTS `device_all_active_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_all_active_alerts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device`,`alert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_all_alerts`
--

DROP TABLE IF EXISTS `device_all_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_all_alerts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device`,`alert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_all_monitors`
--

DROP TABLE IF EXISTS `device_all_monitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_all_monitors` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device`,`monitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_attributes`
--

DROP TABLE IF EXISTS `device_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_attributes` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `attribute` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device`,`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_group`
--

DROP TABLE IF EXISTS `device_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_group` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_disable_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_blob_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `parent_idx` (`parent`),
  KEY `name_255__idx` (`name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_group_alert_user_contacts`
--

DROP TABLE IF EXISTS `device_group_alert_user_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_group_alert_user_contacts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_contact` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device_group`,`user_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_group_alert_user_groups`
--

DROP TABLE IF EXISTS `device_group_alert_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_group_alert_user_groups` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device_group`,`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_group_alert_users`
--

DROP TABLE IF EXISTS `device_group_alert_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_group_alert_users` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device_group`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_tag`
--

DROP TABLE IF EXISTS `device_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_tag` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_blob_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_tag_devices`
--

DROP TABLE IF EXISTS `device_tag_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_tag_devices` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_tag` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`device_tag`,`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_template`
--

DROP TABLE IF EXISTS `device_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_template` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_bin,
  `hardware_cpu_max_used_threshold_percent` bigint(20) DEFAULT NULL,
  `hardware_filesystem_max_used_threshold_percent` bigint(20) DEFAULT NULL,
  `hardware_memory_max_used_threshold_percent` bigint(20) DEFAULT NULL,
  `hardware_network_interface_max_used_threshold_percent` bigint(20) DEFAULT NULL,
  `hardware_system_load_max_load_threshold` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_notification_template`
--

DROP TABLE IF EXISTS `email_notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_notification_template` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `template_subject` mediumtext COLLATE utf8_bin,
  `template_text` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity_log`
--

DROP TABLE IF EXISTS `entity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_log` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `entity_id` mediumtext COLLATE utf8_bin,
  `entity_type` mediumtext COLLATE utf8_bin,
  `log_type` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_callback_server`
--

DROP TABLE IF EXISTS `event_callback_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_callback_server` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `callback_url` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `use_response` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `category` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `message` mediumtext COLLATE utf8_bin,
  `severity` mediumtext COLLATE utf8_bin,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `global_config`
--

DROP TABLE IF EXISTS `global_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_config` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_sender_message_queue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_log_receipt_number_counter` bigint(20) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `disable_new_users` tinyint(1) DEFAULT NULL,
  `lock_server` mediumtext COLLATE utf8_bin,
  `organisation_customer_id_counter` bigint(20) DEFAULT NULL,
  `organisation_limit` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hardware_cpu`
--

DROP TABLE IF EXISTS `hardware_cpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware_cpu` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `compiled_alert_time_periods` blob,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `first_status_set_timestamp` bigint(20) DEFAULT NULL,
  `force_check` tinyint(1) DEFAULT NULL,
  `max_used_threshold_percent` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_status_change_timestamp` bigint(20) DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  `status_change_timestamp` bigint(20) DEFAULT NULL,
  `usage_percent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hardware_file_system`
--

DROP TABLE IF EXISTS `hardware_file_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware_file_system` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `compiled_alert_time_periods` blob,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `disk_type` mediumtext COLLATE utf8_bin,
  `first_status_set_timestamp` bigint(20) DEFAULT NULL,
  `force_check` tinyint(1) DEFAULT NULL,
  `max_used_threshold_percent` bigint(20) DEFAULT NULL,
  `missing_count` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_status_change_timestamp` bigint(20) DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  `status_change_timestamp` bigint(20) DEFAULT NULL,
  `total_bytes` bigint(20) DEFAULT NULL,
  `used_bytes` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hardware_memory`
--

DROP TABLE IF EXISTS `hardware_memory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware_memory` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `compiled_alert_time_periods` blob,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `first_status_set_timestamp` bigint(20) DEFAULT NULL,
  `force_check` tinyint(1) DEFAULT NULL,
  `max_used_threshold_percent` bigint(20) DEFAULT NULL,
  `memory_free` bigint(20) DEFAULT NULL,
  `memory_size` bigint(20) DEFAULT NULL,
  `memory_type` mediumtext COLLATE utf8_bin,
  `memory_used` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_status_change_timestamp` bigint(20) DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  `status_change_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hardware_network_interface`
--

DROP TABLE IF EXISTS `hardware_network_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware_network_interface` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `admin_status` mediumtext COLLATE utf8_bin,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `compiled_alert_time_periods` blob,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `first_status_set_timestamp` bigint(20) DEFAULT NULL,
  `force_check` tinyint(1) DEFAULT NULL,
  `interface_type` mediumtext COLLATE utf8_bin,
  `max_used_threshold_percent` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `operational_status` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_status_change_timestamp` bigint(20) DEFAULT NULL,
  `speed` bigint(20) DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  `status_change_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hardware_system_load`
--

DROP TABLE IF EXISTS `hardware_system_load`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware_system_load` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `compiled_alert_time_periods` blob,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `first_status_set_timestamp` bigint(20) DEFAULT NULL,
  `force_check` tinyint(1) DEFAULT NULL,
  `load_type` mediumtext COLLATE utf8_bin,
  `max_load_threshold` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_status_change_timestamp` bigint(20) DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  `status_change_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hardware_threshold_alert`
--

DROP TABLE IF EXISTS `hardware_threshold_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware_threshold_alert` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ack_time` bigint(20) DEFAULT NULL,
  `ack_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ack_user_email` mediumtext COLLATE utf8_bin,
  `ack_user_name` mediumtext COLLATE utf8_bin,
  `acked` tinyint(1) DEFAULT NULL,
  `alert_sender` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerter` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `end_timestamp` bigint(20) DEFAULT NULL,
  `error_msg` mediumtext COLLATE utf8_bin,
  `last_alert_sent_timestamp` bigint(20) DEFAULT NULL,
  `needs_delivery` tinyint(1) DEFAULT NULL,
  `num_notifications_sent` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `alerter_idx` (`alerter`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `format` mediumtext COLLATE utf8_bin,
  `image_data` longblob,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `key` mediumtext COLLATE utf8_bin,
  `label_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `value` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `_key__255__idx` (`key`(255)),
  KEY `label_group_255__idx` (`label_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label_group`
--

DROP TABLE IF EXISTS `label_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_group` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `probe_heartbeat_timestamp` bigint(20) DEFAULT NULL,
  `provisioning_enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_monitor`
--

DROP TABLE IF EXISTS `location_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_monitor` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `current_errormsg` mediumtext COLLATE utf8_bin,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `failed_checks` bigint(20) DEFAULT NULL,
  `last_check_result` mediumtext COLLATE utf8_bin,
  `last_check_timestamp` bigint(20) DEFAULT NULL,
  `last_status_set_timestamp` bigint(20) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `monitor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `monitor_idx` (`monitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location_monitor_alert`
--

DROP TABLE IF EXISTS `location_monitor_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_monitor_alert` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `end_timestamp` bigint(20) DEFAULT NULL,
  `error_msg` mediumtext COLLATE utf8_bin,
  `location_monitor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `monitor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_timestamp` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `monitor_idx` (`monitor`),
  KEY `location_monitor_idx` (`location_monitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_queue`
--

DROP TABLE IF EXISTS `message_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_queue` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_queue_node`
--

DROP TABLE IF EXISTS `message_queue_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_queue_node` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `hostname` mediumtext COLLATE utf8_bin,
  `message_queue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` mediumtext COLLATE utf8_bin,
  `port` int(11) DEFAULT NULL,
  `username` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metric`
--

DROP TABLE IF EXISTS `metric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `display_graph` tinyint(1) DEFAULT NULL,
  `external_timestamp` bigint(20) DEFAULT NULL,
  `force_error` tinyint(1) DEFAULT NULL,
  `initialized` tinyint(1) DEFAULT NULL,
  `message` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_entity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_value` blob,
  `prune_time` bigint(20) DEFAULT NULL,
  `raw_prev_value` blob,
  `raw_value` blob,
  `update_timestamp` bigint(20) DEFAULT NULL,
  `value` blob,
  `value_multiplier` bigint(20) DEFAULT NULL,
  `value_per_interval` bigint(20) DEFAULT NULL,
  `value_per_second` tinyint(1) DEFAULT NULL,
  `value_type` mediumtext COLLATE utf8_bin,
  `value_unit` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `parent_entity_idx` (`parent_entity`),
  KEY `device_idx` (`device`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metric_graph`
--

DROP TABLE IF EXISTS `metric_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric_graph` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_entity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prune_if_empty` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `parent_entity_idx` (`parent_entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metric_graph_metrics`
--

DROP TABLE IF EXISTS `metric_graph_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric_graph_metrics` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `metric` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `metric_graph` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`metric_graph`,`metric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metric_monitor`
--

DROP TABLE IF EXISTS `metric_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric_monitor` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_interval` bigint(20) DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `compiled_alert_time_periods` blob,
  `created` double DEFAULT NULL,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `failed_checks` bigint(20) DEFAULT NULL,
  `first_status_set_timestamp` bigint(20) DEFAULT NULL,
  `force_check` tinyint(1) DEFAULT NULL,
  `helptext` mediumtext COLLATE utf8_bin,
  `max_failed_checks` bigint(20) DEFAULT NULL,
  `metric` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metric_down_start_timestamp` bigint(20) DEFAULT NULL,
  `metric_downtime_before_alert` bigint(20) DEFAULT NULL,
  `monitor_enabled` tinyint(1) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `notifications_per_alert` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_status_change_timestamp` bigint(20) DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  `status_change_timestamp` bigint(20) DEFAULT NULL,
  `uptime_metric` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_blob_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `value_max` double DEFAULT NULL,
  `value_min` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`),
  KEY `metric_idx` (`metric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metric_monitor_alert`
--

DROP TABLE IF EXISTS `metric_monitor_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric_monitor_alert` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ack_time` bigint(20) DEFAULT NULL,
  `ack_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ack_user_email` mediumtext COLLATE utf8_bin,
  `ack_user_name` mediumtext COLLATE utf8_bin,
  `acked` tinyint(1) DEFAULT NULL,
  `alert_sender` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerter` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `end_timestamp` bigint(20) DEFAULT NULL,
  `error_msg` mediumtext COLLATE utf8_bin,
  `last_alert_sent_timestamp` bigint(20) DEFAULT NULL,
  `message` mediumtext COLLATE utf8_bin,
  `needs_delivery` tinyint(1) DEFAULT NULL,
  `num_notifications_sent` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_timestamp` bigint(20) DEFAULT NULL,
  `value` blob,
  `owner` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `alerter_idx` (`alerter`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metric_monitor_alert_user_contacts`
--

DROP TABLE IF EXISTS `metric_monitor_alert_user_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric_monitor_alert_user_contacts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `metric_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_contact` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`metric_monitor`,`user_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metric_monitor_alert_user_group`
--

DROP TABLE IF EXISTS `metric_monitor_alert_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric_monitor_alert_user_group` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `metric_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`metric_monitor`,`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metric_monitor_alert_users`
--

DROP TABLE IF EXISTS `metric_monitor_alert_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric_monitor_alert_users` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `metric_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`metric_monitor`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metric_template`
--

DROP TABLE IF EXISTS `metric_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric_template` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `metric_description` mediumtext COLLATE utf8_bin,
  `metric_name` mediumtext COLLATE utf8_bin,
  `metric_value_type` mediumtext COLLATE utf8_bin,
  `metric_value_unit` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor`
--

DROP TABLE IF EXISTS `monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_disable_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_interval` bigint(20) DEFAULT NULL,
  `alert_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `arguments` blob,
  `check_interval` bigint(20) DEFAULT NULL,
  `compiled_alert_time_periods` blob,
  `created` double DEFAULT NULL,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `first_status_set_timestamp` bigint(20) DEFAULT NULL,
  `force_check` tinyint(1) DEFAULT NULL,
  `helptext` mediumtext COLLATE utf8_bin,
  `last_check_timestamp` bigint(20) DEFAULT NULL,
  `latest_location_errormsg` mediumtext COLLATE utf8_bin,
  `max_failed_checks` bigint(20) DEFAULT NULL,
  `monitor_downtime_before_alert` bigint(20) DEFAULT NULL,
  `monitor_enabled` tinyint(1) DEFAULT NULL,
  `monitor_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `monitor_type_name` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `notifications_per_alert` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_status_change_timestamp` bigint(20) DEFAULT NULL,
  `recheck_interval` bigint(20) DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  `status_change_timestamp` bigint(20) DEFAULT NULL,
  `status_determination_method` mediumtext COLLATE utf8_bin,
  `target_hostname` mediumtext COLLATE utf8_bin,
  `timeout` bigint(20) DEFAULT NULL,
  `uptime_log_timestamp` bigint(20) DEFAULT NULL,
  `uptime_metric` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_blob_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_alert`
--

DROP TABLE IF EXISTS `monitor_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_alert` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ack_time` bigint(20) DEFAULT NULL,
  `ack_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ack_user_email` mediumtext COLLATE utf8_bin,
  `ack_user_name` mediumtext COLLATE utf8_bin,
  `acked` tinyint(1) DEFAULT NULL,
  `alert_sender` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `end_timestamp` bigint(20) DEFAULT NULL,
  `error_msg` mediumtext COLLATE utf8_bin,
  `last_alert_sent_timestamp` bigint(20) DEFAULT NULL,
  `monitor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `needs_delivery` tinyint(1) DEFAULT NULL,
  `num_notifications_sent` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_timestamp` bigint(20) DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `monitor_idx` (`monitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_alert_location_monitor_alerts`
--

DROP TABLE IF EXISTS `monitor_alert_location_monitor_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_alert_location_monitor_alerts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `location_monitor_alert` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `monitor_alert` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`monitor_alert`,`location_monitor_alert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_alert_user_contacts`
--

DROP TABLE IF EXISTS `monitor_alert_user_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_alert_user_contacts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_contact` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`monitor`,`user_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_alert_user_groups`
--

DROP TABLE IF EXISTS `monitor_alert_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_alert_user_groups` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`monitor`,`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_alert_users`
--

DROP TABLE IF EXISTS `monitor_alert_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_alert_users` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`monitor`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_blocked_host`
--

DROP TABLE IF EXISTS `monitor_blocked_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_blocked_host` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `address` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `reason` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_location_monitor_metrics`
--

DROP TABLE IF EXISTS `monitor_location_monitor_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_location_monitor_metrics` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `metric` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`monitor`,`metric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_locations`
--

DROP TABLE IF EXISTS `monitor_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_locations` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`monitor`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_type`
--

DROP TABLE IF EXISTS `monitor_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_type` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `helptext` mediumtext COLLATE utf8_bin,
  `long_helptext` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `probe_monitor_command` mediumtext COLLATE utf8_bin,
  `sorted_argument_list` blob,
  `visible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `name_255__idx` (`name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_type_argument`
--

DROP TABLE IF EXISTS `monitor_type_argument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_type_argument` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `argument_type` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `default_value` blob,
  `description` mediumtext COLLATE utf8_bin,
  `helptext` mediumtext COLLATE utf8_bin,
  `max_length` bigint(20) DEFAULT NULL,
  `max_value` bigint(20) DEFAULT NULL,
  `min_length` bigint(20) DEFAULT NULL,
  `min_value` bigint(20) DEFAULT NULL,
  `monitor_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `visibility` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `monitor_type_idx` (`monitor_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_type_category`
--

DROP TABLE IF EXISTS `monitor_type_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_type_category` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_type_monitor_type_categories`
--

DROP TABLE IF EXISTS `monitor_type_monitor_type_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_type_monitor_type_categories` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `monitor_type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `monitor_type_category` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`monitor_type`,`monitor_type_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_template`
--

DROP TABLE IF EXISTS `notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_template` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `expansion_type` mediumtext COLLATE utf8_bin,
  `multipart_type` mediumtext COLLATE utf8_bin,
  `subject` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_template_section`
--

DROP TABLE IF EXISTS `notification_template_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_template_section` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8_bin,
  `content_type` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `expansion_type` mediumtext COLLATE utf8_bin,
  `notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_trigger`
--

DROP TABLE IF EXISTS `notification_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_trigger` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `event` mediumtext COLLATE utf8_bin,
  `notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oc_included_monitor_type_categories`
--

DROP TABLE IF EXISTS `oc_included_monitor_type_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_included_monitor_type_categories` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `monitor_type_category` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `organisation_class` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`organisation_class`,`monitor_type_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation`
--

DROP TABLE IF EXISTS `organisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_count_metric` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `billing_contact_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `billing_country_code` mediumtext COLLATE utf8_bin,
  `billing_start_timestamp` bigint(20) DEFAULT NULL,
  `bundle_devices` bigint(20) DEFAULT NULL,
  `bundle_monitors` bigint(20) DEFAULT NULL,
  `cancel_timestamp` bigint(20) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `customer_id` mediumtext COLLATE utf8_bin,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email_notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `global_discount` bigint(20) DEFAULT NULL,
  `is_business` tinyint(1) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `monitor_default_alert_interval` bigint(20) DEFAULT NULL,
  `monitor_default_check_interval` bigint(20) DEFAULT NULL,
  `monitor_default_downtime_before_alert` bigint(20) DEFAULT NULL,
  `monitor_default_max_failed_checks` bigint(20) DEFAULT NULL,
  `monitor_default_notifications_per_alert` bigint(20) DEFAULT NULL,
  `monitor_default_recheck_interval` bigint(20) DEFAULT NULL,
  `monitor_default_timeout` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation_activated` tinyint(1) DEFAULT NULL,
  `organisation_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pager_notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `purchased_credits` bigint(20) DEFAULT NULL,
  `snmp_default_location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `snmp_default_timeout` bigint(20) DEFAULT NULL,
  `status2_blob_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trial_organisation_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trial_organisation_class_expires` bigint(20) DEFAULT NULL,
  `uptime_log_timestamp` bigint(20) DEFAULT NULL,
  `uptime_metric` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_blob_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_action_log`
--

DROP TABLE IF EXISTS `organisation_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_action_log` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `action` mediumtext COLLATE utf8_bin,
  `action_data` blob,
  `affected_entity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_email` mediumtext COLLATE utf8_bin,
  `user_ipaddress` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `organisation_created_idx` (`organisation`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_all_active_alerts`
--

DROP TABLE IF EXISTS `organisation_all_active_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_all_active_alerts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`organisation`,`alert`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_all_alerts`
--

DROP TABLE IF EXISTS `organisation_all_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_all_alerts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`organisation`,`alert`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_all_monitors`
--

DROP TABLE IF EXISTS `organisation_all_monitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_all_monitors` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `organisation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`organisation`,`monitor`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_attributes`
--

DROP TABLE IF EXISTS `organisation_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_attributes` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `attribute` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`organisation`,`attribute`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_class`
--

DROP TABLE IF EXISTS `organisation_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_class` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `credits_included` bigint(20) DEFAULT NULL,
  `default_email_notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `default_location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `default_monitor_graph` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `default_pager_notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `default_snmp_graph` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `default_uptime_graph` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `devices_included` bigint(20) DEFAULT NULL,
  `devices_max` bigint(20) DEFAULT NULL,
  `includes_server_health` tinyint(1) DEFAULT NULL,
  `includes_support` tinyint(1) DEFAULT NULL,
  `master` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `monitor_default_alert_interval` bigint(20) DEFAULT NULL,
  `monitor_default_check_interval` bigint(20) DEFAULT NULL,
  `monitor_default_max_failed_checks` bigint(20) DEFAULT NULL,
  `monitor_default_notifications_per_alert` bigint(20) DEFAULT NULL,
  `monitor_default_recheck_interval` bigint(20) DEFAULT NULL,
  `monitor_default_timeout` bigint(20) DEFAULT NULL,
  `monitor_max_timeout` bigint(20) DEFAULT NULL,
  `monitor_min_alert_interval` bigint(20) DEFAULT NULL,
  `monitor_min_check_interval` bigint(20) DEFAULT NULL,
  `monitor_min_recheck_interval` bigint(20) DEFAULT NULL,
  `monitors_included` bigint(20) DEFAULT NULL,
  `monitors_max` bigint(20) DEFAULT NULL,
  `organisation_pricing_bundle` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `snmp_default_check_interval` bigint(20) DEFAULT NULL,
  `snmp_default_location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `snmp_default_timeout` bigint(20) DEFAULT NULL,
  `snmp_max_timeout` bigint(20) DEFAULT NULL,
  `snmp_min_check_interval` bigint(20) DEFAULT NULL,
  `trial_organisation_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trial_organisation_class_duration` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_class_included_locations`
--

DROP TABLE IF EXISTS `organisation_class_included_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_class_included_locations` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `organisation_class` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`organisation_class`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_class_locations`
--

DROP TABLE IF EXISTS `organisation_class_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_class_locations` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `organisation_class` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`organisation_class`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_class_master`
--

DROP TABLE IF EXISTS `organisation_class_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_class_master` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `active_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_user_license` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `available_for_purchase` tinyint(1) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_class_product_bundles`
--

DROP TABLE IF EXISTS `organisation_class_product_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_class_product_bundles` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `organisation_class` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `product_bundle` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`organisation_class`,`product_bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_monitor_default_locations`
--

DROP TABLE IF EXISTS `organisation_monitor_default_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_monitor_default_locations` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `organisation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`organisation`,`location`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pager_notification_template`
--

DROP TABLE IF EXISTS `pager_notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pager_notification_template` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `template_text` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pager_provider`
--

DROP TABLE IF EXISTS `pager_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pager_provider` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pager_provider_country`
--

DROP TABLE IF EXISTS `pager_provider_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pager_provider_country` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `country_number_code` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `pager_provider` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passive_monitor`
--

DROP TABLE IF EXISTS `passive_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passive_monitor` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_disable_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_interval` bigint(20) DEFAULT NULL,
  `alert_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `compiled_alert_time_periods` blob,
  `created` double DEFAULT NULL,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `failed_checks` bigint(20) DEFAULT NULL,
  `first_status_set_timestamp` bigint(20) DEFAULT NULL,
  `force_check` tinyint(1) DEFAULT NULL,
  `force_state` mediumtext COLLATE utf8_bin,
  `helptext` mediumtext COLLATE utf8_bin,
  `last_report_error_msg` mediumtext COLLATE utf8_bin,
  `last_report_timestamp` bigint(20) DEFAULT NULL,
  `last_report_value` blob,
  `max_failed_checks` bigint(20) DEFAULT NULL,
  `monitor_down_start_timestamp` bigint(20) DEFAULT NULL,
  `monitor_downtime_before_alert` bigint(20) DEFAULT NULL,
  `monitor_enabled` tinyint(1) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `notifications_per_alert` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_status_change_timestamp` bigint(20) DEFAULT NULL,
  `report_max_interval` bigint(20) DEFAULT NULL,
  `report_number_max` double DEFAULT NULL,
  `report_number_min` double DEFAULT NULL,
  `report_type` mediumtext COLLATE utf8_bin,
  `report_valid_number_max` double DEFAULT NULL,
  `report_valid_number_min` double DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  `status_change_timestamp` bigint(20) DEFAULT NULL,
  `uptime_metric` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_blob_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `value_metric` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passive_monitor_alert`
--

DROP TABLE IF EXISTS `passive_monitor_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passive_monitor_alert` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ack_time` bigint(20) DEFAULT NULL,
  `ack_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ack_user_email` mediumtext COLLATE utf8_bin,
  `ack_user_name` mediumtext COLLATE utf8_bin,
  `acked` tinyint(1) DEFAULT NULL,
  `alert_sender` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerter` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `end_timestamp` bigint(20) DEFAULT NULL,
  `error_msg` mediumtext COLLATE utf8_bin,
  `last_alert_sent_timestamp` bigint(20) DEFAULT NULL,
  `needs_delivery` tinyint(1) DEFAULT NULL,
  `num_notifications_sent` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `report_error_msg` mediumtext COLLATE utf8_bin,
  `report_timestamp` bigint(20) DEFAULT NULL,
  `report_value` blob,
  `start_timestamp` bigint(20) DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `alerter_idx` (`alerter`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passive_monitor_alert_user_contacts`
--

DROP TABLE IF EXISTS `passive_monitor_alert_user_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passive_monitor_alert_user_contacts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `passive_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_contact` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`passive_monitor`,`user_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passive_monitor_alert_user_groups`
--

DROP TABLE IF EXISTS `passive_monitor_alert_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passive_monitor_alert_user_groups` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `passive_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`passive_monitor`,`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passive_monitor_alert_users`
--

DROP TABLE IF EXISTS `passive_monitor_alert_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passive_monitor_alert_users` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `passive_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`passive_monitor`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pricing_bundle`
--

DROP TABLE IF EXISTS `pricing_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricing_bundle` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pricing_bundle_regional_pricing`
--

DROP TABLE IF EXISTS `pricing_bundle_regional_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricing_bundle_regional_pricing` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `country_code` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `price_currency` mediumtext COLLATE utf8_bin,
  `pricing_bundle` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `purchase_price_1_month` tinyblob,
  `purchase_price_1_year` tinyblob,
  `purchase_price_3_month` tinyblob,
  `purchase_price_5_year` tinyblob,
  `purchase_price_6_month` tinyblob,
  `recurring_price_1_month` tinyblob,
  `recurring_price_1_year` tinyblob,
  `recurring_price_3_month` tinyblob,
  `recurring_price_5_year` tinyblob,
  `recurring_price_6_month` tinyblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `probe`
--

DROP TABLE IF EXISTS `probe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `probe` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `access_key` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `heartbeat_timestamp` bigint(20) DEFAULT NULL,
  `hostname` mediumtext COLLATE utf8_bin,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `process_start_timestamp` bigint(20) DEFAULT NULL,
  `system_start_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `location_idx` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_id` bigint(20) DEFAULT NULL,
  `process_name` mediumtext COLLATE utf8_bin,
  `process_parameters` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `process_bundle`
--

DROP TABLE IF EXISTS `process_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_bundle` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `monitors_run_ts` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_data` longblob,
  `processes_changed_ts` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `process_monitor`
--

DROP TABLE IF EXISTS `process_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_monitor` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_disable_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_interval` bigint(20) DEFAULT NULL,
  `alert_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `check_parameters` tinyint(1) DEFAULT NULL,
  `compiled_alert_time_periods` blob,
  `created` double DEFAULT NULL,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `first_process_running_set_timestamp` bigint(20) DEFAULT NULL,
  `first_status_set_timestamp` bigint(20) DEFAULT NULL,
  `force_check` tinyint(1) DEFAULT NULL,
  `monitor_enabled` tinyint(1) DEFAULT NULL,
  `notifications_per_alert` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_status_change_timestamp` bigint(20) DEFAULT NULL,
  `process_name` mediumtext COLLATE utf8_bin,
  `process_parameters` mediumtext COLLATE utf8_bin,
  `process_running` tinyint(1) DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  `status_change_timestamp` bigint(20) DEFAULT NULL,
  `uptime_metric` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_blob_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `process_monitor_alert`
--

DROP TABLE IF EXISTS `process_monitor_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_monitor_alert` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ack_time` bigint(20) DEFAULT NULL,
  `ack_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ack_user_email` mediumtext COLLATE utf8_bin,
  `ack_user_name` mediumtext COLLATE utf8_bin,
  `acked` tinyint(1) DEFAULT NULL,
  `alert_sender` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerter` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `end_timestamp` bigint(20) DEFAULT NULL,
  `error_msg` mediumtext COLLATE utf8_bin,
  `last_alert_sent_timestamp` bigint(20) DEFAULT NULL,
  `needs_delivery` tinyint(1) DEFAULT NULL,
  `num_notifications_sent` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_timestamp` bigint(20) DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `alerter_idx` (`alerter`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `process_monitor_alert_user_contacts`
--

DROP TABLE IF EXISTS `process_monitor_alert_user_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_monitor_alert_user_contacts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `process_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_contact` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`process_monitor`,`user_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `process_monitor_alert_user_groups`
--

DROP TABLE IF EXISTS `process_monitor_alert_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_monitor_alert_user_groups` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `process_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`process_monitor`,`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `process_monitor_alert_users`
--

DROP TABLE IF EXISTS `process_monitor_alert_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_monitor_alert_users` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `process_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`process_monitor`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_bundle`
--

DROP TABLE IF EXISTS `product_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `credits` bigint(20) DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `devices` bigint(20) DEFAULT NULL,
  `monitors` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `pricing_bundle` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_bundle_locations`
--

DROP TABLE IF EXISTS `product_bundle_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_locations` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `product_bundle` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`product_bundle`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_bundle_monitor_type_categories`
--

DROP TABLE IF EXISTS `product_bundle_monitor_type_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bundle_monitor_type_categories` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `monitor_type_category` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `product_bundle` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`product_bundle`,`monitor_type_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regional_billing_data`
--

DROP TABLE IF EXISTS `regional_billing_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regional_billing_data` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `billing_currency` mediumtext COLLATE utf8_bin,
  `business_vat` bigint(20) DEFAULT NULL,
  `country_code` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `display_currency` mediumtext COLLATE utf8_bin,
  `is_default` tinyint(1) DEFAULT NULL,
  `private_vat` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `include_all_devices` tinyint(1) DEFAULT NULL,
  `last_sent` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `recurring` mediumtext COLLATE utf8_bin,
  `recurring_monthdate` bigint(20) DEFAULT NULL,
  `recurring_weekday` bigint(20) DEFAULT NULL,
  `report_type` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_device_groups`
--

DROP TABLE IF EXISTS `report_device_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_device_groups` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `report` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`report`,`device_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_devices`
--

DROP TABLE IF EXISTS `report_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_devices` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `report` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`report`,`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_recipient_users`
--

DROP TABLE IF EXISTS `report_recipient_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_recipient_users` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `report` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`report`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rrd_graph`
--

DROP TABLE IF EXISTS `rrd_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rrd_graph` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `graph_step` bigint(20) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rrd_graph_rra`
--

DROP TABLE IF EXISTS `rrd_graph_rra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rrd_graph_rra` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cf` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `rows` bigint(20) DEFAULT NULL,
  `steps` bigint(20) DEFAULT NULL,
  `xff` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rrd_graph_rras`
--

DROP TABLE IF EXISTS `rrd_graph_rras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rrd_graph_rras` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `rrd_graph` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rrd_graph_rra` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`rrd_graph`,`rrd_graph_rra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rrd_store`
--

DROP TABLE IF EXISTS `rrd_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rrd_store` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rrd_store_queue_node`
--

DROP TABLE IF EXISTS `rrd_store_queue_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rrd_store_queue_node` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `hostname` mediumtext COLLATE utf8_bin,
  `password` mediumtext COLLATE utf8_bin,
  `port` int(11) DEFAULT NULL,
  `rrd_store` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rrd_store_rpc_node`
--

DROP TABLE IF EXISTS `rrd_store_rpc_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rrd_store_rpc_node` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `frontrpc_port` int(11) DEFAULT NULL,
  `hostname` mediumtext COLLATE utf8_bin,
  `rrd_store` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_monitor`
--

DROP TABLE IF EXISTS `sample_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_monitor` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_disable_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_interval` bigint(20) DEFAULT NULL,
  `alert_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `compiled_alert_time_periods` blob,
  `created` double DEFAULT NULL,
  `current_alert` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `failed_checks` bigint(20) DEFAULT NULL,
  `first_status_set_timestamp` bigint(20) DEFAULT NULL,
  `force_check` tinyint(1) DEFAULT NULL,
  `max_failed_checks` bigint(20) DEFAULT NULL,
  `monitor_enabled` tinyint(1) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `notifications_per_alert` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prev_status_change_timestamp` bigint(20) DEFAULT NULL,
  `status` mediumtext COLLATE utf8_bin,
  `status_change_timestamp` bigint(20) DEFAULT NULL,
  `uptime_series_blob_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uptime_series_cache` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_monitor_alert`
--

DROP TABLE IF EXISTS `sample_monitor_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_monitor_alert` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ack_time` bigint(20) DEFAULT NULL,
  `ack_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ack_user_email` mediumtext COLLATE utf8_bin,
  `ack_user_name` mediumtext COLLATE utf8_bin,
  `acked` tinyint(1) DEFAULT NULL,
  `alert_sender` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerter` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `end_timestamp` bigint(20) DEFAULT NULL,
  `error_msg` mediumtext COLLATE utf8_bin,
  `last_alert_sent_timestamp` bigint(20) DEFAULT NULL,
  `needs_delivery` tinyint(1) DEFAULT NULL,
  `num_notifications_sent` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `alerter_idx` (`alerter`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_monitor_alert_user_contacts`
--

DROP TABLE IF EXISTS `sample_monitor_alert_user_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_monitor_alert_user_contacts` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `sample_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_contact` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`sample_monitor`,`user_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_monitor_alert_user_groups`
--

DROP TABLE IF EXISTS `sample_monitor_alert_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_monitor_alert_user_groups` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `sample_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`sample_monitor`,`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample_monitor_alert_users`
--

DROP TABLE IF EXISTS `sample_monitor_alert_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_monitor_alert_users` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `sample_monitor` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`sample_monitor`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_limit`
--

DROP TABLE IF EXISTS `service_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_limit` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `client_identifier` mediumtext COLLATE utf8_bin,
  `config_update_timestamp` bigint(20) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `hit_data` blob,
  `max_hits` bigint(20) DEFAULT NULL,
  `max_hits_interval` bigint(20) DEFAULT NULL,
  `service` mediumtext COLLATE utf8_bin,
  `service_limit_config` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_255__idx` (`service`(255)),
  KEY `client_identifier_255__idx` (`client_identifier`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_limit_config`
--

DROP TABLE IF EXISTS `service_limit_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_limit_config` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `client_identifier` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `max_hits` bigint(20) DEFAULT NULL,
  `max_hits_interval` bigint(20) DEFAULT NULL,
  `service` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `service_255__idx` (`service`(255)),
  KEY `client_identifier_255__idx` (`client_identifier`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snmp_collector`
--

DROP TABLE IF EXISTS `snmp_collector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_collector` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `collector_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snmp_collector_oid`
--

DROP TABLE IF EXISTS `snmp_collector_oid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_collector_oid` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `collector` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `oid` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snmp_collector_type`
--

DROP TABLE IF EXISTS `snmp_collector_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_collector_type` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `collector_name` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snmp_collector_type_oid`
--

DROP TABLE IF EXISTS `snmp_collector_type_oid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_collector_type_oid` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `snmp_collector_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snmp_monitor`
--

DROP TABLE IF EXISTS `snmp_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_monitor` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `auth_pass` mediumtext COLLATE utf8_bin,
  `auth_proto` mediumtext COLLATE utf8_bin,
  `check_interval` bigint(20) DEFAULT NULL,
  `community` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `delegator_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `error_msg` mediumtext COLLATE utf8_bin,
  `error_msg_timestamp` bigint(20) DEFAULT NULL,
  `last_check_timestamp` bigint(20) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `priv_pass` mediumtext COLLATE utf8_bin,
  `priv_proto` mediumtext COLLATE utf8_bin,
  `sec_level` mediumtext COLLATE utf8_bin,
  `sec_name` mediumtext COLLATE utf8_bin,
  `snmp_enabled` tinyint(1) DEFAULT NULL,
  `snmp_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `snmp_version` mediumtext COLLATE utf8_bin,
  `timeout` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `device_idx` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snmp_template`
--

DROP TABLE IF EXISTS `snmp_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_template` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snmp_template_snmp_collectors`
--

DROP TABLE IF EXISTS `snmp_template_snmp_collectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_template_snmp_collectors` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `snmp_collector` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmp_template` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`snmp_template`,`snmp_collector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_period`
--

DROP TABLE IF EXISTS `time_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_period` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time_zone` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_period_interval_daily`
--

DROP TABLE IF EXISTS `time_period_interval_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_period_interval_daily` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `end_hour` bigint(20) DEFAULT NULL,
  `end_minute` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_hour` bigint(20) DEFAULT NULL,
  `start_minute` bigint(20) DEFAULT NULL,
  `time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time_zone` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_period_interval_day`
--

DROP TABLE IF EXISTS `time_period_interval_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_period_interval_day` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `day_of_week` bigint(20) DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `end_hour` bigint(20) DEFAULT NULL,
  `end_minute` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_hour` bigint(20) DEFAULT NULL,
  `start_minute` bigint(20) DEFAULT NULL,
  `time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time_zone` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_period_interval_monthly`
--

DROP TABLE IF EXISTS `time_period_interval_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_period_interval_monthly` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `end_day_of_month` bigint(20) DEFAULT NULL,
  `end_hour` bigint(20) DEFAULT NULL,
  `end_minute` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_day_of_month` bigint(20) DEFAULT NULL,
  `start_hour` bigint(20) DEFAULT NULL,
  `start_minute` bigint(20) DEFAULT NULL,
  `time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time_zone` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_period_interval_onetime`
--

DROP TABLE IF EXISTS `time_period_interval_onetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_period_interval_onetime` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `end_day_of_month` bigint(20) DEFAULT NULL,
  `end_hour` bigint(20) DEFAULT NULL,
  `end_minute` bigint(20) DEFAULT NULL,
  `end_month` bigint(20) DEFAULT NULL,
  `end_year` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_day_of_month` bigint(20) DEFAULT NULL,
  `start_hour` bigint(20) DEFAULT NULL,
  `start_minute` bigint(20) DEFAULT NULL,
  `start_month` bigint(20) DEFAULT NULL,
  `start_year` bigint(20) DEFAULT NULL,
  `time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time_zone` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_period_interval_weekly`
--

DROP TABLE IF EXISTS `time_period_interval_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_period_interval_weekly` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `end_day_of_week` bigint(20) DEFAULT NULL,
  `end_hour` bigint(20) DEFAULT NULL,
  `end_minute` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_day_of_week` bigint(20) DEFAULT NULL,
  `start_hour` bigint(20) DEFAULT NULL,
  `start_minute` bigint(20) DEFAULT NULL,
  `time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time_zone` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uptime_series_cache`
--

DROP TABLE IF EXISTS `uptime_series_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uptime_series_cache` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `data` longblob,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `updated` bigint(20) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_disable_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `date_format` mediumtext COLLATE utf8_bin,
  `disable_reason` mediumtext COLLATE utf8_bin,
  `disable_timestamp` bigint(20) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `email` mediumtext COLLATE utf8_bin,
  `email_notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email_verification_sent_ts` bigint(20) DEFAULT NULL,
  `email_verification_string` mediumtext COLLATE utf8_bin,
  `email_verified` tinyint(1) DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `notify_by_email` tinyint(1) DEFAULT NULL,
  `notify_by_pager` tinyint(1) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pager_notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pager_number` mediumtext COLLATE utf8_bin,
  `pager_verification_sent_ts` bigint(20) DEFAULT NULL,
  `pager_verification_string` mediumtext COLLATE utf8_bin,
  `pager_verified` tinyint(1) DEFAULT NULL,
  `password` mediumtext COLLATE utf8_bin,
  `password_reset_token` mediumtext COLLATE utf8_bin,
  `password_reset_ts` bigint(20) DEFAULT NULL,
  `permit_login` tinyint(1) DEFAULT NULL,
  `receive_all_alerts` tinyint(1) DEFAULT NULL,
  `receive_promotions` tinyint(1) DEFAULT NULL,
  `system_administrator` tinyint(1) DEFAULT NULL,
  `time_format` mediumtext COLLATE utf8_bin,
  `time_zone` mediumtext COLLATE utf8_bin,
  `user_license` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `notify_alert_start` tinyint(1) DEFAULT NULL,
  `notify_alert_ack` tinyint(1) DEFAULT NULL,
  `notify_alert_end` tinyint(1) DEFAULT NULL,
  `notify_only_acked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `email_idx` (`email`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_attributes`
--

DROP TABLE IF EXISTS `user_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_attributes` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `attribute` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`user`,`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_contact`
--

DROP TABLE IF EXISTS `user_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contact` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_disable_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `date_format` text COLLATE utf8_bin,
  `email` text COLLATE utf8_bin,
  `email_notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email_verification_sent_ts` bigint(20) DEFAULT NULL,
  `email_verification_string` text COLLATE utf8_bin,
  `email_verified` tinyint(1) DEFAULT NULL,
  `name` text COLLATE utf8_bin,
  `notify_by_email` tinyint(1) DEFAULT NULL,
  `notify_by_pager` tinyint(1) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pager_notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pager_number` text COLLATE utf8_bin,
  `pager_verification_sent_ts` bigint(20) DEFAULT NULL,
  `pager_verification_string` text COLLATE utf8_bin,
  `pager_verified` tinyint(1) DEFAULT NULL,
  `receive_all_alerts` tinyint(1) DEFAULT NULL,
  `receive_promotions` tinyint(1) DEFAULT NULL,
  `time_format` text COLLATE utf8_bin,
  `time_zone` text COLLATE utf8_bin,
  `notify_alert_start` tinyint(1) DEFAULT NULL,
  `notify_alert_ack` tinyint(1) DEFAULT NULL,
  `notify_alert_end` tinyint(1) DEFAULT NULL,
  `notify_only_acked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`),
  KEY `email_idx` (`email`(25))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `alert_disable_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alert_time_period` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alerts_enabled` tinyint(1) DEFAULT NULL,
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `email_notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pager_notification_template` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `receive_all_alerts` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group_attributes`
--

DROP TABLE IF EXISTS `user_group_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_attributes` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `attribute` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `user_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`user_group`,`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group_users`
--

DROP TABLE IF EXISTS `user_group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_users` (
  `id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created` double DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_group` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`user`,`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_license`
--

DROP TABLE IF EXISTS `user_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_license` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `agreement_text` mediumtext COLLATE utf8_bin,
  `agreement_version` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `client_ipaddress` mediumtext COLLATE utf8_bin,
  `created` double DEFAULT NULL,
  `login_service` mediumtext COLLATE utf8_bin,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_email` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_session`
--

DROP TABLE IF EXISTS `user_login_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_session` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `access_time` double DEFAULT NULL,
  `client_ipaddress` mediumtext COLLATE utf8_bin,
  `idle_timeout` bigint(20) DEFAULT NULL,
  `organisation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_time` double DEFAULT NULL,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_idx` (`organisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `value_store`
--

DROP TABLE IF EXISTS `value_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `value_store` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `name` mediumtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `value_store_queue_node`
--

DROP TABLE IF EXISTS `value_store_queue_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `value_store_queue_node` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `hostname` mediumtext COLLATE utf8_bin,
  `password` mediumtext COLLATE utf8_bin,
  `port` int(11) DEFAULT NULL,
  `username` mediumtext COLLATE utf8_bin,
  `value_store` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `value_store_rpc_node`
--

DROP TABLE IF EXISTS `value_store_rpc_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `value_store_rpc_node` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` double DEFAULT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `frontrpc_port` int(11) DEFAULT NULL,
  `hostname` mediumtext COLLATE utf8_bin,
  `value_store` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-23 14:00:13
INSERT INTO `admin_rpc_administrator` VALUES ('bb3a285eda4211e5ad686c4008901394','vegaroute','monitorscout');
INSERT INTO `delegator` VALUES ('3d557297dae311e5871f6c4008901394',0,0,0,0,0,'bfcd8547dae211e59ca06c4008901394',10002,'desc',10001,0,'localhost',0,0,0,0,0,0,0,1,10003);
INSERT INTO `delegator_group` VALUES ('bfcd8547dae211e59ca06c4008901394',0,'Localhost group 1','','','',1,'','localhost-1',1,'e74ce8b3dae111e583e66c4008901394','81ba3e8cda3c11e5b52e6c4008901394','6d0e0914dae111e583886c4008901394');
INSERT INTO `delegator_helper` VALUES ('94e7d83adae311e59ffd6c4008901394',0,'bfcd8547dae211e59ca06c4008901394',17001,'localhost');
INSERT INTO `email_notification_template` VALUES ('1d3a6f5eda6911e5a49a000c299223af',1456258070.14598,'desc','Standard Email Template','1d254110da6911e5a49a000c299223af','Service $State notification for $Device, $ServiceName','Alert for $DeviceName - $DeviceDescription\nService: $ServiceName\nStatus: $Status\nTime: $Time\nPrevious state lasted: $PreviousStateElapsed\nCurrent state start time: $StateStarted\nCurrent state elapsed: $StateElapsed\n\n$DetailedMessage'),('3e3110d2da6911e59c33000c299223af',1456258125.44939,'desc','Standard Email Template','3e1a97dada6911e59c33000c299223af','Service $State notification for $Device, $ServiceName','Alert for $DeviceName - $DeviceDescription\nService: $ServiceName\nStatus: $Status\nTime: $Time\nPrevious state lasted: $PreviousStateElapsed\nCurrent state start time: $StateStarted\nCurrent state elapsed: $StateElapsed\n\n$DetailedMessage'),('4ca9d770da6911e59c33000c299223af',1456258149.72901,'desc','Standard Email Template','4c9749a2da6911e59c33000c299223af','Service $State notification for $Device, $ServiceName','Alert for $DeviceName - $DeviceDescription\nService: $ServiceName\nStatus: $Status\nTime: $Time\nPrevious state lasted: $PreviousStateElapsed\nCurrent state start time: $StateStarted\nCurrent state elapsed: $StateElapsed\n\n$DetailedMessage'),('4ffd9118da6f11e5ab38000c299223af',1456260732.29125,'desc','Standard Email Template','4fea98a6da6f11e5ab38000c299223af','Service $State notification for $Device, $ServiceName','Alert for $DeviceName - $DeviceDescription\nService: $ServiceName\nStatus: $Status\nTime: $Time\nPrevious state lasted: $PreviousStateElapsed\nCurrent state start time: $StateStarted\nCurrent state elapsed: $StateElapsed\n\n$DetailedMessage'),('7c2081a2da6911e590eb000c299223af',1456258229.35959,'desc','Standard Email Template','7c0c0376da6911e590eb000c299223af','Service $State notification for $Device, $ServiceName','Alert for $DeviceName - $DeviceDescription\nService: $ServiceName\nStatus: $Status\nTime: $Time\nPrevious state lasted: $PreviousStateElapsed\nCurrent state start time: $StateStarted\nCurrent state elapsed: $StateElapsed\n\n$DetailedMessage'),('9b1c04b8da6a11e5b475000c299223af',1456258710.83628,'desc','Standard Email Template','9b067e9ada6a11e5b475000c299223af','Service $State notification for $Device, $ServiceName','Alert for $DeviceName - $DeviceDescription\nService: $ServiceName\nStatus: $Status\nTime: $Time\nPrevious state lasted: $PreviousStateElapsed\nCurrent state start time: $StateStarted\nCurrent state elapsed: $StateElapsed\n\n$DetailedMessage'),('a8bf29c7dadb11e5ad696c4008901394',0,'desc','Standard Email Template','','Service $State notification for $Device, $ServiceName','Alert for $DeviceName - $DeviceDescription\nService: $ServiceName\nStatus: $Status\nTime: $Time\nPrevious state lasted: $PreviousStateElapsed\nCurrent state start time: $StateStarted\nCurrent state elapsed: $StateElapsed\n\n$DetailedMessage');
INSERT INTO `global_config` VALUES ('a98f2452da3911e59b0c000c299223af','ca0e3199da3c11e58bdb6c4008901394',1006,1456237689.73947,0,'localhost',1006,0);
INSERT INTO `location` VALUES ('20c07b59dadc11e5b8cf6c4008901394',0,'Localhost location','Localhost','',0,1);
INSERT INTO `message_queue` VALUES ('81ba3e8cda3c11e5b52e6c4008901394',0,'','delegator group message queue'),('c9c9d8d7da3c11e590f96c4008901394',0,'','dp bridge queue'),('ca0e3199da3c11e58bdb6c4008901394',0,'','alert sender message queue');
INSERT INTO `message_queue_node` VALUES ('6647de00da3e11e5833f6c4008901394',0,NULL,'localhost','81ba3e8cda3c11e5b52e6c4008901394','vegaroute',5672,'monitorscout'),('be82a17ada3e11e585666c4008901394',0,NULL,'localhost','c9c9d8d7da3c11e590f96c4008901394','vegaroute',5672,'monitorscout'),('c93f9445da3e11e59ea56c4008901394',0,NULL,'localhost','ca0e3199da3c11e58bdb6c4008901394','vegaroute',5672,'monitorscout');
INSERT INTO `monitor_type` VALUES ('00a70e108aaf11e0b0470015c5fbc82a',1306754505,'POP3 Server Monitor','Monitor a POP3 server.','','pop3 monitor','','pop3','(lp0\nS\'00c0567c8aaf11e0b0470015c5fbc82a\'\np1\naS\'00dab9fe8aaf11e0b0470015c5fbc82a\'\np2\naS\'00f69c328aaf11e0b0470015c5fbc82a\'\np3\naS\'011320dc8aaf11e0b0470015c5fbc82a\'\np4\naS\'013106108aaf11e0b0470015c5fbc82a\'\np5\naS\'014f67f48aaf11e0b0470015c5fbc82a\'\np6\naS\'016f8fe88aaf11e0b0470015c5fbc82a\'\np7\na.',1),('018c0e2a8aaf11e0b0470015c5fbc82a',1306754507,'Mail (SMTP) Server Monitor','Monitor a SMTP server.','','smtp monitor','','smtp','(lp0\nS\'01a62d3c8aaf11e0b0470015c5fbc82a\'\np1\naS\'01c08a248aaf11e0b0470015c5fbc82a\'\np2\naS\'01dc92648aaf11e0b0470015c5fbc82a\'\np3\naS\'01f8fb5c8aaf11e0b0470015c5fbc82a\'\np4\naS\'0216d4d88aaf11e0b0470015c5fbc82a\'\np5\naS\'0235c9ba8aaf11e0b0470015c5fbc82a\'\np6\naS\'0254f56a8aaf11e0b0470015c5fbc82a\'\np7\naS\'0274e67c8aaf11e0b0470015c5fbc82a\'\np8\na.',1),('0291de948aaf11e0b0470015c5fbc82a',1306754508,'Mail Delivery Monitor','Monitor a SMTP/POP3 server pair, verifying that a mail can be delivered and fetched from the POP3 server.','','mail monitor','','mail','(lp0\nS\'02ab42768aaf11e0b0470015c5fbc82a\'\np1\naS\'02c5b5168aaf11e0b0470015c5fbc82a\'\np2\naS\'02e12dbe8aaf11e0b0470015c5fbc82a\'\np3\naS\'02fd7db68aaf11e0b0470015c5fbc82a\'\np4\naS\'031ad62c8aaf11e0b0470015c5fbc82a\'\np5\naS\'0338ef548aaf11e0b0470015c5fbc82a\'\np6\naS\'035887748aaf11e0b0470015c5fbc82a\'\np7\naS\'037854968aaf11e0b0470015c5fbc82a\'\np8\na.',1),('039472b68aaf11e0b0470015c5fbc82a',1306754510,'UDP Port Monitor','Monitor a UDP port.','','udp monitor','','udp','(lp0\nS\'03ad96e28aaf11e0b0470015c5fbc82a\'\np1\naS\'03c7b6588aaf11e0b0470015c5fbc82a\'\np2\naS\'03e34ae48aaf11e0b0470015c5fbc82a\'\np3\na.',1),('03fd49308aaf11e0b0470015c5fbc82a',1306754511,'SSH Server Monitor','Monitor a ssh server.','','ssh monitor','','ssh','(lp0\nS\'041663de8aaf11e0b0470015c5fbc82a\'\np1\na.',1),('042f31668aaf11e0b0470015c5fbc82a',1306754511,'IRC Server Monitor','Monitor a irc server.','','irc monitor','','irc','(lp0\nS\'04484cc88aaf11e0b0470015c5fbc82a\'\np1\naS\'04629bfa8aaf11e0b0470015c5fbc82a\'\np2\na.',1),('047c48b68aaf11e0b0470015c5fbc82a',1306754512,'DNS Server Monitor','Monitor a dns server.','','dns server monitor','','dns','(lp0\nS\'049568828aaf11e0b0470015c5fbc82a\'\np1\naS\'04afb7aa8aaf11e0b0470015c5fbc82a\'\np2\naS\'04cb1bd08aaf11e0b0470015c5fbc82a\'\np3\naS\'04e73c988aaf11e0b0470015c5fbc82a\'\np4\na.',1),('0501ad308aaf11e0b0470015c5fbc82a',1306754512,'DNS Record Monitor','Monitor a dns record.','','dns record monitor','','dns','(lp0\nS\'051b100e8aaf11e0b0470015c5fbc82a\'\np1\naS\'05353e208aaf11e0b0470015c5fbc82a\'\np2\naS\'0550a67e8aaf11e0b0470015c5fbc82a\'\np3\naS\'056fed368aaf11e0b0470015c5fbc82a\'\np4\na.',1),('058a5a2c8aaf11e0b0470015c5fbc82a',1306754513,'FTP Monitor','Monitor a ftp server.','','ftp monitor','','ftp','(lp0\nS\'05a378b88aaf11e0b0470015c5fbc82a\'\np1\naS\'05bdcfb08aaf11e0b0470015c5fbc82a\'\np2\naS\'05d933ae8aaf11e0b0470015c5fbc82a\'\np3\naS\'05f5df188aaf11e0b0470015c5fbc82a\'\np4\na.',1),('061025448aaf11e0b0470015c5fbc82a',1306754514,'IMAP Monitor','Monitor a IMAP4 server.','','imap4 monitor','','imap4','(lp0\nS\'0629141e8aaf11e0b0470015c5fbc82a\'\np1\naS\'064343e88aaf11e0b0470015c5fbc82a\'\np2\naS\'065e8d2e8aaf11e0b0470015c5fbc82a\'\np3\naS\'067a848e8aaf11e0b0470015c5fbc82a\'\np4\na.',1),('0694af4e8aaf11e0b0470015c5fbc82a',1306754515,'MySQL Monitor','Monitor a MySQL server.','','mysql monitor','','mysql','(lp0\nS\'06ad95408aaf11e0b0470015c5fbc82a\'\np1\naS\'06c789148aaf11e0b0470015c5fbc82a\'\np2\naS\'06e2f7bc8aaf11e0b0470015c5fbc82a\'\np3\naS\'06feefe48aaf11e0b0470015c5fbc82a\'\np4\na.',1),('07191ca28aaf11e0b0470015c5fbc82a',1306754516,'PostgreSQL Monitor','Monitor a PostgreSQL server.','','pgsql monitor','','pgsql','(lp0\nS\'07320ab48aaf11e0b0470015c5fbc82a\'\np1\naS\'fa2fec918c3811e0b3c37c6d62900347\'\np2\naS\'074dc1d28aaf11e0b0470015c5fbc82a\'\np3\naS\'076929a48aaf11e0b0470015c5fbc82a\'\np4\na.',1),('0783a73e8aaf11e0b0470015c5fbc82a',1306754517,'Microsoft SQL Server Monitor','Monitor a Microsoft SQL server.','','mssql monitor','','mssql','(lp0\nS\'079ca1b28aaf11e0b0470015c5fbc82a\'\np1\naS\'07b69ef08aaf11e0b0470015c5fbc82a\'\np2\naS\'07d285488aaf11e0b0470015c5fbc82a\'\np3\naS\'5a4e186860d211e3aea77c6d62900347\'\np4\na.',1),('07ec3fc48aaf11e0b0470015c5fbc82a',1306754517,'VNC Server Monitor','Monitor a VNC server.','','vnc monitor','','vnc','(lp0\nS\'080523548aaf11e0b0470015c5fbc82a\'\np1\na.',1),('081de3308aaf11e0b0470015c5fbc82a',1306754518,'RDP Server Monitor','Monitor a RDP server.','','rdp monitor','','x224','(lp0\nS\'9b0ea6e88b9811e0b5357c6d62900347\'\np1\na.',1),('7fa1d119631911e38a4c7c6d62900347',1386844691,'HTTP (web) monitor','Monitor a website using http.','','http monitor','','http-2','(lp0\nS\'c23b204a631b11e3a46f7c6d62900347\'\np1\naS\'023be347631c11e39bda7c6d62900347\'\np2\na.',0),('cc5cab4e1ef611e4bf08001d0970370f',1407500606.73748,'HTTP (web) monitor','Monitor a website using http.','','http monitor','','http-ms','(lp1\nS\'8a08d51e1ef711e4bf08001d0970370f\'\np2\naS\'a64597801ef711e4bf08001d0970370f\'\np3\naS\'fc73af201ef711e4bf08001d0970370f\'\np4\naS\'5ca03f761ef811e4bf08001d0970370f\'\np5\na.',1),('f1cc19aa959c11e0b0b80015c5fbc688',1307956212,'Drupal monitor','Drupal monitor.','','drupal monitor','','http','(lp0\nS\'f1f0a6da959c11e0b0b80015c5fbc688\'\np1\naS\'f21b7194959c11e0b0b80015c5fbc688\'\np2\naS\'f244f122959c11e0b0b80015c5fbc688\'\np3\naS\'f26c3840959c11e0b0b80015c5fbc688\'\np4\naS\'f2963352959c11e0b0b80015c5fbc688\'\np5\naS\'f2c3d212959c11e0b0b80015c5fbc688\'\np6\naS\'f2f16fec959c11e0b0b80015c5fbc688\'\np7\na.',1),('f318583c959c11e0b0b80015c5fbc688',1307956214,'WordPress monitor','WordPress monitor.','','wordpress monitor','','http','(lp0\nS\'f33f98de959c11e0b0b80015c5fbc688\'\np1\naS\'f3665988959c11e0b0b80015c5fbc688\'\np2\naS\'f3925a88959c11e0b0b80015c5fbc688\'\np3\naS\'f3bddcda959c11e0b0b80015c5fbc688\'\np4\naS\'f3eb1f10959c11e0b0b80015c5fbc688\'\np5\naS\'f417bcdc959c11e0b0b80015c5fbc688\'\np6\naS\'f443d59c959c11e0b0b80015c5fbc688\'\np7\na.',1),('f46f092e959c11e0b0b80015c5fbc688',1307956216,'Media Wiki monitor','Media Wiki monitor.','','mediawiki monitor','','http','(lp0\nS\'f4962e82959c11e0b0b80015c5fbc688\'\np1\naS\'f4c18c26959c11e0b0b80015c5fbc688\'\np2\naS\'f4e97af6959c11e0b0b80015c5fbc688\'\np3\naS\'f510c26e959c11e0b0b80015c5fbc688\'\np4\naS\'f5464074959c11e0b0b80015c5fbc688\'\np5\naS\'f577a60a959c11e0b0b80015c5fbc688\'\np6\naS\'f5a1aa68959c11e0b0b80015c5fbc688\'\np7\na.',1),('f5c9d484959c11e0b0b80015c5fbc688',1307956219,'Sharepoint monitor','Sharepoint monitor.','','sharepoint monitor','','http','(lp0\nS\'f5ee6e66959c11e0b0b80015c5fbc688\'\np1\naS\'f6194e1a959c11e0b0b80015c5fbc688\'\np2\naS\'f63fdd3c959c11e0b0b80015c5fbc688\'\np3\naS\'f669f5d6959c11e0b0b80015c5fbc688\'\np4\naS\'f694e3c2959c11e0b0b80015c5fbc688\'\np5\naS\'f6bed68c959c11e0b0b80015c5fbc688\'\np6\naS\'f6f48ad4959c11e0b0b80015c5fbc688\'\np7\na.',1),('f7211b80959c11e0b0b80015c5fbc688',1307956221,'Ensim monitor','Ensim monitor.','','ensim monitor','','http','(lp0\nS\'f7467b46959c11e0b0b80015c5fbc688\'\np1\naS\'f76a5354959c11e0b0b80015c5fbc688\'\np2\naS\'f794ed58959c11e0b0b80015c5fbc688\'\np3\naS\'f7c13750959c11e0b0b80015c5fbc688\'\np4\naS\'f7ea5644959c11e0b0b80015c5fbc688\'\np5\naS\'f812afea959c11e0b0b80015c5fbc688\'\np6\naS\'f83c95a8959c11e0b0b80015c5fbc688\'\np7\na.',1),('f8660064959c11e0b0b80015c5fbc688',1307956223,'Webmin monitor','Webmin monitor.','','webmin monitor','','http','(lp0\nS\'f88fcf5c959c11e0b0b80015c5fbc688\'\np1\naS\'f8b61de2959c11e0b0b80015c5fbc688\'\np2\naS\'f8df20b6959c11e0b0b80015c5fbc688\'\np3\naS\'f9063002959c11e0b0b80015c5fbc688\'\np4\naS\'f93779fa959c11e0b0b80015c5fbc688\'\np5\naS\'f964cd06959c11e0b0b80015c5fbc688\'\np6\naS\'f98fb340959c11e0b0b80015c5fbc688\'\np7\na.',1),('f9bb78fe959c11e0b0b80015c5fbc688',1307956225,'cPanel monitor','cPanel monitor.','','cpanel monitor','','cpanel','(lp0\nS\'f9e42eca959c11e0b0b80015c5fbc688\'\np1\naS\'fa0aed3a959c11e0b0b80015c5fbc688\'\np2\naS\'fa3520e6959c11e0b0b80015c5fbc688\'\np3\naS\'fa5f98e4959c11e0b0b80015c5fbc688\'\np4\naS\'fa8a6524959c11e0b0b80015c5fbc688\'\np5\naS\'fab65512959c11e0b0b80015c5fbc688\'\np6\naS\'fae38ed8959c11e0b0b80015c5fbc688\'\np7\na.',1),('fb0c3112959c11e0b0b80015c5fbc688',1307956228,'Plesk monitor','Plesk monitor.','','plesk monitor','','http','(lp0\nS\'fb337b0a959c11e0b0b80015c5fbc688\'\np1\naS\'fb596c0c959c11e0b0b80015c5fbc688\'\np2\naS\'fb7eb282959c11e0b0b80015c5fbc688\'\np3\naS\'fba45046959c11e0b0b80015c5fbc688\'\np4\naS\'fbcb7856959c11e0b0b80015c5fbc688\'\np5\naS\'fbf3004c959c11e0b0b80015c5fbc688\'\np6\naS\'fc1e0df0959c11e0b0b80015c5fbc688\'\np7\na.',1),('fc42f1b0959c11e0b0b80015c5fbc688',1307956230,'Magento monitor','Magento monitor.','','magento monitor','','http','(lp0\nS\'fc6a1574959c11e0b0b80015c5fbc688\'\np1\naS\'fc8d2f64959c11e0b0b80015c5fbc688\'\np2\naS\'fcb453e6959c11e0b0b80015c5fbc688\'\np3\naS\'fce13aaa959c11e0b0b80015c5fbc688\'\np4\naS\'fd0a0494959c11e0b0b80015c5fbc688\'\np5\naS\'fd320be2959c11e0b0b80015c5fbc688\'\np6\naS\'fd5ac898959c11e0b0b80015c5fbc688\'\np7\na.',1),('fd84c684959c11e0b0b80015c5fbc688',1307956232,'Movable Type monitor','Movable Type monitor.','','movabletype monitor','','http','(lp0\nS\'fdb060f0959c11e0b0b80015c5fbc688\'\np1\naS\'fdd9cbfc959c11e0b0b80015c5fbc688\'\np2\naS\'fe059692959c11e0b0b80015c5fbc688\'\np3\naS\'fe2e7e2c959c11e0b0b80015c5fbc688\'\np4\naS\'fe57ce76959c11e0b0b80015c5fbc688\'\np5\naS\'fe87b2e4959c11e0b0b80015c5fbc688\'\np6\naS\'feb311fa959c11e0b0b80015c5fbc688\'\np7\na.',1),('ff2372408aae11e0b0470015c5fbc82a',1306754503,'Ping Monitor','Monitor a host with ICMP echo request packets.','','ping monitor','','ping','(lp0\n.',1),('ff3c0e408aae11e0b0470015c5fbc82a',1306754503,'TCP Port Monitor','Monitor a TCP port.','The TCP port monitor can be used to monitor a single tcp port.\nIn its default mode it will simply check if the TCP port is open and immediately disconnect. ','tcp monitor','','tcp','(lp0\nS\'ff556bec8aae11e0b0470015c5fbc82a\'\np1\naS\'ff7009348aae11e0b0470015c5fbc82a\'\np2\naS\'ff8bc0708aae11e0b0470015c5fbc82a\'\np3\naS\'ffa84c408aae11e0b0470015c5fbc82a\'\np4\na.',1),('ffc357ba8aae11e0b0470015c5fbc82a',1306754504,'HTTP monitor','HTTP monitor.','','http monitor','','http','(lp0\nS\'ffdca9ea8aae11e0b0470015c5fbc82a\'\np1\naS\'fff7135c8aae11e0b0470015c5fbc82a\'\np2\naS\'0012e0aa8aaf11e0b0470015c5fbc82a\'\np3\naS\'002f7eb88aaf11e0b0470015c5fbc82a\'\np4\naS\'004d62ca8aaf11e0b0470015c5fbc82a\'\np5\naS\'006be9028aaf11e0b0470015c5fbc82a\'\np6\naS\'008b15c08aaf11e0b0470015c5fbc82a\'\np7\na.',0);
INSERT INTO `monitor_type_argument` VALUES ('0012e0aa8aaf11e0b0470015c5fbc82a','string',1306754504,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'ffc357ba8aae11e0b0470015c5fbc82a','host','',3,0,'hidden'),('002f7eb88aaf11e0b0470015c5fbc82a','string',1306754504,'V\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'ffc357ba8aae11e0b0470015c5fbc82a','match string','',4,0,'hidden'),('004d62ca8aaf11e0b0470015c5fbc82a','string',1306754505,'V\np0\n.','Valid status codes (comma separated list)','A comma separated list of valid http status codes.',500,-1,0,-1,'ffc357ba8aae11e0b0470015c5fbc82a','valid status codes','',5,0,'hidden'),('006be9028aaf11e0b0470015c5fbc82a','string',1306754505,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'ffc357ba8aae11e0b0470015c5fbc82a','invalid status codes','',6,0,'never'),('008b15c08aaf11e0b0470015c5fbc82a','bool',1306754505,'I00\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'ffc357ba8aae11e0b0470015c5fbc82a','use ssl','',7,0,'hidden'),('00c0567c8aaf11e0b0470015c5fbc82a','num',1306754505,'I110\n.','POP3 port','POP3 port to monitor.',-1,65535,-1,0,'00a70e108aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('00dab9fe8aaf11e0b0470015c5fbc82a','bool',1306754505,'I00\n.','Use SSL (not TLS)','Use SSL (not TLS).',-1,-1,-1,-1,'00a70e108aaf11e0b0470015c5fbc82a','use ssl','',2,0,'hidden'),('00f69c328aaf11e0b0470015c5fbc82a','string',1306754506,'V\np0\n.','POP3 username','POP3 username, if a username and password are given a login will be done on the POP3 server.',500,-1,0,-1,'00a70e108aaf11e0b0470015c5fbc82a','username','',3,0,'hidden'),('011320dc8aaf11e0b0470015c5fbc82a','string',1306754506,'V\np0\n.','POP3 password','POP3 password, if a username and password are given a login will be done on the POP3 server.',500,-1,0,-1,'00a70e108aaf11e0b0470015c5fbc82a','password','',4,0,'hidden'),('013106108aaf11e0b0470015c5fbc82a','string',1306754506,'V\np0\n.','Find message (regexp)','Check for a message matching this regexp (optional).',500,-1,0,-1,'00a70e108aaf11e0b0470015c5fbc82a','fetch matching message','',5,0,'hidden'),('014f67f48aaf11e0b0470015c5fbc82a','bool',1306754506,'I00\n.','Remove message found with the find message regexp.','Remove the matched message.',-1,-1,-1,-1,'00a70e108aaf11e0b0470015c5fbc82a','remove matching message','',6,0,'hidden'),('016f8fe88aaf11e0b0470015c5fbc82a','bool',1306754506,'I00\n.','Clear mailbox','Remove all messages from the mailbox.',-1,-1,-1,-1,'00a70e108aaf11e0b0470015c5fbc82a','clear mailbox','',7,0,'hidden'),('01a62d3c8aaf11e0b0470015c5fbc82a','num',1306754507,'I25\n.','SMTP port','SMTP port to monitor.',-1,65535,-1,0,'018c0e2a8aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('01c08a248aaf11e0b0470015c5fbc82a','string',1306754507,'V\np0\n.','Sender email-address','Sender email-address, if sender/recipient addresses are set a real mail will be submitted.',500,-1,0,-1,'018c0e2a8aaf11e0b0470015c5fbc82a','sender address','',2,0,'hidden'),('01dc92648aaf11e0b0470015c5fbc82a','string',1306754507,'V\np0\n.','Recipient email-address','Recipient email-address (optional).',500,-1,0,-1,'018c0e2a8aaf11e0b0470015c5fbc82a','recipient address','',3,0,'hidden'),('01f8fb5c8aaf11e0b0470015c5fbc82a','bool',1306754507,'I00\n.','Use SSL','Use SSL.',-1,-1,-1,-1,'018c0e2a8aaf11e0b0470015c5fbc82a','use ssl','',4,0,'hidden'),('0216d4d88aaf11e0b0470015c5fbc82a','bool',1306754508,'I00\n.','Use TLS','Use TLS.',-1,-1,-1,-1,'018c0e2a8aaf11e0b0470015c5fbc82a','use tls','',5,0,'hidden'),('0235c9ba8aaf11e0b0470015c5fbc82a','bool',1306754508,'I00\n.','Use SMTP-authentication','Use SMTP-authentication.',-1,-1,-1,-1,'018c0e2a8aaf11e0b0470015c5fbc82a','use smtp-authentication','',6,0,'hidden'),('023be347631c11e39bda7c6d62900347','string',1386845769,'V\np0\n.','Match string','Search the returned html for the given string, alert if it does not exist.',1000,-1,0,-1,'7fa1d119631911e38a4c7c6d62900347','match string','',2,0,'hidden'),('0254f56a8aaf11e0b0470015c5fbc82a','string',1306754508,'V\np0\n.','SMTP-auth username','SMTP-auth username (optional).',500,-1,0,-1,'018c0e2a8aaf11e0b0470015c5fbc82a','username','',7,0,'hidden'),('0274e67c8aaf11e0b0470015c5fbc82a','string',1306754508,'V\np0\n.','SMTP-auth password','SMTP-auth password (optional).',500,-1,0,-1,'018c0e2a8aaf11e0b0470015c5fbc82a','password','',8,0,'hidden'),('02ab42768aaf11e0b0470015c5fbc82a','num',1306754508,'I25\n.','SMTP port','SMTP port to monitor.',-1,65535,-1,0,'0291de948aaf11e0b0470015c5fbc82a','smtp port','',1,0,'hidden'),('02c5b5168aaf11e0b0470015c5fbc82a','string',1306754509,'V\np0\n.','POP3 server hostname','POP3 server to monitor (leave blank to use monitor device hostname).',500,-1,0,-1,'0291de948aaf11e0b0470015c5fbc82a','pop3 server','',2,0,'hidden'),('02e12dbe8aaf11e0b0470015c5fbc82a','num',1306754509,'I110\n.','POP3 port','POP3 port to monitor.',-1,65535,-1,0,'0291de948aaf11e0b0470015c5fbc82a','pop3 port','',3,0,'hidden'),('02fd7db68aaf11e0b0470015c5fbc82a','string',1306754509,'V\np0\n.','Recipient email-address','Recipient email-address.',500,-1,0,-1,'0291de948aaf11e0b0470015c5fbc82a','recipient address','',4,1,'hidden'),('031ad62c8aaf11e0b0470015c5fbc82a','string',1306754509,'V\np0\n.','POP3 username','POP3 username.',500,-1,0,-1,'0291de948aaf11e0b0470015c5fbc82a','pop3 username','',5,1,'hidden'),('0338ef548aaf11e0b0470015c5fbc82a','string',1306754509,'V\np0\n.','POP3 password','POP3 password.',500,-1,0,-1,'0291de948aaf11e0b0470015c5fbc82a','pop3 password','',6,1,'hidden'),('035887748aaf11e0b0470015c5fbc82a','bool',1306754510,'I01\n.','Remove test message','Remove the matched test message from the pop3 server.',-1,-1,-1,-1,'0291de948aaf11e0b0470015c5fbc82a','remove matching message','',7,0,'hidden'),('037854968aaf11e0b0470015c5fbc82a','bool',1306754510,'I00\n.','Clear mailbox','Clear all mail from the mailbox.',-1,-1,-1,-1,'0291de948aaf11e0b0470015c5fbc82a','clear mailbox','',8,0,'hidden'),('03ad96e28aaf11e0b0470015c5fbc82a','num',1306754510,'I0\n.','UDP port','UDP port to monitor.',-1,65535,-1,0,'039472b68aaf11e0b0470015c5fbc82a','port','',1,1,'always'),('03c7b6588aaf11e0b0470015c5fbc82a','string',1306754510,'V\np0\n.','Send string','String to send after connection.',500,-1,0,-1,'039472b68aaf11e0b0470015c5fbc82a','send string','',2,0,'hidden'),('03e34ae48aaf11e0b0470015c5fbc82a','string',1306754511,'V\np0\n.','Connection string','String expected after connection.',500,-1,0,-1,'039472b68aaf11e0b0470015c5fbc82a','receive string','',3,0,'hidden'),('041663de8aaf11e0b0470015c5fbc82a','num',1306754511,'I22\n.','SSH listen port','TCP port the server listens to.',-1,65535,-1,0,'03fd49308aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('04484cc88aaf11e0b0470015c5fbc82a','num',1306754511,'I6667\n.','IRC port','TCP port the server listens to.',-1,65535,-1,0,'042f31668aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('04629bfa8aaf11e0b0470015c5fbc82a','num',1306754511,'I100\n.','Max simultaneous users','Max number of simultaneous users.',-1,65535,-1,0,'042f31668aaf11e0b0470015c5fbc82a','max users','',2,0,'hidden'),('049568828aaf11e0b0470015c5fbc82a','string',1306754512,'Vwww.monitorscout.com\np0\n.','DNS query string','DNS record to query.',100,-1,0,-1,'047c48b68aaf11e0b0470015c5fbc82a','query string','',1,0,'hidden'),('04afb7aa8aaf11e0b0470015c5fbc82a','bool',1306754512,'I00\n.','Require authoritive response','Require the response to be authoritive.',-1,-1,-1,-1,'047c48b68aaf11e0b0470015c5fbc82a','require authority','',2,0,'hidden'),('04cb1bd08aaf11e0b0470015c5fbc82a','string',1306754512,'V\np0\n.','Required response','A list of ip-addresses that must be in the dns response.',500,-1,0,-1,'047c48b68aaf11e0b0470015c5fbc82a','required response','',3,0,'hidden'),('04e73c988aaf11e0b0470015c5fbc82a','bool',1306754512,'I00\n.','Local query','Perform query locally, instead of using the device as a DNS server.',-1,-1,-1,-1,'047c48b68aaf11e0b0470015c5fbc82a','local query','',4,0,'never'),('051b100e8aaf11e0b0470015c5fbc82a','string',1306754513,'V\np0\n.','DNS query string','DNS record to query.',100,-1,0,-1,'0501ad308aaf11e0b0470015c5fbc82a','query string','',1,1,'always'),('05353e208aaf11e0b0470015c5fbc82a','bool',1306754513,'I00\n.','Require authoritive response','Require the response to be authoritive.',-1,-1,-1,-1,'0501ad308aaf11e0b0470015c5fbc82a','require authority','',2,0,'never'),('0550a67e8aaf11e0b0470015c5fbc82a','string',1306754513,'V\np0\n.','Required response','A list of ip-addresses that must be in the dns response.',500,-1,0,-1,'0501ad308aaf11e0b0470015c5fbc82a','required response','',3,0,'hidden'),('056fed368aaf11e0b0470015c5fbc82a','bool',1306754513,'I00\n.','Local query','Perform query locally, instead of using the device as a DNS server.',-1,-1,-1,-1,'0501ad308aaf11e0b0470015c5fbc82a','local query','',4,0,'hidden'),('05a378b88aaf11e0b0470015c5fbc82a','num',1306754513,'I21\n.','FTP listen port','TCP port the server listens to.',-1,65535,-1,0,'058a5a2c8aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('05bdcfb08aaf11e0b0470015c5fbc82a','bool',1306754514,'I00\n.','Use SSL','Use SSL.',-1,-1,-1,-1,'058a5a2c8aaf11e0b0470015c5fbc82a','use ssl','',2,0,'hidden'),('05d933ae8aaf11e0b0470015c5fbc82a','string',1306754514,'V\np0\n.','FTP username','FTP username.',500,-1,0,-1,'058a5a2c8aaf11e0b0470015c5fbc82a','username','',3,1,'hidden'),('05f5df188aaf11e0b0470015c5fbc82a','string',1306754514,'V\np0\n.','FTP password','FTP password.',500,-1,0,-1,'058a5a2c8aaf11e0b0470015c5fbc82a','password','',4,1,'hidden'),('0629141e8aaf11e0b0470015c5fbc82a','num',1306754514,'I143\n.','IMAP listen port','TCP port the server listens to.',-1,65535,-1,0,'061025448aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('064343e88aaf11e0b0470015c5fbc82a','bool',1306754515,'I00\n.','Use SSL','Use SSL.',-1,-1,-1,-1,'061025448aaf11e0b0470015c5fbc82a','use ssl','',2,0,'hidden'),('065e8d2e8aaf11e0b0470015c5fbc82a','string',1306754515,'V\np0\n.','IMAP username','IMAP username.',500,-1,0,-1,'061025448aaf11e0b0470015c5fbc82a','username','',3,1,'hidden'),('067a848e8aaf11e0b0470015c5fbc82a','string',1306754515,'V\np0\n.','IMAP password','IMAP password.',500,-1,0,-1,'061025448aaf11e0b0470015c5fbc82a','password','',4,1,'hidden'),('06ad95408aaf11e0b0470015c5fbc82a','num',1306754515,'I3306\n.','MySQL listen port','TCP port the server listens to.',-1,65535,-1,0,'0694af4e8aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('06c789148aaf11e0b0470015c5fbc82a','string',1306754515,'V\np0\n.','MySQL username','MySQL username.',500,-1,0,-1,'0694af4e8aaf11e0b0470015c5fbc82a','username','',2,1,'hidden'),('06e2f7bc8aaf11e0b0470015c5fbc82a','string',1306754516,'V\np0\n.','MySQL password','MySQL password.',500,-1,0,-1,'0694af4e8aaf11e0b0470015c5fbc82a','password','',3,1,'hidden'),('06feefe48aaf11e0b0470015c5fbc82a','string',1306754516,'V\np0\n.','Database name','Database name.',500,-1,0,-1,'0694af4e8aaf11e0b0470015c5fbc82a','dbname','',4,1,'always'),('07320ab48aaf11e0b0470015c5fbc82a','num',1306754516,'I5432\n.','PostgreSQL listen port','TCP port the server listens to.',-1,65535,-1,0,'07191ca28aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('074dc1d28aaf11e0b0470015c5fbc82a','string',1306754516,'V\np0\n.','PostgreSQL password','PostgreSQL password.',500,-1,0,-1,'07191ca28aaf11e0b0470015c5fbc82a','password','',3,1,'hidden'),('076929a48aaf11e0b0470015c5fbc82a','string',1306754516,'V\np0\n.','Database name','Database name.',500,-1,0,-1,'07191ca28aaf11e0b0470015c5fbc82a','dbname','',4,1,'always'),('079ca1b28aaf11e0b0470015c5fbc82a','num',1306754517,'I1433\n.','Microsoft SQL server listen port','TCP port the server listens to.',-1,65535,-1,0,'0783a73e8aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('07b69ef08aaf11e0b0470015c5fbc82a','string',1306754517,'V\np0\n.','Microsoft SQL server username','Microsoft SQL server username.',500,-1,0,-1,'0783a73e8aaf11e0b0470015c5fbc82a','username','',2,1,'always'),('07d285488aaf11e0b0470015c5fbc82a','string',1306754517,'V\np0\n.','Microsoft SQL server password','Microsoft SQL server password.',500,-1,0,-1,'0783a73e8aaf11e0b0470015c5fbc82a','password','',3,1,'always'),('080523548aaf11e0b0470015c5fbc82a','num',1306754517,'I5900\n.','VNC server listen port','TCP port the server listens to.',-1,65535,-1,0,'07ec3fc48aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('5a4e186860d211e3aea77c6d62900347','string',1386594232,'V\np0\n.','Microsoft SQL server database name','An optional database name to check, the table monitor_scout_test will be created',100,-1,0,-1,'0783a73e8aaf11e0b0470015c5fbc82a','database name','',4,0,'always'),('5ca03f761ef811e4bf08001d0970370f','num',1407501278.26934,'I7\n.','Check SSL certificate expiration date','Set the permitted minimum number of days before the server SSL certificate expires.',-1,-1,-1,0,'cc5cab4e1ef611e4bf08001d0970370f','SSL expiration check','',4,0,'hidden'),('8a08d51e1ef711e4bf08001d0970370f','string',1407500924.95548,'V\n.','Complete url to monitor','Complete url to monitor, defaults to: http://<device-name>/',1000,-1,0,-1,'cc5cab4e1ef611e4bf08001d0970370f','url','',1,0,'always'),('9b0ea6e88b9811e0b5357c6d62900347','num',1306854837,'I3389\n.','RDP server listen port','TCP port the server listens to.',-1,65535,-1,0,'081de3308aaf11e0b0470015c5fbc82a','port','',1,0,'hidden'),('a64597801ef711e4bf08001d0970370f','string',1407500972.32986,'V\n.','Match string','Search the returned html for the given string, alert if it does not exist.',1000,-1,0,-1,'cc5cab4e1ef611e4bf08001d0970370f','match string','',2,0,'hidden'),('c23b204a631b11e3a46f7c6d62900347','string',1386845662,'V\np0\n.','Complete url to monitor','Complete url to monitor, defaults to: http://<device-name>/',1000,-1,0,-1,'7fa1d119631911e38a4c7c6d62900347','url','',1,0,'always'),('f1f0a6da959c11e0b0b80015c5fbc688','num',1307956212,'I80\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'f1cc19aa959c11e0b0b80015c5fbc688','port','',1,0,'hidden'),('f21b7194959c11e0b0b80015c5fbc688','string',1307956213,'V/admin\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'f1cc19aa959c11e0b0b80015c5fbc688','url','',2,0,'hidden'),('f244f122959c11e0b0b80015c5fbc688','string',1307956213,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'f1cc19aa959c11e0b0b80015c5fbc688','host','',3,0,'never'),('f26c3840959c11e0b0b80015c5fbc688','string',1307956213,'VUsername\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'f1cc19aa959c11e0b0b80015c5fbc688','match string','',4,0,'never'),('f2963352959c11e0b0b80015c5fbc688','string',1307956213,'V\np0\n.','Valid status codes (regexp)','Regular expression that matches HTTP status codes that are considered valid.',500,-1,0,-1,'f1cc19aa959c11e0b0b80015c5fbc688','valid status codes','',5,0,'never'),('f2c3d212959c11e0b0b80015c5fbc688','string',1307956214,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'f1cc19aa959c11e0b0b80015c5fbc688','invalid status codes','',6,0,'never'),('f2f16fec959c11e0b0b80015c5fbc688','bool',1307956214,'I00\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'f1cc19aa959c11e0b0b80015c5fbc688','use ssl','',7,0,'hidden'),('f33f98de959c11e0b0b80015c5fbc688','num',1307956214,'I80\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'f318583c959c11e0b0b80015c5fbc688','port','',1,0,'hidden'),('f3665988959c11e0b0b80015c5fbc688','string',1307956215,'V/wp-login.php\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'f318583c959c11e0b0b80015c5fbc688','url','',2,0,'hidden'),('f3925a88959c11e0b0b80015c5fbc688','string',1307956215,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'f318583c959c11e0b0b80015c5fbc688','host','',3,0,'hidden'),('f3bddcda959c11e0b0b80015c5fbc688','string',1307956215,'VUsername\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'f318583c959c11e0b0b80015c5fbc688','match string','',4,0,'never'),('f3eb1f10959c11e0b0b80015c5fbc688','string',1307956216,'V\np0\n.','Valid status codes (regexp)','Regular expression that matches HTTP status codes that are considered valid.',500,-1,0,-1,'f318583c959c11e0b0b80015c5fbc688','valid status codes','',5,0,'never'),('f417bcdc959c11e0b0b80015c5fbc688','string',1307956216,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'f318583c959c11e0b0b80015c5fbc688','invalid status codes','',6,0,'never'),('f443d59c959c11e0b0b80015c5fbc688','bool',1307956216,'I00\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'f318583c959c11e0b0b80015c5fbc688','use ssl','',7,0,'hidden'),('f4962e82959c11e0b0b80015c5fbc688','num',1307956217,'I80\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'f46f092e959c11e0b0b80015c5fbc688','port','',1,0,'hidden'),('f4c18c26959c11e0b0b80015c5fbc688','string',1307956217,'V/index.php?title=Special:UserLogin&returnto=Main_Page\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'f46f092e959c11e0b0b80015c5fbc688','url','',2,0,'hidden'),('f4e97af6959c11e0b0b80015c5fbc688','string',1307956217,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'f46f092e959c11e0b0b80015c5fbc688','host','',3,0,'hidden'),('f510c26e959c11e0b0b80015c5fbc688','string',1307956218,'VUsername\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'f46f092e959c11e0b0b80015c5fbc688','match string','',4,0,'never'),('f5464074959c11e0b0b80015c5fbc688','string',1307956218,'V\np0\n.','Valid status codes (regexp)','Regular expression that matches HTTP status codes that are considered valid.',500,-1,0,-1,'f46f092e959c11e0b0b80015c5fbc688','valid status codes','',5,0,'never'),('f577a60a959c11e0b0b80015c5fbc688','string',1307956218,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'f46f092e959c11e0b0b80015c5fbc688','invalid status codes','',6,0,'never'),('f5a1aa68959c11e0b0b80015c5fbc688','bool',1307956218,'I00\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'f46f092e959c11e0b0b80015c5fbc688','use ssl','',7,0,'hidden'),('f5ee6e66959c11e0b0b80015c5fbc688','num',1307956219,'I888\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'f5c9d484959c11e0b0b80015c5fbc688','port','',1,0,'hidden'),('f6194e1a959c11e0b0b80015c5fbc688','string',1307956219,'V/\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'f5c9d484959c11e0b0b80015c5fbc688','url','',2,0,'hidden'),('f63fdd3c959c11e0b0b80015c5fbc688','string',1307956219,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'f5c9d484959c11e0b0b80015c5fbc688','host','',3,0,'hidden'),('f669f5d6959c11e0b0b80015c5fbc688','string',1307956220,'Vusername\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'f5c9d484959c11e0b0b80015c5fbc688','match string','',4,0,'never'),('f694e3c2959c11e0b0b80015c5fbc688','string',1307956220,'V\np0\n.','Valid status codes (regexp)','Regular expression that matches HTTP status codes that are considered valid.',500,-1,0,-1,'f5c9d484959c11e0b0b80015c5fbc688','valid status codes','',5,0,'never'),('f6bed68c959c11e0b0b80015c5fbc688','string',1307956220,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'f5c9d484959c11e0b0b80015c5fbc688','invalid status codes','',6,0,'never'),('f6f48ad4959c11e0b0b80015c5fbc688','bool',1307956221,'I00\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'f5c9d484959c11e0b0b80015c5fbc688','use ssl','',7,0,'hidden'),('f7467b46959c11e0b0b80015c5fbc688','num',1307956221,'I443\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'f7211b80959c11e0b0b80015c5fbc688','port','',1,0,'hidden'),('f76a5354959c11e0b0b80015c5fbc688','string',1307956221,'V/admin\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'f7211b80959c11e0b0b80015c5fbc688','url','',2,0,'hidden'),('f794ed58959c11e0b0b80015c5fbc688','string',1307956222,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'f7211b80959c11e0b0b80015c5fbc688','host','',3,0,'hidden'),('f7c13750959c11e0b0b80015c5fbc688','string',1307956222,'Vusername\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'f7211b80959c11e0b0b80015c5fbc688','match string','',4,0,'never'),('f7ea5644959c11e0b0b80015c5fbc688','string',1307956222,'V\np0\n.','Valid status codes (regexp)','Regular expression that matches HTTP status codes that are considered valid.',500,-1,0,-1,'f7211b80959c11e0b0b80015c5fbc688','valid status codes','',5,0,'never'),('f812afea959c11e0b0b80015c5fbc688','string',1307956223,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'f7211b80959c11e0b0b80015c5fbc688','invalid status codes','',6,0,'never'),('f83c95a8959c11e0b0b80015c5fbc688','bool',1307956223,'I01\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'f7211b80959c11e0b0b80015c5fbc688','use ssl','',7,0,'hidden'),('f88fcf5c959c11e0b0b80015c5fbc688','num',1307956223,'I10000\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'f8660064959c11e0b0b80015c5fbc688','port','',1,0,'hidden'),('f8b61de2959c11e0b0b80015c5fbc688','string',1307956224,'V/\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'f8660064959c11e0b0b80015c5fbc688','url','',2,0,'hidden'),('f8df20b6959c11e0b0b80015c5fbc688','string',1307956224,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'f8660064959c11e0b0b80015c5fbc688','host','',3,0,'hidden'),('f9063002959c11e0b0b80015c5fbc688','string',1307956224,'VUsername\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'f8660064959c11e0b0b80015c5fbc688','match string','',4,0,'never'),('f93779fa959c11e0b0b80015c5fbc688','string',1307956224,'V\np0\n.','Valid status codes (regexp)','Regular expression that matches HTTP status codes that are considered valid.',500,-1,0,-1,'f8660064959c11e0b0b80015c5fbc688','valid status codes','',5,0,'never'),('f964cd06959c11e0b0b80015c5fbc688','string',1307956225,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'f8660064959c11e0b0b80015c5fbc688','invalid status codes','',6,0,'never'),('f98fb340959c11e0b0b80015c5fbc688','bool',1307956225,'I01\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'f8660064959c11e0b0b80015c5fbc688','use ssl','',7,0,'hidden'),('f9e42eca959c11e0b0b80015c5fbc688','num',1307956226,'I2083\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'f9bb78fe959c11e0b0b80015c5fbc688','port','',1,0,'hidden'),('fa0aed3a959c11e0b0b80015c5fbc688','string',1307956226,'V/\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'f9bb78fe959c11e0b0b80015c5fbc688','url','',2,0,'hidden'),('fa2fec918c3811e0b3c37c6d62900347','string',1306923716,'V\np0\n.','PostgreSQL username','PostgreSQL username.',500,-1,0,-1,'07191ca28aaf11e0b0470015c5fbc82a','username','',2,1,'always'),('fa3520e6959c11e0b0b80015c5fbc688','string',1307956226,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'f9bb78fe959c11e0b0b80015c5fbc688','host','',3,0,'hidden'),('fa5f98e4959c11e0b0b80015c5fbc688','string',1307956226,'Vuser name\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'f9bb78fe959c11e0b0b80015c5fbc688','match string','',4,0,'never'),('fa8a6524959c11e0b0b80015c5fbc688','string',1307956227,'V\np0\n.','Valid status codes (regexp)','Regular expression that matches HTTP status codes that are considered valid.',500,-1,0,-1,'f9bb78fe959c11e0b0b80015c5fbc688','valid status codes','',5,0,'never'),('fab65512959c11e0b0b80015c5fbc688','string',1307956227,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'f9bb78fe959c11e0b0b80015c5fbc688','invalid status codes','',6,0,'never'),('fae38ed8959c11e0b0b80015c5fbc688','bool',1307956227,'I01\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'f9bb78fe959c11e0b0b80015c5fbc688','use ssl','',7,0,'hidden'),('fb337b0a959c11e0b0b80015c5fbc688','num',1307956228,'I8443\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'fb0c3112959c11e0b0b80015c5fbc688','port','',1,0,'hidden'),('fb596c0c959c11e0b0b80015c5fbc688','string',1307956228,'V/\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'fb0c3112959c11e0b0b80015c5fbc688','url','',2,0,'hidden'),('fb7eb282959c11e0b0b80015c5fbc688','string',1307956228,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'fb0c3112959c11e0b0b80015c5fbc688','host','',3,0,'hidden'),('fba45046959c11e0b0b80015c5fbc688','string',1307956229,'Vuser name\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'fb0c3112959c11e0b0b80015c5fbc688','match string','',4,0,'never'),('fbcb7856959c11e0b0b80015c5fbc688','string',1307956229,'V\np0\n.','Valid status codes (regexp)','Regular expression that matches HTTP status codes that are considered valid.',500,-1,0,-1,'fb0c3112959c11e0b0b80015c5fbc688','valid status codes','',5,0,'never'),('fbf3004c959c11e0b0b80015c5fbc688','string',1307956229,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'fb0c3112959c11e0b0b80015c5fbc688','invalid status codes','',6,0,'never'),('fc1e0df0959c11e0b0b80015c5fbc688','bool',1307956229,'I01\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'fb0c3112959c11e0b0b80015c5fbc688','use ssl','',7,0,'hidden'),('fc6a1574959c11e0b0b80015c5fbc688','num',1307956230,'I80\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'fc42f1b0959c11e0b0b80015c5fbc688','port','',1,0,'hidden'),('fc73af201ef711e4bf08001d0970370f','bool',1407501116.91599,'I01\n.','Validate server SSL certificate','Check that the servers SSL certificate is valid.',-1,-1,-1,-1,'cc5cab4e1ef611e4bf08001d0970370f','validate SSL certificate','',3,0,'hidden'),('fc8d2f64959c11e0b0b80015c5fbc688','string',1307956230,'V/index.php/admin\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'fc42f1b0959c11e0b0b80015c5fbc688','url','',2,0,'hidden'),('fcb453e6959c11e0b0b80015c5fbc688','string',1307956230,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'fc42f1b0959c11e0b0b80015c5fbc688','host','',3,0,'hidden'),('fce13aaa959c11e0b0b80015c5fbc688','string',1307956231,'Vusername\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'fc42f1b0959c11e0b0b80015c5fbc688','match string','',4,0,'never'),('fd0a0494959c11e0b0b80015c5fbc688','string',1307956231,'V\np0\n.','Valid status codes (regexp)','Regular expression that matches HTTP status codes that are considered valid.',500,-1,0,-1,'fc42f1b0959c11e0b0b80015c5fbc688','valid status codes','',5,0,'never'),('fd320be2959c11e0b0b80015c5fbc688','string',1307956231,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'fc42f1b0959c11e0b0b80015c5fbc688','invalid status codes','',6,0,'never'),('fd5ac898959c11e0b0b80015c5fbc688','bool',1307956231,'I00\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'fc42f1b0959c11e0b0b80015c5fbc688','use ssl','',7,0,'hidden'),('fdb060f0959c11e0b0b80015c5fbc688','num',1307956232,'I80\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'fd84c684959c11e0b0b80015c5fbc688','port','',1,0,'hidden'),('fdd9cbfc959c11e0b0b80015c5fbc688','string',1307956232,'V/mt.cgi\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'fd84c684959c11e0b0b80015c5fbc688','url','',2,0,'hidden'),('fe059692959c11e0b0b80015c5fbc688','string',1307956233,'V\np0\n.','HTTP host header','Value of HTTP host header to send.',500,-1,0,-1,'fd84c684959c11e0b0b80015c5fbc688','host','',3,0,'hidden'),('fe2e7e2c959c11e0b0b80015c5fbc688','string',1307956233,'Vusername\np0\n.','Returned html must match given string.','Returned html must match given string.',500,-1,0,-1,'fd84c684959c11e0b0b80015c5fbc688','match string','',4,0,'never'),('fe57ce76959c11e0b0b80015c5fbc688','string',1307956233,'V\np0\n.','Valid status codes (regexp)','Regular expression that matches HTTP status codes that are considered valid.',500,-1,0,-1,'fd84c684959c11e0b0b80015c5fbc688','valid status codes','',5,0,'never'),('fe87b2e4959c11e0b0b80015c5fbc688','string',1307956233,'V\np0\n.','Invalid status codes (regexp)','Regular expression that matches HTTP status codes that are considered invalid.',500,-1,0,-1,'fd84c684959c11e0b0b80015c5fbc688','invalid status codes','',6,0,'never'),('feb311fa959c11e0b0b80015c5fbc688','bool',1307956234,'I00\n.','Use SSL (HTTPS)','Use SSL (HTTPS).',-1,-1,-1,-1,'fd84c684959c11e0b0b80015c5fbc688','use ssl','',7,0,'hidden'),('ff556bec8aae11e0b0470015c5fbc82a','num',1306754503,'I0\n.','TCP port','TCP port to monitor.',-1,65535,-1,0,'ff3c0e408aae11e0b0470015c5fbc82a','port','',1,1,'always'),('ff7009348aae11e0b0470015c5fbc82a','string',1306754503,'V\np0\n.','Send string','String to send after connection.',500,-1,0,-1,'ff3c0e408aae11e0b0470015c5fbc82a','send string','',2,0,'hidden'),('ff8bc0708aae11e0b0470015c5fbc82a','string',1306754503,'V\np0\n.','Connection string','String expected after connection.',500,-1,0,-1,'ff3c0e408aae11e0b0470015c5fbc82a','receive string','',3,0,'hidden'),('ffa84c408aae11e0b0470015c5fbc82a','bool',1306754503,'I00\n.','Wait peer disconnect','Expect the remote peer to disconnect.',-1,-1,-1,-1,'ff3c0e408aae11e0b0470015c5fbc82a','wait peer disconnect','',4,0,'hidden'),('ffdca9ea8aae11e0b0470015c5fbc82a','num',1306754504,'I80\n.','HTTP port','HTTP port to monitor.',-1,65535,-1,0,'ffc357ba8aae11e0b0470015c5fbc82a','port','',1,0,'hidden'),('fff7135c8aae11e0b0470015c5fbc82a','string',1306754504,'V/\np0\n.','Local URL to monitor','URL to monitor.',500,-1,0,-1,'ffc357ba8aae11e0b0470015c5fbc82a','url','',2,0,'hidden');
INSERT INTO `monitor_type_category` VALUES ('f1a75d90959c11e0b0b80015c5fbc688',1307956212,'Web Monitors','web monitors',''),('fef6a6348aae11e0b0470015c5fbc82a',1306754502,'Standard Monitors','standard monitors',''),('ff0cf7048aae11e0b0470015c5fbc82a',1306754502,'SQL Monitors','sql monitors','');
INSERT INTO `monitor_type_monitor_type_categories` VALUES ('1f88d4eeeaf111e3aad00018fefa448e',1306754502,'00a70e108aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('202b05f2eaf111e3aad00018fefa448e',1353513984,'0169020a33f411e2b59b58b035629331','660454b533f511e289f658b035629331'),('202b01f6eaf111e3aad00018fefa448e',1334048540,'0169020a33f411e2b59b58b035629331','e14896b582eb11e1b7747c6d62900347'),('1faa2ebeeaf111e3aad00018fefa448e',1306754502,'018c0e2a8aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('1fb23ceeeaf111e3aad00018fefa448e',1306754502,'0291de948aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('1f85c538eaf111e3aad00018fefa448e',1334048540,'02ce621e7e8711e3a5a7001d0970370f','e14896b582eb11e1b7747c6d62900347'),('16e324a4c96a11e49453001d0970370f',1426241821.56605,'034c2f76c96a11e4b79d001ec9b7c6f5','f5b1a3bec96911e4b79d001ec9b7c6f5'),('2075bfd4eaf111e3aad00018fefa448e',1306754502,'039472b68aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('20012d0eeaf111e3aad00018fefa448e',1306754502,'03fd49308aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('1f8092d4eaf111e3aad00018fefa448e',1306754502,'042f31668aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('5f68111831d911e49fe0001d0970370f',1409577040.62794,'043aabfa31d611e4b86b001ec9b7c6f5','e14896b582eb11e1b7747c6d62900347'),('1fbc8226eaf111e3aad00018fefa448e',1306754502,'047c48b68aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('1fff0d12eaf111e3aad00018fefa448e',1306754502,'0501ad308aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('1fc57cfaeaf111e3aad00018fefa448e',1306754502,'058a5a2c8aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('207b7b40eaf111e3aad00018fefa448e',1306754502,'061025448aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('1fac34fceaf111e3aad00018fefa448e',1306754502,'0694af4e8aaf11e0b0470015c5fbc82a','ff0cf7048aae11e0b0470015c5fbc82a'),('1fd90004eaf111e3aad00018fefa448e',1306754502,'07191ca28aaf11e0b0470015c5fbc82a','ff0cf7048aae11e0b0470015c5fbc82a'),('1f9b3080eaf111e3aad00018fefa448e',1306754502,'0783a73e8aaf11e0b0470015c5fbc82a','ff0cf7048aae11e0b0470015c5fbc82a'),('1f8252f4eaf111e3aad00018fefa448e',1306754502,'07ec3fc48aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('20a39d82eaf111e3aad00018fefa448e',1306754502,'081de3308aaf11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('208ab16eeaf111e3aad00018fefa448e',1353505746,'0945e0fd33e411e2834958b035629331','37a7ecdc33e211e29a2d58b035629331'),('208aad68eaf111e3aad00018fefa448e',1334048540,'0945e0fd33e411e2834958b035629331','e14896b582eb11e1b7747c6d62900347'),('207e34e8eaf111e3aad00018fefa448e',1353514680,'0a02a02e06f611e2b8777c6d62900347','04dc057d33f711e290a658b035629331'),('207e38d0eaf111e3aad00018fefa448e',1334048540,'0a02a02e06f611e2b8777c6d62900347','e14896b582eb11e1b7747c6d62900347'),('1fea9f3aeaf111e3aad00018fefa448e',1353514680,'0c4fd8ee349211e297a358b035629331','04dc057d33f711e290a658b035629331'),('1feaa32ceaf111e3aad00018fefa448e',1334048540,'0c4fd8ee349211e297a358b035629331','e14896b582eb11e1b7747c6d62900347'),('1f9e8546eaf111e3aad00018fefa448e',1353514680,'0f553d17349211e2930258b035629331','04dc057d33f711e290a658b035629331'),('1f9e8942eaf111e3aad00018fefa448e',1334048540,'0f553d17349211e2930258b035629331','e14896b582eb11e1b7747c6d62900347'),('1fd3b1eeeaf111e3aad00018fefa448e',1334048540,'119dbec68cb911e3a3d8001ec9b7c6f5','e14896b582eb11e1b7747c6d62900347'),('1feffa34eaf111e3aad00018fefa448e',1334048540,'1b1dbd85348e11e2a71258b035629331','e14896b582eb11e1b7747c6d62900347'),('1f71e054eaf111e3aad00018fefa448e',1391421551,'1b98ca16ede511e1b46a7c6d62900347','d4a141fe8cb911e3a3d8001ec9b7c6f5'),('46133f6c59c511e48fbe001ec9b7c6f5',1413966454.70552,'2e3c3a8859c511e48fbe001ec9b7c6f5','e14896b582eb11e1b7747c6d62900347'),('5572a6aec26c11e4adb2001ec9b7c6f5',1425473127.37929,'303d5f56c26b11e498c4001d0970370f','e14896b582eb11e1b7747c6d62900347'),('1fc94fceeaf111e3aad00018fefa448e',1353505865,'35460d00edc911e1b0a37c6d62900347','7e6a76eb33e211e2b13b58b035629331'),('1fc95406eaf111e3aad00018fefa448e',1334048540,'35460d00edc911e1b0a37c6d62900347','e14896b582eb11e1b7747c6d62900347'),('20090812eaf111e3aad00018fefa448e',1353514680,'36a568dc070311e2a9427c6d62900347','04dc057d33f711e290a658b035629331'),('20090c04eaf111e3aad00018fefa448e',1334048540,'36a568dc070311e2a9427c6d62900347','e14896b582eb11e1b7747c6d62900347'),('1fcb1520eaf111e3aad00018fefa448e',1334048540,'373d93d8387611e2ac5c0015c5fbc688','e14896b582eb11e1b7747c6d62900347'),('20a40006eaf111e3aad00018fefa448e',1353514680,'3782a914a5b311e2b25f0015c5fbc688','04dc057d33f711e290a658b035629331'),('20a403f8eaf111e3aad00018fefa448e',1334048540,'3782a914a5b311e2b25f0015c5fbc688','e14896b582eb11e1b7747c6d62900347'),('1ff1d4e4eaf111e3aad00018fefa448e',1353505865,'3cd96d82edce11e1b9587c6d62900347','7e6a76eb33e211e2b13b58b035629331'),('1ff1d8cceaf111e3aad00018fefa448e',1334048540,'3cd96d82edce11e1b9587c6d62900347','e14896b582eb11e1b7747c6d62900347'),('a5661b50732411e59bdc001d0970370f',1444903693.56195,'45153220508011e5b9d2001ec9b7c6f5','e14896b582eb11e1b7747c6d62900347'),('1f791ac2eaf111e3aad00018fefa448e',1353514680,'4cf050872fd611e2823f7c6d62900347','04dc057d33f711e290a658b035629331'),('1f7ea9baeaf111e3aad00018fefa448e',1334048540,'4cf050872fd611e2823f7c6d62900347','e14896b582eb11e1b7747c6d62900347'),('6ef0a438c96e11e4b79d001ec9b7c6f5',1426243687.28093,'57b26112c96e11e49453001d0970370f','f5b1a3bec96911e4b79d001ec9b7c6f5'),('c5a6e90e31d911e49fe0001d0970370f',1409577212.1674,'5898bc9c34a211e28d2f58b035629331','d4a141fe8cb911e3a3d8001ec9b7c6f5'),('2043e216eaf111e3aad00018fefa448e',1353514680,'606fa691070e11e2872a7c6d62900347','04dc057d33f711e290a658b035629331'),('2043e608eaf111e3aad00018fefa448e',1334048540,'606fa691070e11e2872a7c6d62900347','e14896b582eb11e1b7747c6d62900347'),('1fc76f56eaf111e3aad00018fefa448e',1353505917,'615bfb5e071711e29a577c6d62900347','9de9c36833e211e28fa158b035629331'),('1fc76b6eeaf111e3aad00018fefa448e',1334048540,'615bfb5e071711e29a577c6d62900347','e14896b582eb11e1b7747c6d62900347'),('2091e7c2eaf111e3aad00018fefa448e',1334048540,'623b450733f311e29e9858b035629331','e14896b582eb11e1b7747c6d62900347'),('2062d93ceaf111e3aad00018fefa448e',1353514680,'648eff0206f811e28a387c6d62900347','04dc057d33f711e290a658b035629331'),('2062dd56eaf111e3aad00018fefa448e',1334048540,'648eff0206f811e28a387c6d62900347','e14896b582eb11e1b7747c6d62900347'),('1fb7509eeaf111e3aad00018fefa448e',1353514680,'6906be54087d11e2bcdb7c6d62900347','04dc057d33f711e290a658b035629331'),('1fb75490eaf111e3aad00018fefa448e',1334048540,'6906be54087d11e2bcdb7c6d62900347','e14896b582eb11e1b7747c6d62900347'),('1fd1ad7ceaf111e3aad00018fefa448e',1353514680,'6eef294033f811e2be8858b035629331','04dc057d33f711e290a658b035629331'),('1fd1b178eaf111e3aad00018fefa448e',1334048540,'6eef294033f811e2be8858b035629331','e14896b582eb11e1b7747c6d62900347'),('af0c34cafd3511e3b3f2001d0970370f',1403789276.31558,'73242616fd3511e3819d001ec9b7c6f5','e14896b582eb11e1b7747c6d62900347'),('1fa64f88eaf111e3aad00018fefa448e',1353514680,'74da5023349411e28e9758b035629331','04dc057d33f711e290a658b035629331'),('1fa65384eaf111e3aad00018fefa448e',1334048540,'74da5023349411e28e9758b035629331','e14896b582eb11e1b7747c6d62900347'),('1fb9df26eaf111e3aad00018fefa448e',1353514680,'75ed9fd133f711e2b96b58b035629331','04dc057d33f711e290a658b035629331'),('1fb9e354eaf111e3aad00018fefa448e',1334048540,'75ed9fd133f711e2b96b58b035629331','e14896b582eb11e1b7747c6d62900347'),('1ffcb918eaf111e3aad00018fefa448e',1334048540,'7ca0c8c52fef11e2bf997c6d62900347','e14896b582eb11e1b7747c6d62900347'),('ccdacaf87c8611e59bdc001d0970370f',1445935410.90231,'7ed686e47c8611e59bdc001d0970370f','e14896b582eb11e1b7747c6d62900347'),('1fa19f1aeaf111e3aad00018fefa448e',1307956212,'7fa1d119631911e38a4c7c6d62900347','f1a75d90959c11e0b0b80015c5fbc688'),('1fa19b14eaf111e3aad00018fefa448e',1306754502,'7fa1d119631911e38a4c7c6d62900347','fef6a6348aae11e0b0470015c5fbc82a'),('c34d026cc98011e49453001d0970370f',1426251559.75606,'837af780c97f11e4b79d001ec9b7c6f5','f5b1a3bec96911e4b79d001ec9b7c6f5'),('1fd69c06eaf111e3aad00018fefa448e',1353514680,'8799ff4c06f611e28c497c6d62900347','04dc057d33f711e290a658b035629331'),('1fd69ff8eaf111e3aad00018fefa448e',1334048540,'8799ff4c06f611e28c497c6d62900347','e14896b582eb11e1b7747c6d62900347'),('1fe2e5d8eaf111e3aad00018fefa448e',1334048540,'95f599c5387a11e2b93f58b035629331','e14896b582eb11e1b7747c6d62900347'),('20731b8aeaf111e3aad00018fefa448e',1353514680,'a76bdf6333f711e2b58b58b035629331','04dc057d33f711e290a658b035629331'),('20731f7ceaf111e3aad00018fefa448e',1334048540,'a76bdf6333f711e2b58b58b035629331','e14896b582eb11e1b7747c6d62900347'),('20159618eaf111e3aad00018fefa448e',1334048540,'a8b18502387d11e2a8c458b035629331','e14896b582eb11e1b7747c6d62900347'),('1fe2861aeaf111e3aad00018fefa448e',1353514680,'ad6328b834a011e2906b58b035629331','04dc057d33f711e290a658b035629331'),('1fe28a02eaf111e3aad00018fefa448e',1334048540,'ad6328b834a011e2906b58b035629331','e14896b582eb11e1b7747c6d62900347'),('1ff3b12eeaf111e3aad00018fefa448e',1334048540,'bffa6087348f11e2845f58b035629331','e14896b582eb11e1b7747c6d62900347'),('1fe78778eaf111e3aad00018fefa448e',1334048540,'c0f22e8f07bd11e2a6047c6d62900347','e14896b582eb11e1b7747c6d62900347'),('20974424eaf111e3aad00018fefa448e',1334048540,'c134eb5907bd11e2b5437c6d62900347','e14896b582eb11e1b7747c6d62900347'),('1f65f17ceaf111e3aad00018fefa448e',1353505746,'c25f28ae087811e2b1d17c6d62900347','37a7ecdc33e211e29a2d58b035629331'),('1f604f06eaf111e3aad00018fefa448e',1334048540,'c25f28ae087811e2b1d17c6d62900347','e14896b582eb11e1b7747c6d62900347'),('1f8c38d2eaf111e3aad00018fefa448e',1334048540,'c955dc00edce11e1b9587c6d62900347','e14896b582eb11e1b7747c6d62900347'),('209f7e78eaf111e3aad00018fefa448e',1353505746,'c9c0ef07087d11e28f6f7c6d62900347','37a7ecdc33e211e29a2d58b035629331'),('209f7a7ceaf111e3aad00018fefa448e',1334048540,'c9c0ef07087d11e28f6f7c6d62900347','e14896b582eb11e1b7747c6d62900347'),('20f8ed661ef711e4bf08001d0970370f',1407500748.68993,'cc5cab4e1ef611e4bf08001d0970370f','f1a75d90959c11e0b0b80015c5fbc688'),('20fa578c1ef711e4bf08001d0970370f',1407500748.69919,'cc5cab4e1ef611e4bf08001d0970370f','fef6a6348aae11e0b0470015c5fbc82a'),('1fe4379eeaf111e3aad00018fefa448e',1353513984,'d237366e33f511e2a50b58b035629331','660454b533f511e289f658b035629331'),('1fe4332aeaf111e3aad00018fefa448e',1334048540,'d237366e33f511e2a50b58b035629331','e14896b582eb11e1b7747c6d62900347'),('2084f242eaf111e3aad00018fefa448e',1353505746,'d44e0f99087e11e29ac77c6d62900347','37a7ecdc33e211e29a2d58b035629331'),('2084ee50eaf111e3aad00018fefa448e',1334048540,'d44e0f99087e11e29ac77c6d62900347','e14896b582eb11e1b7747c6d62900347'),('203c4876eaf111e3aad00018fefa448e',1353514680,'e243458006f711e2949f7c6d62900347','04dc057d33f711e290a658b035629331'),('203c4c68eaf111e3aad00018fefa448e',1334048540,'e243458006f711e2949f7c6d62900347','e14896b582eb11e1b7747c6d62900347'),('1ff6170ceaf111e3aad00018fefa448e',1353505917,'e44bb933071211e2a0427c6d62900347','9de9c36833e211e28fa158b035629331'),('1ff6131aeaf111e3aad00018fefa448e',1334048540,'e44bb933071211e2a0427c6d62900347','e14896b582eb11e1b7747c6d62900347'),('20041de8eaf111e3aad00018fefa448e',1307956212,'f1cc19aa959c11e0b0b80015c5fbc688','f1a75d90959c11e0b0b80015c5fbc688'),('20831f76eaf111e3aad00018fefa448e',1307956212,'f318583c959c11e0b0b80015c5fbc688','f1a75d90959c11e0b0b80015c5fbc688'),('1fdeeea6eaf111e3aad00018fefa448e',1307956212,'f46f092e959c11e0b0b80015c5fbc688','f1a75d90959c11e0b0b80015c5fbc688'),('2070b1a6eaf111e3aad00018fefa448e',1307956212,'f5c9d484959c11e0b0b80015c5fbc688','f1a75d90959c11e0b0b80015c5fbc688'),('1fdc4264eaf111e3aad00018fefa448e',1307956212,'f7211b80959c11e0b0b80015c5fbc688','f1a75d90959c11e0b0b80015c5fbc688'),('1f942c7ceaf111e3aad00018fefa448e',1307956212,'f8660064959c11e0b0b80015c5fbc688','f1a75d90959c11e0b0b80015c5fbc688'),('1fa44a8aeaf111e3aad00018fefa448e',1307956212,'f9bb78fe959c11e0b0b80015c5fbc688','f1a75d90959c11e0b0b80015c5fbc688'),('2077b92eeaf111e3aad00018fefa448e',1307956212,'fb0c3112959c11e0b0b80015c5fbc688','f1a75d90959c11e0b0b80015c5fbc688'),('1fc01936eaf111e3aad00018fefa448e',1307956212,'fc42f1b0959c11e0b0b80015c5fbc688','f1a75d90959c11e0b0b80015c5fbc688'),('209d1b56eaf111e3aad00018fefa448e',1307956212,'fd84c684959c11e0b0b80015c5fbc688','f1a75d90959c11e0b0b80015c5fbc688'),('20a15266eaf111e3aad00018fefa448e',1306754502,'ff2372408aae11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('1ffb0e56eaf111e3aad00018fefa448e',1306754502,'ff3c0e408aae11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a'),('201149e6eaf111e3aad00018fefa448e',1306754502,'ffc357ba8aae11e0b0470015c5fbc82a','fef6a6348aae11e0b0470015c5fbc82a');
INSERT INTO `notification_template` VALUES ('ace2b821a0a611e0aa9c7c6d62900347',1309169854,'mako','alternative','Your Monitor Scout credit card is about to expire'),('acf34cd9a0a611e0ae407c6d62900347',1309169854,'mako','alternative','Credit card not approved'),('acf8da05a0a611e0bd627c6d62900347',1309169854,'mako','alternative','Monitor Scout email verification'),('ad02aa66a0a611e0a8327c6d62900347',1309169854,'mako','alternative','Welcome to Monitor Scout!'),('ad07e49ca0a611e0899a7c6d62900347',1309169854,'mako','mixed',''),('ad0bb728a0a611e0802a7c6d62900347',1309169854,'mako','alternative','Monitor Scout password reset'),('ad10b2dea0a611e0a6367c6d62900347',1309169854,'mako','alternative','Monitor Scout order receipt'),('ad154d6ba0a611e09e147c6d62900347',1309169854,'mako','alternative','Monitor Scout renewal confirmation.'),('ad1a2c0fa0a611e090bd7c6d62900347',1309169855,'mako','alternative','Monitor Scout resources depleted.'),('ad1fcd63a0a611e0a1da7c6d62900347',1309169855,'mako','alternative','Monitor Scout resources nearly depleted'),('ad24a9f5a0a611e0b8817c6d62900347',1309169855,'mako','alternative','Monitor Scout report.'),('ad299f4aa0a611e0b45c7c6d62900347',1309169855,'mako','alternative','Monitor Scout services stopped'),('ad2e305ca0a611e0904d7c6d62900347',1309169855,'mako','alternative','Your Monitor Scout trial package will soon expire.'),('ad32e263a0a611e0b9a47c6d62900347',1309169855,'mako','alternative','Your Monitor Scout trial package has expired.');
INSERT INTO `notification_template_section` VALUES ('acef2c8fa0a611e0ae247c6d62900347','Dear Customer,\r\n\r\nOrganisation name: ${organisation_name}\r\nOrganisation id: ${organisation_id}\r\n\r\nYour credit card used for subscription xxx will expire on (date).\r\n\r\nExpiration date: ${expiration_date}\r\nPayment method: ${payment_method}\r\ncc number: ${payment_method_masked_number}\r\n\r\nTo avoid deactivation or a temporary blocking of your subscription, we strongly recommend that you update or change your credit card information.\r\n\r\nTo update or change your credit card information, login to Monitor Scout\'s Administrative centre and go to the billing section under Account. There you will find a link to update or change your credit card information.\r\n\r\nThank you for using Monitor Scout and our premium monitoring services!\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169854,'mako','ace2b821a0a611e0aa9c7c6d62900347'),('acf17f85a0a611e08b5b7c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Credit card expiration email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n<p><br />\r\n  \r\n  Dear Customer, \r\n  </p>\r\n<p>&nbsp;</p>\r\n<p>Organisation name: ${organisation_name} </p>\r\n    <p> Organisation id: ${organisation_id}  </p>\r\n<p>&nbsp;</p>\r\n<p>Your credit card used for subscription xxx will expire on (date).  </p>\r\n<p>&nbsp;</p>\r\n<p>Expiration date: ${expiration_date}  </p>\r\n<p>Payment method: ${payment_method}  </p>\r\n<p>cc number: ${payment_method_masked_number}  </p>\r\n<p>&nbsp;</p>\r\n<p>To avoid deactivation or a temporary blocking of your subscription, we strongly recommend that you update or change your credit card information.  </p>\r\n<p>&nbsp;</p>\r\n<p>To update or change your credit card information, login to Monitor Scout\'s Administrative centre and go to the billing section under Account. There you will find a link to update or change your credit card information.  </p>\r\n<p>&nbsp;</p>\r\n<p>Thank you for using Monitor Scout and our premium monitoring services!  </p>\r\n<p>&nbsp;</p>\r\n<p>Regards,\r\n  \r\n  <br />\r\n  Monitor Scout </p>\r\n  <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169854,'mako','ace2b821a0a611e0aa9c7c6d62900347'),('acf59635a0a611e0a0087c6d62900347','Dear Customer,\r\n\r\n${organisation_name}\r\n${organisation_id}\r\n\r\nThe renewal of your subscription ${organisation_class_name} was not successful due to a failed credit card transaction. \r\n\r\nWe therefore ask you to change or update your credit card information.\r\nTo update or change your credit card information, login to Monitor Scout\'s Administrative centre and go to the billing section under Account. There you will find a link to update or change your credit card information.\r\n\r\nYour account will be put on hold for 7 days in order to give you time to pay the fee for the next subscription period. If we have not received the payment in 7 days your account will be terminated and all data and settings will be lost.\r\n\r\nThank you for using Monitor Scout and our premium monitoring services!\r\n\r\nIf you have received this email in error, please contact: support@monitorscout.se\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169854,'mako','acf34cd9a0a611e0ae407c6d62900347'),('acf79f68a0a611e0893c7c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Credit card was not approved email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n<p>&nbsp;</p>\r\n  <p>Dear Customer, </p>\r\n<p>&nbsp; </p>\r\n<p>${organisation_name}\r\n    ${organisation_id} </p>\r\n  <p>&nbsp;</p>\r\n<p>The renewal of your subscription ${organisation_class_name} was not successful due to a failed credit card transaction.  </p>\r\n<p>&nbsp;</p>\r\n<p>We therefore ask you to change or update your credit card information.  </p>\r\n<p>To update or change your credit card information, login to Monitor Scout\'s Administrative centre and go to the billing section under Account. There you will find a link to update or change your credit card information.  </p>\r\n<p>&nbsp;</p>\r\n<p>Your account will be put on hold for 7 days in order to give you time to pay the fee for the next subscription period. If we have not received the payment in 7 days your account will be terminated and all data and settings will be lost.  </p>\r\n<p>&nbsp;</p>\r\n<p>Thank you for using Monitor Scout and our premium monitoring services!  </p>\r\n<p>&nbsp;</p>\r\n<p>If you have received this email in error, please contact: support@monitorscout.se</p>\r\n<p>&nbsp;</p>\r\n<p> Regards,\r\n  \r\n  Monitor Scout </p>\r\n  <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169854,'mako','acf34cd9a0a611e0ae407c6d62900347'),('acfcf79ea0a611e08cd27c6d62900347','Dear Customer,\r\n\r\nWelcome to Monitor Scout. To activate your user account, click on the link: ${url}${id}\r\n\r\nYou can now take advantage of the Monitor Scout\'s monitoring service. If you would like to receive notifications via SMS/pager, these resources can be bought in Monitor Scout\'s Administrative centre under Account. This is also where you verify your pager/ phone.\r\n\r\nTo start using the monitoring service, go to the administrative tool and use your registration credentials to log in. If you don\'t have the credentials contact your account administrator or go to http://www.monitorscout.com and request a new password.\r\n\r\nUseful links:\r\nLogin: http://monitorscout.com\r\nSupport: http://support.monitorscout.com\r\nBlog: http://blog.monitorscout.com\r\nFor further questions about the Monitor Scout services see our FAQ or support web.\r\n\r\nThank you for using Monitor Scout and our premium monitoring services!\r\n\r\nIf you have received this email in error, please contact: support@monitorscout.se\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169854,'mako','acf8da05a0a611e0bd627c6d62900347'),('acff61b3a0a611e0ab507c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>New user creation email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n<p><br />\r\n  \r\n  \r\n  Dear Customer,  </p>\r\n<p>&nbsp;</p>\r\n<p>Welcome to Monitor Scout. To activate your user account, click on the link:<br/>\r\n<a href=\"${url}${id}\">${url}${id}</a>bsp;</p>\r\n<p>You can now take advantage of the Monitor Scout\'s monitoring service.</p>\r\n<p> If you would like to receive notifications via SMS/pager, these resources can be bought in Monitor Scout\'s Administrative centre under Account. This is also where you verify your pager/ phone.  </p>\r\n  <p>&nbsp;</p>\r\n<p>To start using the monitoring service, go to the administrative tool and use your registration credentials to log in. If you don\'t have the credentials contact your account administrator or go to http://www.monitorscout.com and request a new password.    </p>\r\n  <p>&nbsp;</p>\r\n<p>Useful links:</p>\r\n<p>Login: <a href=\"http://monitorscout.com\">http://monitorscout.com</a></p>\r\n<p>Support: <a href=\"http://support.monitorscout.com\">http://support.monitorscout.com</a></p>\r\n<p>Blog: <a href=\"http://blog.monitorscout.com\">http://blog.monitorscout.com</a></p>\r\n<p>For further questions about the Monitor Scout services see our FAQ or support web.  </p>\r\n  <p>&nbsp;</p>\r\n<p>Thank you for using Monitor Scout and our premium monitoring services!</p>\r\n  <p>&nbsp;</p>\r\n<p> If you have received this email in error, please contact: support@monitorscout.se    </p>\r\n  <p>&nbsp;</p>\r\n<p>Regards,    </p>\r\n<p>Monitor Scout <br/>\r\n  </p>\r\n  <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169854,'mako','acf8da05a0a611e0bd627c6d62900347'),('ad055a38a0a611e096b77c6d62900347','\r\nDear Customer,\r\n\r\nYour account has been created and is ready to use.\r\nOrganisation name: ${organisation_name}\r\nOrganisation ID: ${organisation_id}\r\nOrganisation class name: ${organisation_class_name}\r\n\r\n% if trial_name:\r\nYour account has been upgraded from package: ${organisation_class_name} to package: ${trial_name}\r\nThe Trial period is valid for: ${trial_duration}. During this period you can use and evaluate the full functionality of ${trial_name}. You can always keep the extra functionality and at any time upgrade it. Note that if you don\'t upgrade the extra  functionality during the trial period, collected data, settings and graphs related to the extra features will disappear.\r\n% endif\r\n\r\nTo log in to the Monitor Scout administration tool, please use the credentials received in the order\r\nprocess. Follow the link below or visit our website.\r\nHttp://monitorscout.com\r\n\r\nFor further questions about the Monitor Scout services see our FAQ or support web.\r\n\r\nThank you for using Monitor Scout\'s premium monitoring services!\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169854,'mako','ad02aa66a0a611e0a8327c6d62900347'),('ad0691dca0a611e09cad7c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>New account creation email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n<p><br />\r\n  \r\n  \r\n  \r\n  \r\n  Dear Customer,  </p>\r\n  <p>&nbsp;</p>\r\n<p>Your account has been created and is ready to use.    </p>\r\n<p>Organisation name: ${organisation_name}  </p>\r\n<p>Organisation ID: ${organisation_id}  </p>\r\n<p>Organisation class name: ${organisation_class_name}  </p>\r\n  <p>&nbsp;</p>\r\n% if trial_name:\r\n<p>Your account has been upgraded from package: ${organisation_class_name}to package: ${trial_name}The Trial period is valid for: ${trial_duration}. During this period you can use and evaluate the full functionality of : ${trial_name}. You can always keep the extra functionality and at any time upgrade it. Note that if you don\'t upgrade the extra  functionality during the trial period, collected data, settings and graphs related to the extra features will disappear.  </p>\r\n% endif\r\n  <p>&nbsp;</p>\r\n<p>To log in to the Monitor Scout administration tool, please use the credentials received in the order\r\n  process. Follow the link below or visit our website.    </p>\r\n  <p><a href=\"http://monitorscout.com\">http://monitorscout.com</a>bsp;</p>\r\n<p>For further questions about the Monitor Scout services see our FAQ or support web.    </p>\r\n  <p>&nbsp;</p>\r\n<p>Thank you for using Monitor Scout\'s premium monitoring services!    </p>\r\n  <p>&nbsp;</p>\r\n<p>Regards,    </p>\r\n<p>Monitor Scout <br/>\r\n  </p>\r\n  <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169854,'mako','ad02aa66a0a611e0a8327c6d62900347'),('ad0a702ba0a611e0a0167c6d62900347','Verification code: ${code}\n\n${url}${id}\n\nMonitor Scout','text/plain',1309169854,'mako','ad07e49ca0a611e0899a7c6d62900347'),('ad0dd7a8a0a611e089bc7c6d62900347','Dear ${name},\r\n\r\nYou have requested to reset the password for the user: ${email}\r\nTo reset the password click on the following link url: ${url}${id}\r\nThank you for using Monitor Scout and our premium monitoring services!\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169854,'mako','ad0bb728a0a611e0802a7c6d62900347'),('ad0ef04aa0a611e0a4467c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Password reset</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n<p><br />\r\n  \r\n  Dear ${name},\r\n  </p>\r\n<p>&nbsp;</p>\r\n<p style=\"width:608px;\"> You have requested to reset the password for the user: ${email}  </p>\r\n<p>To reset the password click on the following link:<br/>\r\n<a href=\"${url}${id}\"></a>${url}${id}<br/>\r\n</p>\r\n<p> Thank you for using Monitor Scout and our premium monitoring services!  </p>\r\n<p>&nbsp;</p>\r\n<p>Regards,  </p>\r\n<p>Monitor Scout </p>\r\n  <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\ritorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169854,'mako','ad0bb728a0a611e0802a7c6d62900347'),('ad12f863a0a611e0943b7c6d62900347','Dear Customer,\r\n\r\nThanks for your order! It has now been submitted for processing. An order confirmation will be sent\r\nto your billing email. We recommend you print the confirmation for future reference. A copy of the\r\ninvoice can be found under Account/billing, when you log in to Monitor Scout\'s administration tool.\r\n\r\nIP address: ${client_ipaddress}\r\nOrder number: ${order_id}\r\nOrder date: ${order_date}\r\nCustomer ID: ${customer_id}\r\nUser: ${user_name}\r\nOrder amount: ${billed_amount}\r\nVAT: ${vat}\r\nCurrency: ${billed_currency}\r\nPeriod start: ${period_start}\r\nPeriod end: ${period_end}\r\n\r\nOrder Details:\r\n% for log_line in log_lines:\r\nItem: ${log_line[\'item_description\']}\r\nAmount: ${log_line[\'billed_amount\']}\r\nUnits: ${log_line[\'billed_units\']}\r\n% endfor\r\n\r\nWhen your order has been processed, you will receive two emails. One will verify the creation of your account and the other your user ID.\r\n\r\nThank you for using Monitor Scout and our premium monitoring services!\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169854,'mako','ad10b2dea0a611e0a6367c6d62900347'),('ad14159ea0a611e0b3317c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Order confirmation email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n<p>&nbsp;</p>\r\n<p>Dear Customer, <br />\r\n  </p>\r\n<p>&nbsp;</p>\r\n<p>Thanks for your order! It has now been submitted for processing. An order confirmation will be sent\r\n  to your billing email. We recommend you print the confirmation for future reference. A copy of the\r\n  invoice can be found under Account/billing, when you log in to Monitor Scout\'s administration tool.</p>\r\n      <p>&nbsp;</p>\r\n<p>IP address: ${client_ipaddress}\r\n  <br />\r\n  Order number: ${order_id}\r\n  <br />\r\n  Order date: ${order_date}\r\n  <br />\r\n  Customer ID: ${customer_id}\r\n  <br />\r\n  User: ${user_name}\r\n  <br />\r\n  Order amount: ${billed_amount} ${billed_currency}\r\n  <br />\r\n  VAT: ${vat}\r\n  <br />\r\n  Period start: ${period_start}\r\n  <br />\r\n  Period end: ${period_end}  </p>\r\n<p>&nbsp;</p>\r\n<p>Order Details:\r\n  <br />\r\n% for log_line in log_lines:\r\n<p>Item: ${log_line[\'item_description\']}  </p>\r\n<p>Amount: ${log_line[\'billed_amount\']}\r\n  <br />\r\n  Units: ${log_line[\'billed_units\']}  </p>\r\n% endfor\r\n<p>&nbsp;</p>\r\n<p>Thank you for using Monitor Scout and our premium monitoring services!  </p>\r\n<p>&nbsp;</p>\r\n<p>Regards,<br />\r\nMonitor Scout </p>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169854,'mako','ad10b2dea0a611e0a6367c6d62900347'),('ad17b2f0a0a611e08afd7c6d62900347','Dear Customer,\r\n\r\nThank you for renewing your Monitor Scout subscription ${organisation_class_name}.\r\n\r\nWe recommend you print the confirmation for future reference. A copy of the invoice can be found\r\nunder Account/billing when you log in to Monitor Scout\'s administration tool.\r\n\r\nThank you for using Monitor Scout and our premium monitoring services!\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169855,'mako','ad154d6ba0a611e09e147c6d62900347'),('ad18e97da0a611e09d077c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Renewal confirmation email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n<p><br />\r\n  \r\n  Dear Customer, \r\n  </p>\r\n<p>&nbsp;</p>\r\n<p>Thank you for renewing your Monitor Scout subscription ${organisation_class_name}. </p>\r\n    <p>&nbsp;</p>\r\n<p>We recommend you print the confirmation for future reference. A copy of the invoice can be found\r\n  under Account/billing when you log in to Monitor Scout\'s administration tool.  </p>\r\n<p>&nbsp;</p>\r\n<p>Thank you for using Monitor Scout and our premium monitoring services!</p>\r\n<p>&nbsp;</p>\r\n<p> Regards,\r\n  \r\n  <br />\r\n  Monitor Scout </p>\r\n  <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169855,'mako','ad154d6ba0a611e09e147c6d62900347'),('ad1d5e75a0a611e08e437c6d62900347','Dear Customer,\r\n\r\n${organisation_name}\r\n${organisation_id}\r\n\r\nYour account subscription ${organisation_class_name} has run out of available credits. This means you can not receive additional notifications via SMS or pager and you risk losing uptime. To prevent this log in to Monitor Scout\'s Administrative centre under Account. There you can buy additional resources/credits and/or upgrade your subscription.\r\n\r\nThank you for using Monitor Scout and our premium monitoring services!\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169855,'mako','ad1a2c0fa0a611e090bd7c6d62900347'),('ad1e9fa3a0a611e0bf917c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Resource depleted email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n          <p>&nbsp;</p>\r\n          <p>Dear Customer,          </p>\r\n          <p>&nbsp;</p>\r\n          <p>${organisation_name}\r\n            <br />\r\n            ${organisation_id}          </p>\r\n          <p>&nbsp;</p>\r\n  <p>Your account subscription ${organisation_class_name} has run out of available credits. This means you can not receive additional notifications via SMS or pager and you risk losing uptime. To prevent this log in to Monitor Scout\'s Administrative centre under Account. There you can buy additional resources/credits and/or upgrade your subscription.</p>\r\n          <p>&nbsp;</p>\r\n          <p>Thank you for using Monitor Scout and our premium monitoring services!          </p>\r\n          <p>&nbsp;</p>\r\n          <p>Regards,\r\n            \r\n            <br />\r\n            Monitor Scout <br/>\r\n          </p>\r\n          <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169855,'mako','ad1a2c0fa0a611e090bd7c6d62900347'),('ad21e4a8a0a611e0bb6c7c6d62900347','Dear Customer,\r\n\r\n${organisation_name}\r\n${organisation_id}\r\n\r\nYour account subscription ${organisation_class_name}\r\nis running out of available resources, with less than than 25 %\r\nleft. If you run out of resources completely, important services such as the SMS or pager notification will stop sending alerts through this channel, which could lead to undesired downtime. To prevent this log in to Monitor Scout\'s Administrative centre under Account. There you can buy additional resources/credits and/or upgrade your subscription.  \r\n\r\nThank you for using Monitor Scout and our premium monitoring services!\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169855,'mako','ad1fcd63a0a611e0a1da7c6d62900347'),('ad237a54a0a611e09cea7c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Resource Nearly Depleted</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n<p><br />\r\n  \r\n  Dear Customer,  </p>\r\n<p>&nbsp;</p>\r\n<p>${organisation_name}<br />\r\n  ${organisation_id}  </p>\r\n  <p>&nbsp;</p>\r\n<p>Your account subscription ${organisation_class_name}\r\n  is running out of available resources, with less than than 25 %\r\n    left. </p>\r\n<p>If you run out of resources completely, important services such as the SMS or pager notification will stop sending alerts through this channel, which could lead to undesired downtime. To prevent this log in to Monitor Scout\'s Administrative centre under Account. There you can buy additional resources/credits and/or upgrade your subscription.  </p>\r\n  <p>&nbsp;</p>\r\n<p>Thank you for using Monitor Scout and our premium monitoring services!    </p>\r\n  <p>&nbsp;</p>\r\n<p>Regards,\r\n  \r\n  <br />\r\n  Monitor Scout <br/>\r\n    </p>\r\n  <div class=\"separator\"></div>\r\n<br/>\r\n\r\n</div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169855,'mako','ad1fcd63a0a611e0a1da7c6d62900347'),('ad26d487a0a611e0a7807c6d62900347','\r\nDear Customer,\r\n\r\n${organisation_name}\r\n${organisation_id}\r\n\r\nThe Monitor Scout report you requested is attached to this email.\r\nFor further questions about the Monitor Scout services see our FAQ or support web.\r\n\r\nUseful links:\r\nLogin: http://monitorscout.com\r\nSupport: http://support.monitorscout.com\r\nBlog: http://blog.monitorscout.com\r\n\r\nThank you for using Monitor Scout and our premium monitoring services!\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169855,'mako','ad24a9f5a0a611e0b8817c6d62900347'),('ad27eb3da0a611e0ba657c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Requested report email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n<p><br />\r\n  \r\n  Dear Customer,\r\n  </p>\r\n<p>&nbsp;</p>\r\n<p style=\"width:608px;\"> ${organisation_name}  </p>\r\n<p>${organisation_id}  </p>\r\n<p>&nbsp;</p>\r\n<p>The Monitor Scout report you requested is attached to this email.  </p>\r\n<p>For further questions about the Monitor Scout services see our FAQ or support web.  </p>\r\n<p>&nbsp;</p>\r\n<p>Useful links:  </p>\r\n<p>Login: <a href=\"http://monitorscout.com\">http://monitorscout.com</a></p>\r\n<p>Support: <a href=\"http://support.monitorscout.com\">http://support.monitorscout.com</a></p>\r\n<p>Blog: <a href=\"http://blog.monitorscout.com\">http://blog.monitorscout.com</a></p>\r\n<p>&nbsp;</p>\r\n<p>Thank you for using Monitor Scout and our premium monitoring services!  </p>\r\n<p>&nbsp;</p>\r\n<p>Regards,  </p>\r\n<p>Monitor Scout </p>\r\n  <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169855,'mako','ad24a9f5a0a611e0b8817c6d62900347'),('ad2bd9d7a0a611e0a8427c6d62900347','Dear Customer,\r\n\r\n${organisation_name}\r\n${organisation_id}\r\n\r\nWe have previously tried to contact you about the renewal of your subscription ${organisation_class_name}. Because of unsettled fees your subscription has now been stopped and your account closed. \r\n\r\nYou can reactivate your account by loging in to Monitor Scout\'s administrative centre and go to Account/Billing. There you can change your credit card information. It will take 24-48 hours to reactivate the account. All your data and settings will be available for another 7 days. However, if no payment is received during this time, your account will be permanently terminated, and you will lose all your settings and data.\r\n\r\nThank you for using Monitor Scout and our premium monitoring services!\r\n\r\nIf you have received this email in error, please contact: support@monitorscout.se\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169855,'mako','ad299f4aa0a611e0b45c7c6d62900347'),('ad2cf911a0a611e09eda7c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Stopped service due to unpaid fees email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n<p><br />\r\n  \r\n  \r\n  Dear Customer,  </p>\r\n  <p>&nbsp;</p>\r\n<p>${organisation_name}\r\n  <br />\r\n  ${organisation_id}    </p>\r\n  <p>&nbsp;</p>\r\n<p>We have previously tried to contact you about the renewal of your subscription ${organisation_class_name}. Because of unsettled fees your subscription has now been stopped and your account closed.    </p>\r\n  <p>&nbsp;</p>\r\n<p>You can reactivate your account by loging in to Monitor Scout\'s administrative centre and go to Account/Billing. There you can change your credit card information. It will take 24-48 hours to reactivate the account. All your data and settings will be available for another 7 days. However, if no payment is received during this time, your account will be permanently terminated, and you will lose all your settings and data     </p>\r\n  <p>&nbsp;</p>\r\n<p>Thank you for using Monitor Scout and our premium monitoring services!    </p>\r\n  <p>&nbsp;</p>\r\n<p>If you have received this email in error, please contact: support@monitorscout.se    </p>\r\n  <p>&nbsp;</p>\r\n<p>Regards,\r\n  \r\n  <br />\r\n  Monitor Scout <br/>\r\n    </p>\r\n  <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\ritorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169855,'mako','ad299f4aa0a611e0b45c7c6d62900347'),('ad307a0fa0a611e099847c6d62900347','Dear Customer,\r\n\r\nOrganisation name: ${organisation_name}\r\nOrganisation ID: ${organisation_id}\r\n\r\nYou are currently subscribing to ${organisation_class_name}subscription plan. You were also upgraded to the ${trial_organisation_class_name}subscription for a limited time period ${trial_duration}.\r\n\r\nYour trial subscription soon expire. You will then be downgraded to ${organisation_class_name} subscription plan. This means that you will lose some of functionality that you can get through  ${trial_organisation_class_name}, but not in the  ${organisation_class_name}\r\n\r\nTo avoid this type of downgrading, we ask you to log in to Monitor Scout\'s administrative centre. There you can upgrade your package from a ${organisation_class_name}\r\nsubscription plan to a ${trial_organisation_class_name}\r\n\r\nReduce expensive downtime through Monitor Scout services. For further questions about the Monitor Scout services see our FAQ or support web.\r\n\r\nThank you for using Monitor Scout\'s premium monitoring services!\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169855,'mako','ad2e305ca0a611e0904d7c6d62900347'),('ad31aaa3a0a611e0b4367c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Trial organisation due to expiration email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n          <p>&nbsp;</p>\r\n          <p>Dear Customer,          </p>\r\n          <p>&nbsp;</p>\r\n          <p>Organisation name: ${organisation_name}\r\n            <br />\r\n            Organisation ID: ${organisation_id}          </p>\r\n          <p>&nbsp;</p>\r\n          <p>You are currently subscribing to ${organisation_class_name}subscription plan. You were also upgraded to the ${trial_organisation_class_name}subscription for a limited time period ${trial_duration}.          </p>\r\n          <p>&nbsp;</p>\r\n          <p>Your trial subscription soon expire. You will then be downgraded to ${organisation_class_name} subscription plan. This means that you will lose some of functionality that you can get through  ${trial_organisation_class_name}, but not in the  ${organisation_class_name}          </p>\r\n          <p>&nbsp;</p>\r\n          <p>To avoid this type of downgrading, we ask you to log in to Monitor Scout\'s administrative centre. There you can upgrade your package from a ${organisation_class_name}\r\n            subscription plan to a ${trial_organisation_class_name}          </p>\r\n          <p>&nbsp;</p>\r\n          <p>Reduce expensive downtime through Monitor Scout services. For further questions about the Monitor Scout services see our FAQ or support web.          </p>\r\n          <p>&nbsp;</p>\r\n          <p>Thank you for using Monitor Scout\'s premium monitoring services!          </p>\r\n          <p>&nbsp;</p>\r\n          <p>Regards,\r\n            \r\n            <br />\r\n            Monitor Scout<br/>\r\n          </p>\r\n          <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169855,'mako','ad2e305ca0a611e0904d7c6d62900347'),('ad35786ea0a611e0a8477c6d62900347','Dear Customer,\r\n\r\n${organisation_name}\r\n\r\nImportant information from Monitor Scout:\r\nYour trial period has expired. \r\nYour subscription  ${trial_organisation_class_name}\r\nhas been downgraded to ${organisation_class_name}\r\n\r\nYou have now lost some of the functionality included in the${trial_organisation_class_name} subscription.\r\n\r\nFor a limited time period it\'s still possible to upgrade your account and keep your settings and data.\r\n\r\nLog in to your Monitor Scout administrative centre and go to account/upgrade and upgrade your account.\r\n\r\nReduce expensive downtime through Monitor Scout services. For further questions about the Monitor Scout services see our FAQ or support web.\r\n\r\nThank you for using Monitor Scout\'s premium monitoring services!\r\n\r\nRegards,\r\n\r\nMonitor Scout','text/plain',1309169855,'mako','ad32e263a0a611e0b9a47c6d62900347'),('ad36c4b8a0a611e09f997c6d62900347','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Trial organisation expiration email</title>\r\n<link href=\"http://img.monitorscout.com/mailimg.110405/style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<div class=\"wrapper\">\r\n<div class=\"header\"><img src=\"http://img.monitorscout.com/mailimg.110405/images/mslogo.jpg\" width=\"130\" height=\"41\" alt=\"Monitor Scout\" align=\"absmiddle\" /><p><a href=\"http://www.monitorscout.com\">Visit Monitor Scout</a> | <a href=\"http://www.monitorscout.com/\">Visit your account</a> | <a href=\"http://support.monitorscout.com/\">Visit our support</a></p></div>\r\n\r\n    <div class=\"whitebox-top\"></div>\r\n        <div class=\"whitebox-content\">\r\n\r\n          <p>&nbsp;</p>\r\n          <p>Dear Customer,            </p>\r\n          <p>&nbsp;</p>\r\n          <p>${organisation_name}            </p>\r\n          <p>&nbsp;</p>\r\n          <p>Important information from Monitor Scout:\r\n            <br />\r\n            Your trial period has expired. \r\n            <br />\r\n            Your subscription  ${trial_organisation_class_name}            </p>\r\n          <p>has been downgraded to ${organisation_class_name}            </p>\r\n          <p>&nbsp;</p>\r\n          <p>You have now lost some of the functionality included in the${trial_organisation_class_name} subscription.            </p>\r\n          <p>&nbsp;</p>\r\n          <p>For a limited time period it\'s still possible to upgrade your account and keep your settings and data.            </p>\r\n          <p>&nbsp;</p>\r\n          <p>Log in to your Monitor Scout administrative centre and go to account/upgrade and upgrade your account.            </p>\r\n          <p>&nbsp;</p>\r\n          <p>Reduce expensive downtime through Monitor Scout services. For further questions about the Monitor Scout services see our FAQ or support web.            </p>\r\n          <p>&nbsp;</p>\r\n          <p>Thank you for using Monitor Scout\'s premium monitoring services!            </p>\r\n          <p>&nbsp;</p>\r\n          <p>Regards,\r\n            \r\n            <br />\r\n            Monitor Scout </p>\r\n          <div class=\"separator\"></div>\r\n<br/>\r\n\r\n </div>\r\n        <div class=\"whitebox-bottom\"></div>\r\n<div class=\"footer\">Copyright © 2011 MonitorScout AB, All Rights Reserved.<br/>\r\n<br/>\r\nMonitor Scout is a leading website and server monitoring company, with a wide selection of flexible, high quality services. The reliable web-based system protects your websites and server 24/7 and reduces your downtime with immediate email/SMS notifications. We offer customized packages to monitor websites, hardware and applications, in depth uptime analysis with our global monitoring network and more.<br/>\r\n<br/>\r\nMonitor Scout</div>\r\n\r\n\r\n\r\n</div>\r\n</body>\r\n</html>','text/html',1309169855,'mako','ad32e263a0a611e0b9a47c6d62900347');
INSERT INTO `notification_trigger` VALUES ('acedc7a6a0a611e0ad297c6d62900347',1309169854,'cc expiration','ace2b821a0a611e0aa9c7c6d62900347'),('acf44585a0a611e099ab7c6d62900347',1309169854,'cc not approved','acf34cd9a0a611e0ae407c6d62900347'),('acf9b5c0a0a611e092ba7c6d62900347',1309169854,'email verification','acf8da05a0a611e0bd627c6d62900347'),('ad038863a0a611e09a437c6d62900347',1309169854,'organisation activated','ad02aa66a0a611e0a8327c6d62900347'),('ad08b0e8a0a611e0836e7c6d62900347',1309169854,'pager verification','ad07e49ca0a611e0899a7c6d62900347'),('ad0c91dea0a611e093d77c6d62900347',1309169854,'password reset','ad0bb728a0a611e0802a7c6d62900347'),('ad11a08fa0a611e082cc7c6d62900347',1309169854,'purchase complete','ad10b2dea0a611e0a6367c6d62900347'),('ad162ae8a0a611e0809b7c6d62900347',1309169855,'renewal confirmation','ad154d6ba0a611e09e147c6d62900347'),('ad1b2d66a0a611e0b0bb7c6d62900347',1309169855,'resources depleted','ad1a2c0fa0a611e090bd7c6d62900347'),('ad209d85a0a611e0a69e7c6d62900347',1309169855,'resources nearly depleted','ad1fcd63a0a611e0a1da7c6d62900347'),('ad258e47a0a611e09bce7c6d62900347',1309169855,'send report','ad24a9f5a0a611e0b8817c6d62900347'),('ad2a9078a0a611e0a7ed7c6d62900347',1309169855,'stopped services unpaid fees','ad299f4aa0a611e0b45c7c6d62900347'),('ad2f09faa0a611e086827c6d62900347',1309169855,'trial organisation class due expire','ad2e305ca0a611e0904d7c6d62900347'),('ad33ac6ba0a611e099137c6d62900347',1309169855,'trial organisation class expiration','ad32e263a0a611e0b9a47c6d62900347');
INSERT INTO `oc_included_monitor_type_categories` VALUES ('758f6940daf611e58b846c4008901394',0,'f1a75d90959c11e0b0b80015c5fbc688','60f521d7dadb11e5b12b6c4008901394'),('758f6940daf611e58b846c4008901394',0,'fef6a6348aae11e0b0470015c5fbc82a','60f521d7dadb11e5b12b6c4008901394'),('758f6940daf611e58b846c4008901394',0,'ff0cf7048aae11e0b0470015c5fbc82a','60f521d7dadb11e5b12b6c4008901394');
INSERT INTO `organisation_class` VALUES ('60f521d7dadb11e5b12b6c4008901394',0,1000,'a8bf29c7dadb11e5ad696c4008901394','20c07b59dadc11e5b8cf6c4008901394','a3ec6d99dadc11e590c26c4008901394','55155d02dadd11e58a246c4008901394','a3ec6d99dadc11e590c26c4008901394','a3ec6d99dadc11e590c26c4008901394',1000,1000,1,1,'b3a2d9e6dadd11e5982b6c4008901394',10800,180,5,5,60,30,300,3600,60,60,1000,1000,'910a696edade11e5aa4d6c4008901394',300,'20c07b59dadc11e5b8cf6c4008901394',120,120,300,'',0);
INSERT INTO `organisation_class_included_locations` VALUES ('6306c970dae011e5928f6c4008901394',0,'20c07b59dadc11e5b8cf6c4008901394','60f521d7dadb11e5b12b6c4008901394');
INSERT INTO `organisation_class_master` VALUES ('b3a2d9e6dadd11e5982b6c4008901394','60f521d7dadb11e5b12b6c4008901394','1139df19dadb11e58ab96c4008901394',1,0,'','Default class');
INSERT INTO `pager_notification_template` VALUES ('1d39f290da6911e5a49a000c299223af',1456258070.14279,'desc','Standard Pager Template','1d254110da6911e5a49a000c299223af','$Service on $DeviceName is $State'),('3e30b22cda6911e59c33000c299223af',1456258125.44696,'desc','Standard Pager Template','3e1a97dada6911e59c33000c299223af','$Service on $DeviceName is $State'),('4ca95318da6911e59c33000c299223af',1456258149.72588,'desc','Standard Pager Template','4c9749a2da6911e59c33000c299223af','$Service on $DeviceName is $State'),('4ffd25deda6f11e5ab38000c299223af',1456260732.28851,'desc','Standard Pager Template','4fea98a6da6f11e5ab38000c299223af','$Service on $DeviceName is $State'),('55155d02dadd11e58a246c4008901394',0,'desc','Standard Pager Template','','$Service on $DeviceName is $State'),('7c20281ada6911e590eb000c299223af',1456258229.3573,'desc','Standard Pager Template','7c0c0376da6911e590eb000c299223af','$Service on $DeviceName is $State'),('9b1ba4b4da6a11e5b475000c299223af',1456258710.83383,'desc','Standard Pager Template','9b067e9ada6a11e5b475000c299223af','$Service on $DeviceName is $State');
INSERT INTO `pager_provider` VALUES ('35bd5c94771c11e193727c6d62900347',0,0,1,'clickatell_us'),('fb9851cc8aae11e0b0470015c5fbc82a',0,1,1,'clickatell'),('fbae7e168aae11e0b0470015c5fbc82a',0,0,1,'mosms');
INSERT INTO `pager_provider_country` VALUES ('5f036cba771c11e180407c6d62900347','1',1332749953,'35bd5c94771c11e193727c6d62900347');
INSERT INTO `pricing_bundle` VALUES ('910a696edade11e5aa4d6c4008901394',0);
INSERT INTO `pricing_bundle_regional_pricing` VALUES ('7026a57adadf11e5b7e06c4008901394','SE',0,1,'USD','910a696edade11e5aa4d6c4008901394','F0\n.','F0\n.','F0\n.','F0\n.','F0\n.','F0\n.','F0\n.','F0\n.','F0\n.','F0\n.');
INSERT INTO `regional_billing_data` VALUES ('fc8427648aae11e0b0470015c5fbc82a','USD',25,'SE',0,'USD',1,25);
INSERT INTO `rrd_graph` VALUES ('a3ec6d99dadc11e590c26c4008901394',0,'rrd1',300,'rrd1');
INSERT INTO `rrd_graph_rra` VALUES ('d10b6011dadc11e5b9bb6c4008901394','AVERAGE',0,'rra1','rra1',105120,1,0.5);
INSERT INTO `rrd_store` VALUES ('e74ce8b3dae111e583e66c4008901394',0,'','');
INSERT INTO `rrd_store_queue_node` VALUES ('fafa8233dae111e588696c4008901394',0,'','localhost','vegaroute',5672,'e74ce8b3dae111e583e66c4008901394','monitorscout');
INSERT INTO `rrd_store_rpc_node` VALUES ('1d10f268dae211e5a4fe6c4008901394',0,'',19001,'localhost','e74ce8b3dae111e583e66c4008901394');
INSERT INTO `snmp_collector` VALUES ('0dfe0ae391d211e098647c6d62900347','0cd39e1991d211e0b5927c6d62900347',1307539218,'Windows SNMP Informant memory collector.','memory-windows-snmp-informant',''),('10faa19e91d211e097527c6d62900347','10865ffa91d211e0a0337c6d62900347',1307539223,'Windows SNMP Informant CPU collector.','cpu-windows-snmp-informant',''),('231871babab411e197f07c6d62900347','1e835340bab411e199df7c6d62900347',1340181864,'System information generic collector.','sysinfo-standard',''),('52cfaa148b7a11e085d47c6d62900347','3ff49efd8b7a11e0baa07c6d62900347',1306841831,'Net SNMP CPU collector.','cpu-net-snmp',''),('fdc9160c8aae11e0b0470015c5fbc82a','fd9bc18e8aae11e0b0470015c5fbc82a',1306754500,'Standard SNMP disk collector.','disk-standard',''),('fe3bcf6c8aae11e0b0470015c5fbc82a','fdf78c948aae11e0b0470015c5fbc82a',1306754501,'Standard SNMP network interface collector.','network-interface-standard',''),('fe97b2008aae11e0b0470015c5fbc82a','fe81366a8aae11e0b0470015c5fbc82a',1306754502,'Net SNMP memory collector.','memory-net-snmp',''),('fec4ecc08aae11e0b0470015c5fbc82a','feaebad68aae11e0b0470015c5fbc82a',1306754502,'Net SNMP process collector.','process-net-snmp','');
INSERT INTO `snmp_collector_oid` VALUES ('fde03dc88aae11e0b0470015c5fbc82a','fdc9160c8aae11e0b0470015c5fbc82a',1306754500,'Base OID.','base-oid','.1.3.6.1.2.1.25.2.3.1',''),('fe52d1c68aae11e0b0470015c5fbc82a','fe3bcf6c8aae11e0b0470015c5fbc82a',1306754501,'Base OID 32bit.','base-32bit-oid','.1.3.6.1.2.1.2.2.1',''),('fe6a19f88aae11e0b0470015c5fbc82a','fe3bcf6c8aae11e0b0470015c5fbc82a',1306754501,'Base OID 64bit.','base-64bit-oid','1.3.6.1.2.1.31.1.1.1','');
INSERT INTO `snmp_collector_type` VALUES ('0cd39e1991d211e0b5927c6d62900347','memory-windows-snmp-informant',1307539216,'Windows SNMP Informant memory collector.','memory-windows-snmp-informant',''),('10865ffa91d211e0a0337c6d62900347','cpu-windows-snmp-informant',1307539222,'Windows SNMP Informant CPU collector.','cpu-windows-snmp-informant',''),('1e835340bab411e199df7c6d62900347','sysinfo-standard',1340181856,'System information generic collector.','sysinfo-standard',''),('3ff49efd8b7a11e0baa07c6d62900347','cpu-net-snmp',1306841799,'Net SNMP CPU collector.','cpu-net-snmp',''),('fd9bc18e8aae11e0b0470015c5fbc82a','disk-standard',1306754500,'Standard SNMP disk collector.','disk-standard',''),('fdf78c948aae11e0b0470015c5fbc82a','network-interface-standard',1306754501,'Standard SNMP network interface collector.','network-interface-standard',''),('fe81366a8aae11e0b0470015c5fbc82a','memory-net-snmp',1306754501,'Net SNMP memory collector.','memory-net-snmp',''),('feaebad68aae11e0b0470015c5fbc82a','process-net-snmp',1306754502,'Net SNMP process collector.','process-net-snmp','');
INSERT INTO `snmp_collector_type_oid` VALUES ('fdb1fa4e8aae11e0b0470015c5fbc82a',1306754500,'Base OID.','base-oid','','fd9bc18e8aae11e0b0470015c5fbc82a'),('fe0db8a28aae11e0b0470015c5fbc82a',1306754501,'Base 32bit OID.','base-32bit-oid','','fdf78c948aae11e0b0470015c5fbc82a'),('fe24bce68aae11e0b0470015c5fbc82a',1306754501,'Base 64bit OID.','base-64bit-oid','','fdf78c948aae11e0b0470015c5fbc82a');
INSERT INTO `snmp_template` VALUES ('b56f9f8591d211e0a5237c6d62900347',1307539499,'Windows SNMP Template.','Windows SNMP Template',''),('fedc149a8aae11e0b0470015c5fbc82a',1306754502,'Net SNMP Template.','Net SNMP Template','');
INSERT INTO `snmp_template_snmp_collectors` VALUES ('250b037eeaf111e3aad00018fefa448e',1307539218,'0dfe0ae391d211e098647c6d62900347','b56f9f8591d211e0a5237c6d62900347'),('250afffaeaf111e3aad00018fefa448e',1307539223,'10faa19e91d211e097527c6d62900347','b56f9f8591d211e0a5237c6d62900347'),('250b070ceaf111e3aad00018fefa448e',1306754500,'fdc9160c8aae11e0b0470015c5fbc82a','b56f9f8591d211e0a5237c6d62900347'),('250af7a8eaf111e3aad00018fefa448e',1306754501,'fe3bcf6c8aae11e0b0470015c5fbc82a','b56f9f8591d211e0a5237c6d62900347'),('250afc4eeaf111e3aad00018fefa448e',1306754502,'fec4ecc08aae11e0b0470015c5fbc82a','b56f9f8591d211e0a5237c6d62900347'),('250b663eeaf111e3aad00018fefa448e',1340181864,'231871babab411e197f07c6d62900347','fedc149a8aae11e0b0470015c5fbc82a'),('250b6d6eeaf111e3aad00018fefa448e',1306841831,'52cfaa148b7a11e085d47c6d62900347','fedc149a8aae11e0b0470015c5fbc82a'),('250b70e8eaf111e3aad00018fefa448e',1306754500,'fdc9160c8aae11e0b0470015c5fbc82a','fedc149a8aae11e0b0470015c5fbc82a'),('250b69e0eaf111e3aad00018fefa448e',1306754501,'fe3bcf6c8aae11e0b0470015c5fbc82a','fedc149a8aae11e0b0470015c5fbc82a'),('250b6238eaf111e3aad00018fefa448e',1306754502,'fe97b2008aae11e0b0470015c5fbc82a','fedc149a8aae11e0b0470015c5fbc82a'),('250b7458eaf111e3aad00018fefa448e',1306754502,'fec4ecc08aae11e0b0470015c5fbc82a','fedc149a8aae11e0b0470015c5fbc82a');
INSERT INTO `user_license` VALUES ('1139df19dadb11e58ab96c4008901394','agreement text','1',0);
INSERT INTO `value_store` VALUES ('6d0e0914dae111e583886c4008901394',0,'','');
INSERT INTO `value_store_queue_node` VALUES ('961e3566dae111e588356c4008901394',0,'','localhost','vegaroute',5672,'monitorscout','6d0e0914dae111e583886c4008901394');
INSERT INTO `value_store_rpc_node` VALUES ('792e234fdae111e5a48a6c4008901394',0,'',18001,'localhost','6d0e0914dae111e583886c4008901394');
INSERT INTO `probe` VALUES ('b605b223db0011e599fa6c4008901394','pheeda2eer0Ahfee',0,'Local probe',0,'localhost','20c07b59dadc11e5b8cf6c4008901394','',0,0,0);
