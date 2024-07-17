-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 16 Jul 2024 pada 09.18
-- Versi server: 5.7.39
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_conversation`
--

CREATE TABLE `lhc_mailconv_conversation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dep_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctime` int(11) UNSIGNED NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `priority_asc` int(11) NOT NULL DEFAULT '0',
  `from_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_message_id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `udate` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailbox_id` bigint(20) UNSIGNED NOT NULL,
  `opened_at` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `total_messages` int(11) UNSIGNED NOT NULL,
  `match_rule_id` int(11) UNSIGNED NOT NULL,
  `cls_time` int(11) UNSIGNED NOT NULL,
  `pnd_time` int(11) UNSIGNED NOT NULL,
  `wait_time` int(11) UNSIGNED NOT NULL,
  `accept_time` int(11) UNSIGNED NOT NULL,
  `response_time` int(11) NOT NULL,
  `interaction_time` int(11) NOT NULL,
  `lr_time` int(11) UNSIGNED NOT NULL,
  `tslasign` int(11) UNSIGNED NOT NULL,
  `start_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `transfer_uid` int(11) UNSIGNED NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `conv_duration` int(11) NOT NULL DEFAULT '0',
  `mail_variables` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_attachment` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `pending_sync` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `follow_up_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `undelivered` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_delete_filter`
--

CREATE TABLE `lhc_mailconv_delete_filter` (
  `id` int(11) UNSIGNED NOT NULL,
  `updated_at` bigint(20) UNSIGNED NOT NULL,
  `created_at` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `archive_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `last_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `started_at` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `finished_at` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `processed_records` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `delete_policy` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `filter` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `filter_input` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_delete_item`
--

CREATE TABLE `lhc_mailconv_delete_item` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `filter_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_file`
--

CREATE TABLE `lhc_mailconv_file` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `size` int(11) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disposition` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_mailbox`
--

CREATE TABLE `lhc_mailconv_mailbox` (
  `id` int(11) UNSIGNED NOT NULL,
  `mail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `port` int(11) UNSIGNED NOT NULL,
  `workflow_options` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `imap` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_sync_log` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sync_started` bigint(20) UNSIGNED NOT NULL,
  `last_sync_time` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `mailbox_sync` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sync_status` int(11) UNSIGNED NOT NULL,
  `sync_interval` int(11) UNSIGNED NOT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature_under` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_since` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `dep_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `delete_mode` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `reopen_timeout` int(11) UNSIGNED NOT NULL DEFAULT '4',
  `failed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `uuid_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_a_copy` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `import_priority` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `assign_parent_user` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `mail_smtp` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_smtp` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_smtp` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_smtp` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_pswd_smtp` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `auth_method` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `reopen_reset` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `delete_on_archive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `delete_policy` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `last_process_time` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_mailing_campaign`
--

CREATE TABLE `lhc_mailconv_mailing_campaign` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `starts_at` bigint(20) UNSIGNED NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `mailbox_id` bigint(20) UNSIGNED NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_alt` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `as_active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `reply_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_logic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `owner_user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_mailing_campaign_recipient`
--

CREATE TABLE `lhc_mailconv_mailing_campaign_recipient` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `recipient_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailbox` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `opened_at` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `send_at` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `conversation_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_3` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_4` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_5` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_6` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_mailing_list`
--

CREATE TABLE `lhc_mailconv_mailing_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_mailing_list_recipient`
--

CREATE TABLE `lhc_mailconv_mailing_list_recipient` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mailing_list_id` bigint(20) UNSIGNED NOT NULL,
  `mailing_recipient_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_match_rule`
--

CREATE TABLE `lhc_mailconv_match_rule` (
  `id` int(11) UNSIGNED NOT NULL,
  `dep_id` int(11) UNSIGNED NOT NULL,
  `conditions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `mailbox_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_mail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_contains` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `priority_rule` int(11) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_msg`
--

CREATE TABLE `lhc_mailconv_msg` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) UNSIGNED NOT NULL,
  `opened_at` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id_old` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `message_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_reply_to` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `references` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctime` int(11) UNSIGNED NOT NULL,
  `udate` int(11) UNSIGNED NOT NULL,
  `date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `flagged` int(11) UNSIGNED NOT NULL,
  `recent` int(11) UNSIGNED NOT NULL,
  `msgno` bigint(20) UNSIGNED NOT NULL,
  `uid` bigint(20) UNSIGNED NOT NULL,
  `size` int(11) UNSIGNED NOT NULL,
  `from_host` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_host` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_to_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailbox_id` bigint(20) UNSIGNED NOT NULL,
  `response_time` bigint(20) UNSIGNED NOT NULL,
  `cls_time` bigint(20) UNSIGNED NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_external` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `wait_time` bigint(20) UNSIGNED NOT NULL,
  `accept_time` bigint(20) UNSIGNED NOT NULL,
  `interaction_time` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `conv_user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lr_time` bigint(20) UNSIGNED NOT NULL,
  `response_type` int(11) UNSIGNED NOT NULL,
  `bcc_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_id` int(11) UNSIGNED NOT NULL,
  `mb_folder` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conv_duration` int(11) NOT NULL DEFAULT '0',
  `has_attachment` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `undelivered` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `rfc822_body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_status` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_msg_internal`
--

CREATE TABLE `lhc_mailconv_msg_internal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL,
  `chat_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `name_support` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_msg_open`
--

CREATE TABLE `lhc_mailconv_msg_open` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opened_at` bigint(20) UNSIGNED NOT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_msg_subject`
--

CREATE TABLE `lhc_mailconv_msg_subject` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` int(11) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_oauth_ms`
--

CREATE TABLE `lhc_mailconv_oauth_ms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mailbox_id` bigint(20) UNSIGNED NOT NULL,
  `oauth_uid` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `display_name` varchar(200) NOT NULL,
  `txtSessionKey` varchar(255) NOT NULL,
  `txtCodeVerifier` varchar(255) NOT NULL,
  `dtExpires` bigint(20) UNSIGNED NOT NULL,
  `txtRefreshToken` text NOT NULL,
  `txtToken` text NOT NULL,
  `txtIDToken` text NOT NULL,
  `completed` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_personal_mailbox_group`
--

CREATE TABLE `lhc_mailconv_personal_mailbox_group` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mails` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_recipient`
--

CREATE TABLE `lhc_mailconv_recipient` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailbox` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_2` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_3` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_4` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_5` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_6` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_remarks`
--

CREATE TABLE `lhc_mailconv_remarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_response_template`
--

CREATE TABLE `lhc_mailconv_response_template` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_id` int(11) NOT NULL DEFAULT '0',
  `template_plain` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_response_template_dep`
--

CREATE TABLE `lhc_mailconv_response_template_dep` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_id` bigint(20) NOT NULL,
  `dep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_response_template_subject`
--

CREATE TABLE `lhc_mailconv_response_template_subject` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lhc_mailconv_sent_copy`
--

CREATE TABLE `lhc_mailconv_sent_copy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mailbox_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `body` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_auto_responder`
--

CREATE TABLE `lh_abstract_auto_responder` (
  `id` int(11) NOT NULL,
  `siteaccess` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `timeout_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bot_configuration` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `only_proactive` int(11) NOT NULL,
  `repeat_number` int(11) NOT NULL DEFAULT '1',
  `survey_timeout` int(11) NOT NULL DEFAULT '0',
  `survey_id` int(11) NOT NULL DEFAULT '0',
  `wait_timeout_hold_1` int(11) NOT NULL,
  `wait_timeout_hold_2` int(11) NOT NULL,
  `wait_timeout_hold_3` int(11) NOT NULL,
  `wait_timeout_hold_4` int(11) NOT NULL,
  `wait_timeout_hold_5` int(11) NOT NULL,
  `timeout_hold_message_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout_hold_message_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout_hold_message_3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout_hold_message_4` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout_hold_message_5` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout_hold` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout_2` int(11) NOT NULL,
  `timeout_message_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout_3` int(11) NOT NULL,
  `timeout_message_3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout_4` int(11) NOT NULL,
  `timeout_message_4` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout_5` int(11) NOT NULL,
  `timeout_message_5` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout_reply_1` int(11) NOT NULL,
  `timeout_reply_message_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout_reply_2` int(11) NOT NULL,
  `timeout_reply_message_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout_reply_3` int(11) NOT NULL,
  `timeout_reply_message_3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout_reply_4` int(11) NOT NULL,
  `timeout_reply_message_4` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wait_timeout_reply_5` int(11) NOT NULL,
  `timeout_reply_message_5` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `languages` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ignore_pa_chat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_auto_responder_chat`
--

CREATE TABLE `lh_abstract_auto_responder_chat` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `auto_responder_id` int(11) NOT NULL,
  `wait_timeout_send` int(11) NOT NULL,
  `pending_send_status` int(11) NOT NULL,
  `active_send_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_auto_responder_dep`
--

CREATE TABLE `lh_abstract_auto_responder_dep` (
  `id` bigint(20) NOT NULL,
  `autoresponder_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_browse_offer_invitation`
--

CREATE TABLE `lh_abstract_browse_offer_invitation` (
  `id` int(11) NOT NULL,
  `siteaccess` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_on_site` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `callback_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `lhc_iframe_content` tinyint(4) NOT NULL,
  `custom_iframe_url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_times` int(11) NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `has_url` int(11) NOT NULL,
  `is_wildcard` int(11) NOT NULL,
  `referrer` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `unit` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_chat_alert_icon`
--

CREATE TABLE `lh_abstract_chat_alert_icon` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_chat_column`
--

CREATE TABLE `lh_abstract_chat_column` (
  `id` int(11) NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `conditions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_enabled` tinyint(1) NOT NULL,
  `online_enabled` tinyint(1) NOT NULL,
  `icon_mode` tinyint(1) NOT NULL DEFAULT '0',
  `has_popup` tinyint(1) NOT NULL DEFAULT '0',
  `popup_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_column` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `chat_list_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `mail_list_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `mail_enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_chat_priority`
--

CREATE TABLE `lh_abstract_chat_priority` (
  `id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_destination` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `present_role_is` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_id` int(11) NOT NULL,
  `dest_dep_id` int(11) NOT NULL DEFAULT '0',
  `sort_priority` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_chat_variable`
--

CREATE TABLE `lh_abstract_chat_variable` (
  `id` int(11) NOT NULL,
  `content_field` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `var_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `var_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inv` tinyint(1) NOT NULL,
  `old_js_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `change_message` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL,
  `persistent` tinyint(1) NOT NULL,
  `js_variable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_email_template`
--

CREATE TABLE `lh_abstract_email_template` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name_ac` tinyint(4) NOT NULL,
  `from_email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email_ac` tinyint(4) NOT NULL,
  `user_mail_as_sender` tinyint(4) NOT NULL,
  `use_chat_locale` tinyint(1) NOT NULL DEFAULT '0',
  `only_recipient` tinyint(1) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translations` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc_recipients` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_ac` tinyint(4) NOT NULL,
  `reply_to` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply_to_ac` tinyint(4) NOT NULL,
  `recipient` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_abstract_email_template`
--

INSERT INTO `lh_abstract_email_template` (`id`, `name`, `from_name`, `from_name_ac`, `from_email`, `from_email_ac`, `user_mail_as_sender`, `use_chat_locale`, `only_recipient`, `content`, `translations`, `subject`, `bcc_recipients`, `subject_ac`, `reply_to`, `reply_to_ac`, `recipient`) VALUES
(1, 'Send mail to user', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Dear {user_chat_nick},\r\n\r\n{additional_message}\r\n\r\nLive Support response:\r\n{messages_content}\r\n\r\nSincerely,\r\nLive Support Team\r\n', '', '{name_surname} has responded to your request', '', 1, '', 1, ''),
(2, 'Support request from user', '', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\n\r\nMessage:\r\n{message}\r\n\r\nAdditional data, if any:\r\n{additional_data}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nLink to chat if any:\r\n{prefillchat}\r\n\r\nSincerely,\r\nLive Support Team', '', '{name}, {country}, {department}, Support request from user', '', 0, '', 0, 'ihyanatikwibowo@gmail.com'),
(3, 'User mail for himself', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Dear {user_chat_nick},\r\n\r\nTranscript:\r\n{messages_content}\r\nChat ID: {chat_id}\n\r\nSincerely,\r\nLive Support Team\r\n', '', 'Chat transcript', '', 0, '', 0, ''),
(4, 'New chat request', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nClick to accept chat automatically\r\n{url_accept}\r\n\r\nSurvey\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team', '', 'New chat request', '', 0, '', 0, 'ihyanatikwibowo@gmail.com'),
(5, 'Chat was closed', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\n{operator} has closed a chat\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nAdditional data, if any:\r\n{additional_data}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nSurvey:\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team', '', 'Chat was closed', '', 0, '', 0, 'ihyanatikwibowo@gmail.com'),
(6, 'New FAQ question', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\nNew FAQ question\r\nEmail: {email}\r\n\r\nQuestion:\r\n{question}\r\n\r\nQuestion URL:\r\n{url_question}\r\n\r\nURL to answer a question:\r\n{url_request}\r\n\r\nSincerely,\r\nLive Support Team', '', 'New FAQ question', '', 0, '', 0, 'ihyanatikwibowo@gmail.com'),
(7, 'New unread message', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nClick to accept chat automatically\r\n{url_accept}\r\n\r\nSurvey:\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team', '', 'New unread message', '', 0, '', 0, 'ihyanatikwibowo@gmail.com'),
(8, 'Filled form', 'MCFC', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\nUser has filled a form\r\nForm name - {form_name}\r\nUser IP - {ip}\r\nDownload filled data - {url_download}\r\nView filled data - {url_view}\r\n\r\n{content}\r\n\r\nSincerely,\r\nLive Support Team', '', 'Filled form - {form_name}', '', 0, '', 0, 'ihyanatikwibowo@gmail.com'),
(9, 'Chat was accepted', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\nOperator {user_name} has accepted a chat [{chat_id}]\r\n\r\nUser request data:\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nMessage:\r\n{message}\r\n\r\nURL of page from which user has send request:\r\n{url_request}\r\n\r\nClick to accept chat automatically\r\n{url_accept}\r\n\r\nSurvey:\r\n{survey}\r\n\r\nSincerely,\r\nLive Support Team', '', 'Chat was accepted [{chat_id}]', '', 0, '', 0, 'ihyanatikwibowo@gmail.com'),
(10, 'Permission request', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\nOperator {user} has requested these permissions\n\r\n{permissions}\r\n\r\nSincerely,\r\nLive Support Team', '', 'Permission request from {user}', '', 0, '', 0, ''),
(11, 'You have unread messages', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\nOperator {operator} has answered to you\r\n\r\n{messages}\r\n\r\nSincerely,\r\nLive Support Team', '', 'Operator has answered to your request', '', 0, '', 0, ''),
(12, 'Visitor returned', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\nVisitor information\r\nName: {name}\r\nEmail: {email}\r\nPhone: {phone}\r\nDepartment: {department}\r\nCountry: {country}\r\nCity: {city}\r\nIP: {ip}\r\nCreated:	{created}\r\nUser left:	{user_left}\r\nWaited:	{waited}\r\nChat duration:	{chat_duration}\r\n\r\nSee more information at\r\n{url_accept}\r\n\r\nLast chat:\r\n{message}\r\n\r\nAdditional data, if any:\r\n{additional_data}\r\n\r\nSincerely,\r\nLive Support Team', '', 'Visitor returned - {username}', '', 0, '', 0, ''),
(13, 'Report prepared', 'Live Helper Chat', 0, '', 0, 0, 0, 0, 'Hello,\r\n\r\nReport prepared - {report_name}, {date_range}\r\n\r\n{report_description}\r\n\r\nView report at:\r\n{url_report}\r\nView directly: {url_report_direct}', '', 'Report prepared - {report_name}', '', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_form`
--

CREATE TABLE `lh_abstract_form` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `name_attr` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro_attr` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xls_columns` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagelayout` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_form_collected`
--

CREATE TABLE `lh_abstract_form_collected` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `ip` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_msg_protection`
--

CREATE TABLE `lh_abstract_msg_protection` (
  `id` int(11) UNSIGNED NOT NULL,
  `pattern` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `remove` int(11) NOT NULL DEFAULT '0',
  `v_warning` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_proactive_chat_campaign`
--

CREATE TABLE `lh_abstract_proactive_chat_campaign` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_proactive_chat_campaign_conv`
--

CREATE TABLE `lh_abstract_proactive_chat_campaign_conv` (
  `id` bigint(20) NOT NULL,
  `device_type` tinyint(11) NOT NULL,
  `invitation_type` tinyint(1) NOT NULL,
  `invitation_status` tinyint(1) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `con_time` int(11) NOT NULL,
  `vid_id` bigint(20) DEFAULT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `conv_int_expires` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `conv_int_time` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `conv_event` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_proactive_chat_event`
--

CREATE TABLE `lh_abstract_proactive_chat_event` (
  `id` int(11) NOT NULL,
  `vid_id` int(11) NOT NULL,
  `ev_id` int(11) NOT NULL,
  `ts` int(11) NOT NULL,
  `val` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_proactive_chat_invitation`
--

CREATE TABLE `lh_abstract_proactive_chat_invitation` (
  `id` int(11) NOT NULL,
  `siteaccess` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_on_site` int(11) NOT NULL,
  `pageviews` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_returning` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_times` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `hide_after_ntimes` int(11) NOT NULL,
  `show_on_mobile` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `delay_init` int(11) NOT NULL,
  `show_instant` int(11) NOT NULL,
  `autoresponder_id` int(11) NOT NULL,
  `disabled` int(11) NOT NULL,
  `inject_only_html` tinyint(1) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_ids` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_returning_nick` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referrer` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_random_operator` int(11) NOT NULL,
  `operator_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `event_invitation` int(11) NOT NULL,
  `dynamic_invitation` int(11) NOT NULL,
  `bot_id` int(11) NOT NULL,
  `trigger_id` int(11) NOT NULL,
  `bot_offline` tinyint(1) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requires_email` int(11) NOT NULL,
  `iddle_for` int(11) NOT NULL,
  `event_type` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `requires_username` int(11) NOT NULL,
  `requires_phone` int(11) NOT NULL,
  `design_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_from` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `active_to` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `repetitiveness` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `days_activity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_present` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_proactive_chat_invitation_dep`
--

CREATE TABLE `lh_abstract_proactive_chat_invitation_dep` (
  `id` bigint(20) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_proactive_chat_invitation_event`
--

CREATE TABLE `lh_abstract_proactive_chat_invitation_event` (
  `id` int(11) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `min_number` int(11) NOT NULL,
  `during_seconds` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_proactive_chat_variables`
--

CREATE TABLE `lh_abstract_proactive_chat_variables` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_timeout` int(11) NOT NULL,
  `filter_val` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_product`
--

CREATE TABLE `lh_abstract_product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `departament_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_product_departament`
--

CREATE TABLE `lh_abstract_product_departament` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `departament_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_rest_api_key`
--

CREATE TABLE `lh_abstract_rest_api_key` (
  `id` int(11) NOT NULL,
  `api_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `ip_restrictions` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_rest_api_key_remote`
--

CREATE TABLE `lh_abstract_rest_api_key_remote` (
  `id` int(11) NOT NULL,
  `api_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_saved_report`
--

CREATE TABLE `lh_abstract_saved_report` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_options` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_log` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `position` int(11) UNSIGNED NOT NULL,
  `days` int(11) UNSIGNED NOT NULL,
  `date_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days_end` int(11) UNSIGNED NOT NULL,
  `updated_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_saved_search`
--

CREATE TABLE `lh_abstract_saved_search` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `position` int(11) UNSIGNED NOT NULL,
  `scope` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` int(11) UNSIGNED NOT NULL,
  `updated_at` bigint(20) UNSIGNED NOT NULL,
  `requested_at` bigint(20) UNSIGNED NOT NULL,
  `total_records` bigint(20) UNSIGNED NOT NULL,
  `passive` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sharer_user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_stats`
--

CREATE TABLE `lh_abstract_stats` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `lupdate` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `stats` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_subject`
--

CREATE TABLE `lh_abstract_subject` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `internal` tinyint(1) NOT NULL DEFAULT '0',
  `internal_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `widgets` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_subject_chat`
--

CREATE TABLE `lh_abstract_subject_chat` (
  `id` bigint(20) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `chat_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_subject_dep`
--

CREATE TABLE `lh_abstract_subject_dep` (
  `id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_survey`
--

CREATE TABLE `lh_abstract_survey` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedback_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_stars_1_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_stars_1_pos` int(11) NOT NULL,
  `max_stars_2_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_stars_2_pos` int(11) NOT NULL,
  `max_stars_2` int(11) NOT NULL,
  `max_stars_3_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_stars_3_pos` int(11) NOT NULL,
  `max_stars_3` int(11) NOT NULL,
  `max_stars_4_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_stars_4_pos` int(11) NOT NULL,
  `max_stars_4` int(11) NOT NULL,
  `max_stars_5_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_stars_5_pos` int(11) NOT NULL,
  `max_stars_5` int(11) NOT NULL,
  `question_options_1` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options_1_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options_1_pos` int(11) NOT NULL,
  `question_options_2` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options_2_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options_2_pos` int(11) NOT NULL,
  `question_options_3` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options_3_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options_3_pos` int(11) NOT NULL,
  `question_options_4` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options_4_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options_4_pos` int(11) NOT NULL,
  `question_options_5` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options_5_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_options_5_pos` int(11) NOT NULL,
  `question_plain_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_plain_1_pos` int(11) NOT NULL,
  `question_plain_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_plain_2_pos` int(11) NOT NULL,
  `question_plain_3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_plain_3_pos` int(11) NOT NULL,
  `question_plain_4` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_plain_4_pos` int(11) NOT NULL,
  `question_plain_5` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_plain_5_pos` int(11) NOT NULL,
  `max_stars_1_enabled` int(11) NOT NULL,
  `max_stars_2_enabled` int(11) NOT NULL,
  `max_stars_3_enabled` int(11) NOT NULL,
  `max_stars_4_enabled` int(11) NOT NULL,
  `max_stars_5_enabled` int(11) NOT NULL,
  `question_options_1_enabled` int(11) NOT NULL,
  `question_options_2_enabled` int(11) NOT NULL,
  `question_options_3_enabled` int(11) NOT NULL,
  `question_options_4_enabled` int(11) NOT NULL,
  `question_options_5_enabled` int(11) NOT NULL,
  `question_plain_1_enabled` int(11) NOT NULL,
  `question_plain_2_enabled` int(11) NOT NULL,
  `question_plain_3_enabled` int(11) NOT NULL,
  `question_plain_4_enabled` int(11) NOT NULL,
  `question_plain_5_enabled` int(11) NOT NULL,
  `max_stars_1` int(11) NOT NULL,
  `max_stars_1_req` int(11) NOT NULL,
  `max_stars_2_req` int(11) NOT NULL,
  `max_stars_3_req` int(11) NOT NULL,
  `max_stars_4_req` int(11) NOT NULL,
  `max_stars_5_req` int(11) NOT NULL,
  `question_options_1_req` int(11) NOT NULL,
  `question_options_2_req` int(11) NOT NULL,
  `question_options_3_req` int(11) NOT NULL,
  `question_options_4_req` int(11) NOT NULL,
  `question_options_5_req` int(11) NOT NULL,
  `question_plain_1_req` int(11) NOT NULL,
  `question_plain_2_req` int(11) NOT NULL,
  `question_plain_3_req` int(11) NOT NULL,
  `question_plain_4_req` int(11) NOT NULL,
  `question_plain_5_req` int(11) NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_survey_item`
--

CREATE TABLE `lh_abstract_survey_item` (
  `id` bigint(20) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ftime` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `max_stars_1` int(11) NOT NULL,
  `max_stars_2` int(11) NOT NULL,
  `max_stars_3` int(11) NOT NULL,
  `max_stars_4` int(11) NOT NULL,
  `max_stars_5` int(11) NOT NULL,
  `question_options_1` int(11) NOT NULL,
  `question_options_2` int(11) NOT NULL,
  `question_options_3` int(11) NOT NULL,
  `question_options_4` int(11) NOT NULL,
  `question_options_5` int(11) NOT NULL,
  `question_plain_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_plain_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_plain_3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_plain_4` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_plain_5` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `online_user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_abstract_widget_theme`
--

CREATE TABLE `lh_abstract_widget_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_company` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `onl_bcolor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bor_bcolor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'e3e3e3',
  `text_color` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `online_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `online_image_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offline_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offline_image_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_image_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `need_help_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_background` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `need_help_tcolor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `need_help_bcolor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `need_help_border` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `need_help_close_bg` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `need_help_hover_bg` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `need_help_close_hover_bg` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `need_help_image_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_status_css` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_container_css` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_widget_css` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `need_help_header` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `need_help_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `online_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `offline_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_border_color` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright_image_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_copyright_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_copyright` int(11) NOT NULL DEFAULT '1',
  `explain_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro_operator_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_image_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimize_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimize_image_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restore_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restore_image_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `close_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `close_image_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `popup_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `popup_image_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide_close` int(11) NOT NULL,
  `hide_popup` int(11) NOT NULL,
  `header_height` int(11) NOT NULL,
  `header_padding` int(11) NOT NULL,
  `widget_border_width` int(11) NOT NULL,
  `support_joined` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `support_closed` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pending_join` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `noonline_operators` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `noonline_operators_offline` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_need_help` int(11) NOT NULL DEFAULT '1',
  `show_need_help_timeout` int(11) NOT NULL DEFAULT '24',
  `show_voting` tinyint(1) NOT NULL DEFAULT '1',
  `department_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_select` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buble_visitor_background` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buble_visitor_title_color` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buble_visitor_text_color` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buble_operator_background` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buble_operator_title_color` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buble_operator_text_color` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_popup_css` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide_ts` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `hide_op_ts` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `widget_response_width` int(11) NOT NULL,
  `show_need_help_delay` int(11) NOT NULL,
  `show_status_delay` int(11) NOT NULL,
  `modern_look` tinyint(1) NOT NULL DEFAULT '0',
  `bot_status_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bot_configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pending_join_queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified` int(11) NOT NULL,
  `widget_show_leave_form` tinyint(1) NOT NULL,
  `enable_widget_embed_override` tinyint(1) NOT NULL,
  `widget_popheight` int(11) NOT NULL,
  `widget_popwidth` int(11) NOT NULL,
  `widget_survey` int(11) NOT NULL,
  `widget_position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_pright` int(11) NOT NULL,
  `widget_pbottom` int(11) NOT NULL,
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_abstract_widget_theme`
--

INSERT INTO `lh_abstract_widget_theme` (`id`, `name`, `name_company`, `onl_bcolor`, `bor_bcolor`, `text_color`, `online_image`, `online_image_path`, `offline_image`, `offline_image_path`, `logo_image`, `logo_image_path`, `need_help_image`, `header_background`, `need_help_tcolor`, `need_help_bcolor`, `need_help_border`, `need_help_close_bg`, `need_help_hover_bg`, `need_help_close_hover_bg`, `need_help_image_path`, `custom_status_css`, `custom_container_css`, `custom_widget_css`, `need_help_header`, `need_help_text`, `online_text`, `offline_text`, `widget_border_color`, `copyright_image`, `copyright_image_path`, `widget_copyright_url`, `show_copyright`, `explain_text`, `intro_operator_text`, `operator_image`, `operator_image_path`, `minimize_image`, `minimize_image_path`, `restore_image`, `restore_image_path`, `close_image`, `close_image_path`, `popup_image`, `popup_image_path`, `hide_close`, `hide_popup`, `header_height`, `header_padding`, `widget_border_width`, `support_joined`, `support_closed`, `pending_join`, `noonline_operators`, `noonline_operators_offline`, `show_need_help`, `show_need_help_timeout`, `show_voting`, `department_title`, `department_select`, `buble_visitor_background`, `buble_visitor_title_color`, `buble_visitor_text_color`, `buble_operator_background`, `buble_operator_title_color`, `buble_operator_text_color`, `custom_popup_css`, `hide_ts`, `hide_op_ts`, `widget_response_width`, `show_need_help_delay`, `show_status_delay`, `modern_look`, `bot_status_text`, `bot_configuration`, `notification_configuration`, `pending_join_queue`, `modified`, `widget_show_leave_form`, `enable_widget_embed_override`, `widget_popheight`, `widget_popwidth`, `widget_survey`, `widget_position`, `widget_pright`, `widget_pbottom`, `alias`) VALUES
(1, 'default', '', '228B22', 'FFD700', '', '', '', '', '', '', '', '', '228B22', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'FFD700', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0, 0, 2, '', '', '', '', '', 1, 24, 1, '', '', '228B22', '000000', '', 'A9A9A9', '0000FF', 'F0F8FF', '', 0, 0, 0, 0, 0, 1, '', '{\"theme_expires\":\"\",\"icons_order\":\"\",\"nh_width\":\"\",\"nh_height\":\"\",\"nh_right\":\"\",\"nh_bottom\":\"\",\"hide_mobile_nh\":1,\"always_present_nh\":0,\"hide_close_nh\":0,\"load_w2\":0,\"drag_enabled\":0,\"animate_nh\":1,\"disable_sound\":0,\"hide_iframe\":0,\"hide_parent\":0,\"kcw\":0,\"custom_html\":\"\",\"inject_html\":\"\",\"header_html\":\"\",\"custom_html_widget\":\"\",\"custom_page_css\":\"\",\"custom_html_bot\":\"\",\"custom_html_widget_bot\":\"\",\"custom_html_header\":\"\",\"custom_html_footer\":\"\",\"intro_message\":\"\",\"intro_message_html\":\"\",\"pre_chat_html\":\"\",\"pre_offline_chat_html\":\"\",\"custom_html_header_body\":\"\",\"custom_html_status\":\"\",\"after_chat_status\":\"\",\"custom_start_button\":\"\",\"custom_tos_text\":\"\",\"min_text\":\"\",\"popup_text\":\"\",\"end_chat_text\":\"\",\"fheight_text_class\":\"\",\"fheight_text_col\":\"\",\"custom_start_button_bot\":\"\",\"bot_id\":\"0\",\"trigger_id\":\"0\",\"custom_start_button_offline\":\"\",\"need_help_html\":\"\",\"thank_feedback\":\"\",\"blocked_visitor\":\"\",\"formf_name\":\"\",\"formf_email\":\"\",\"formf_file\":\"\",\"formf_phone\":\"\",\"formf_question\":\"\",\"bot_button_border\":\"228B22\",\"bot_button_background\":\"228B22\",\"bot_button_background_hover\":\"\",\"bot_button_text_color\":\"FFD700\",\"bot_button_border_radius\":\"30\",\"bot_button_padding\":\"10\",\"bot_button_padding_left_right\":\"80\",\"bot_button_fs\":\"\",\"wheight\":\"500\",\"wwidth\":\"\",\"operator_avatar\":\"\",\"nh_avatar\":\"\",\"wright\":\"50\",\"wbottom\":\"30\",\"wright_inv\":\"\",\"switch_to_human\":\"\",\"placeholder_message\":\"\",\"custom_op_name\":\"\",\"chat_unavailable\":\"\",\"disable_edit_prev\":0,\"confirm_close\":0,\"start_on_close\":0,\"prev_msg\":0,\"custom_html_priority\":0,\"proactive_once_typed\":0,\"hide_job_title\":0,\"close_on_unload\":0,\"dont_prefill_offline\":0,\"hide_bb_code\":0,\"msg_snippet\":0,\"font_size\":0,\"use_system_tz\":0,\"print_btn_msg\":0,\"survey_button\":0,\"enable_react_for_vi\":0,\"one_reaction_per_msg\":0,\"reactions_always_visible_under\":0,\"always_visible_reactions\":0,\"custom_tb_reactions\":\"\",\"custom_mw_reactions\":\"\",\"fscreen_embed\":0,\"auto_bot_intro\":0,\"detect_language\":0,\"bubble_style_profile\":0,\"hide_status\":0,\"msg_expand\":0,\"hide_visitor_profile\":0,\"header_icon_color\":\"000000\",\"offl_bcolor\":\"\",\"offlbor_bcolor\":\"\",\"offltxt_color\":\"\",\"close_in_status\":0,\"job_new_row\":0,\"cnew_msg\":\"\",\"cnew_msgm\":\"\",\"cscroll_btn\":\"\",\"bg_scroll_bottom\":\"\",\"text_scroll_bottom\":\"\",\"embed_closed\":\"\",\"viewport\":\"\",\"msg_time_format_day\":\"\",\"msg_time_format_time\":\"\",\"cnew_msgh\":\"\",\"new_msg_text_color\":\"\",\"bg_new_msg\":\"\",\"buble_reaction_background_vi\":\"\",\"buble_reaction_color_vi\":\"\",\"buble_reaction_background_op\":\"\",\"buble_reaction_color_op\":\"\"}', '{\"notification_enabled\":0,\"ntitle\":\"\",\"ndomain\":\"\"}', '', 1721121430, 0, 0, 520, 500, 0, 'bottom_right', 0, 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_admin_theme`
--

CREATE TABLE `lh_admin_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `static_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `static_js_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `static_css_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_attributes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `header_css` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_audits`
--

CREATE TABLE `lh_audits` (
  `id` bigint(20) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_id` bigint(20) DEFAULT '0',
  `line` bigint(20) DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `severity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_bot_condition`
--

CREATE TABLE `lh_bot_condition` (
  `id` int(11) UNSIGNED NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_brand`
--

CREATE TABLE `lh_brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_brand_member`
--

CREATE TABLE `lh_brand_member` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dep_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_canned_msg`
--

CREATE TABLE `lh_canned_msg` (
  `id` int(11) NOT NULL,
  `msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fallback_msg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `explain` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `languages` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `auto_send` tinyint(1) NOT NULL,
  `html_snippet` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_int_1` int(11) NOT NULL,
  `attr_int_2` int(11) NOT NULL,
  `attr_int_3` int(11) NOT NULL,
  `disabled` tinyint(1) UNSIGNED DEFAULT '0',
  `unique_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `active_from` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `active_to` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `repetitiveness` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `days_activity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_on_exp` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_canned_msg_dep`
--

CREATE TABLE `lh_canned_msg_dep` (
  `id` bigint(20) NOT NULL,
  `canned_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_canned_msg_replace`
--

CREATE TABLE `lh_canned_msg_replace` (
  `id` int(11) UNSIGNED NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `conditions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_from` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `active_to` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `repetitiveness` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `days_activity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_zone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_canned_msg_subject`
--

CREATE TABLE `lh_canned_msg_subject` (
  `id` int(11) NOT NULL,
  `canned_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_canned_msg_tag`
--

CREATE TABLE `lh_canned_msg_tag` (
  `id` int(11) NOT NULL,
  `tag` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_canned_msg_tag_link`
--

CREATE TABLE `lh_canned_msg_tag_link` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `canned_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_canned_msg_use`
--

CREATE TABLE `lh_canned_msg_use` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `canned_id` int(11) UNSIGNED NOT NULL,
  `chat_id` bigint(20) UNSIGNED NOT NULL,
  `ctime` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat`
--

CREATE TABLE `lh_chat` (
  `id` bigint(20) NOT NULL,
  `nick` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `status_sub` int(11) NOT NULL DEFAULT '0',
  `status_sub_sub` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_referrer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_variables` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_id` int(11) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `sender_user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pnd_time` int(11) NOT NULL DEFAULT '0',
  `cls_time` int(11) NOT NULL DEFAULT '0',
  `usaccept` int(11) NOT NULL DEFAULT '0',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `user_closed_ts` int(11) NOT NULL DEFAULT '0',
  `support_informed` int(11) NOT NULL DEFAULT '0',
  `unread_messages_informed` int(11) NOT NULL DEFAULT '0',
  `reinform_timeout` int(11) NOT NULL DEFAULT '0',
  `last_op_msg_time` int(11) NOT NULL DEFAULT '0',
  `has_unread_op_messages` int(11) NOT NULL DEFAULT '0',
  `unread_op_messages_informed` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unanswered_chat` int(11) NOT NULL,
  `cls_us` tinyint(1) NOT NULL DEFAULT '0',
  `anonymized` tinyint(1) NOT NULL,
  `user_typing` int(11) NOT NULL,
  `gbot_id` int(11) NOT NULL DEFAULT '0',
  `user_typing_txt` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_typing` int(11) NOT NULL,
  `operator_typing_id` int(11) NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_unread_messages` int(11) NOT NULL,
  `last_user_msg_time` int(11) NOT NULL,
  `fbst` tinyint(1) NOT NULL,
  `online_user_id` int(11) NOT NULL,
  `auto_responder_id` int(11) NOT NULL,
  `last_msg_id` int(11) NOT NULL,
  `lsync` int(11) NOT NULL,
  `transfer_uid` int(11) NOT NULL,
  `additional_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_tz_identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lon` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_admin` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_sub_arg` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uagent` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_locale_to` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_send` int(11) NOT NULL,
  `screenshot_id` int(11) NOT NULL,
  `wait_time` int(11) NOT NULL,
  `chat_duration` int(11) NOT NULL,
  `tslasign` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `chat_initiator` int(11) NOT NULL,
  `transfer_timeout_ts` int(11) NOT NULL,
  `transfer_timeout_ac` int(11) NOT NULL,
  `transfer_if_na` int(11) NOT NULL,
  `na_cb_executed` int(11) NOT NULL,
  `device_type` int(11) NOT NULL,
  `nc_cb_executed` tinyint(1) NOT NULL,
  `iwh_id` int(11) NOT NULL DEFAULT '0',
  `theme_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `frt` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `aart` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `mart` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_chat`
--

INSERT INTO `lh_chat` (`id`, `nick`, `status`, `status_sub`, `status_sub_sub`, `time`, `user_id`, `hash`, `referrer`, `session_referrer`, `chat_variables`, `remarks`, `ip`, `dep_id`, `invitation_id`, `sender_user_id`, `product_id`, `pnd_time`, `cls_time`, `usaccept`, `user_status`, `user_closed_ts`, `support_informed`, `unread_messages_informed`, `reinform_timeout`, `last_op_msg_time`, `has_unread_op_messages`, `unread_op_messages_informed`, `email`, `country_code`, `country_name`, `unanswered_chat`, `cls_us`, `anonymized`, `user_typing`, `gbot_id`, `user_typing_txt`, `operator_typing`, `operator_typing_id`, `phone`, `has_unread_messages`, `last_user_msg_time`, `fbst`, `online_user_id`, `auto_responder_id`, `last_msg_id`, `lsync`, `transfer_uid`, `additional_data`, `user_tz_identifier`, `lat`, `lon`, `city`, `operation`, `operation_admin`, `status_sub_arg`, `uagent`, `chat_locale`, `chat_locale_to`, `mail_send`, `screenshot_id`, `wait_time`, `chat_duration`, `tslasign`, `priority`, `chat_initiator`, `transfer_timeout_ts`, `transfer_timeout_ac`, `transfer_if_na`, `na_cb_executed`, `device_type`, `nc_cb_executed`, `iwh_id`, `theme_id`, `frt`, `aart`, `mart`) VALUES
(1, 'tetst', 5, 0, 0, 1721098564, 0, '9ZfM4qKRC4QEVcXdeG8Mu4aY2KlIxDCR7LnYbnYT', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721098564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 1, 'Visitor is typing', 0, 0, '', 0, 1721098635, 0, 2, 0, 2, 1721098635, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(2, 'admin', 5, 0, 0, 1721099311, 0, 'jvaEGZ2zMC2nymZlyMj8ugztfaXb9SdcscG5YUTi', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721099311, 0, 0, 0, 0, 0, 0, 0, 1721099313, 0, 0, '', '', '', 0, 0, 0, 0, 1, '', 0, 0, '', 0, 1721099313, 0, 2, 0, 4, 1721099346, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(3, 'tiket', 5, 0, 3, 1721099369, 0, 'G7unzH6sfYnqRlRJptkqcupUTGSIq2lMnmnu6daR', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721099369, 0, 0, 0, 0, 0, 0, 0, 1721099370, 0, 0, '', '', '', 0, 0, 0, 0, 1, '', 0, 0, '', 0, 1721099370, 0, 2, 0, 7, 1721099520, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(4, 'user', 5, 0, 0, 1721099529, 0, 'sfFfqAHKZLS8bSybf1YwoGmWYCXOxq1JUXLqmHDF', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721099529, 0, 0, 1, 1721101071, 1, 0, 0, 1721099533, 0, 0, '', '', '', 0, 0, 0, 1721101066, 1, 'user has left the chat!', 0, 0, '', 0, 1721099533, 0, 2, 0, 10, 1721101070, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(5, 'tiket', 5, 0, 0, 1721101077, 0, 'Y3HSqzQ4oVMYyZz5L6N1DABik3nFBIExYmhc2Wz8', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721101077, 0, 0, 0, 0, 0, 0, 0, 1721101080, 0, 0, '', '', '', 0, 0, 0, 0, 1, '', 0, 0, '', 0, 1721101080, 0, 2, 0, 13, 1721101080, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(6, 'hub', 5, 0, 0, 1721101155, 0, '2IMOTggyEFeSCI2OGLXYzBKiVeGUCYqkyqsH5Y4D', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721101155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 1, '', 0, 0, '', 0, 1721101158, 0, 2, 0, 16, 1721101158, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(7, 'tiket', 5, 9, 0, 1721101186, 0, 'y5F5yES6PQASnyNAJxfwL3U0KN91IWuGby2AsB0e', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721101220, 0, 0, 1, 1721101220, 1, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 1721101215, 1, 'tiket has left the chat!', 0, 0, '', 0, 1721101188, 0, 2, 0, 19, 1721101219, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(8, 'admin', 5, 0, 0, 1721101229, 0, 'r9UxUhzjFxgff2WZvdJ4yaBs9PO827qLFwqXM1YR', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721101229, 0, 0, 1, 1721101262, 1, 0, 0, 1721101231, 0, 0, '', '', '', 0, 0, 0, 1721101257, 1, 'admin has left the chat!', 0, 0, '', 0, 1721101231, 0, 2, 0, 21, 1721101231, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(9, 'test', 5, 0, 0, 1721101270, 0, 'fbPmnR0Cdmgn4RqCjIyf7Aq0YTxtQz64IaELPsny', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721101270, 0, 0, 0, 0, 0, 0, 0, 1721101273, 0, 0, '', '', '', 0, 0, 0, 0, 1, '', 0, 0, '', 0, 1721101273, 0, 2, 0, 24, 1721101273, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(10, 'tiket', 5, 0, 3, 1721101297, 0, 'k1eBBx3yKhDaA6tgpEdfGd3m6rTpSGYKhsF3S7KS', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721101297, 0, 0, 0, 0, 0, 0, 0, 1721101299, 0, 0, '', '', '', 0, 0, 0, 0, 1, '', 0, 0, '', 0, 1721101299, 0, 2, 0, 27, 1721101309, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(11, 'tiket', 5, 0, 0, 1721102046, 0, 'cr5L67euQ8nsamuZTFqS1XplKIOAiDm8XwQsbxbs', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721102046, 0, 0, 1, 1721102187, 1, 0, 0, 1721102054, 0, 0, '', '', '', 0, 0, 0, 1721102182, 1, 'tiket has left the chat!', 0, 0, '', 0, 1721102054, 0, 2, 0, 30, 1721102182, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(12, 'hub', 2, 0, 0, 1721102325, 1, '5pAgZ3KedHyPr8T4F6w8D1oNDnqmxs3e25Rs8fwf', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721102810, 1721102991, 0, 0, 1721103152, 1, 0, 0, 1721102812, 0, 0, '', '', '', 0, 1, 0, 1721103153, 1, '//localhost:8000', 0, 0, '', 0, 1721102991, 0, 2, 0, 35, 1721103157, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 1, 487, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1),
(13, 'tiket', 5, 0, 0, 1721103163, 0, 'NA1yuXnzaShoaXBKJ9lDAReH0ozu96AcVPiBYDxx', '//localhost:8000/chat', '', '', '', '127.0.0.1', 1, 0, 0, 0, 1721103163, 0, 0, 1, 1721103205, 1, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 1721103200, 1, 'tiket has left the chat!', 0, 0, '', 0, 0, 0, 2, 0, 37, 1721103194, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(14, 'tiket', 5, 0, 0, 1721103215, 0, 'wQFIbNgbxSr9XgRBftoQOImF2NVPcoQ0yNaR4TPH', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721103215, 0, 0, 0, 0, 0, 0, 0, 1721103217, 0, 0, '', '', '', 0, 0, 0, 0, 1, '', 0, 0, '', 0, 1721103217, 0, 2, 0, 40, 1721103217, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(15, 'user', 5, 0, 0, 1721103233, 0, 'Kk4BbN5jbF7JDct2NbVsF8jfvWQp7D3gjnfLhYgk', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721103233, 0, 0, 0, 0, 0, 0, 0, 1721103234, 0, 0, '', '', '', 0, 0, 0, 0, 1, '', 0, 0, '', 0, 1721103234, 0, 2, 0, 43, 1721103234, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(16, '12345678', 5, 0, 0, 1721104000, 0, 'ITgJuYCyPd2UVpxGl02BaH96wdb1FL1jamvFHWSB', '//localhost:8000/chat', '', '{\"msg_v\":5}', '', '127.0.0.1', 1, 0, 0, 0, 1721104000, 0, 0, 1, 1721105433, 1, 0, 0, 1721104038, 0, 0, '', '', '', 0, 0, 0, 1721105428, 1, '12345678 has left the chat!', 0, 0, '', 0, 1721104038, 0, 2, 0, 54, 1721105421, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(17, 'tiket', 5, 0, 0, 1721105998, 0, 'Ou5UpRuB9apm8Y1eBPQgRYYNIS3bMNvKnXiTeT8G', '//localhost:8000/chat', '', '{\"msg_v\":5}', '', '127.0.0.1', 1, 0, 0, 0, 1721105998, 0, 0, 0, 1721114289, 1, 0, 0, 1721112553, 0, 0, '', '', '', 0, 0, 0, 1721114284, 1, 'tiket has left the chat!', 0, 0, '', 0, 1721112552, 0, 2, 0, 65, 1721114290, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(18, '12345678', 5, 0, 0, 1721114237, 0, 'T8ckjaZnCHAcTGRkcHh5hAEadRsVYobOwhrnVi7R', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721114237, 0, 0, 1, 1721114615, 1, 0, 0, 1721114344, 0, 0, '', '', '', 0, 0, 0, 1721114610, 1, '12345678 has left the chat!', 0, 0, '', 0, 1721114344, 0, 2, 0, 68, 1721114594, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(19, '12345678', 5, 0, 0, 1721114462, 0, 'xM81gcalcpezqp2KNwptZ3leGN9UgbnXOkFWE0Sf', '//localhost:8000/chat', '', '{\"msg_v\":2}', '', '127.0.0.1', 1, 0, 0, 0, 1721114462, 0, 0, 1, 1721120619, 1, 0, 0, 1721114480, 0, 0, '', '', '', 0, 0, 0, 1721120614, 1, '12345678 has left the chat!', 0, 0, '', 0, 1721114480, 0, 2, 0, 73, 1721120611, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(20, 'tiket', 5, 0, 3, 1721115293, 0, '7A3tSxd6bunBkh3K42gsjAlrz70n2mFPvA4W8riQ', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721115293, 0, 0, 1, 1721120893, 1, 0, 0, 1721115434, 0, 0, '', '', '', 0, 0, 0, 1721120888, 1, 'tiket has left the chat!', 0, 0, '', 0, 1721115434, 0, 2, 0, 76, 1721120867, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(21, 'admin', 5, 0, 0, 1721120719, 0, 'q30fmtWI5qocyzdVwW0ntMOFV0lyDXye1qaMxuXs', '//localhost:8000/chat', '', '{\"msg_v\":3}', '', '127.0.0.1', 1, 0, 0, 0, 1721120719, 0, 0, 1, 1721121025, 1, 0, 0, 1721120732, 0, 0, '', '', '', 0, 0, 0, 1721121020, 1, 'admin has left the chat!', 0, 0, '', 0, 1721120732, 0, 2, 0, 83, 1721121000, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(22, 'test', 5, 0, 0, 1721121382, 0, 'z8bdVB755tnutLvjRsI51lIytBA2Z7JggRBTTRDp', '//localhost:8000/chat', '', '{\"msg_v\":1}', '', '127.0.0.1', 1, 0, 0, 0, 1721121382, 0, 0, 0, 1721121465, 1, 0, 0, 1721121454, 0, 0, '', '', '', 0, 0, 0, 1721121460, 1, 'test has left the chat!', 0, 0, '', 0, 1721121454, 0, 2, 0, 86, 1721121499, 0, '', 'Asia/Jakarta', '0', '0', '', '', '', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'id-ID', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chatbox`
--

CREATE TABLE `lh_chatbox` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` int(11) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_accept`
--

CREATE TABLE `lh_chat_accept` (
  `id` int(11) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctime` int(11) NOT NULL,
  `wused` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_action`
--

CREATE TABLE `lh_chat_action` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_archive_range`
--

CREATE TABLE `lh_chat_archive_range` (
  `id` int(11) NOT NULL,
  `range_from` bigint(20) UNSIGNED NOT NULL,
  `range_to` bigint(20) UNSIGNED NOT NULL,
  `older_than` int(11) NOT NULL,
  `last_id` bigint(20) NOT NULL,
  `first_id` bigint(20) NOT NULL,
  `year_month` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_blocked_user`
--

CREATE TABLE `lh_chat_blocked_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `datets` bigint(20) UNSIGNED NOT NULL,
  `chat_id` bigint(20) UNSIGNED NOT NULL,
  `dep_id` bigint(20) UNSIGNED NOT NULL,
  `nick` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btype` tinyint(1) NOT NULL DEFAULT '0',
  `expires` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `online_user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_config`
--

CREATE TABLE `lh_chat_config` (
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `explain` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_chat_config`
--

INSERT INTO `lh_chat_config` (`identifier`, `value`, `type`, `explain`, `hidden`) VALUES
('accept_chat_link_timeout', '300', 0, 'How many seconds chat accept link is valid. Set 0 to force login all the time manually.', 0),
('accept_tos_link', '#', 0, 'Change to your site Terms of Service', 0),
('activity_timeout', '5', 0, 'How long operator should go offline automatically because of inactivity. Value in minutes', 0),
('activity_track_all', '0', 0, 'Track all logged operators activity and ignore their individual settings.', 0),
('allow_reopen_closed', '0', 0, 'Allow user to reopen closed chats?', 0),
('application_name', 'a:6:{s:3:\"eng\";s:31:\"Live Helper Chat - live support\";s:3:\"lit\";s:26:\"Live Helper Chat - pagalba\";s:3:\"hrv\";s:0:\"\";s:3:\"esp\";s:0:\"\";s:3:\"por\";s:0:\"\";s:10:\"site_admin\";s:31:\"Live Helper Chat - live support\";}', 1, 'Support application name, visible in browser title.', 0),
('assign_workflow_timeout', '0', 0, 'Chats waiting in pending line more than n seconds should be auto assigned first. Time in seconds', 0),
('autoclose_abandon_pending', '0,0', 0, 'Automatically close pending chats where visitor has left a chat. Timeout in minutes, last activity by visitor <desktop timeout>,<mobile timeout>,<status chat>', 0),
('autoclose_activity_timeout', '0', 0, 'Automatically close active chat if from last visitor/operator message passed. 0 - disabled, n > 0 time in minutes', 0),
('autoclose_timeout', '0', 0, 'Automatic chats closing. 0 - disabled, n > 0 time in minutes before chat is automatically closed', 0),
('autoclose_timeout_active', '0', 0, 'Automatic active chats closing. 0 - disabled, n > 0 time in minutes before chat is automatically closed', 0),
('autoclose_timeout_bot', '0', 0, 'Automatic bot chats closing. 0 - disabled, n > 0 time in minutes before chat is automatically closed', 0),
('autoclose_timeout_pending', '0', 0, 'Automatic pending chats closing. 0 - disabled, n > 0 time in minutes before chat is automatically closed', 0),
('autologin_data', 'a:3:{i:0;b:0;s:11:\"secret_hash\";s:16:\"please_change_me\";s:7:\"enabled\";i:0;}', 0, 'Autologin configuration data', 1),
('automatically_reopen_chat', '1', 0, 'Automatically reopen chat on widget open', 0),
('autopurge_timeout', '0', 0, 'Automatic chats purging. 0 - disabled, n > 0 time in minutes before chat is automatically deleted', 0),
('banned_ip_range', '', 0, 'Which ip should not be allowed to chat', 0),
('bbc_button_visible', '1', 0, 'Show BB Code button', 0),
('bbcode_options', 'a:2:{s:3:\"div\";a:0:{}s:3:\"dio\";a:0:{}}', 0, '', 1),
('cduration_timeout_operator', '10', 0, 'How long visitor can wait for message from operator before time between messages are ignored. Values in minutes.', 0),
('cduration_timeout_user', '4', 0, 'How long operator can wait for message from visitor before time between messages are ignored. Values in minutes.', 0),
('chatbox_data', 'a:6:{i:0;b:0;s:20:\"chatbox_auto_enabled\";i:0;s:19:\"chatbox_secret_hash\";s:80:\"ITvHYxvxxoN2mgMC4N6x2NoS4E6bGL7qpxdPRI3FVkjfU5bpcWpnl7eSCMkJJ1QutOd26lPwPZJ1h9Bo\";s:20:\"chatbox_default_name\";s:7:\"Chatbox\";s:17:\"chatbox_msg_limit\";i:50;s:22:\"chatbox_default_opname\";s:7:\"Manager\";}', 0, 'Chatbox configuration', 1),
('checkstatus_timeout', '0', 0, 'Interval between chat status checks in seconds, 0 disabled.', 0),
('cleanup_cronjob', '0', 0, 'Cleanup should be done only using cronjob.', 0),
('customer_company_name', 'Live Helper Chat', 0, 'Your company name - visible in bottom left corner', 0),
('customer_site_url', 'http://livehelperchat.com', 0, 'Your site URL address', 0),
('dashboard_order', '[[\"online_operators\",\"departments_stats\",\"online_visitors\"],[\"group_chats\",\"my_chats\",\"pending_chats\",\"transfered_chats\"],[\"active_chats\",\"bot_chats\"]]', 0, 'Home page dashboard widgets order', 0),
('default_admin_theme_id', '0', 0, 'Default admin theme ID', 1),
('default_theme_id', '0', 0, 'Default theme ID.', 1),
('departament_availability', '364', 0, 'How long department availability statistic should be kept? (days)', 0),
('disable_html5_storage', '1', 0, 'Disable HMTL5 storage, check it if your site is switching between http and https', 0),
('disable_iframe_sharing', '1', 0, 'Disable iframes in sharing mode', 0),
('disable_js_execution', '1', 0, 'Disable JS execution in Co-Browsing operator window', 0),
('disable_live_autoassign', '0', 0, 'Disable live auto assign', 0),
('disable_popup_restore', '0', 0, 'Disable option in widget to open new window. Restore icon will be hidden', 0),
('disable_print', '0', 0, 'Disable chat print', 0),
('disable_send', '0', 0, 'Disable chat transcript send', 0),
('disable_txt_dwnld', '0', 0, 'Disable chat download', 0),
('do_no_track_ip', '0', 0, 'Do not track visitors IP', 0),
('enable_status_cache', '0', 0, 'Enable status check cache using Redis. PHPResque extension is required.', 0),
('encrypt_msg_after', '0', 0, 'After how many days anonymize messages', 0),
('encrypt_msg_op', '0', 0, 'Anonymize also operators messages', 0),
('explicit_http_mode', '', 0, 'Please enter explicit http mode. Either http: or https:, do not forget : at the end.', 0),
('export_hash', '9rT2fIqSVRErZs55BMGfXaVGEZNEttV7ZClQbiUdR7Nm04DQ3szxuTUz519E4SegnNTKuUAOznuTlzyG', 0, 'Chats export secret hash', 0),
('faq_email_required', '0', 0, 'Is visitor e-mail required for FAQ', 0),
('file_configuration', 'a:7:{i:0;b:0;s:5:\"ft_op\";s:47:\"gif|jpe?g|png|zip|svg|rar|xls|doc|docx|xlsx|pdf\";s:5:\"ft_us\";s:30:\"gif|jpe?g|png|svg|doc|docx|pdf\";s:6:\"fs_max\";i:2048;s:18:\"active_user_upload\";b:0;s:16:\"active_op_upload\";b:1;s:19:\"active_admin_upload\";b:1;}', 0, 'Files configuration item', 1),
('footprint_background', '0', 0, 'Footprint updates should be processed in the background. Make sure you are running workflow background cronjob.', 0),
('front_tabs', 'dashboard,online_users,online_map', 0, 'Home page tabs order', 0),
('geo_data', 'a:5:{i:0;b:0;s:21:\"geo_detection_enabled\";i:1;s:22:\"geo_service_identifier\";s:8:\"max_mind\";s:23:\"max_mind_detection_type\";s:7:\"country\";s:22:\"max_mind_city_location\";s:37:\"var/external/geoip/GeoLite2-City.mmdb\";}', 0, '', 1),
('geo_location_data', 'a:3:{s:4:\"zoom\";i:4;s:3:\"lat\";s:7:\"49.8211\";s:3:\"lng\";s:7:\"11.7835\";}', 0, '', 1),
('geoadjustment_data', 'a:8:{i:0;b:0;s:18:\"use_geo_adjustment\";b:0;s:13:\"available_for\";s:0:\"\";s:15:\"other_countries\";s:6:\"custom\";s:8:\"hide_for\";s:0:\"\";s:12:\"other_status\";s:7:\"offline\";s:11:\"rest_status\";s:6:\"hidden\";s:12:\"apply_widget\";i:0;}', 0, 'Geo adjustment settings', 1),
('hide_button_dropdown', '0', 0, 'Hide close button in dropdown', 0),
('hide_disabled_department', '1', 0, 'Hide disabled department widget', 0),
('hide_right_column_frontpage', '1', 0, 'Hide right column in frontpage', 0),
('ignorable_ip', '', 0, 'Which ip should be ignored in online users list, separate by comma', 0),
('ignore_typing', '0', 0, 'Do not store what visitor is typing', 0),
('ignore_user_status', '0', 0, 'Ignore users online statuses and use departments online hours', 0),
('inform_unread_message', '0', 0, 'Inform visitor about unread messages from operator, value in minutes. 0 - disabled', 0),
('list_closed', '0', 0, 'List closed chats', 0),
('list_online_operators', '1', 0, 'List online operators.', 0),
('list_unread', '0', 0, 'List unread chats', 0),
('listd_op', '10', 0, 'Default number of online operators to show', 0),
('max_message_length', '500', 0, 'Maximum message length in characters', 0),
('message_seen_timeout', '24', 0, 'Proactive message timeout in hours. After how many hours proactive chat mesasge should be shown again.', 0),
('mheight', '', 0, 'Messages box height', 0),
('mheight_op', '200', 0, 'Messages box height for operator', 0),
('min_phone_length', '8', 0, 'Minimum phone number length', 0),
('mobile_options', 'a:2:{s:13:\"notifications\";i:0;s:7:\"fcm_key\";s:152:\"AAAAiF8DeNk:APA91bFVHu2ybhBUTtlEtQrUEPpM2fb-5ovgo0FVNm4XxK3cYJtSwRcd-pqcBot_422yDOzHyw2p9ZFplkHrmNXjm8f5f-OIzfalGmpsypeXvnPxhU6Db1B2Z1Acc-TamHUn2F4xBJkP\";}', 0, '', 1),
('need_help_tip', '1', 0, 'Show need help tooltip?', 0),
('need_help_tip_timeout', '24', 0, 'Need help tooltip timeout, after how many hours show again tooltip?', 0),
('no_wildcard_cookie', '0', 0, 'Cookie should be valid only for domain where Javascript is embedded (excludes subdomains)', 0),
('on_close_exit_chat', '0', 0, 'On chat close exit chat', 0),
('online_if', '0', 0, '', 0),
('open_closed_chat_timeout', '1800', 0, 'How many seconds customer has to open already closed chat.', 0),
('paidchat_data', '', 0, 'Paid chat configuration', 1),
('password_data', '', 0, 'Password requirements', 1),
('preload_iframes', '0', 0, 'Preload widget. It will avoid loading delay after clicking widget', 0),
('pro_active_invite', '1', 0, 'Is pro active chat invitation active. Online users tracking also has to be enabled', 0),
('pro_active_limitation', '-1', 0, 'Pro active chats invitations limitation based on pending chats, (-1) do not limit, (0,1,n+1) number of pending chats can be for invitation to be shown.', 0),
('pro_active_show_if_offline', '0', 0, 'Should invitation logic be executed if there is no online operators', 0),
('product_enabled_module', '0', 0, 'Product module is enabled', 1),
('product_show_departament', '0', 0, 'Enable products show by departments', 1),
('recaptcha_data', 'a:4:{i:0;b:0;s:8:\"site_key\";s:0:\"\";s:10:\"secret_key\";s:0:\"\";s:7:\"enabled\";i:0;}', 0, 'Re-captcha configuration', 1),
('remember_username', '1', 0, 'Should we remember username for the next time visitor starts a chat?', 0),
('reopen_as_new', '1', 0, 'Reopen closed chat as new? Otherwise it will be reopened as active.', 0),
('reopen_chat_enabled', '0', 0, 'Reopen chat functionality enabled', 0),
('reverse_pending', '0', 0, 'Make default pending chats order from old to new', 0),
('run_departments_workflow', '0', 0, 'Should cronjob run departments transfer workflow, even if user leaves a chat', 0),
('run_unaswered_chat_workflow', '0', 0, 'Should cronjob run unanswered chats workflow and execute unaswered chats callback, 0 - no, any other number bigger than 0 is a minits how long chat have to be not accepted before executing callback.', 0),
('session_captcha', '0', 0, 'Use session captcha. LHC have to be installed on the same domain or subdomain.', 0),
('sharing_auto_allow', '0', 0, 'Do not ask permission for users to see their screen', 0),
('sharing_nodejs_enabled', '0', 0, 'NodeJs support enabled', 0),
('sharing_nodejs_path', '', 0, 'socket.io path, optional', 0),
('sharing_nodejs_secure', '0', 0, 'Connect to NodeJs in https mode', 0),
('sharing_nodejs_sllocation', 'https://cdn.jsdelivr.net/npm/socket.io-client@2/dist/socket.io.js', 0, 'Location of SocketIO JS library', 0),
('sharing_nodejs_socket_host', '', 0, 'Host where NodeJs is running', 0),
('show_language_switcher', '0', 0, 'Show users option to switch language at widget', 0),
('show_languages', 'eng,lit,hrv,esp,por,nld,ara,ger,pol,rus,ita,fre,chn,cse,nor,tur,vnm,idn,sve,per,ell,dnk,rou,bgr,tha,geo,fin,alb', 0, 'Between what languages user should be able to switch', 0),
('smtp_data', 'a:5:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:2:\"25\";s:8:\"use_smtp\";i:0;s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}', 0, 'SMTP configuration', 1),
('sound_invitation', '1', 0, 'Play sound on invitation to chat.', 0),
('speech_data', 'a:3:{i:0;b:0;s:8:\"language\";i:7;s:7:\"dialect\";s:5:\"en-US\";}', 1, '', 1),
('start_chat_data', 'a:93:{i:0;b:0;s:21:\"name_visible_in_popup\";b:1;s:27:\"name_visible_in_page_widget\";b:1;s:19:\"name_require_option\";s:8:\"required\";s:22:\"email_visible_in_popup\";b:0;s:28:\"email_visible_in_page_widget\";b:0;s:20:\"email_require_option\";s:8:\"required\";s:24:\"message_visible_in_popup\";b:0;s:30:\"message_visible_in_page_widget\";b:0;s:22:\"message_require_option\";s:8:\"required\";s:22:\"phone_visible_in_popup\";b:0;s:28:\"phone_visible_in_page_widget\";b:0;s:20:\"phone_require_option\";s:8:\"required\";s:21:\"force_leave_a_message\";b:0;s:29:\"offline_name_visible_in_popup\";b:1;s:35:\"offline_name_visible_in_page_widget\";b:1;s:27:\"offline_name_require_option\";s:8:\"required\";s:30:\"offline_phone_visible_in_popup\";b:0;s:36:\"offline_phone_visible_in_page_widget\";b:0;s:28:\"offline_phone_require_option\";s:8:\"required\";s:32:\"offline_message_visible_in_popup\";b:1;s:38:\"offline_message_visible_in_page_widget\";b:1;s:30:\"offline_message_require_option\";s:8:\"required\";s:15:\"auto_start_chat\";b:0;s:12:\"mobile_popup\";b:0;s:17:\"dont_auto_process\";b:0;s:20:\"tos_visible_in_popup\";b:0;s:12:\"requires_dep\";b:0;s:17:\"requires_dep_lock\";b:0;s:17:\"show_messages_box\";b:1;s:26:\"tos_visible_in_page_widget\";b:0;s:19:\"tos_checked_offline\";b:0;s:18:\"tos_checked_online\";b:0;s:28:\"offline_tos_visible_in_popup\";b:0;s:34:\"offline_tos_visible_in_page_widget\";b:0;s:35:\"offline_file_visible_in_page_widget\";b:0;s:29:\"offline_file_visible_in_popup\";b:0;s:11:\"name_hidden\";b:0;s:15:\"name_hidden_bot\";b:0;s:24:\"custom_fields_encryption\";s:0:\"\";s:19:\"offline_name_hidden\";b:0;s:13:\"pre_chat_html\";s:0:\"\";s:21:\"pre_offline_chat_html\";s:0:\"\";s:12:\"email_hidden\";b:0;s:16:\"email_hidden_bot\";b:0;s:20:\"offline_email_hidden\";b:0;s:15:\"user_msg_height\";s:0:\"\";s:12:\"phone_hidden\";b:0;s:16:\"phone_hidden_bot\";b:0;s:20:\"offline_phone_hidden\";b:0;s:14:\"message_hidden\";b:0;s:18:\"message_hidden_bot\";b:0;s:18:\"message_auto_start\";b:0;s:28:\"message_auto_start_key_press\";b:0;s:22:\"offline_message_hidden\";b:0;s:21:\"show_operator_profile\";b:1;s:21:\"remove_operator_space\";b:0;s:18:\"hide_message_label\";b:0;s:17:\"custom_fields_url\";s:0:\"\";s:13:\"custom_fields\";s:0:\"\";s:21:\"name_hidden_prefilled\";b:0;s:22:\"email_hidden_prefilled\";b:0;s:24:\"message_hidden_prefilled\";b:0;s:22:\"phone_hidden_prefilled\";b:0;s:29:\"offline_name_hidden_prefilled\";b:0;s:32:\"offline_message_hidden_prefilled\";b:0;s:30:\"offline_phone_hidden_prefilled\";b:0;s:18:\"disable_start_chat\";b:0;s:18:\"offline_name_width\";i:0;s:19:\"offline_email_width\";i:0;s:19:\"offline_phone_width\";i:0;s:10:\"name_width\";i:0;s:11:\"email_width\";i:0;s:11:\"phone_width\";i:0;s:17:\"hide_start_button\";b:0;s:9:\"lazy_load\";b:0;s:28:\"offline_email_require_option\";s:8:\"required\";s:30:\"offline_email_hidden_prefilled\";b:0;s:36:\"offline_email_visible_in_page_widget\";b:1;s:30:\"offline_email_visible_in_popup\";b:1;s:9:\"np_border\";b:0;s:14:\"pre_conditions\";s:108:\"{\"online\":[],\"offline\":[],\"disable\":[],\"offline_enabled\":false,\"disable_enabled\":false,\"disable_message\":\"\"}\";s:13:\"name_priority\";i:10;s:14:\"email_priority\";i:20;s:16:\"message_priority\";i:40;s:14:\"phone_priority\";i:30;s:21:\"offline_name_priority\";i:10;s:22:\"offline_email_priority\";i:20;s:24:\"offline_message_priority\";i:40;s:22:\"offline_phone_priority\";i:30;s:21:\"offline_file_priority\";i:50;s:20:\"offline_tos_priority\";i:60;s:12:\"tos_priority\";i:50;}', 0, '', 1),
('suggest_leave_msg', '1', 0, 'Suggest user to leave a message then user chooses offline department', 0),
('sync_sound_settings', 'a:16:{i:0;b:0;s:12:\"repeat_sound\";i:1;s:18:\"repeat_sound_delay\";i:5;s:10:\"show_alert\";b:0;s:22:\"new_chat_sound_enabled\";b:1;s:31:\"new_message_sound_admin_enabled\";b:1;s:30:\"new_message_sound_user_enabled\";b:1;s:14:\"online_timeout\";d:300;s:22:\"check_for_operator_msg\";d:10;s:21:\"back_office_sinterval\";d:10;s:22:\"chat_message_sinterval\";d:3.5;s:20:\"long_polling_enabled\";b:0;s:30:\"polling_chat_message_sinterval\";d:1.5;s:29:\"polling_back_office_sinterval\";d:5;s:18:\"connection_timeout\";i:30;s:28:\"browser_notification_message\";b:0;}', 0, '', 1),
('track_activity', '0', 0, 'Track users activity on site?', 0),
('track_domain', '', 0, 'Set your domain to enable user tracking across different domain subdomains.', 0),
('track_footprint', '0', 0, 'Track users footprint. For this also online visitors tracking should be enabled', 0),
('track_if_offline', '0', 0, 'Track online visitors even if there is no online operators', 0),
('track_is_online', '0', 0, 'Track is user still on site, chat status checks also has to be enabled', 0),
('track_mouse_activity', '0', 0, 'Should mouse movement be tracked as activity measure, if not checked only basic events would be tracked', 0),
('track_online_visitors', '1', 0, 'Enable online site visitors tracking', 0),
('tracked_footprint_cleanup', '90', 0, 'How many days keep records of users footprint.', 0),
('tracked_users_cleanup', '160', 0, 'How many days keep records of online users.', 0),
('tracked_users_cleanup_last', '1721097332', 0, 'Track last cleanup', 1),
('transfer_configuration', '0', 0, 'Transfer configuration', 1),
('translation_data', 'a:6:{i:0;b:0;s:19:\"translation_handler\";s:4:\"bing\";s:19:\"enable_translations\";b:0;s:14:\"bing_client_id\";s:0:\"\";s:18:\"bing_client_secret\";s:0:\"\";s:14:\"google_api_key\";s:0:\"\";}', 0, 'Translation data', 1),
('uonline_sessions', '364', 0, 'How long keep operators online sessions data? (days)', 0),
('update_ip', '127.0.0.1', 0, 'Which ip should be allowed to update DB by executing http request, separate by comma?', 0),
('use_secure_cookie', '0', 0, 'Use secure cookie, check this if you want to force SSL all the time', 0),
('valid_domains', '', 0, 'Domains where script can be embedded. E.g example.com, google.com', 0),
('voting_days_limit', '7', 0, 'How many days voting widget should not be expanded after last show', 0),
('vwait_to_long', '120', 0, 'How long we should wait before we inform operator about unanswered chat.', 0),
('xmp_data', 'a:14:{i:0;b:0;s:4:\"host\";s:15:\"talk.google.com\";s:6:\"server\";s:9:\"gmail.com\";s:8:\"resource\";s:6:\"xmpphp\";s:4:\"port\";s:4:\"5222\";s:7:\"use_xmp\";i:0;s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:11:\"xmp_message\";s:98:\"New chat request [{chat_id}] from [{department}]\r\n{messages}\r\nClick to accept a chat\r\n{url_accept}\";s:10:\"recipients\";s:0:\"\";s:20:\"xmp_accepted_message\";s:89:\"{user_name} has accepted a chat [{chat_id}] from [{department}]\r\n{messages}\r\n{url_accept}\";s:16:\"use_standard_xmp\";i:0;s:15:\"test_recipients\";s:0:\"\";s:21:\"test_group_recipients\";s:0:\"\";}', 0, 'XMP data', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_event_track`
--

CREATE TABLE `lh_chat_event_track` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_file`
--

CREATE TABLE `lh_chat_file` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `persistent` int(11) NOT NULL,
  `online_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_incoming`
--

CREATE TABLE `lh_chat_incoming` (
  `id` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `utime` bigint(20) NOT NULL,
  `incoming_id` int(11) NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_external_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_online_user`
--

CREATE TABLE `lh_chat_online_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_page` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `invitation_seen_count` int(11) NOT NULL,
  `invitation_id` int(11) NOT NULL,
  `last_visit` int(11) NOT NULL,
  `first_visit` int(11) NOT NULL,
  `total_visits` int(11) NOT NULL,
  `pages_count` int(11) NOT NULL,
  `tt_pages_count` int(11) NOT NULL,
  `invitation_count` int(11) NOT NULL,
  `last_check_time` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_country_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_country_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visitor_tz` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_user_proactive` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_user_id` int(11) NOT NULL,
  `conversion_id` int(11) NOT NULL,
  `message_seen` int(11) NOT NULL,
  `message_seen_ts` int(11) NOT NULL,
  `user_active` int(11) NOT NULL,
  `lat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lon` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reopen_chat` int(11) NOT NULL,
  `time_on_site` int(11) NOT NULL,
  `tt_time_on_site` int(11) NOT NULL,
  `requires_email` int(11) NOT NULL,
  `requires_username` int(11) NOT NULL,
  `requires_phone` int(11) NOT NULL,
  `screenshot_id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `online_attr_system` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_chat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `online_attr` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` tinyint(1) NOT NULL DEFAULT '0',
  `chat_time` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `last_visit_prev` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_chat_online_user`
--

INSERT INTO `lh_chat_online_user` (`id`, `vid`, `ip`, `current_page`, `page_title`, `referrer`, `chat_id`, `invitation_seen_count`, `invitation_id`, `last_visit`, `first_visit`, `total_visits`, `pages_count`, `tt_pages_count`, `invitation_count`, `last_check_time`, `dep_id`, `user_agent`, `notes`, `user_country_code`, `user_country_name`, `visitor_tz`, `operator_message`, `operator_user_proactive`, `operator_user_id`, `conversion_id`, `message_seen`, `message_seen_ts`, `user_active`, `lat`, `lon`, `city`, `reopen_chat`, `time_on_site`, `tt_time_on_site`, `requires_email`, `requires_username`, `requires_phone`, `screenshot_id`, `identifier`, `operation`, `online_attr_system`, `operation_chat`, `online_attr`, `device_type`, `chat_time`, `last_visit_prev`) VALUES
(1, '1c56819dd7a481bff879', '127.0.0.1', '//localhost:8000/chat', '', '', 0, 0, 0, 1721121445, 1721097332, 4, 11, 51, 0, 1721121445, 0, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '', '', '', '', '', '', 0, 0, 0, 0, 1, '0', '0', '', 0, 534, 11340, 0, 0, 0, 0, '', '', '', '', '{\"init\":\"NEW_VID: 1c56819dd7a481bff879\"}', 1, 0, 1721115279),
(2, '5f8ad65562ea68e55ac1', '127.0.0.1', '//localhost:8000/chat', 'Chat Widget', '', 22, 0, 0, 1721121446, 1721097333, 3, 26, 89, 0, 1721121446, 1, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '', '', '', 'Asia/Jakarta', '', '', 0, 0, 1, 1721121382, 1, '0', '0', '', 0, 845, 13886, 0, 0, 0, 0, '', '', '{\"username\":\"tetst\"}', '', '{\"init\":\"NEW_VID: 5f8ad65562ea68e55ac1 | \\/\\/localhost:8000\\/chat\"}', 1, 1721121382, 1721115280);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_online_user_footprint`
--

CREATE TABLE `lh_chat_online_user_footprint` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `online_user_id` int(11) NOT NULL,
  `page` varchar(2083) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_online_user_footprint_update`
--

CREATE TABLE `lh_chat_online_user_footprint_update` (
  `online_user_id` bigint(20) NOT NULL,
  `command` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_paid`
--

CREATE TABLE `lh_chat_paid` (
  `id` int(11) NOT NULL,
  `hash` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_participant`
--

CREATE TABLE `lh_chat_participant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `duration` int(11) UNSIGNED NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL,
  `dep_id` bigint(20) UNSIGNED NOT NULL,
  `frt` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `aart` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `mart` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_chat_participant`
--

INSERT INTO `lh_chat_participant` (`id`, `chat_id`, `user_id`, `duration`, `time`, `dep_id`, `frt`, `aart`, `mart`) VALUES
(1, 12, 0, 0, 1721102325, 1, 0, 0, 0),
(2, 12, -2, 1, 1721102325, 1, 0, 0, 0),
(3, 12, 1, 0, 1721102325, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_start_settings`
--

CREATE TABLE `lh_chat_start_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_chat_voice_video`
--

CREATE TABLE `lh_chat_voice_video` (
  `id` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `op_status` tinyint(4) NOT NULL,
  `vi_status` tinyint(4) NOT NULL,
  `voice` tinyint(4) NOT NULL,
  `video` tinyint(4) NOT NULL,
  `screen_share` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `ctime` int(11) NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_cobrowse`
--

CREATE TABLE `lh_cobrowse` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `online_user_id` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initialize` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `modifications` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `w` int(11) NOT NULL,
  `wh` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_departament`
--

CREATE TABLE `lh_departament` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xmpp_recipients` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xmpp_group_recipients` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `sort_priority` int(11) NOT NULL,
  `department_transfer_id` int(11) NOT NULL,
  `transfer_timeout` int(11) NOT NULL,
  `exclude_inactive_chats` int(11) NOT NULL,
  `delay_before_assign` int(11) NOT NULL,
  `max_ac_dep_chats` int(11) NOT NULL,
  `assign_same_language` int(11) NOT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `max_load` int(11) NOT NULL DEFAULT '0',
  `max_load_h` int(11) NOT NULL DEFAULT '0',
  `max_active_mails` int(11) NOT NULL DEFAULT '0',
  `active_mail_balancing` tinyint(1) NOT NULL,
  `max_ac_dep_mails` int(11) NOT NULL,
  `max_timeout_seconds_mail` int(11) NOT NULL,
  `delay_before_assign_mail` int(11) NOT NULL,
  `disabled` int(11) NOT NULL,
  `hidden` int(11) NOT NULL,
  `delay_lm` int(11) NOT NULL,
  `max_active_chats` int(11) NOT NULL,
  `max_timeout_seconds` int(11) NOT NULL,
  `identifier` varchar(2083) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mod_start_hour` int(4) NOT NULL DEFAULT '-1',
  `mod_end_hour` int(4) NOT NULL DEFAULT '-1',
  `tud_start_hour` int(4) NOT NULL DEFAULT '-1',
  `tud_end_hour` int(4) NOT NULL DEFAULT '-1',
  `wed_start_hour` int(4) NOT NULL DEFAULT '-1',
  `wed_end_hour` int(4) NOT NULL DEFAULT '-1',
  `thd_start_hour` int(4) NOT NULL DEFAULT '-1',
  `thd_end_hour` int(4) NOT NULL DEFAULT '-1',
  `frd_start_hour` int(4) NOT NULL DEFAULT '-1',
  `frd_end_hour` int(4) NOT NULL DEFAULT '-1',
  `sad_start_hour` int(4) NOT NULL DEFAULT '-1',
  `sad_end_hour` int(4) NOT NULL DEFAULT '-1',
  `sud_start_hour` int(4) NOT NULL DEFAULT '-1',
  `sud_end_hour` int(4) NOT NULL DEFAULT '-1',
  `nc_cb_execute` tinyint(1) NOT NULL,
  `na_cb_execute` tinyint(1) NOT NULL,
  `inform_unread` tinyint(1) NOT NULL,
  `active_balancing` tinyint(1) NOT NULL,
  `visible_if_online` tinyint(1) NOT NULL,
  `inform_close` int(11) NOT NULL,
  `inform_unread_delay` int(11) NOT NULL,
  `inform_options` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `online_hours_active` tinyint(1) NOT NULL,
  `inform_delay` int(11) NOT NULL,
  `attr_int_1` int(11) NOT NULL,
  `attr_int_2` int(11) NOT NULL,
  `attr_int_3` int(11) NOT NULL,
  `pending_max` int(11) NOT NULL,
  `pending_group_max` int(11) NOT NULL,
  `active_chats_counter` int(11) NOT NULL,
  `inactive_chats_cnt` int(11) NOT NULL DEFAULT '0',
  `pending_chats_counter` int(11) NOT NULL,
  `bot_chats_counter` int(11) NOT NULL DEFAULT '0',
  `inop_chats_cnt` int(11) NOT NULL DEFAULT '0',
  `acop_chats_cnt` int(11) NOT NULL DEFAULT '0',
  `inform_close_all` int(11) NOT NULL,
  `inform_close_all_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bot_configuration` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ignore_op_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_departament`
--

INSERT INTO `lh_departament` (`id`, `name`, `email`, `xmpp_recipients`, `xmpp_group_recipients`, `priority`, `sort_priority`, `department_transfer_id`, `transfer_timeout`, `exclude_inactive_chats`, `delay_before_assign`, `max_ac_dep_chats`, `assign_same_language`, `archive`, `max_load`, `max_load_h`, `max_active_mails`, `active_mail_balancing`, `max_ac_dep_mails`, `max_timeout_seconds_mail`, `delay_before_assign_mail`, `disabled`, `hidden`, `delay_lm`, `max_active_chats`, `max_timeout_seconds`, `identifier`, `mod_start_hour`, `mod_end_hour`, `tud_start_hour`, `tud_end_hour`, `wed_start_hour`, `wed_end_hour`, `thd_start_hour`, `thd_end_hour`, `frd_start_hour`, `frd_end_hour`, `sad_start_hour`, `sad_end_hour`, `sud_start_hour`, `sud_end_hour`, `nc_cb_execute`, `na_cb_execute`, `inform_unread`, `active_balancing`, `visible_if_online`, `inform_close`, `inform_unread_delay`, `inform_options`, `online_hours_active`, `inform_delay`, `attr_int_1`, `attr_int_2`, `attr_int_3`, `pending_max`, `pending_group_max`, `active_chats_counter`, `inactive_chats_cnt`, `pending_chats_counter`, `bot_chats_counter`, `inop_chats_cnt`, `acop_chats_cnt`, `inform_close_all`, `inform_close_all_email`, `alias`, `product_configuration`, `bot_configuration`, `ignore_op_status`) VALUES
(1, 'IT', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 'a:0:{}', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 0, 0, '', '', '{\"products_enabled\":0,\"products_required\":0}', '{\"auto_lower_limit\":0,\"assign_by_priority\":0,\"active_prioritized_assignment\":0,\"assign_by_priority_chat\":0,\"min_agent_priority\":0,\"min_chat_priority\":0,\"max_chat_priority\":0,\"off_op_exec\":0,\"off_op_work_hours\":0,\"ru_on_transfer\":0,\"off_if_online\":0,\"bot_id\":1,\"mailbox_id\":0,\"transfer_min_priority\":\"\",\"bot_tr_id\":0,\"theme_ind\":0,\"survey_id\":0,\"bot_only_offline\":false,\"hide_survey_bot\":false,\"bot_foh\":false,\"auto_delay_timeout\":0,\"auto_delay_var\":\"\",\"hide_send_email\":false}', 0),
(2, 'DBA', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 'a:0:{}', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '{\"products_enabled\":0,\"products_required\":0}', '{\"auto_lower_limit\":0,\"assign_by_priority\":0,\"active_prioritized_assignment\":0,\"assign_by_priority_chat\":0,\"min_agent_priority\":0,\"min_chat_priority\":0,\"max_chat_priority\":0,\"off_op_exec\":0,\"off_op_work_hours\":0,\"ru_on_transfer\":0,\"off_if_online\":0,\"bot_id\":0,\"mailbox_id\":0,\"transfer_min_priority\":\"\",\"bot_tr_id\":0,\"theme_ind\":0,\"survey_id\":0,\"bot_only_offline\":false,\"hide_survey_bot\":false,\"bot_foh\":false,\"auto_delay_timeout\":0,\"auto_delay_var\":\"\",\"hide_send_email\":false}', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_departament_availability`
--

CREATE TABLE `lh_departament_availability` (
  `id` bigint(20) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `hour` int(11) NOT NULL,
  `hourminute` int(4) NOT NULL,
  `minute` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `ymdhi` bigint(20) NOT NULL,
  `ymd` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_departament_custom_work_hours`
--

CREATE TABLE `lh_departament_custom_work_hours` (
  `id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `date_from` int(11) NOT NULL,
  `date_to` int(11) NOT NULL,
  `start_hour` int(11) NOT NULL,
  `end_hour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_departament_group`
--

CREATE TABLE `lh_departament_group` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `achats_cnt` int(11) NOT NULL DEFAULT '0',
  `inachats_cnt` int(11) NOT NULL DEFAULT '0',
  `pchats_cnt` int(11) NOT NULL DEFAULT '0',
  `max_load` int(11) NOT NULL DEFAULT '0',
  `max_load_h` int(11) NOT NULL DEFAULT '0',
  `bchats_cnt` int(11) NOT NULL DEFAULT '0',
  `inopchats_cnt` int(11) NOT NULL DEFAULT '0',
  `acopchats_cnt` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_departament_group_member`
--

CREATE TABLE `lh_departament_group_member` (
  `id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `dep_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_departament_group_user`
--

CREATE TABLE `lh_departament_group_user` (
  `id` int(11) NOT NULL,
  `dep_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `read_only` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `exc_indv_autoasign` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `assign_priority` int(11) NOT NULL DEFAULT '0',
  `chat_min_priority` int(11) NOT NULL DEFAULT '0',
  `chat_max_priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_departament_limit_group`
--

CREATE TABLE `lh_departament_limit_group` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pending_max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_departament_limit_group_member`
--

CREATE TABLE `lh_departament_limit_group_member` (
  `id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `dep_limit_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_faq`
--

CREATE TABLE `lh_faq` (
  `id` int(11) NOT NULL,
  `question` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `has_url` tinyint(1) NOT NULL,
  `is_wildcard` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_forgotpasswordhash`
--

CREATE TABLE `lh_forgotpasswordhash` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_bot`
--

CREATE TABLE `lh_generic_bot_bot` (
  `id` bigint(20) NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attr_str_3` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_generic_bot_bot`
--

INSERT INTO `lh_generic_bot_bot` (`id`, `configuration`, `avatar`, `filename`, `filepath`, `name`, `nick`, `attr_str_1`, `attr_str_2`, `attr_str_3`) VALUES
(1, '{\"exc_group_id\":[],\"bot_id\":[],\"profile_hide\":false,\"msg_hide\":false}', '', '', '', 'chat bot', 'chat bot', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_chat_event`
--

CREATE TABLE `lh_generic_bot_chat_event` (
  `id` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `counter` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_chat_workflow`
--

CREATE TABLE `lh_generic_bot_chat_workflow` (
  `id` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `trigger_id` bigint(20) NOT NULL,
  `time` int(11) NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `collected_data` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_command`
--

CREATE TABLE `lh_generic_bot_command` (
  `id` int(11) NOT NULL,
  `command` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_command` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled_display` tinyint(1) NOT NULL DEFAULT '0',
  `info_msg` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bot_id` int(11) NOT NULL,
  `trigger_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortcut_1` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortcut_2` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) UNSIGNED NOT NULL DEFAULT '1000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_exception`
--

CREATE TABLE `lh_generic_bot_exception` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_exception_message`
--

CREATE TABLE `lh_generic_bot_exception_message` (
  `id` bigint(20) NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception_group_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_group`
--

CREATE TABLE `lh_generic_bot_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_collapsed` int(11) NOT NULL DEFAULT '0',
  `pos` int(11) NOT NULL DEFAULT '0',
  `bot_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_generic_bot_group`
--

INSERT INTO `lh_generic_bot_group` (`id`, `name`, `is_collapsed`, `pos`, `bot_id`) VALUES
(1, 'IT', 0, 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_payload`
--

CREATE TABLE `lh_generic_bot_payload` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bot_id` int(11) NOT NULL,
  `trigger_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_pending_event`
--

CREATE TABLE `lh_generic_bot_pending_event` (
  `id` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `trigger_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_repeat_restrict`
--

CREATE TABLE `lh_generic_bot_repeat_restrict` (
  `id` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `trigger_id` bigint(20) DEFAULT NULL,
  `identifier` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_rest_api`
--

CREATE TABLE `lh_generic_bot_rest_api` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_rest_api_cache`
--

CREATE TABLE `lh_generic_bot_rest_api_cache` (
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rest_api_id` bigint(20) UNSIGNED NOT NULL,
  `response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_trigger`
--

CREATE TABLE `lh_generic_bot_trigger` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `bot_id` int(11) NOT NULL,
  `default` int(11) NOT NULL,
  `default_unknown` int(11) NOT NULL,
  `as_argument` int(11) NOT NULL DEFAULT '0',
  `in_progress` int(11) NOT NULL DEFAULT '0',
  `default_unknown_btn` int(11) NOT NULL DEFAULT '0',
  `default_always` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_generic_bot_trigger`
--

INSERT INTO `lh_generic_bot_trigger` (`id`, `name`, `actions`, `group_id`, `bot_id`, `default`, `default_unknown`, `as_argument`, `in_progress`, `default_unknown_btn`, `default_always`) VALUES
(1, 'Halo', '[{\"_id\":\"T-yfUeX2o\",\"type\":\"text\",\"content\":{\"text\":\"Halo , Ada yang bisa kami bantu ?\",\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true,\"as_dropdown\":false}}}]', 1, 1, 1, 0, 0, 0, 0, 0),
(2, 'SIAK itu apa ?', '[{\"_id\":\"VbNj7hPE1\",\"type\":\"text\",\"content\":{\"text\":\"SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.\",\"quick_replies\":[{\"_id\":\"Y0aQ5svUd\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi SIAK\",\"payload\":\"4\"}},{\"_id\":\"7qLpj2VdY\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}}],\"attr_options\":{\"always_show\":true}}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(3, 'Bagaimana cara mengakses SIAK ?', '[{\"_id\":\"_PQEJ6BhU\",\"type\":\"text\",\"content\":{\"text\":\"Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.\",\"quick_replies\":[{\"_id\":\"UG4PIiGh9\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\"}},{\"_id\":\"dElg2I06A\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi login\",\"payload\":\"4\"}}],\"attr_options\":{\"always_show\":true}}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(4, 'Apa yang harus dilakukan jika lupa kata sandi untuk login ke SIAK?', '[{\"_id\":\"hR2qXGHjQ\",\"type\":\"text\",\"content\":{\"text\":\"Jika Anda lupa kata sandi untuk login ke SIAK, Anda bisa menggunakan fitur \\\"Lupa Kata Sandi\\\" di halaman login. Anda akan diminta untuk memasukkan alamat email terdaftar atau nomor mahasiswa, dan instruksi untuk mereset kata sandi akan dikirimkan ke email Anda.\",\"quick_replies\":[{\"_id\":\"D_22srwe3\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}},{\"_id\":\"2tbSzpglm\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara rubah data pribadi ?\",\"payload\":\"5\"}}],\"attr_options\":{\"always_show\":true}}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(5, 'Bagaimana cara mengubah data pribadi ke siak ?', '[{\"_id\":\"JkiHOe2cT\",\"type\":\"text\",\"content\":{\"text\":\"Untuk mengubah data pribadi di SIAK, Anda harus login ke akun Anda dan mengakses menu \\\"Profil\\\" atau \\\"Pengaturan Akun\\\". Di sana, Anda dapat mengedit informasi seperti alamat, nomor telepon, dan data pribadi lainnya. Beberapa perubahan mungkin memerlukan verifikasi atau persetujuan dari pihak administrasi.\",\"quick_replies\":[{\"_id\":\"8qxOEUhLN\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi login\",\"payload\":\"4\"}},{\"_id\":\"jy6o9wWCc\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara melihat jadwal SIAK ?\",\"payload\":\"6\"}}],\"attr_options\":{\"always_show\":true}}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(6, 'Bagaimana cara melihat jadwal kuliah di SIAK?', '[{\"_id\":\"XXhz720Sd\",\"type\":\"text\",\"content\":{\"text\":\"Untuk melihat jadwal kuliah di SIAK, login ke akun Anda dan navigasikan ke menu \\\"Jadwal Kuliah\\\" atau \\\"Akademik\\\". Di sana, Anda akan menemukan jadwal kuliah yang telah ditetapkan untuk semester berjalan.\",\"quick_replies\":[{\"_id\":\"BJYZUJOzZ\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara rubah data pribadi ?\",\"payload\":\"5\"}},{\"_id\":\"oZPZWgHdI\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara daftar matkul ?\",\"payload\":\"7\"}}],\"attr_options\":{\"always_show\":true}}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(7, 'Bagaimana cara mendaftar mata kuliah melalui SIAK?', '[{\"_id\":\"5tVd0VamS\",\"type\":\"text\",\"content\":{\"text\":\"Untuk mendaftar mata kuliah melalui SIAK, login ke akun Anda dan akses menu \\\"Pendaftaran Mata Kuliah\\\" atau \\\"KRS (Kartu Rencana Studi)\\\". Pilih mata kuliah yang ingin Anda ambil dan ikuti instruksi untuk menyelesaikan pendaftaran.\",\"quick_replies\":[{\"_id\":\"8txUs-QaE\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara melihat jadwal SIAK ?\",\"payload\":\"6\"}},{\"_id\":\"6q9TQlLO7\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara tidak bisa akses SIAK ?\",\"payload\":\"8\"}}],\"attr_options\":{\"always_show\":true}}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(8, 'Apa yang harus dilakukan jika tidak bisa mengakses SIAK?', '[{\"_id\":\"OM4_lBIJh\",\"type\":\"text\",\"content\":{\"text\":\"ika Anda tidak bisa mengakses SIAK, coba langkah-langkah berikut:\\n\\u2022\\tPastikan Anda menggunakan kredensial yang benar.\\n\\u2022\\tPeriksa koneksi internet Anda.\\n\\u2022\\tCoba gunakan browser yang berbeda atau bersihkan cache browser Anda.\\n\\u2022\\tJika masalah berlanjut, hubungi helpdesk SIAK melalui telepon, email, atau sistem tiket.\\n\",\"quick_replies\":[{\"_id\":\"q5Ko-kTrO\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara daftar matkul SIAK ?\",\"payload\":\"7\"}},{\"_id\":\"YaS-MfiBy\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara melihat nilai SIAK ?\",\"payload\":\"9\"}}],\"attr_options\":{\"always_show\":true}}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(9, 'Bagaimana cara melihat nilai di SIAK?', '[{\"_id\":\"t2oyFbthR\",\"type\":\"text\",\"content\":{\"text\":\"Untuk melihat nilai di SIAK, login ke akun Anda dan navigasikan ke menu \\\"Nilai\\\" atau \\\"Transkrip Akademik\\\". Di sana, Anda akan melihat daftar nilai untuk setiap mata kuliah yang telah Anda ambil.\",\"quick_replies\":[{\"_id\":\"XnV8-3dXA\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara jika tidak bisa akses SIAK ?\",\"payload\":\"8\"}},{\"_id\":\"Cf5p7oP3O\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana jika ada kesalahan data di SIAK ?\",\"payload\":\"10\"}}],\"attr_options\":{\"always_show\":true}}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(10, 'Apa yang harus dilakukan jika ada kesalahan data di SIAK?', '[{\"_id\":\"A-aG0Vlw8\",\"type\":\"text\",\"content\":{\"text\":\"Jika Anda menemukan kesalahan data di SIAK, segera laporkan ke helpdesk SIAK dengan memberikan rincian kesalahan dan data yang benar. Mereka akan membantu memperbaiki kesalahan tersebut sesegera mungkin.\",\"quick_replies\":[{\"_id\":\"o6GSB7JdM\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara melihat nilai SIAK ?\",\"payload\":\"9\"}},{\"_id\":\"wjvKQDW3S\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara menghubungi Helpdesk ?\",\"payload\":\"11\"}}],\"attr_options\":{\"always_show\":true}}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(11, 'Bagaimana cara menghubungi helpdesk SIAK?', '[{\"_id\":\"w6AvEdTgX\",\"type\":\"text\",\"content\":{\"text\":\"Anda dapat menghubungi helpdesk SIAK melalui beberapa saluran, seperti:\\n\\u2022\\tTelepon: Nomor telepon yang disediakan oleh institusi.\\n\\u2022\\tEmail: Alamat email resmi helpdesk SIAK.\\n\\u2022\\tChat online: Jika tersedia, melalui portal SIAK.\\n\\u2022\\tSistem tiket: Menggunakan sistem tiket yang disediakan di portal SIAK.\\n\",\"quick_replies\":[{\"_id\":\"VVTWUnMT9\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana jika ada kesalahan data di SIAK ?\",\"payload\":\"10\"}},{\"_id\":\"nSJaVYnNZ\",\"type\":\"trigger\",\"content\":{\"name\":\"Done\",\"payload\":\"12\"}}],\"attr_options\":{\"always_show\":true}}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(12, 'Done', '[{\"_id\":\"ALxwo1V2j\",\"type\":\"text\",\"content\":{\"text\":\"Terimakasih sudah menggunakan layanan kami , sampai jumpa di lain waktu.\",\"quick_replies\":[{\"_id\":\"dNGYXbB9v\",\"type\":\"trigger\",\"content\":{\"name\":\"Ulangi percakapan\",\"payload\":\"1\"}}]}}]', 1, 1, 0, 0, 0, 0, 0, 0),
(13, 'New trigger', '', 1, 1, 0, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_trigger_event`
--

CREATE TABLE `lh_generic_bot_trigger_event` (
  `id` bigint(20) NOT NULL,
  `pattern` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pattern_exc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `trigger_id` bigint(20) NOT NULL,
  `bot_id` int(11) NOT NULL,
  `skip` tinyint(1) NOT NULL DEFAULT '0',
  `on_start_type` tinyint(1) NOT NULL,
  `priority` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_generic_bot_trigger_event`
--

INSERT INTO `lh_generic_bot_trigger_event` (`id`, `pattern`, `pattern_exc`, `configuration`, `trigger_id`, `bot_id`, `skip`, `on_start_type`, `priority`, `type`) VALUES
(1, 'default', '', '{}', 1, 1, 0, 0, 0, 0),
(2, 'definisi siak', '', '{}', 2, 1, 0, 0, 0, 0),
(3, 'akses siak', '', '{}', 3, 1, 0, 0, 0, 0),
(4, 'lupa sandi', '', '{}', 4, 1, 0, 0, 0, 0),
(6, 'ubah data pribadi', '', '{}', 5, 1, 0, 0, 0, 0),
(7, 'jadwal kuliah siak', '', '{}', 6, 1, 0, 0, 0, 0),
(8, 'daftar matkul siak', '', '{}', 7, 1, 0, 0, 0, 0),
(9, 'kendala akses', '', '{}', 8, 1, 0, 0, 0, 0),
(10, 'nilai siak', '', '{}', 9, 1, 0, 0, 0, 0),
(11, 'kesalahan data siak', '', '{}', 10, 1, 0, 0, 0, 0),
(12, 'helpdesk siak', '', '{}', 11, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_trigger_event_template`
--

CREATE TABLE `lh_generic_bot_trigger_event_template` (
  `id` bigint(20) NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_generic_bot_trigger_event_template`
--

INSERT INTO `lh_generic_bot_trigger_event_template` (`id`, `configuration`, `name`) VALUES
(1, '[{\"pattern_exc\":\"\",\"trigger_id\":2,\"priority\":0,\"configuration_array\":[],\"pattern\":\"definisi siak\",\"bot_id\":1,\"configuration\":null,\"on_start_type\":0,\"type\":0,\"id\":2,\"skip\":0}]', 'definisi siak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_trigger_template`
--

CREATE TABLE `lh_generic_bot_trigger_template` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actions` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_tr_group`
--

CREATE TABLE `lh_generic_bot_tr_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bot_lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_translation_service` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `filename` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_generic_bot_tr_item`
--

CREATE TABLE `lh_generic_bot_tr_item` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `auto_translate` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translation` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_group`
--

CREATE TABLE `lh_group` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_group`
--

INSERT INTO `lh_group` (`id`, `name`, `disabled`, `required`) VALUES
(1, 'Administrators', 0, 0),
(2, 'Operators', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_grouprole`
--

CREATE TABLE `lh_grouprole` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_grouprole`
--

INSERT INTO `lh_grouprole` (`id`, `group_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_groupuser`
--

CREATE TABLE `lh_groupuser` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_groupuser`
--

INSERT INTO `lh_groupuser` (`id`, `group_id`, `user_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_group_chat`
--

CREATE TABLE `lh_group_chat` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chat_id` bigint(20) NOT NULL DEFAULT '0',
  `last_msg_op_id` bigint(20) NOT NULL,
  `last_msg` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_user_msg_time` int(11) NOT NULL,
  `last_msg_id` bigint(20) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `tm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_group_chat_member`
--

CREATE TABLE `lh_group_chat_member` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `last_activity` int(11) NOT NULL,
  `last_msg_id` bigint(20) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `jtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_group_msg`
--

CREATE TABLE `lh_group_msg` (
  `id` bigint(20) NOT NULL,
  `msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name_support` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_group_object`
--

CREATE TABLE `lh_group_object` (
  `id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_group_work`
--

CREATE TABLE `lh_group_work` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_work_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_incoming_webhook`
--

CREATE TABLE `lh_incoming_webhook` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_id` int(11) NOT NULL,
  `scope` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_color` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_incoming` tinyint(1) UNSIGNED NOT NULL,
  `log_failed_parse` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_mail_archive_range`
--

CREATE TABLE `lh_mail_archive_range` (
  `id` int(11) NOT NULL,
  `range_from` bigint(20) UNSIGNED NOT NULL,
  `range_to` bigint(20) UNSIGNED NOT NULL,
  `older_than` int(11) NOT NULL,
  `last_id` bigint(20) NOT NULL,
  `first_id` bigint(20) NOT NULL,
  `year_month` int(11) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_mail_continuous_event`
--

CREATE TABLE `lh_mail_continuous_event` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_msg`
--

CREATE TABLE `lh_msg` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_msg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `del_st` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name_support` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_msg`
--

INSERT INTO `lh_msg` (`id`, `msg`, `meta_msg`, `time`, `chat_id`, `user_id`, `del_st`, `name_support`) VALUES
(1, 'Halo , Ada yang bisa kami bantu ?', '', 1721098564, 1, -2, 3, 'chat bot'),
(2, 'halo', '', 1721098635, 1, 0, 0, ''),
(3, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\"}}]},\"processed\":true}', 1721099311, 2, -2, 3, 'chat bot'),
(4, 'SIAK itu apa ?', '', 1721099313, 2, 0, 0, ''),
(5, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '', 1721099314, 2, -2, 3, 'chat bot'),
(6, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\",\"render_precheck_function\":\"akses siak\"}}]},\"processed\":true}', 1721099369, 3, -2, 3, 'chat bot'),
(7, 'SIAK itu apa ?', '', 1721099370, 3, 0, 0, ''),
(8, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '', 1721099371, 3, -2, 3, 'chat bot'),
(9, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\",\"render_precheck_function\":\"akses siak\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721099529, 4, -2, 3, 'chat bot'),
(10, 'SIAK itu apa ?', '', 1721099533, 4, 0, 0, ''),
(11, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '', 1721099534, 4, -2, 3, 'chat bot'),
(12, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721101077, 5, -2, 3, 'chat bot'),
(13, 'SIAK itu apa ?', '', 1721101080, 5, 0, 0, ''),
(14, 'Anda dapat menghubungi helpdesk SIAK melalui beberapa saluran, seperti:\n•	Telepon: Nomor telepon yang disediakan oleh institusi.\n•	Email: Alamat email resmi helpdesk SIAK.\n•	Chat online: Jika tersedia, melalui portal SIAK.\n•	Sistem tiket: Menggunakan sistem tiket yang disediakan di portal SIAK.', '', 1721101081, 5, -2, 3, 'chat bot'),
(15, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721101155, 6, -2, 3, 'chat bot'),
(16, 'Bagaimana cara mengakses SIAK ?', '', 1721101158, 6, 0, 0, ''),
(17, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721101186, 7, -2, 3, 'chat bot'),
(18, 'SIAK itu apa ?', '', 1721101188, 7, 0, 0, ''),
(19, '[level=system-warning exit-visitor]tiket has closed the chat explicitly![/level] [button_action=send_manual_message]invite to chat[/button_action]', '', 1721101220, 7, -1, 0, ''),
(20, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721101229, 8, -2, 3, 'chat bot'),
(21, 'SIAK itu apa ?', '', 1721101231, 8, 0, 0, ''),
(22, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '', 1721101232, 8, -2, 3, 'chat bot'),
(23, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721101270, 9, -2, 3, 'chat bot'),
(24, 'Bagaimana cara mengakses SIAK ?', '', 1721101273, 9, 0, 0, ''),
(25, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '', 1721101274, 9, -2, 3, 'chat bot'),
(26, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721101297, 10, -2, 3, 'chat bot'),
(27, 'SIAK itu apa ?', '', 1721101299, 10, 0, 0, ''),
(28, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '', 1721101300, 10, -2, 3, 'chat bot'),
(29, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721102046, 11, -2, 3, 'chat bot'),
(30, 'Bagaimana cara mengakses SIAK ?', '', 1721102054, 11, 0, 0, ''),
(31, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '', 1721102055, 11, -2, 3, 'chat bot'),
(32, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"button\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"button\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721102325, 12, -2, 3, 'chat bot'),
(33, 'SIAK itu apa ?', '', 1721102328, 12, 0, 0, ''),
(34, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '', 1721102329, 12, -2, 3, 'chat bot'),
(35, 'Halo', '', 1721102812, 12, 1, 3, 'Ihya Wibowo'),
(36, 'Ihya Wibowo has closed the chat!', '', 1721102991, 12, -1, 0, 'Ihya Wibowo'),
(37, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":false,\"as_dropdown\":true}}}', 1721103163, 13, -2, 3, 'chat bot'),
(38, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true,\"as_dropdown\":false}},\"processed\":true}', 1721103215, 14, -2, 3, 'chat bot'),
(39, 'SIAK itu apa ?', '', 1721103217, 14, 0, 0, ''),
(40, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '', 1721103218, 14, -2, 3, 'chat bot'),
(41, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true,\"as_dropdown\":false}},\"processed\":true}', 1721103233, 15, -2, 3, 'chat bot'),
(42, 'Bagaimana cara mengakses SIAK ?', '', 1721103234, 15, 0, 0, ''),
(43, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '', 1721103235, 15, -2, 3, 'chat bot'),
(44, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true,\"as_dropdown\":false}},\"processed\":true}', 1721104000, 16, -2, 3, 'chat bot'),
(45, 'SIAK itu apa ?', '', 1721104004, 16, 0, 0, ''),
(46, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '{\"content\":{\"quick_replies\":[{\"_id\":\"Y0aQ5svUd\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi SIAK\",\"payload\":\"4\"}},{\"_id\":\"7qLpj2VdY\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721104005, 16, -2, 3, 'chat bot'),
(47, 'Bagaimana cara akses SIAK ?', '', 1721104018, 16, 0, 0, ''),
(48, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '{\"content\":{\"quick_replies\":[{\"_id\":\"UG4PIiGh9\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\"}},{\"_id\":\"dElg2I06A\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi login\",\"payload\":\"4\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721104019, 16, -2, 3, 'chat bot'),
(49, 'Lupa kata sandi login', '', 1721104025, 16, 0, 0, ''),
(50, 'Jika Anda lupa kata sandi untuk login ke SIAK, Anda bisa menggunakan fitur \"Lupa Kata Sandi\" di halaman login. Anda akan diminta untuk memasukkan alamat email terdaftar atau nomor mahasiswa, dan instruksi untuk mereset kata sandi akan dikirimkan ke email Anda.', '{\"content\":{\"quick_replies\":[{\"_id\":\"D_22srwe3\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}},{\"_id\":\"2tbSzpglm\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara rubah data pribadi ?\",\"payload\":\"5\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721104026, 16, -2, 3, 'chat bot'),
(51, 'Bagaimana cara rubah data pribadi ?', '', 1721104034, 16, 0, 0, ''),
(52, 'Untuk mengubah data pribadi di SIAK, Anda harus login ke akun Anda dan mengakses menu \"Profil\" atau \"Pengaturan Akun\". Di sana, Anda dapat mengedit informasi seperti alamat, nomor telepon, dan data pribadi lainnya. Beberapa perubahan mungkin memerlukan verifikasi atau persetujuan dari pihak administrasi.', '{\"content\":{\"quick_replies\":[{\"_id\":\"8qxOEUhLN\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi login\",\"payload\":\"4\"}},{\"_id\":\"jy6o9wWCc\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara melihat jadwal SIAK ?\",\"payload\":\"6\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721104035, 16, -2, 3, 'chat bot'),
(53, 'Bagaimana cara melihat jadwal SIAK ?', '', 1721104038, 16, 0, 0, ''),
(54, 'Untuk melihat jadwal kuliah di SIAK, login ke akun Anda dan navigasikan ke menu \"Jadwal Kuliah\" atau \"Akademik\". Di sana, Anda akan menemukan jadwal kuliah yang telah ditetapkan untuk semester berjalan.', '', 1721104039, 16, -2, 3, 'chat bot'),
(55, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true,\"as_dropdown\":false}},\"processed\":true}', 1721105998, 17, -2, 3, 'chat bot'),
(56, 'SIAK itu apa ?', '', 1721106005, 17, 0, 0, ''),
(57, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '{\"content\":{\"quick_replies\":[{\"_id\":\"Y0aQ5svUd\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi SIAK\",\"payload\":\"4\"}},{\"_id\":\"7qLpj2VdY\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721106006, 17, -2, 3, 'chat bot'),
(58, 'Lupa kata sandi SIAK', '', 1721112391, 17, 0, 0, ''),
(59, 'Jika Anda lupa kata sandi untuk login ke SIAK, Anda bisa menggunakan fitur \"Lupa Kata Sandi\" di halaman login. Anda akan diminta untuk memasukkan alamat email terdaftar atau nomor mahasiswa, dan instruksi untuk mereset kata sandi akan dikirimkan ke email Anda.', '{\"content\":{\"quick_replies\":[{\"_id\":\"D_22srwe3\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}},{\"_id\":\"2tbSzpglm\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara rubah data pribadi ?\",\"payload\":\"5\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721112392, 17, -2, 3, 'chat bot'),
(60, 'Bagaimana cara akses SIAK ?', '', 1721112404, 17, 0, 0, ''),
(61, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '{\"content\":{\"quick_replies\":[{\"_id\":\"UG4PIiGh9\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\"}},{\"_id\":\"dElg2I06A\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi login\",\"payload\":\"4\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721112405, 17, -2, 3, 'chat bot'),
(62, 'SIAK itu apa ?', '', 1721112421, 17, 0, 0, ''),
(63, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '{\"content\":{\"quick_replies\":[{\"_id\":\"Y0aQ5svUd\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi SIAK\",\"payload\":\"4\"}},{\"_id\":\"7qLpj2VdY\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721112422, 17, -2, 3, 'chat bot'),
(64, 'Bagaimana cara akses SIAK ?', '', 1721112552, 17, 0, 0, ''),
(65, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '{\"content\":{\"quick_replies\":[{\"_id\":\"UG4PIiGh9\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\"}},{\"_id\":\"dElg2I06A\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi login\",\"payload\":\"4\"}}],\"attr_options\":{\"always_show\":true}}}', 1721112553, 17, -2, 3, 'chat bot'),
(66, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true,\"as_dropdown\":false}},\"processed\":true}', 1721114237, 18, -2, 3, 'chat bot'),
(67, 'Bagaimana cara mengakses SIAK ?', '', 1721114344, 18, 0, 0, ''),
(68, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '{\"content\":{\"quick_replies\":[{\"_id\":\"UG4PIiGh9\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\"}},{\"_id\":\"dElg2I06A\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi login\",\"payload\":\"4\"}}],\"attr_options\":{\"always_show\":true}}}', 1721114345, 18, -2, 3, 'chat bot'),
(69, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true,\"as_dropdown\":false}},\"processed\":true}', 1721114462, 19, -2, 3, 'chat bot'),
(70, 'Bagaimana cara mengakses SIAK ?', '', 1721114468, 19, 0, 0, ''),
(71, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '{\"content\":{\"quick_replies\":[{\"_id\":\"UG4PIiGh9\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\"}},{\"_id\":\"dElg2I06A\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi login\",\"payload\":\"4\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721114469, 19, -2, 3, 'chat bot'),
(72, 'SIAK itu apa ?', '', 1721114480, 19, 0, 0, ''),
(73, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '{\"content\":{\"quick_replies\":[{\"_id\":\"Y0aQ5svUd\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi SIAK\",\"payload\":\"4\"}},{\"_id\":\"7qLpj2VdY\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}}],\"attr_options\":{\"always_show\":true}}}', 1721114481, 19, -2, 3, 'chat bot'),
(74, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true,\"as_dropdown\":false}},\"processed\":true}', 1721115293, 20, -2, 3, 'chat bot'),
(75, 'SIAK itu apa ?', '', 1721115434, 20, 0, 0, ''),
(76, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '{\"content\":{\"quick_replies\":[{\"_id\":\"Y0aQ5svUd\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi SIAK\",\"payload\":\"4\"}},{\"_id\":\"7qLpj2VdY\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}}],\"attr_options\":{\"always_show\":true}}}', 1721115435, 20, -2, 3, 'chat bot'),
(77, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true,\"as_dropdown\":false}},\"processed\":true}', 1721120719, 21, -2, 3, 'chat bot'),
(78, 'SIAK itu apa ?', '', 1721120722, 21, 0, 0, ''),
(79, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '{\"content\":{\"quick_replies\":[{\"_id\":\"Y0aQ5svUd\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi SIAK\",\"payload\":\"4\"}},{\"_id\":\"7qLpj2VdY\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721120723, 21, -2, 3, 'chat bot'),
(80, 'Bagaimana cara akses SIAK ?', '', 1721120730, 21, 0, 0, ''),
(81, 'Untuk mengakses SIAK, Anda perlu mengunjungi portal SIAK resmi institusi Anda dan login menggunakan kredensial yang diberikan, seperti nomor mahasiswa atau email institusi dan kata sandi.', '{\"content\":{\"quick_replies\":[{\"_id\":\"UG4PIiGh9\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\"}},{\"_id\":\"dElg2I06A\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi login\",\"payload\":\"4\"}}],\"attr_options\":{\"always_show\":true}},\"processed\":true}', 1721120731, 21, -2, 3, 'chat bot'),
(82, 'Lupa kata sandi login', '', 1721120732, 21, 0, 0, ''),
(83, 'Jika Anda lupa kata sandi untuk login ke SIAK, Anda bisa menggunakan fitur \"Lupa Kata Sandi\" di halaman login. Anda akan diminta untuk memasukkan alamat email terdaftar atau nomor mahasiswa, dan instruksi untuk mereset kata sandi akan dikirimkan ke email Anda.', '{\"content\":{\"quick_replies\":[{\"_id\":\"D_22srwe3\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}},{\"_id\":\"2tbSzpglm\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara rubah data pribadi ?\",\"payload\":\"5\"}}],\"attr_options\":{\"always_show\":true}}}', 1721120733, 21, -2, 3, 'chat bot'),
(84, 'Halo , Ada yang bisa kami bantu ?', '{\"content\":{\"quick_replies\":[{\"_id\":\"JFKOaewh2\",\"type\":\"trigger\",\"content\":{\"name\":\"SIAK itu apa ?\",\"payload\":\"2\",\"render_precheck_function\":\"definisi siak\"}},{\"_id\":\"S4HNUopAG\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara mengakses SIAK ?\",\"payload\":\"3\",\"render_precheck_function\":\"akses siak\",\"no_name\":false,\"button_class\":\"\"}}],\"attr_options\":{\"always_show\":true,\"as_dropdown\":false}},\"processed\":true}', 1721121382, 22, -2, 3, 'chat bot'),
(85, 'SIAK itu apa ?', '', 1721121454, 22, 0, 0, ''),
(86, 'SIAK (Sistem Informasi Akademik) adalah sistem yang digunakan oleh institusi pendidikan untuk mengelola data akademik, seperti pendaftaran mahasiswa, jadwal kuliah, nilai, absensi, dan administrasi lainnya. Sistem ini memudahkan proses administrasi akademik bagi mahasiswa, dosen, dan staf.', '{\"content\":{\"quick_replies\":[{\"_id\":\"Y0aQ5svUd\",\"type\":\"trigger\",\"content\":{\"name\":\"Lupa kata sandi SIAK\",\"payload\":\"4\"}},{\"_id\":\"7qLpj2VdY\",\"type\":\"trigger\",\"content\":{\"name\":\"Bagaimana cara akses SIAK ?\",\"payload\":\"3\"}}],\"attr_options\":{\"always_show\":true}}}', 1721121455, 22, -2, 3, 'chat bot');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_notification_subscriber`
--

CREATE TABLE `lh_notification_subscriber` (
  `id` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `online_user_id` bigint(20) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `utime` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` tinyint(1) NOT NULL,
  `subscriber_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uagent` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_error` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_question`
--

CREATE TABLE `lh_question` (
  `id` int(11) NOT NULL,
  `question` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `is_voting` int(11) NOT NULL,
  `question_intro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `revote` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_question_answer`
--

CREATE TABLE `lh_question_answer` (
  `id` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ctime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_question_option`
--

CREATE TABLE `lh_question_option` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_question_option_answer`
--

CREATE TABLE `lh_question_option_answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_role`
--

CREATE TABLE `lh_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_role`
--

INSERT INTO `lh_role` (`id`, `name`) VALUES
(1, 'Administrators'),
(2, 'Operators');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_rolefunction`
--

CREATE TABLE `lh_rolefunction` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `function` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limitation` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_rolefunction`
--

INSERT INTO `lh_rolefunction` (`id`, `role_id`, `module`, `function`, `limitation`) VALUES
(1, 1, '*', '*', ''),
(2, 2, 'lhuser', 'selfedit', ''),
(3, 2, 'lhuser', 'change_chat_nickname', ''),
(4, 2, 'lhuser', 'changephoto', ''),
(5, 2, 'lhuser', 'change_job_title', ''),
(6, 2, 'lhuser', 'change_core_attributes', ''),
(7, 2, 'lhuser', 'change_name_surname', ''),
(8, 2, 'lhuser', 'selfedit', ''),
(9, 2, 'lhuser', 'changeonlinestatus', ''),
(10, 2, 'lhuser', 'changeskypenick', ''),
(11, 2, 'lhuser', 'personalcannedmsg', ''),
(12, 2, 'lhuser', 'change_visibility_list', ''),
(13, 2, 'lhuser', 'see_assigned_departments', ''),
(14, 2, 'lhuser', 'canseedepartmentstats', ''),
(15, 2, 'lhchat', 'use', ''),
(16, 2, 'lhchat', 'open_all', ''),
(17, 2, 'lhchat', 'chattabschrome', ''),
(18, 2, 'lhchat', 'singlechatwindow', ''),
(19, 2, 'lhchat', 'allowopenremotechat', ''),
(20, 2, 'lhchat', 'writeremotechat', ''),
(21, 2, 'lhchat', 'allowchattabs', ''),
(22, 2, 'lhchat', 'use_onlineusers', ''),
(23, 2, 'lhchat', 'take_screenshot', ''),
(24, 2, 'lhchat', 'editprevious', ''),
(25, 2, 'lhfront', 'use', ''),
(26, 2, 'lhsystem', 'use', ''),
(27, 2, 'lhtranslation', 'use', ''),
(28, 2, 'lhchat', 'allowblockusers', ''),
(29, 2, 'lhsystem', 'generatejs', ''),
(30, 2, 'lhsystem', 'changelanguage', ''),
(31, 2, 'lhchat', 'allowredirect', ''),
(32, 2, 'lhchat', 'allowtransfer', ''),
(33, 2, 'lhchat', 'allowtransferdirectly', ''),
(34, 2, 'lhchat', 'administratecannedmsg', ''),
(35, 2, 'lhchat', 'explorecannedmsg', ''),
(36, 2, 'lhchat', 'sees_all_online_visitors', ''),
(37, 2, 'lhchat', 'list_all_chats', ''),
(38, 2, 'lhchat', 'use_unhidden_phone', ''),
(39, 2, 'lhchat', 'chat_see_email', ''),
(40, 2, 'lhchat', 'chat_see_unhidden_email', ''),
(41, 2, 'lhchat', 'see_sensitive_information', ''),
(42, 2, 'lhchat', 'whispermode', ''),
(43, 2, 'lhpermission', 'see_permissions', ''),
(44, 2, 'lhquestionary', 'manage_questionary', ''),
(45, 2, 'lhfaq', 'manage_faq', ''),
(46, 2, 'lhchatbox', 'manage_chatbox', ''),
(47, 2, 'lhbrowseoffer', 'manage_bo', ''),
(48, 2, 'lhxml', '*', ''),
(49, 2, 'lhcobrowse', 'browse', ''),
(50, 2, 'lhfile', 'use_operator', ''),
(51, 2, 'lhfile', 'file_delete_chat', ''),
(52, 2, 'lhstatistic', 'use', ''),
(53, 2, 'lhspeech', 'changedefaultlanguage', ''),
(54, 2, 'lhspeech', 'use', ''),
(55, 2, 'lhcannedmsg', 'use', ''),
(56, 2, 'lhcannedmsg', 'see_global', ''),
(57, 2, 'lhchat', 'prev_chats', ''),
(58, 2, 'lhchat', 'allowopenclosedchats', ''),
(59, 2, 'lhtheme', 'personaltheme', ''),
(60, 2, 'lhuser', 'userlistonline', ''),
(61, 2, 'lhspeech', 'change_chat_recognition', ''),
(62, 2, 'lhgroupchat', 'use', ''),
(63, 2, 'lhuser', 'see_all_group_users', ''),
(64, 2, 'lhvoicevideo', 'use', ''),
(65, 2, 'lhtheme', 'use_operator', ''),
(66, 2, 'lhgenericbot', 'use_operator', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_speech_chat_language`
--

CREATE TABLE `lh_speech_chat_language` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `dialect` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_speech_language`
--

CREATE TABLE `lh_speech_language` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siteaccess` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_speech_language`
--

INSERT INTO `lh_speech_language` (`id`, `name`, `siteaccess`) VALUES
(1, 'Afrikaans', ''),
(2, 'Bahasa Indonesia', ''),
(3, 'Bahasa Melayu', ''),
(4, 'Català', ''),
(5, 'Čeština', 'cse'),
(6, 'Deutsch', 'ger'),
(7, 'English', ''),
(8, 'Español', 'esp'),
(9, 'Euskara', ''),
(10, 'Français', 'fre'),
(11, 'Galego', ''),
(12, 'Hrvatski', ''),
(13, 'IsiZulu', ''),
(14, 'Íslenska', ''),
(15, 'Italiano', 'ita'),
(16, 'Magyar', ''),
(17, 'Nederlands', 'nld'),
(18, 'Norsk bokmål', ''),
(19, 'Polski', 'pol'),
(20, 'Português', 'por'),
(21, 'Română', ''),
(22, 'Slovenčina', 'svk'),
(23, 'Suomi', 'fin'),
(24, 'Svenska', ''),
(25, 'Türkçe', 'tur'),
(26, 'български', ''),
(27, 'Pусский', 'rus'),
(28, 'Српски', ''),
(29, '한국어', ''),
(30, '中文', ''),
(31, '日本語', ''),
(32, 'Lingua latīna', ''),
(33, 'Lithuanian', 'lit'),
(34, 'Latvia', ''),
(35, 'Afar', ''),
(36, 'Arabic', ''),
(37, 'Assamese', ''),
(38, 'Azerbaijani', ''),
(39, 'Bulgarian', 'bgr'),
(40, 'Bangla', ''),
(41, 'Bosnian', ''),
(42, 'Cakchiquel', ''),
(43, 'Danish', ''),
(44, 'Greek', ''),
(45, 'Estonian', ''),
(46, 'Persian', ''),
(47, 'Filipino', ''),
(48, 'Gujarati', ''),
(49, 'Hebrew', ''),
(50, 'Croatian', ''),
(51, 'Indonesia', ''),
(52, 'Icelandic', ''),
(53, 'Georgian', ''),
(54, 'Maori (New Zealand)', ''),
(55, 'Macedonian', ''),
(56, 'Malay (Latin)', ''),
(57, 'Maltese', ''),
(58, 'Norwegian Nynorsk', ''),
(59, 'Norwegian', 'nor'),
(60, 'Northern Sotho (South Africa)', ''),
(61, 'Slovenian', ''),
(63, 'Thai', ''),
(64, 'Tagalog', ''),
(65, 'Tongan', ''),
(66, 'Ukrainian', ''),
(67, 'Vietnamese', 'vnm'),
(68, 'Chinese', 'chn');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_speech_language_dialect`
--

CREATE TABLE `lh_speech_language_dialect` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `lang_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_speech_language_dialect`
--

INSERT INTO `lh_speech_language_dialect` (`id`, `language_id`, `lang_name`, `lang_code`, `short_code`) VALUES
(1, 1, 'Afrikaans', 'af-ZA', 'af'),
(2, 2, 'Bahasa Indonesia', 'id-ID', 'id'),
(3, 3, 'Bahasa Melayu', 'ms-MY', ''),
(4, 4, 'Català', 'ca-ES', ''),
(5, 5, 'Čeština', 'cs-CZ', 'cs'),
(6, 6, 'Deutsch', 'de-DE', 'de'),
(7, 7, 'Australia', 'en-AU', ''),
(8, 7, 'Canada', 'en-CA', ''),
(9, 7, 'India', 'en-IN', ''),
(10, 7, 'New Zealand', 'en-NZ', ''),
(11, 7, 'South Africa', 'en-ZA', ''),
(12, 7, 'United Kingdom', 'en-GB', 'en'),
(13, 7, 'United States', 'en-US', ''),
(14, 8, 'Argentina', 'es-AR', ''),
(15, 8, 'Bolivia', 'es-BO', ''),
(16, 8, 'Chile', 'es-CL', ''),
(17, 8, 'Colombia', 'es-CO', ''),
(18, 8, 'Costa Rica', 'es-CR', ''),
(19, 8, 'Ecuador', 'es-EC', ''),
(20, 8, 'El Salvador', 'es-SV', ''),
(21, 8, 'España', 'es-ES', 'es'),
(22, 8, 'Estados Unidos', 'es-US', ''),
(23, 8, 'Guatemala', 'es-GT', ''),
(24, 8, 'Honduras', 'es-HN', ''),
(25, 8, 'México', 'es-MX', ''),
(26, 8, 'Nicaragua', 'es-NI', ''),
(27, 8, 'Panamá', 'es-PA', ''),
(28, 8, 'Paraguay', 'es-PY', ''),
(29, 8, 'Perú', 'es-PE', ''),
(30, 8, 'Puerto Rico', 'es-PR', ''),
(31, 8, 'República Dominicana', 'es-DO', ''),
(32, 8, 'Uruguay', 'es-UY', ''),
(33, 8, 'Venezuela', 'es-VE', ''),
(34, 9, 'Euskara', 'eu-ES', ''),
(35, 10, 'Français', 'fr-FR', 'fr'),
(36, 11, 'Galego', 'gl-ES', ''),
(37, 12, 'Hrvatski', 'hr_HR', ''),
(38, 13, 'IsiZulu', 'zu-ZA', ''),
(39, 14, 'Íslenska', 'is-IS', ''),
(40, 15, 'Italia', 'it-IT', 'it'),
(41, 15, 'Svizzera', 'it-CH', 'it'),
(42, 16, 'Magyar', 'hu-HU', 'hu'),
(43, 17, 'Nederlands', 'nl-NL', 'nl'),
(44, 18, 'Norsk bokmål', 'nb-NO', 'nb'),
(45, 19, 'Polski', 'pl-PL', 'pl'),
(46, 20, 'Brasil', 'pt-BR', ''),
(47, 20, 'Portugal', 'pt-PT', 'pt'),
(48, 21, 'Română', 'ro-RO', 'ro'),
(49, 22, 'Slovenčina', 'sk-SK', 'sk'),
(50, 23, 'Suomi', 'fi-FI', 'fi'),
(51, 24, 'Swedish', 'sv-SE', 'sv'),
(52, 25, 'Türkçe', 'tr-TR', 'tr'),
(53, 26, 'български', 'bg-BG', ''),
(54, 27, 'Pусский', 'ru-RU', 'ru'),
(55, 28, 'Serbian', 'sr-RS', 'sr'),
(56, 29, '한국어', 'ko-KR', 'ko'),
(57, 30, '普通话 (中国大陆)', 'cmn-Hans-CN', ''),
(58, 30, '普通话 (香港)', 'cmn-Hans-HK', ''),
(59, 30, '中文 (台灣)', 'cmn-Hant-TW', ''),
(60, 30, '粵語 (香港)', 'yue-Hant-HK', ''),
(61, 31, '日本語', 'ja-JP', 'ja'),
(62, 32, 'Lingua latīna', 'la', ''),
(64, 33, 'Lithuanian', 'lt-LT', 'lt'),
(65, 34, 'Latvia', 'lv-LV', 'lv'),
(66, 35, 'Afar', 'aa-DJ', 'aa'),
(67, 36, 'Egypt', 'ar-EG', 'ar'),
(68, 37, 'India', 'as-IN', 'as'),
(69, 38, 'Azerbaijani', 'az-AZ', 'az'),
(70, 39, 'Bulgarian', 'bg', 'bg'),
(71, 40, 'Bangla', 'bn', 'bn'),
(72, 41, 'Bosnian', 'bs-BA', 'bs'),
(73, 42, 'Cakchiquel', 'cak', 'cak'),
(74, 43, 'Danish', 'da-dk', 'da'),
(75, 44, 'Greek', 'el-GR', 'el'),
(76, 45, 'Estonian', 'et-EE', 'et'),
(77, 46, 'Persian', 'fa-IR', 'fa'),
(78, 47, 'Filipino', 'fil', 'fil'),
(79, 48, 'Gujarati', 'gu-IN', 'gu'),
(80, 49, 'Hebrew', 'he', 'he'),
(81, 50, 'Croatian', 'hr-HR', 'hr'),
(82, 51, 'Indonesia', 'in', 'in'),
(83, 52, 'Icelandic', 'is', 'is'),
(84, 53, 'Georgian', 'ka-ge', 'ka'),
(85, 54, 'Maori (New Zealand)', 'mi-nz', 'mi'),
(86, 55, 'Macedonian', 'mk-MK', 'mk'),
(87, 56, 'Malay (Latin)', 'ms', 'ms'),
(88, 57, 'Maltese', 'mt', 'mt'),
(89, 58, 'Norwegian Nynorsk', 'nn-NO', 'nn'),
(90, 59, 'Norwegian', 'no', 'no'),
(91, 60, 'Northern Sotho (South Africa)', 'nso-za', 'nso'),
(92, 61, 'Slovenian', 'sl-SI', 'sl'),
(94, 63, 'Thai', 'th-TH', 'th'),
(95, 64, 'Tagalog', 'tl', 'tl'),
(96, 65, 'Tongan', 'to-TO', 'to'),
(97, 66, 'Ukrainian', 'uk-UA', 'uk'),
(98, 67, 'Vietnamese', 'vi-VN', 'vi'),
(99, 68, 'Chinese', 'zh-CN', 'zh'),
(100, 36, 'Egypt', 'ar-AE', ''),
(101, 36, 'Egypt', 'ar-IQ', ''),
(102, 41, 'Bosnian', 'bs-Latn-BA', ''),
(103, 6, 'Deutsch', 'de-at', ''),
(104, 6, 'Deutsch', 'de-ch', ''),
(105, 6, 'Deutsch', 'de-GB', ''),
(106, 6, 'Deutsch', 'de-LI', ''),
(107, 6, 'Deutsch', 'de-LU', ''),
(108, 7, 'United Kingdom', 'en-029', ''),
(109, 7, 'United Kingdom', 'en-AS', ''),
(110, 7, 'United Kingdom', 'en-BE', ''),
(111, 7, 'United Kingdom', 'en-BM', ''),
(112, 7, 'United Kingdom', 'en-BS', ''),
(113, 7, 'United Kingdom', 'en-BW', ''),
(114, 7, 'United Kingdom', 'en-CH', ''),
(115, 7, 'United Kingdom', 'en-CX', ''),
(116, 7, 'United Kingdom', 'en-CY', ''),
(117, 7, 'United Kingdom', 'en-DE', ''),
(118, 7, 'United Kingdom', 'en-DK', ''),
(119, 7, 'United Kingdom', 'en-DM', ''),
(120, 7, 'United Kingdom', 'en-GY', ''),
(121, 7, 'United Kingdom', 'en-HK', ''),
(122, 7, 'United Kingdom', 'en-ie', ''),
(123, 7, 'United Kingdom', 'en-IM', ''),
(124, 7, 'United Kingdom', 'en-JM', ''),
(125, 7, 'United Kingdom', 'en-KY', ''),
(126, 7, 'United Kingdom', 'en-MY', ''),
(127, 7, 'United Kingdom', 'en-NF', ''),
(128, 7, 'United Kingdom', 'en-NG', ''),
(129, 7, 'United Kingdom', 'en-NL', ''),
(130, 7, 'United Kingdom', 'en-PH', ''),
(131, 7, 'United Kingdom', 'en-SE', ''),
(132, 7, 'United Kingdom', 'en-sg', ''),
(133, 7, 'United Kingdom', 'en-SI', ''),
(134, 7, 'United Kingdom', 'en-SS', ''),
(135, 7, 'United Kingdom', 'en-TO', ''),
(136, 7, 'United Kingdom', 'en-TZ', ''),
(137, 7, 'United Kingdom', 'en-UG', ''),
(138, 7, 'United Kingdom', 'en-UK', ''),
(139, 7, 'United Kingdom', 'en-ZG', ''),
(140, 7, 'United Kingdom', 'en-ZM', ''),
(141, 7, 'United Kingdom', 'en-ZW', ''),
(142, 8, 'España', 'es-419', ''),
(143, 8, 'España', 'es-xl', ''),
(144, 47, 'Filipino', 'fil-PH', ''),
(145, 10, 'Français', 'fr-BE', ''),
(146, 10, 'Français', 'fr-ca', ''),
(147, 10, 'Français', 'fr-ch', ''),
(148, 10, 'Français', 'fr-CM', ''),
(149, 10, 'Français', 'fr-MC', ''),
(150, 49, 'Hebrew', 'he-IL', ''),
(151, 50, 'Croatian', 'hr-BA', ''),
(152, 17, 'Nederlands', 'nl-BE', ''),
(153, 19, 'Polski', 'pl-GB', ''),
(154, 27, 'Pусский', 'ru-KZ', ''),
(155, 27, 'Pусский', 'ru-UA', ''),
(156, 28, 'Serbian', 'sr-BA', ''),
(157, 28, 'Serbian', 'sr-Latn-RS', ''),
(158, 68, 'Chinese', 'zh-MO', ''),
(159, 68, 'Chinese', 'zh-SG', ''),
(160, 68, 'Chinese', 'zh-TW', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_speech_user_language`
--

CREATE TABLE `lh_speech_user_language` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `language` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_transfer`
--

CREATE TABLE `lh_transfer` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `transfer_user_id` int(11) NOT NULL,
  `from_dep_id` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `transfer_scope` int(11) NOT NULL DEFAULT '0',
  `transfer_to_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_userdep`
--

CREATE TABLE `lh_userdep` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `last_activity` int(11) NOT NULL,
  `lastd_activity` int(11) NOT NULL DEFAULT '0',
  `exclude_autoasign` tinyint(1) NOT NULL DEFAULT '0',
  `exc_indv_autoasign` tinyint(1) NOT NULL DEFAULT '0',
  `hide_online` int(11) NOT NULL,
  `last_accepted` int(11) NOT NULL DEFAULT '0',
  `active_chats` int(11) NOT NULL DEFAULT '0',
  `pending_chats` int(11) NOT NULL DEFAULT '0',
  `inactive_chats` int(11) NOT NULL DEFAULT '0',
  `max_chats` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `ro` tinyint(1) NOT NULL DEFAULT '0',
  `hide_online_ts` int(11) NOT NULL DEFAULT '0',
  `dep_group_id` int(11) NOT NULL DEFAULT '0',
  `always_on` tinyint(1) NOT NULL DEFAULT '0',
  `exclude_autoasign_mails` tinyint(1) NOT NULL DEFAULT '0',
  `active_mails` int(11) NOT NULL DEFAULT '0',
  `pending_mails` int(11) NOT NULL DEFAULT '0',
  `max_mails` int(11) NOT NULL DEFAULT '0',
  `last_accepted_mail` int(11) NOT NULL DEFAULT '0',
  `assign_priority` int(11) NOT NULL DEFAULT '0',
  `chat_max_priority` int(11) NOT NULL DEFAULT '0',
  `chat_min_priority` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_userdep`
--

INSERT INTO `lh_userdep` (`id`, `user_id`, `dep_id`, `last_activity`, `lastd_activity`, `exclude_autoasign`, `exc_indv_autoasign`, `hide_online`, `last_accepted`, `active_chats`, `pending_chats`, `inactive_chats`, `max_chats`, `type`, `ro`, `hide_online_ts`, `dep_group_id`, `always_on`, `exclude_autoasign_mails`, `active_mails`, `pending_mails`, `max_mails`, `last_accepted_mail`, `assign_priority`, `chat_max_priority`, `chat_min_priority`) VALUES
(1, 1, 0, 1721121488, 1721121433, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_userdep_alias`
--

CREATE TABLE `lh_userdep_alias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dep_id` bigint(20) UNSIGNED NOT NULL,
  `dep_group_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nick` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_users`
--

CREATE TABLE `lh_users` (
  `id` int(11) NOT NULL,
  `username` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_zone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departments_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xmpp_username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation_admin` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `skype` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exclude_autoasign` tinyint(1) NOT NULL,
  `disabled` tinyint(4) NOT NULL,
  `hide_online` tinyint(1) NOT NULL,
  `all_departments` tinyint(1) NOT NULL,
  `invisible_mode` tinyint(1) NOT NULL,
  `inactive_mode` tinyint(1) NOT NULL,
  `rec_per_req` tinyint(1) NOT NULL,
  `auto_accept` tinyint(1) NOT NULL,
  `max_active_chats` int(11) NOT NULL,
  `cache_version` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `pswd_updated` int(11) NOT NULL,
  `attr_int_1` int(11) NOT NULL,
  `attr_int_2` int(11) NOT NULL,
  `attr_int_3` int(11) NOT NULL,
  `force_logout` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `llogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `always_on` tinyint(1) NOT NULL DEFAULT '0',
  `exclude_autoasign_mails` tinyint(1) NOT NULL DEFAULT '0',
  `max_active_mails` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_users`
--

INSERT INTO `lh_users` (`id`, `username`, `password`, `email`, `time_zone`, `name`, `surname`, `filepath`, `filename`, `job_title`, `departments_ids`, `chat_nickname`, `xmpp_username`, `session_id`, `avatar`, `operation_admin`, `skype`, `exclude_autoasign`, `disabled`, `hide_online`, `all_departments`, `invisible_mode`, `inactive_mode`, `rec_per_req`, `auto_accept`, `max_active_chats`, `cache_version`, `pswd_updated`, `attr_int_1`, `attr_int_2`, `attr_int_3`, `force_logout`, `llogin`, `always_on`, `exclude_autoasign_mails`, `max_active_mails`) VALUES
(1, 'ihya', '$2y$10$NOuNNfJPGzFwqHz7IvNexeG7NdRl1a2X3vYTtzTI9BAhfZ.z1lbPe', 'ihyanatikwibowo@gmail.com', '', 'Ihya', 'Wibowo', '', '', '', '0', '', '', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1721097246, 0, 0, 0, 0, 1721111445, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_users_login`
--

CREATE TABLE `lh_users_login` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `ctime` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_users_login`
--

INSERT INTO `lh_users_login` (`id`, `user_id`, `type`, `ctime`, `status`, `ip`, `msg`) VALUES
(1, 1, 1, 1721097260, 0, '127.0.0.1', 'Logged in successfully. WEB'),
(2, 1, 1, 1721111435, 0, '127.0.0.1', 'Logged in successfully. WEB'),
(3, 1, 1, 1721111445, 0, '127.0.0.1', 'Logged in successfully. WEB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_users_online_session`
--

CREATE TABLE `lh_users_online_session` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `lactivity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_users_online_session`
--

INSERT INTO `lh_users_online_session` (`id`, `user_id`, `time`, `duration`, `lactivity`) VALUES
(1, 1, 1721097263, 9080, 1721106343),
(2, 1, 1721111448, 5954, 1721117402),
(3, 1, 1721120603, 885, 1721121488);

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_users_remember`
--

CREATE TABLE `lh_users_remember` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_users_session`
--

CREATE TABLE `lh_users_session` (
  `id` int(11) NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` int(11) NOT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL,
  `expires_on` int(11) NOT NULL,
  `notifications_status` int(11) NOT NULL DEFAULT '1',
  `error` int(11) NOT NULL DEFAULT '0',
  `last_error` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_users_setting`
--

CREATE TABLE `lh_users_setting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_users_setting`
--

INSERT INTO `lh_users_setting` (`id`, `user_id`, `identifier`, `value`) VALUES
(1, 1, 'user_language', 'en_EN'),
(2, 1, 'new_dashboard', '1'),
(3, 1, 'enable_pending_list', '1'),
(4, 1, 'enable_active_list', '1'),
(5, 1, 'enable_close_list', '0'),
(6, 1, 'enable_unread_list', '0'),
(7, 1, 'enable_mchats_list', '1'),
(8, 1, 'dwo', ''),
(9, 1, 'left_list', '0'),
(10, 1, 'new_user_bn', '0'),
(11, 1, 'new_user_sound', '0'),
(12, 1, 'dw_filters', '{}'),
(13, 1, 'ouser_timeout', '3600'),
(14, 1, 'oupdate_timeout', '10'),
(15, 1, 'omax_rows', '50'),
(16, 1, 'ogroup_by', 'none'),
(17, 1, 'ocountry', 'none'),
(18, 1, 'otime_on_site', ''),
(19, 1, 'omap_depid', '0'),
(20, 1, 'omap_mtimeout', '30'),
(21, 1, 'online_connected', '0'),
(22, 1, 'oattrf_key_1', ''),
(23, 1, 'oattrf_val_1', ''),
(24, 1, 'oattrf_key_2', ''),
(25, 1, 'oattrf_val_2', ''),
(26, 1, 'oattrf_key_3', ''),
(27, 1, 'oattrf_val_3', ''),
(28, 1, 'oattrf_key_4', ''),
(29, 1, 'oattrf_val_4', ''),
(30, 1, 'oattrf_key_5', ''),
(31, 1, 'oattrf_val_5', ''),
(32, 1, 'hide_tabs', '1'),
(33, 1, 'column_chats', '0'),
(34, 1, 'dark_mode', '0'),
(35, 1, 'admin_theme_enabled', '0'),
(36, 1, 'show_alert_transfer', '1'),
(37, 1, 'show_alert_chat', '0'),
(38, 1, 'auto_join_private', '1'),
(39, 1, 'chat_message', '1'),
(40, 1, 'new_chat_sound', '1'),
(41, 1, 'sn_off', '1'),
(42, 1, 'ownntfonly', '0'),
(43, 1, 'auto_uppercase', '1'),
(44, 1, 'auto_accept_mail', '0'),
(45, 1, 'no_scroll_bottom', '0'),
(46, 1, 'scroll_load', '1'),
(47, 1, 'hide_quick_notifications', '0'),
(48, 1, 'auto_preload', '0'),
(49, 1, 'static_order', '0'),
(50, 1, 'trackactivitytimeout', '-1'),
(51, 1, 'trackactivity', '0'),
(52, 1, 'dwic', ''),
(53, 1, 'dw_nic', ''),
(54, 1, 'bot_msg_nm', '3'),
(55, 1, 'bot_notifications', '0'),
(56, 1, 'enable_bot_list', '1'),
(57, 1, 'show_all_pending', '1'),
(58, 1, 'chat_text_rows', '2'),
(59, 1, 'remove_close_timeout', '5'),
(60, 1, 'remove_closed_chats', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_users_setting_option`
--

CREATE TABLE `lh_users_setting_option` (
  `identifier` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lh_users_setting_option`
--

INSERT INTO `lh_users_setting_option` (`identifier`, `class`, `attribute`) VALUES
('chat_message', '', ''),
('dwo', '', ''),
('enable_active_list', '', ''),
('enable_close_list', '', ''),
('enable_pending_list', '', ''),
('enable_unread_list', '', ''),
('new_chat_sound', '', ''),
('new_user_bn', '', ''),
('new_user_sound', '', ''),
('o_department', '', ''),
('ocountry', '', ''),
('ogroup_by', '', ''),
('omap_depid', '', ''),
('omap_mtimeout', '', ''),
('omax_rows', '', ''),
('otime_on_site', '', ''),
('oupdate_timeout', '', ''),
('ouser_timeout', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lh_webhook`
--

CREATE TABLE `lh_webhook` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bot_id_alt` int(11) NOT NULL DEFAULT '0',
  `trigger_id_alt` int(11) NOT NULL DEFAULT '0',
  `bot_id` int(11) NOT NULL,
  `trigger_id` int(11) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `lhc_mailconv_conversation`
--
ALTER TABLE `lhc_mailconv_conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang` (`lang`),
  ADD KEY `from_address` (`from_address`),
  ADD KEY `mailbox_id` (`mailbox_id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `mailbox_id_status_udate` (`mailbox_id`,`status`,`udate`),
  ADD KEY `status_priority` (`status`,`priority`),
  ADD KEY `status_priority_asc` (`status`,`priority_asc`),
  ADD KEY `has_attachment` (`has_attachment`),
  ADD KEY `udate` (`udate`),
  ADD KEY `user_id_status` (`user_id`,`status`),
  ADD KEY `status_dep_id` (`status`,`dep_id`),
  ADD KEY `undelivered` (`undelivered`),
  ADD KEY `phone` (`phone`);

--
-- Indeks untuk tabel `lhc_mailconv_delete_filter`
--
ALTER TABLE `lhc_mailconv_delete_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `lhc_mailconv_delete_item`
--
ALTER TABLE `lhc_mailconv_delete_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id_status` (`filter_id`,`status`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `lhc_mailconv_file`
--
ALTER TABLE `lhc_mailconv_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `conversation_id` (`conversation_id`);

--
-- Indeks untuk tabel `lhc_mailconv_mailbox`
--
ALTER TABLE `lhc_mailconv_mailbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indeks untuk tabel `lhc_mailconv_mailing_campaign`
--
ALTER TABLE `lhc_mailconv_mailing_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_enabled_starts_at` (`status`,`enabled`,`starts_at`),
  ADD KEY `enabled` (`enabled`);

--
-- Indeks untuk tabel `lhc_mailconv_mailing_campaign_recipient`
--
ALTER TABLE `lhc_mailconv_mailing_campaign_recipient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `campaign_id_status` (`campaign_id`,`status`),
  ADD KEY `campaign_id_email` (`campaign_id`,`email`);

--
-- Indeks untuk tabel `lhc_mailconv_mailing_list`
--
ALTER TABLE `lhc_mailconv_mailing_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lhc_mailconv_mailing_list_recipient`
--
ALTER TABLE `lhc_mailconv_mailing_list_recipient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mailing_list_id` (`mailing_list_id`),
  ADD KEY `mailing_recipient_id` (`mailing_recipient_id`);

--
-- Indeks untuk tabel `lhc_mailconv_match_rule`
--
ALTER TABLE `lhc_mailconv_match_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active_priority` (`active`,`priority`);

--
-- Indeks untuk tabel `lhc_mailconv_msg`
--
ALTER TABLE `lhc_mailconv_msg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_hash` (`message_hash`),
  ADD KEY `lang` (`lang`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `response_type` (`response_type`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `conversation_id_old` (`conversation_id_old`),
  ADD KEY `mailbox_id` (`mailbox_id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `has_attachment` (`has_attachment`),
  ADD KEY `udate` (`udate`);

--
-- Indeks untuk tabel `lhc_mailconv_msg_internal`
--
ALTER TABLE `lhc_mailconv_msg_internal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id_id` (`chat_id`,`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lhc_mailconv_msg_open`
--
ALTER TABLE `lhc_mailconv_msg_open`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`);

--
-- Indeks untuk tabel `lhc_mailconv_msg_subject`
--
ALTER TABLE `lhc_mailconv_msg_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`);

--
-- Indeks untuk tabel `lhc_mailconv_oauth_ms`
--
ALTER TABLE `lhc_mailconv_oauth_ms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_uid` (`oauth_uid`),
  ADD KEY `user_id_completed` (`mailbox_id`,`completed`);

--
-- Indeks untuk tabel `lhc_mailconv_personal_mailbox_group`
--
ALTER TABLE `lhc_mailconv_personal_mailbox_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indeks untuk tabel `lhc_mailconv_recipient`
--
ALTER TABLE `lhc_mailconv_recipient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `email` (`email`);

--
-- Indeks untuk tabel `lhc_mailconv_remarks`
--
ALTER TABLE `lhc_mailconv_remarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indeks untuk tabel `lhc_mailconv_response_template`
--
ALTER TABLE `lhc_mailconv_response_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unique_id` (`unique_id`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indeks untuk tabel `lhc_mailconv_response_template_dep`
--
ALTER TABLE `lhc_mailconv_response_template_dep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indeks untuk tabel `lhc_mailconv_response_template_subject`
--
ALTER TABLE `lhc_mailconv_response_template_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indeks untuk tabel `lhc_mailconv_sent_copy`
--
ALTER TABLE `lhc_mailconv_sent_copy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `lh_abstract_auto_responder`
--
ALTER TABLE `lh_abstract_auto_responder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siteaccess_position` (`siteaccess`,`position`);

--
-- Indeks untuk tabel `lh_abstract_auto_responder_chat`
--
ALTER TABLE `lh_abstract_auto_responder_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indeks untuk tabel `lh_abstract_auto_responder_dep`
--
ALTER TABLE `lh_abstract_auto_responder_dep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autoresponder_id` (`autoresponder_id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indeks untuk tabel `lh_abstract_browse_offer_invitation`
--
ALTER TABLE `lh_abstract_browse_offer_invitation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeks untuk tabel `lh_abstract_chat_alert_icon`
--
ALTER TABLE `lh_abstract_chat_alert_icon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_abstract_chat_column`
--
ALTER TABLE `lh_abstract_chat_column`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `online_enabled` (`online_enabled`),
  ADD KEY `chat_enabled` (`chat_enabled`);

--
-- Indeks untuk tabel `lh_abstract_chat_priority`
--
ALTER TABLE `lh_abstract_chat_priority`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indeks untuk tabel `lh_abstract_chat_variable`
--
ALTER TABLE `lh_abstract_chat_variable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indeks untuk tabel `lh_abstract_email_template`
--
ALTER TABLE `lh_abstract_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_abstract_form`
--
ALTER TABLE `lh_abstract_form`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_abstract_form_collected`
--
ALTER TABLE `lh_abstract_form_collected`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`form_id`);

--
-- Indeks untuk tabel `lh_abstract_msg_protection`
--
ALTER TABLE `lh_abstract_msg_protection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indeks untuk tabel `lh_abstract_proactive_chat_campaign`
--
ALTER TABLE `lh_abstract_proactive_chat_campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_abstract_proactive_chat_campaign_conv`
--
ALTER TABLE `lh_abstract_proactive_chat_campaign_conv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`),
  ADD KEY `invitation_status` (`invitation_status`),
  ADD KEY `ctime` (`ctime`),
  ADD KEY `invitation_id_variation_id` (`invitation_id`,`variation_id`),
  ADD KEY `unique_id` (`unique_id`),
  ADD KEY `conv_int_time` (`conv_int_time`),
  ADD KEY `conv_event_vid_id` (`conv_event`,`vid_id`);

--
-- Indeks untuk tabel `lh_abstract_proactive_chat_event`
--
ALTER TABLE `lh_abstract_proactive_chat_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vid_id_ev_id_val_ts` (`vid_id`,`ev_id`,`val`,`ts`),
  ADD KEY `vid_id_ev_id_ts` (`vid_id`,`ev_id`,`ts`);

--
-- Indeks untuk tabel `lh_abstract_proactive_chat_invitation`
--
ALTER TABLE `lh_abstract_proactive_chat_invitation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_on_site_pageviews_siteaccess_position` (`time_on_site`,`pageviews`,`siteaccess`,`identifier`,`position`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `dynamic_invitation` (`dynamic_invitation`),
  ADD KEY `tag` (`tag`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `show_on_mobile` (`show_on_mobile`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indeks untuk tabel `lh_abstract_proactive_chat_invitation_dep`
--
ALTER TABLE `lh_abstract_proactive_chat_invitation_dep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invitation_id` (`invitation_id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indeks untuk tabel `lh_abstract_proactive_chat_invitation_event`
--
ALTER TABLE `lh_abstract_proactive_chat_invitation_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invitation_id` (`invitation_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indeks untuk tabel `lh_abstract_proactive_chat_variables`
--
ALTER TABLE `lh_abstract_proactive_chat_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeks untuk tabel `lh_abstract_product`
--
ALTER TABLE `lh_abstract_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departament_id` (`departament_id`);

--
-- Indeks untuk tabel `lh_abstract_product_departament`
--
ALTER TABLE `lh_abstract_product_departament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departament_id` (`departament_id`);

--
-- Indeks untuk tabel `lh_abstract_rest_api_key`
--
ALTER TABLE `lh_abstract_rest_api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_key` (`api_key`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lh_abstract_rest_api_key_remote`
--
ALTER TABLE `lh_abstract_rest_api_key_remote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indeks untuk tabel `lh_abstract_saved_report`
--
ALTER TABLE `lh_abstract_saved_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lh_abstract_saved_search`
--
ALTER TABLE `lh_abstract_saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scope` (`scope`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `requested_at` (`requested_at`),
  ADD KEY `user_id_status` (`user_id`,`status`);

--
-- Indeks untuk tabel `lh_abstract_stats`
--
ALTER TABLE `lh_abstract_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_object_id` (`type`,`object_id`);

--
-- Indeks untuk tabel `lh_abstract_subject`
--
ALTER TABLE `lh_abstract_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `internal` (`internal`),
  ADD KEY `internal_type` (`internal_type`),
  ADD KEY `widgets` (`widgets`);

--
-- Indeks untuk tabel `lh_abstract_subject_chat`
--
ALTER TABLE `lh_abstract_subject_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indeks untuk tabel `lh_abstract_subject_dep`
--
ALTER TABLE `lh_abstract_subject_dep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indeks untuk tabel `lh_abstract_survey`
--
ALTER TABLE `lh_abstract_survey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeks untuk tabel `lh_abstract_survey_item`
--
ALTER TABLE `lh_abstract_survey_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_user_id` (`online_user_id`),
  ADD KEY `survey_id` (`survey_id`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `ftime` (`ftime`),
  ADD KEY `max_stars_1` (`max_stars_1`),
  ADD KEY `max_stars_2` (`max_stars_2`),
  ADD KEY `max_stars_3` (`max_stars_3`),
  ADD KEY `max_stars_4` (`max_stars_4`),
  ADD KEY `max_stars_5` (`max_stars_5`),
  ADD KEY `question_options_1` (`question_options_1`),
  ADD KEY `question_options_2` (`question_options_2`),
  ADD KEY `question_options_3` (`question_options_3`),
  ADD KEY `question_options_4` (`question_options_4`),
  ADD KEY `question_options_5` (`question_options_5`);

--
-- Indeks untuk tabel `lh_abstract_widget_theme`
--
ALTER TABLE `lh_abstract_widget_theme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`);

--
-- Indeks untuk tabel `lh_admin_theme`
--
ALTER TABLE `lh_admin_theme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lh_audits`
--
ALTER TABLE `lh_audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `time` (`time`),
  ADD KEY `source` (`source`(191)),
  ADD KEY `category` (`category`(191));

--
-- Indeks untuk tabel `lh_bot_condition`
--
ALTER TABLE `lh_bot_condition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeks untuk tabel `lh_brand`
--
ALTER TABLE `lh_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_brand_member`
--
ALTER TABLE `lh_brand_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `brand_id_role` (`brand_id`,`role`);

--
-- Indeks untuk tabel `lh_canned_msg`
--
ALTER TABLE `lh_canned_msg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `attr_int_1` (`attr_int_1`),
  ADD KEY `attr_int_2` (`attr_int_2`),
  ADD KEY `attr_int_3` (`attr_int_3`),
  ADD KEY `delete_on_exp` (`delete_on_exp`),
  ADD KEY `position_title_v2` (`position`,`title`(191)),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `unique_id` (`unique_id`),
  ADD KEY `repetitiveness` (`repetitiveness`);

--
-- Indeks untuk tabel `lh_canned_msg_dep`
--
ALTER TABLE `lh_canned_msg_dep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canned_id` (`canned_id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indeks untuk tabel `lh_canned_msg_replace`
--
ALTER TABLE `lh_canned_msg_replace`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeks untuk tabel `lh_canned_msg_subject`
--
ALTER TABLE `lh_canned_msg_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canned_id` (`canned_id`);

--
-- Indeks untuk tabel `lh_canned_msg_tag`
--
ALTER TABLE `lh_canned_msg_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag` (`tag`);

--
-- Indeks untuk tabel `lh_canned_msg_tag_link`
--
ALTER TABLE `lh_canned_msg_tag_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canned_id` (`canned_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indeks untuk tabel `lh_canned_msg_use`
--
ALTER TABLE `lh_canned_msg_use`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ctime` (`ctime`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `canned_id` (`canned_id`);

--
-- Indeks untuk tabel `lh_chat`
--
ALTER TABLE `lh_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_user_id` (`status`,`user_id`),
  ADD KEY `unanswered_chat` (`unanswered_chat`),
  ADD KEY `online_user_id` (`online_user_id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `time` (`time`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `unread_operator` (`has_unread_op_messages`,`unread_op_messages_informed`),
  ADD KEY `user_id_sender_user_id` (`user_id`,`sender_user_id`),
  ADD KEY `sender_user_id` (`sender_user_id`),
  ADD KEY `anonymized` (`anonymized`),
  ADD KEY `has_unread_messages` (`has_unread_messages`),
  ADD KEY `status` (`status`),
  ADD KEY `nick` (`nick`),
  ADD KEY `iwh_id` (`iwh_id`),
  ADD KEY `theme_id` (`theme_id`),
  ADD KEY `email` (`email`),
  ADD KEY `phone` (`phone`),
  ADD KEY `dep_id_status` (`dep_id`,`status`);

--
-- Indeks untuk tabel `lh_chatbox`
--
ALTER TABLE `lh_chatbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indeks untuk tabel `lh_chat_accept`
--
ALTER TABLE `lh_chat_accept`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`);

--
-- Indeks untuk tabel `lh_chat_action`
--
ALTER TABLE `lh_chat_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indeks untuk tabel `lh_chat_archive_range`
--
ALTER TABLE `lh_chat_archive_range`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_chat_blocked_user`
--
ALTER TABLE `lh_chat_blocked_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`),
  ADD KEY `nick` (`nick`),
  ADD KEY `online_user_id` (`online_user_id`);

--
-- Indeks untuk tabel `lh_chat_config`
--
ALTER TABLE `lh_chat_config`
  ADD PRIMARY KEY (`identifier`);

--
-- Indeks untuk tabel `lh_chat_event_track`
--
ALTER TABLE `lh_chat_event_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indeks untuk tabel `lh_chat_file`
--
ALTER TABLE `lh_chat_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `online_user_id` (`online_user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lh_chat_incoming`
--
ALTER TABLE `lh_chat_incoming`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `incoming_ext_id_uniq` (`incoming_id`,`chat_external_id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indeks untuk tabel `lh_chat_online_user`
--
ALTER TABLE `lh_chat_online_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vid` (`vid`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `first_visit` (`first_visit`),
  ADD KEY `last_visit_dep_id` (`last_visit`,`dep_id`);

--
-- Indeks untuk tabel `lh_chat_online_user_footprint`
--
ALTER TABLE `lh_chat_online_user_footprint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `online_user_id` (`online_user_id`);

--
-- Indeks untuk tabel `lh_chat_online_user_footprint_update`
--
ALTER TABLE `lh_chat_online_user_footprint_update`
  ADD KEY `online_user_id` (`online_user_id`);

--
-- Indeks untuk tabel `lh_chat_paid`
--
ALTER TABLE `lh_chat_paid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`(191)),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indeks untuk tabel `lh_chat_participant`
--
ALTER TABLE `lh_chat_participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `time` (`time`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lh_chat_start_settings`
--
ALTER TABLE `lh_chat_start_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indeks untuk tabel `lh_chat_voice_video`
--
ALTER TABLE `lh_chat_voice_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indeks untuk tabel `lh_cobrowse`
--
ALTER TABLE `lh_cobrowse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `online_user_id` (`online_user_id`);

--
-- Indeks untuk tabel `lh_departament`
--
ALTER TABLE `lh_departament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier_2` (`identifier`(191)),
  ADD KEY `archive` (`archive`),
  ADD KEY `alias` (`alias`),
  ADD KEY `attr_int_1` (`attr_int_1`),
  ADD KEY `attr_int_2` (`attr_int_2`),
  ADD KEY `attr_int_3` (`attr_int_3`),
  ADD KEY `active_chats_counter` (`active_chats_counter`),
  ADD KEY `pending_chats_counter` (`pending_chats_counter`),
  ADD KEY `bot_chats_counter` (`bot_chats_counter`),
  ADD KEY `disabled_hidden` (`disabled`,`hidden`),
  ADD KEY `sort_priority_name` (`sort_priority`,`name`),
  ADD KEY `active_mod` (`online_hours_active`,`mod_start_hour`,`mod_end_hour`),
  ADD KEY `active_tud` (`online_hours_active`,`tud_start_hour`,`tud_end_hour`),
  ADD KEY `active_wed` (`online_hours_active`,`wed_start_hour`,`wed_end_hour`),
  ADD KEY `active_thd` (`online_hours_active`,`thd_start_hour`,`thd_end_hour`),
  ADD KEY `active_frd` (`online_hours_active`,`frd_start_hour`,`frd_end_hour`),
  ADD KEY `active_sad` (`online_hours_active`,`sad_start_hour`,`sad_end_hour`),
  ADD KEY `active_sud` (`online_hours_active`,`sud_start_hour`,`sud_end_hour`),
  ADD KEY `ignore_op_status` (`ignore_op_status`);

--
-- Indeks untuk tabel `lh_departament_availability`
--
ALTER TABLE `lh_departament_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ymdhi` (`ymdhi`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `hourminute` (`hourminute`),
  ADD KEY `time` (`time`);

--
-- Indeks untuk tabel `lh_departament_custom_work_hours`
--
ALTER TABLE `lh_departament_custom_work_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `date_from` (`date_from`),
  ADD KEY `search_active` (`date_from`,`date_to`,`dep_id`);

--
-- Indeks untuk tabel `lh_departament_group`
--
ALTER TABLE `lh_departament_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_departament_group_member`
--
ALTER TABLE `lh_departament_group_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_group_id` (`dep_group_id`);

--
-- Indeks untuk tabel `lh_departament_group_user`
--
ALTER TABLE `lh_departament_group_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_group_id` (`dep_group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lh_departament_limit_group`
--
ALTER TABLE `lh_departament_limit_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_departament_limit_group_member`
--
ALTER TABLE `lh_departament_limit_group_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_limit_group_id` (`dep_limit_group_id`);

--
-- Indeks untuk tabel `lh_faq`
--
ALTER TABLE `lh_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`),
  ADD KEY `active_url_2` (`active`,`url`(191)),
  ADD KEY `has_url` (`has_url`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `is_wildcard` (`is_wildcard`);

--
-- Indeks untuk tabel `lh_forgotpasswordhash`
--
ALTER TABLE `lh_forgotpasswordhash`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_generic_bot_bot`
--
ALTER TABLE `lh_generic_bot_bot`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_generic_bot_chat_event`
--
ALTER TABLE `lh_generic_bot_chat_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indeks untuk tabel `lh_generic_bot_chat_workflow`
--
ALTER TABLE `lh_generic_bot_chat_workflow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indeks untuk tabel `lh_generic_bot_command`
--
ALTER TABLE `lh_generic_bot_command`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `command` (`command`);

--
-- Indeks untuk tabel `lh_generic_bot_exception`
--
ALTER TABLE `lh_generic_bot_exception`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_generic_bot_exception_message`
--
ALTER TABLE `lh_generic_bot_exception_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `exception_group_id` (`exception_group_id`);

--
-- Indeks untuk tabel `lh_generic_bot_group`
--
ALTER TABLE `lh_generic_bot_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bot_id` (`bot_id`);

--
-- Indeks untuk tabel `lh_generic_bot_payload`
--
ALTER TABLE `lh_generic_bot_payload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bot_id` (`bot_id`),
  ADD KEY `trigger_id` (`trigger_id`);

--
-- Indeks untuk tabel `lh_generic_bot_pending_event`
--
ALTER TABLE `lh_generic_bot_pending_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indeks untuk tabel `lh_generic_bot_repeat_restrict`
--
ALTER TABLE `lh_generic_bot_repeat_restrict`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id_trigger_id` (`chat_id`,`trigger_id`);

--
-- Indeks untuk tabel `lh_generic_bot_rest_api`
--
ALTER TABLE `lh_generic_bot_rest_api`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_generic_bot_rest_api_cache`
--
ALTER TABLE `lh_generic_bot_rest_api_cache`
  ADD UNIQUE KEY `rest_api_id_hash` (`rest_api_id`,`hash`);

--
-- Indeks untuk tabel `lh_generic_bot_trigger`
--
ALTER TABLE `lh_generic_bot_trigger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bot_id` (`bot_id`),
  ADD KEY `default_unknown` (`default_unknown`),
  ADD KEY `in_progress` (`in_progress`),
  ADD KEY `default_unknown_btn` (`default_unknown_btn`),
  ADD KEY `default_always` (`default_always`),
  ADD KEY `group_id` (`group_id`);

--
-- Indeks untuk tabel `lh_generic_bot_trigger_event`
--
ALTER TABLE `lh_generic_bot_trigger_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pattern_v2` (`pattern`(191)),
  ADD KEY `type` (`type`),
  ADD KEY `on_start_type` (`on_start_type`),
  ADD KEY `trigger_id` (`trigger_id`);

--
-- Indeks untuk tabel `lh_generic_bot_trigger_event_template`
--
ALTER TABLE `lh_generic_bot_trigger_event_template`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_generic_bot_trigger_template`
--
ALTER TABLE `lh_generic_bot_trigger_template`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_generic_bot_tr_group`
--
ALTER TABLE `lh_generic_bot_tr_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_generic_bot_tr_item`
--
ALTER TABLE `lh_generic_bot_tr_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `group_id` (`group_id`);

--
-- Indeks untuk tabel `lh_group`
--
ALTER TABLE `lh_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled` (`disabled`);

--
-- Indeks untuk tabel `lh_grouprole`
--
ALTER TABLE `lh_grouprole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`role_id`,`group_id`),
  ADD KEY `group_id_primary` (`group_id`);

--
-- Indeks untuk tabel `lh_groupuser`
--
ALTER TABLE `lh_groupuser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `group_id_2` (`group_id`,`user_id`);

--
-- Indeks untuk tabel `lh_group_chat`
--
ALTER TABLE `lh_group_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `type` (`type`);

--
-- Indeks untuk tabel `lh_group_chat_member`
--
ALTER TABLE `lh_group_chat_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type` (`type`);

--
-- Indeks untuk tabel `lh_group_msg`
--
ALTER TABLE `lh_group_msg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id_id` (`chat_id`,`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lh_group_object`
--
ALTER TABLE `lh_group_object`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id_type` (`object_id`,`type`),
  ADD KEY `group_id` (`group_id`);

--
-- Indeks untuk tabel `lh_group_work`
--
ALTER TABLE `lh_group_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indeks untuk tabel `lh_incoming_webhook`
--
ALTER TABLE `lh_incoming_webhook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`,`disabled`);

--
-- Indeks untuk tabel `lh_mail_archive_range`
--
ALTER TABLE `lh_mail_archive_range`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_mail_continuous_event`
--
ALTER TABLE `lh_mail_continuous_event`
  ADD UNIQUE KEY `webhook_id_message_id` (`webhook_id`,`message_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indeks untuk tabel `lh_msg`
--
ALTER TABLE `lh_msg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id_id` (`chat_id`,`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `lh_notification_subscriber`
--
ALTER TABLE `lh_notification_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `online_user_id` (`online_user_id`),
  ADD KEY `subscriber_hash` (`subscriber_hash`);

--
-- Indeks untuk tabel `lh_question`
--
ALTER TABLE `lh_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `priority` (`priority`),
  ADD KEY `active_priority` (`active`,`priority`);

--
-- Indeks untuk tabel `lh_question_answer`
--
ALTER TABLE `lh_question_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`),
  ADD KEY `question_id` (`question_id`);

--
-- Indeks untuk tabel `lh_question_option`
--
ALTER TABLE `lh_question_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indeks untuk tabel `lh_question_option_answer`
--
ALTER TABLE `lh_question_option_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `ip` (`ip`);

--
-- Indeks untuk tabel `lh_role`
--
ALTER TABLE `lh_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_rolefunction`
--
ALTER TABLE `lh_rolefunction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indeks untuk tabel `lh_speech_chat_language`
--
ALTER TABLE `lh_speech_chat_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indeks untuk tabel `lh_speech_language`
--
ALTER TABLE `lh_speech_language`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_speech_language_dialect`
--
ALTER TABLE `lh_speech_language_dialect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `short_code` (`short_code`),
  ADD KEY `lang_code` (`lang_code`);

--
-- Indeks untuk tabel `lh_speech_user_language`
--
ALTER TABLE `lh_speech_user_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_language` (`user_id`,`language`);

--
-- Indeks untuk tabel `lh_transfer`
--
ALTER TABLE `lh_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `transfer_user_id_dep_id` (`transfer_user_id`,`dep_id`),
  ADD KEY `transfer_to_user_id` (`transfer_to_user_id`);

--
-- Indeks untuk tabel `lh_userdep`
--
ALTER TABLE `lh_userdep`
  ADD PRIMARY KEY (`id`),
  ADD KEY `last_activity_hide_online_dep_id` (`last_activity`,`hide_online`,`dep_id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `user_id_type` (`user_id`,`type`),
  ADD KEY `online_op_widget` (`last_activity`,`user_id`,`dep_id`,`always_on`);

--
-- Indeks untuk tabel `lh_userdep_alias`
--
ALTER TABLE `lh_userdep_alias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dep_id_user_id` (`dep_id`,`user_id`),
  ADD KEY `dep_group_id_user_id` (`dep_group_id`,`user_id`);

--
-- Indeks untuk tabel `lh_users`
--
ALTER TABLE `lh_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hide_online` (`hide_online`),
  ADD KEY `rec_per_req` (`rec_per_req`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `email` (`email`),
  ADD KEY `xmpp_username` (`xmpp_username`(191));

--
-- Indeks untuk tabel `lh_users_login`
--
ALTER TABLE `lh_users_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_type` (`user_id`,`type`);

--
-- Indeks untuk tabel `lh_users_online_session`
--
ALTER TABLE `lh_users_online_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_lactivity` (`user_id`,`lactivity`),
  ADD KEY `lactivity` (`lactivity`);

--
-- Indeks untuk tabel `lh_users_remember`
--
ALTER TABLE `lh_users_remember`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lh_users_session`
--
ALTER TABLE `lh_users_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token` (`token`),
  ADD KEY `device_token_device_type_v2` (`device_token`(191),`device_type`),
  ADD KEY `error` (`error`);

--
-- Indeks untuk tabel `lh_users_setting`
--
ALTER TABLE `lh_users_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`identifier`);

--
-- Indeks untuk tabel `lh_users_setting_option`
--
ALTER TABLE `lh_users_setting_option`
  ADD PRIMARY KEY (`identifier`);

--
-- Indeks untuk tabel `lh_webhook`
--
ALTER TABLE `lh_webhook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_disabled` (`event`,`disabled`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_conversation`
--
ALTER TABLE `lhc_mailconv_conversation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_delete_filter`
--
ALTER TABLE `lhc_mailconv_delete_filter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_delete_item`
--
ALTER TABLE `lhc_mailconv_delete_item`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_file`
--
ALTER TABLE `lhc_mailconv_file`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_mailbox`
--
ALTER TABLE `lhc_mailconv_mailbox`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_mailing_campaign`
--
ALTER TABLE `lhc_mailconv_mailing_campaign`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_mailing_campaign_recipient`
--
ALTER TABLE `lhc_mailconv_mailing_campaign_recipient`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_mailing_list`
--
ALTER TABLE `lhc_mailconv_mailing_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_mailing_list_recipient`
--
ALTER TABLE `lhc_mailconv_mailing_list_recipient`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_match_rule`
--
ALTER TABLE `lhc_mailconv_match_rule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_msg`
--
ALTER TABLE `lhc_mailconv_msg`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_msg_internal`
--
ALTER TABLE `lhc_mailconv_msg_internal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_msg_open`
--
ALTER TABLE `lhc_mailconv_msg_open`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_msg_subject`
--
ALTER TABLE `lhc_mailconv_msg_subject`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_oauth_ms`
--
ALTER TABLE `lhc_mailconv_oauth_ms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_personal_mailbox_group`
--
ALTER TABLE `lhc_mailconv_personal_mailbox_group`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_recipient`
--
ALTER TABLE `lhc_mailconv_recipient`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_remarks`
--
ALTER TABLE `lhc_mailconv_remarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_response_template`
--
ALTER TABLE `lhc_mailconv_response_template`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_response_template_dep`
--
ALTER TABLE `lhc_mailconv_response_template_dep`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_response_template_subject`
--
ALTER TABLE `lhc_mailconv_response_template_subject`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lhc_mailconv_sent_copy`
--
ALTER TABLE `lhc_mailconv_sent_copy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_auto_responder`
--
ALTER TABLE `lh_abstract_auto_responder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_auto_responder_chat`
--
ALTER TABLE `lh_abstract_auto_responder_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_auto_responder_dep`
--
ALTER TABLE `lh_abstract_auto_responder_dep`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_browse_offer_invitation`
--
ALTER TABLE `lh_abstract_browse_offer_invitation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_chat_alert_icon`
--
ALTER TABLE `lh_abstract_chat_alert_icon`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_chat_column`
--
ALTER TABLE `lh_abstract_chat_column`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_chat_priority`
--
ALTER TABLE `lh_abstract_chat_priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_chat_variable`
--
ALTER TABLE `lh_abstract_chat_variable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_email_template`
--
ALTER TABLE `lh_abstract_email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_form`
--
ALTER TABLE `lh_abstract_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_form_collected`
--
ALTER TABLE `lh_abstract_form_collected`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_msg_protection`
--
ALTER TABLE `lh_abstract_msg_protection`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_proactive_chat_campaign`
--
ALTER TABLE `lh_abstract_proactive_chat_campaign`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_proactive_chat_campaign_conv`
--
ALTER TABLE `lh_abstract_proactive_chat_campaign_conv`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_proactive_chat_event`
--
ALTER TABLE `lh_abstract_proactive_chat_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_proactive_chat_invitation`
--
ALTER TABLE `lh_abstract_proactive_chat_invitation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_proactive_chat_invitation_dep`
--
ALTER TABLE `lh_abstract_proactive_chat_invitation_dep`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_proactive_chat_invitation_event`
--
ALTER TABLE `lh_abstract_proactive_chat_invitation_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_proactive_chat_variables`
--
ALTER TABLE `lh_abstract_proactive_chat_variables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_product`
--
ALTER TABLE `lh_abstract_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_product_departament`
--
ALTER TABLE `lh_abstract_product_departament`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_rest_api_key`
--
ALTER TABLE `lh_abstract_rest_api_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_rest_api_key_remote`
--
ALTER TABLE `lh_abstract_rest_api_key_remote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_saved_report`
--
ALTER TABLE `lh_abstract_saved_report`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_saved_search`
--
ALTER TABLE `lh_abstract_saved_search`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_stats`
--
ALTER TABLE `lh_abstract_stats`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_subject`
--
ALTER TABLE `lh_abstract_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_subject_chat`
--
ALTER TABLE `lh_abstract_subject_chat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_subject_dep`
--
ALTER TABLE `lh_abstract_subject_dep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_survey`
--
ALTER TABLE `lh_abstract_survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_survey_item`
--
ALTER TABLE `lh_abstract_survey_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_abstract_widget_theme`
--
ALTER TABLE `lh_abstract_widget_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `lh_admin_theme`
--
ALTER TABLE `lh_admin_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_audits`
--
ALTER TABLE `lh_audits`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_bot_condition`
--
ALTER TABLE `lh_bot_condition`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_brand`
--
ALTER TABLE `lh_brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_brand_member`
--
ALTER TABLE `lh_brand_member`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_canned_msg`
--
ALTER TABLE `lh_canned_msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_canned_msg_dep`
--
ALTER TABLE `lh_canned_msg_dep`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_canned_msg_replace`
--
ALTER TABLE `lh_canned_msg_replace`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_canned_msg_subject`
--
ALTER TABLE `lh_canned_msg_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_canned_msg_tag`
--
ALTER TABLE `lh_canned_msg_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_canned_msg_tag_link`
--
ALTER TABLE `lh_canned_msg_tag_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_canned_msg_use`
--
ALTER TABLE `lh_canned_msg_use`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat`
--
ALTER TABLE `lh_chat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `lh_chatbox`
--
ALTER TABLE `lh_chatbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_accept`
--
ALTER TABLE `lh_chat_accept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_action`
--
ALTER TABLE `lh_chat_action`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_archive_range`
--
ALTER TABLE `lh_chat_archive_range`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_blocked_user`
--
ALTER TABLE `lh_chat_blocked_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_event_track`
--
ALTER TABLE `lh_chat_event_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_file`
--
ALTER TABLE `lh_chat_file`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_incoming`
--
ALTER TABLE `lh_chat_incoming`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_online_user`
--
ALTER TABLE `lh_chat_online_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_online_user_footprint`
--
ALTER TABLE `lh_chat_online_user_footprint`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_paid`
--
ALTER TABLE `lh_chat_paid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_participant`
--
ALTER TABLE `lh_chat_participant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_start_settings`
--
ALTER TABLE `lh_chat_start_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_chat_voice_video`
--
ALTER TABLE `lh_chat_voice_video`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_cobrowse`
--
ALTER TABLE `lh_cobrowse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_departament`
--
ALTER TABLE `lh_departament`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `lh_departament_availability`
--
ALTER TABLE `lh_departament_availability`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_departament_custom_work_hours`
--
ALTER TABLE `lh_departament_custom_work_hours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_departament_group`
--
ALTER TABLE `lh_departament_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_departament_group_member`
--
ALTER TABLE `lh_departament_group_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_departament_group_user`
--
ALTER TABLE `lh_departament_group_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_departament_limit_group`
--
ALTER TABLE `lh_departament_limit_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_departament_limit_group_member`
--
ALTER TABLE `lh_departament_limit_group_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_faq`
--
ALTER TABLE `lh_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_forgotpasswordhash`
--
ALTER TABLE `lh_forgotpasswordhash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_bot`
--
ALTER TABLE `lh_generic_bot_bot`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_chat_event`
--
ALTER TABLE `lh_generic_bot_chat_event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_chat_workflow`
--
ALTER TABLE `lh_generic_bot_chat_workflow`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_command`
--
ALTER TABLE `lh_generic_bot_command`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_exception`
--
ALTER TABLE `lh_generic_bot_exception`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_exception_message`
--
ALTER TABLE `lh_generic_bot_exception_message`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_group`
--
ALTER TABLE `lh_generic_bot_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_payload`
--
ALTER TABLE `lh_generic_bot_payload`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_pending_event`
--
ALTER TABLE `lh_generic_bot_pending_event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_repeat_restrict`
--
ALTER TABLE `lh_generic_bot_repeat_restrict`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_rest_api`
--
ALTER TABLE `lh_generic_bot_rest_api`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_trigger`
--
ALTER TABLE `lh_generic_bot_trigger`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_trigger_event`
--
ALTER TABLE `lh_generic_bot_trigger_event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_trigger_event_template`
--
ALTER TABLE `lh_generic_bot_trigger_event_template`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_trigger_template`
--
ALTER TABLE `lh_generic_bot_trigger_template`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_tr_group`
--
ALTER TABLE `lh_generic_bot_tr_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_generic_bot_tr_item`
--
ALTER TABLE `lh_generic_bot_tr_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_group`
--
ALTER TABLE `lh_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `lh_grouprole`
--
ALTER TABLE `lh_grouprole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `lh_groupuser`
--
ALTER TABLE `lh_groupuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `lh_group_chat`
--
ALTER TABLE `lh_group_chat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_group_chat_member`
--
ALTER TABLE `lh_group_chat_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_group_msg`
--
ALTER TABLE `lh_group_msg`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_group_object`
--
ALTER TABLE `lh_group_object`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_group_work`
--
ALTER TABLE `lh_group_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_incoming_webhook`
--
ALTER TABLE `lh_incoming_webhook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_mail_archive_range`
--
ALTER TABLE `lh_mail_archive_range`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_msg`
--
ALTER TABLE `lh_msg`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `lh_notification_subscriber`
--
ALTER TABLE `lh_notification_subscriber`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_question`
--
ALTER TABLE `lh_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_question_answer`
--
ALTER TABLE `lh_question_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_question_option`
--
ALTER TABLE `lh_question_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_question_option_answer`
--
ALTER TABLE `lh_question_option_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_role`
--
ALTER TABLE `lh_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `lh_rolefunction`
--
ALTER TABLE `lh_rolefunction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT untuk tabel `lh_speech_chat_language`
--
ALTER TABLE `lh_speech_chat_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_speech_language`
--
ALTER TABLE `lh_speech_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT untuk tabel `lh_speech_language_dialect`
--
ALTER TABLE `lh_speech_language_dialect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT untuk tabel `lh_speech_user_language`
--
ALTER TABLE `lh_speech_user_language`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_transfer`
--
ALTER TABLE `lh_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_userdep`
--
ALTER TABLE `lh_userdep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `lh_userdep_alias`
--
ALTER TABLE `lh_userdep_alias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_users`
--
ALTER TABLE `lh_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `lh_users_login`
--
ALTER TABLE `lh_users_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `lh_users_online_session`
--
ALTER TABLE `lh_users_online_session`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `lh_users_remember`
--
ALTER TABLE `lh_users_remember`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_users_session`
--
ALTER TABLE `lh_users_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `lh_users_setting`
--
ALTER TABLE `lh_users_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `lh_webhook`
--
ALTER TABLE `lh_webhook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
