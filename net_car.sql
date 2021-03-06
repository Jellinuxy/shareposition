-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-08-07 10:42:29
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `net_car`
--

-- --------------------------------------------------------

--
-- 表的结构 `siji`
--

CREATE TABLE `siji` (
  `sid` smallint(5) UNSIGNED NOT NULL,
  `account` varchar(30) NOT NULL,
  `pwd` varchar(40) NOT NULL,
  `islocked` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `siji`
--

INSERT INTO `siji` (`sid`, `account`, `pwd`, `islocked`, `created_at`, `last_login`) VALUES
(1, 'siji1', '1672a5cd1188cc21f78d5391ce2cccfe', 0, '2017-08-07 01:05:50', '2017-08-07 01:05:50');

-- --------------------------------------------------------

--
-- 表的结构 `siji_info`
--

CREATE TABLE `siji_info` (
  `sid` smallint(5) UNSIGNED NOT NULL,
  `realname` varchar(30) NOT NULL,
  `idnumber` varchar(20) NOT NULL,
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 男  2 女',
  `contactphone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话号码',
  `carnumber` varchar(20) NOT NULL DEFAULT '',
  `des` varchar(50) NOT NULL DEFAULT '' COMMENT '车子描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `siji_info`
--

INSERT INTO `siji_info` (`sid`, `realname`, `idnumber`, `sex`, `contactphone`, `carnumber`, `des`) VALUES
(1, '廖伟', '500103198610102210', 1, '15002385131', '渝BLW199', '黑色马自达6轿车');

-- --------------------------------------------------------

--
-- 表的结构 `siji_position`
--

CREATE TABLE `siji_position` (
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `geo` varchar(6) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `direction` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0-北  90-东 180-南  270-西',
  `speed` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `pid` bigint(20) UNSIGNED NOT NULL,
  `sid` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `siji_position`
--

INSERT INTO `siji_position` (`lat`, `lng`, `geo`, `created_time`, `direction`, `speed`, `pid`, `sid`) VALUES
(26.123, 103.22, 'wk9ksg', '2017-08-07 03:08:42', 0, 70, 1, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 03:09:41', 0, 70, 2, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 03:12:55', 0, 70, 3, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 03:13:53', 0, 70, 4, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 03:13:56', 0, 70, 5, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:07:58', 0, 70, 6, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:08:01', 0, 70, 7, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:12:42', 0, 70, 8, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:15:30', 0, 70, 9, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:15:57', 0, 70, 10, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:15:59', 0, 70, 11, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:16:00', 0, 70, 12, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:16:01', 0, 70, 13, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:16:02', 0, 70, 14, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:16:03', 0, 70, 15, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:20:11', 0, 70, 16, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:20:54', 0, 70, 17, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:21:28', 0, 70, 18, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:21:46', 0, 70, 19, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:24:02', 0, 70, 20, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:24:22', 0, 70, 21, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:29:53', 0, 70, 22, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:30:39', 0, 70, 23, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:31:28', 0, 70, 24, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:31:29', 0, 70, 25, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:35:02', 0, 70, 26, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:35:24', 0, 70, 27, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:41:46', 0, 70, 28, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:41:58', 0, 70, 29, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:42:05', 0, 70, 30, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:42:08', 0, 70, 31, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:42:26', 0, 70, 32, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:42:27', 0, 70, 33, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:42:28', 0, 70, 34, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:42:29', 0, 70, 35, 1),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:42:42', 0, 70, 36, 2),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:42:47', 0, 70, 37, 3),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:42:52', 0, 70, 38, 4),
(26.123, 103.22, 'wk9ksg', '2017-08-07 06:42:57', 0, 70, 39, 5),
(29.565512, 106.58703, 'wm7b1q', '2017-08-07 07:15:48', 0, 70, 40, 1),
(29.566235, 106.58712, 'wm7b1q', '2017-08-07 07:15:53', 0, 70, 41, 1),
(29.566769, 106.587192, 'wm7b1q', '2017-08-07 07:15:58', 0, 70, 42, 1),
(29.566706, 106.58897, 'wm7b1q', '2017-08-07 07:16:03', 0, 70, 43, 1),
(29.565669, 106.591198, 'wm7b1w', '2017-08-07 07:16:08', 0, 70, 44, 1),
(29.564884, 106.59366, 'wm7b1w', '2017-08-07 07:16:13', 0, 70, 45, 1),
(29.563439, 106.598708, 'wm7b1t', '2017-08-07 07:16:18', 0, 70, 46, 1),
(29.561947, 106.603775, 'wm7b1v', '2017-08-07 07:16:23', 0, 70, 47, 1),
(29.559481, 106.602463, 'wm7b1v', '2017-08-07 07:16:28', 0, 70, 48, 1),
(29.555946, 106.601816, 'wm7b1u', '2017-08-07 07:16:33', 0, 70, 49, 1),
(29.553574, 106.601762, 'wm7b1u', '2017-08-07 07:16:38', 0, 70, 50, 1),
(29.554815, 106.603056, 'wm7b1u', '2017-08-07 07:16:43', 0, 70, 51, 1),
(29.556732, 106.603146, 'wm7b1u', '2017-08-07 07:16:48', 0, 70, 52, 1),
(29.554799, 106.605068, 'wm7b1u', '2017-08-07 07:16:53', 0, 70, 53, 1),
(29.565512, 106.58703, 'wm7b1q', '2017-08-07 07:17:11', 0, 70, 54, 1),
(29.566235, 106.58712, 'wm7b1q', '2017-08-07 07:17:16', 0, 70, 55, 1),
(29.566769, 106.587192, 'wm7b1q', '2017-08-07 07:17:21', 0, 70, 56, 1),
(29.566706, 106.58897, 'wm7b1q', '2017-08-07 07:17:26', 0, 70, 57, 1),
(29.565669, 106.591198, 'wm7b1w', '2017-08-07 07:17:31', 0, 70, 58, 1),
(29.564884, 106.59366, 'wm7b1w', '2017-08-07 07:17:36', 0, 70, 59, 1),
(29.563439, 106.598708, 'wm7b1t', '2017-08-07 07:17:41', 0, 70, 60, 1),
(29.561947, 106.603775, 'wm7b1v', '2017-08-07 07:17:46', 0, 70, 61, 1),
(29.559481, 106.602463, 'wm7b1v', '2017-08-07 07:17:51', 0, 70, 62, 1),
(29.555946, 106.601816, 'wm7b1u', '2017-08-07 07:17:56', 0, 70, 63, 1),
(29.553574, 106.601762, 'wm7b1u', '2017-08-07 07:18:01', 0, 70, 64, 1),
(29.554815, 106.603056, 'wm7b1u', '2017-08-07 07:18:06', 0, 70, 65, 1),
(29.556732, 106.603146, 'wm7b1u', '2017-08-07 07:18:11', 0, 70, 66, 1),
(29.554799, 106.605068, 'wm7b1u', '2017-08-07 07:18:16', 0, 70, 67, 1),
(29.552097, 106.605733, 'wm7b1g', '2017-08-07 07:18:21', 0, 70, 68, 1),
(29.548971, 106.612326, 'wm7b45', '2017-08-07 07:18:26', 0, 70, 69, 1),
(29.545656, 106.625909, 'wm7b46', '2017-08-07 07:18:31', 0, 70, 70, 1),
(29.543661, 106.634946, 'wm7b4d', '2017-08-07 07:18:36', 0, 70, 71, 1),
(29.537219, 106.64648, 'wm7b4c', '2017-08-07 07:18:41', 0, 70, 72, 1),
(29.532034, 106.65611, 'wm7b50', '2017-08-07 07:18:46', 0, 70, 73, 1),
(29.526928, 106.668291, 'wm5zgr', '2017-08-07 07:18:51', 0, 70, 74, 1),
(29.523062, 106.667393, 'wm5zgq', '2017-08-07 07:18:56', 0, 70, 75, 1),
(29.518301, 106.665003, 'wm5zgj', '2017-08-07 07:19:01', 0, 70, 76, 1),
(29.511087, 106.661823, 'wm5zgh', '2017-08-07 07:19:06', 0, 70, 77, 1),
(29.509076, 106.660188, 'wm5zg5', '2017-08-07 07:19:11', 0, 70, 78, 1),
(29.511087, 106.661751, 'wm5zgh', '2017-08-07 07:19:16', 0, 70, 79, 1),
(29.510804, 106.662506, 'wm5zgh', '2017-08-07 07:19:21', 0, 70, 80, 1),
(29.565512, 106.58703, 'wm7b1q', '2017-08-07 07:28:32', 0, 70, 81, 1),
(29.566235, 106.58712, 'wm7b1q', '2017-08-07 07:28:37', 0, 70, 82, 1),
(29.565512, 106.58703, 'wm7b1q', '2017-08-07 07:28:39', 0, 70, 83, 2),
(29.566769, 106.587192, 'wm7b1q', '2017-08-07 07:28:42', 0, 70, 84, 1),
(29.566235, 106.58712, 'wm7b1q', '2017-08-07 07:28:44', 0, 70, 85, 2),
(29.565512, 106.58703, 'wm7b1q', '2017-08-07 07:28:45', 0, 70, 86, 3),
(29.566706, 106.58897, 'wm7b1q', '2017-08-07 07:28:47', 0, 70, 87, 1),
(29.565512, 106.58703, 'wm7b1q', '2017-08-07 07:28:48', 0, 70, 88, 4),
(29.566769, 106.587192, 'wm7b1q', '2017-08-07 07:28:49', 0, 70, 89, 2),
(29.566235, 106.58712, 'wm7b1q', '2017-08-07 07:28:50', 0, 70, 90, 3),
(29.565669, 106.591198, 'wm7b1w', '2017-08-07 07:28:52', 0, 70, 91, 1),
(29.565512, 106.58703, 'wm7b1q', '2017-08-07 07:28:52', 0, 70, 92, 5),
(29.566235, 106.58712, 'wm7b1q', '2017-08-07 07:28:53', 0, 70, 93, 4),
(29.566706, 106.58897, 'wm7b1q', '2017-08-07 07:28:54', 0, 70, 94, 2),
(29.566769, 106.587192, 'wm7b1q', '2017-08-07 07:28:55', 0, 70, 95, 3),
(29.565512, 106.58703, 'wm7b1q', '2017-08-07 07:28:56', 0, 70, 96, 6),
(29.564884, 106.59366, 'wm7b1w', '2017-08-07 07:28:57', 0, 70, 97, 1),
(29.566235, 106.58712, 'wm7b1q', '2017-08-07 07:28:57', 0, 70, 98, 5),
(29.566769, 106.587192, 'wm7b1q', '2017-08-07 07:28:58', 0, 70, 99, 4),
(29.565669, 106.591198, 'wm7b1w', '2017-08-07 07:28:59', 0, 70, 100, 2),
(29.566706, 106.58897, 'wm7b1q', '2017-08-07 07:29:00', 0, 70, 101, 3),
(29.566235, 106.58712, 'wm7b1q', '2017-08-07 07:29:01', 0, 70, 102, 6),
(29.563439, 106.598708, 'wm7b1t', '2017-08-07 07:29:02', 0, 70, 103, 1),
(29.566769, 106.587192, 'wm7b1q', '2017-08-07 07:29:02', 0, 70, 104, 5),
(29.566706, 106.58897, 'wm7b1q', '2017-08-07 07:29:03', 0, 70, 105, 4),
(29.564884, 106.59366, 'wm7b1w', '2017-08-07 07:29:04', 0, 70, 106, 2),
(29.565669, 106.591198, 'wm7b1w', '2017-08-07 07:29:05', 0, 70, 107, 3),
(29.566769, 106.587192, 'wm7b1q', '2017-08-07 07:29:06', 0, 70, 108, 6),
(29.561947, 106.603775, 'wm7b1v', '2017-08-07 07:29:07', 0, 70, 109, 1),
(29.566706, 106.58897, 'wm7b1q', '2017-08-07 07:29:07', 0, 70, 110, 5),
(29.565669, 106.591198, 'wm7b1w', '2017-08-07 07:29:08', 0, 70, 111, 4),
(29.563439, 106.598708, 'wm7b1t', '2017-08-07 07:29:09', 0, 70, 112, 2),
(29.564884, 106.59366, 'wm7b1w', '2017-08-07 07:29:10', 0, 70, 113, 3),
(29.566706, 106.58897, 'wm7b1q', '2017-08-07 07:29:11', 0, 70, 114, 6),
(29.559481, 106.602463, 'wm7b1v', '2017-08-07 07:29:12', 0, 70, 115, 1),
(29.565669, 106.591198, 'wm7b1w', '2017-08-07 07:29:12', 0, 70, 116, 5),
(29.564884, 106.59366, 'wm7b1w', '2017-08-07 07:29:13', 0, 70, 117, 4),
(29.561947, 106.603775, 'wm7b1v', '2017-08-07 07:29:14', 0, 70, 118, 2),
(29.563439, 106.598708, 'wm7b1t', '2017-08-07 07:29:15', 0, 70, 119, 3),
(29.565669, 106.591198, 'wm7b1w', '2017-08-07 07:29:16', 0, 70, 120, 6),
(29.555946, 106.601816, 'wm7b1u', '2017-08-07 07:29:17', 0, 70, 121, 1),
(29.564884, 106.59366, 'wm7b1w', '2017-08-07 07:29:17', 0, 70, 122, 5),
(29.563439, 106.598708, 'wm7b1t', '2017-08-07 07:29:18', 0, 70, 123, 4),
(29.559481, 106.602463, 'wm7b1v', '2017-08-07 07:29:19', 0, 70, 124, 2),
(29.561947, 106.603775, 'wm7b1v', '2017-08-07 07:29:20', 0, 70, 125, 3),
(29.564884, 106.59366, 'wm7b1w', '2017-08-07 07:29:21', 0, 70, 126, 6),
(29.553574, 106.601762, 'wm7b1u', '2017-08-07 07:29:22', 0, 70, 127, 1),
(29.563439, 106.598708, 'wm7b1t', '2017-08-07 07:29:22', 0, 70, 128, 5),
(29.561947, 106.603775, 'wm7b1v', '2017-08-07 07:29:23', 0, 70, 129, 4),
(29.555946, 106.601816, 'wm7b1u', '2017-08-07 07:29:24', 0, 70, 130, 2),
(29.559481, 106.602463, 'wm7b1v', '2017-08-07 07:29:25', 0, 70, 131, 3),
(29.563439, 106.598708, 'wm7b1t', '2017-08-07 07:29:26', 0, 70, 132, 6),
(29.554815, 106.603056, 'wm7b1u', '2017-08-07 07:29:27', 0, 70, 133, 1),
(29.561947, 106.603775, 'wm7b1v', '2017-08-07 07:29:27', 0, 70, 134, 5),
(29.559481, 106.602463, 'wm7b1v', '2017-08-07 07:29:28', 0, 70, 135, 4),
(29.553574, 106.601762, 'wm7b1u', '2017-08-07 07:29:29', 0, 70, 136, 2),
(29.555946, 106.601816, 'wm7b1u', '2017-08-07 07:29:30', 0, 70, 137, 3),
(29.561947, 106.603775, 'wm7b1v', '2017-08-07 07:29:31', 0, 70, 138, 6),
(29.556732, 106.603146, 'wm7b1u', '2017-08-07 07:29:32', 0, 70, 139, 1),
(29.559481, 106.602463, 'wm7b1v', '2017-08-07 07:29:32', 0, 70, 140, 5),
(29.555946, 106.601816, 'wm7b1u', '2017-08-07 07:29:33', 0, 70, 141, 4),
(29.554815, 106.603056, 'wm7b1u', '2017-08-07 07:29:34', 0, 70, 142, 2),
(29.553574, 106.601762, 'wm7b1u', '2017-08-07 07:29:35', 0, 70, 143, 3),
(29.559481, 106.602463, 'wm7b1v', '2017-08-07 07:29:36', 0, 70, 144, 6),
(29.554799, 106.605068, 'wm7b1u', '2017-08-07 07:29:37', 0, 70, 145, 1),
(29.555946, 106.601816, 'wm7b1u', '2017-08-07 07:29:37', 0, 70, 146, 5),
(29.553574, 106.601762, 'wm7b1u', '2017-08-07 07:29:38', 0, 70, 147, 4),
(29.556732, 106.603146, 'wm7b1u', '2017-08-07 07:29:39', 0, 70, 148, 2),
(29.554815, 106.603056, 'wm7b1u', '2017-08-07 07:29:40', 0, 70, 149, 3),
(29.555946, 106.601816, 'wm7b1u', '2017-08-07 07:29:41', 0, 70, 150, 6),
(29.552097, 106.605733, 'wm7b1g', '2017-08-07 07:29:42', 0, 70, 151, 1),
(29.553574, 106.601762, 'wm7b1u', '2017-08-07 07:29:42', 0, 70, 152, 5),
(29.554815, 106.603056, 'wm7b1u', '2017-08-07 07:29:43', 0, 70, 153, 4),
(29.554799, 106.605068, 'wm7b1u', '2017-08-07 07:29:44', 0, 70, 154, 2),
(29.556732, 106.603146, 'wm7b1u', '2017-08-07 07:29:45', 0, 70, 155, 3),
(29.553574, 106.601762, 'wm7b1u', '2017-08-07 07:29:46', 0, 70, 156, 6),
(29.548971, 106.612326, 'wm7b45', '2017-08-07 07:29:47', 0, 70, 157, 1),
(29.554815, 106.603056, 'wm7b1u', '2017-08-07 07:29:47', 0, 70, 158, 5),
(29.556732, 106.603146, 'wm7b1u', '2017-08-07 07:29:48', 0, 70, 159, 4),
(29.552097, 106.605733, 'wm7b1g', '2017-08-07 07:29:49', 0, 70, 160, 2),
(29.554799, 106.605068, 'wm7b1u', '2017-08-07 07:29:50', 0, 70, 161, 3),
(29.554815, 106.603056, 'wm7b1u', '2017-08-07 07:29:51', 0, 70, 162, 6),
(29.545656, 106.625909, 'wm7b46', '2017-08-07 07:29:52', 0, 70, 163, 1),
(29.556732, 106.603146, 'wm7b1u', '2017-08-07 07:29:52', 0, 70, 164, 5),
(29.554799, 106.605068, 'wm7b1u', '2017-08-07 07:29:53', 0, 70, 165, 4),
(29.548971, 106.612326, 'wm7b45', '2017-08-07 07:29:54', 0, 70, 166, 2),
(29.552097, 106.605733, 'wm7b1g', '2017-08-07 07:29:55', 0, 70, 167, 3),
(29.556732, 106.603146, 'wm7b1u', '2017-08-07 07:29:56', 0, 70, 168, 6),
(29.543661, 106.634946, 'wm7b4d', '2017-08-07 07:29:57', 0, 70, 169, 1),
(29.554799, 106.605068, 'wm7b1u', '2017-08-07 07:29:57', 0, 70, 170, 5),
(29.552097, 106.605733, 'wm7b1g', '2017-08-07 07:29:58', 0, 70, 171, 4),
(29.545656, 106.625909, 'wm7b46', '2017-08-07 07:29:59', 0, 70, 172, 2),
(29.548971, 106.612326, 'wm7b45', '2017-08-07 07:30:00', 0, 70, 173, 3),
(29.554799, 106.605068, 'wm7b1u', '2017-08-07 07:30:01', 0, 70, 174, 6),
(29.537219, 106.64648, 'wm7b4c', '2017-08-07 07:30:02', 0, 70, 175, 1),
(29.552097, 106.605733, 'wm7b1g', '2017-08-07 07:30:02', 0, 70, 176, 5),
(29.548971, 106.612326, 'wm7b45', '2017-08-07 07:30:03', 0, 70, 177, 4),
(29.543661, 106.634946, 'wm7b4d', '2017-08-07 07:30:04', 0, 70, 178, 2),
(29.545656, 106.625909, 'wm7b46', '2017-08-07 07:30:05', 0, 70, 179, 3),
(29.552097, 106.605733, 'wm7b1g', '2017-08-07 07:30:06', 0, 70, 180, 6),
(29.532034, 106.65611, 'wm7b50', '2017-08-07 07:30:07', 0, 70, 181, 1),
(29.548971, 106.612326, 'wm7b45', '2017-08-07 07:30:07', 0, 70, 182, 5),
(29.545656, 106.625909, 'wm7b46', '2017-08-07 07:30:08', 0, 70, 183, 4),
(29.537219, 106.64648, 'wm7b4c', '2017-08-07 07:30:09', 0, 70, 184, 2),
(29.543661, 106.634946, 'wm7b4d', '2017-08-07 07:30:10', 0, 70, 185, 3),
(29.548971, 106.612326, 'wm7b45', '2017-08-07 07:30:11', 0, 70, 186, 6),
(29.526928, 106.668291, 'wm5zgr', '2017-08-07 07:30:12', 0, 70, 187, 1),
(29.545656, 106.625909, 'wm7b46', '2017-08-07 07:30:12', 0, 70, 188, 5),
(29.543661, 106.634946, 'wm7b4d', '2017-08-07 07:30:13', 0, 70, 189, 4),
(29.532034, 106.65611, 'wm7b50', '2017-08-07 07:30:14', 0, 70, 190, 2),
(29.537219, 106.64648, 'wm7b4c', '2017-08-07 07:30:15', 0, 70, 191, 3),
(29.545656, 106.625909, 'wm7b46', '2017-08-07 07:30:16', 0, 70, 192, 6),
(29.523062, 106.667393, 'wm5zgq', '2017-08-07 07:30:17', 0, 70, 193, 1),
(29.543661, 106.634946, 'wm7b4d', '2017-08-07 07:30:17', 0, 70, 194, 5),
(29.537219, 106.64648, 'wm7b4c', '2017-08-07 07:30:18', 0, 70, 195, 4),
(29.526928, 106.668291, 'wm5zgr', '2017-08-07 07:30:19', 0, 70, 196, 2),
(29.532034, 106.65611, 'wm7b50', '2017-08-07 07:30:20', 0, 70, 197, 3),
(29.543661, 106.634946, 'wm7b4d', '2017-08-07 07:30:21', 0, 70, 198, 6),
(29.518301, 106.665003, 'wm5zgj', '2017-08-07 07:30:22', 0, 70, 199, 1),
(29.537219, 106.64648, 'wm7b4c', '2017-08-07 07:30:22', 0, 70, 200, 5),
(29.532034, 106.65611, 'wm7b50', '2017-08-07 07:30:23', 0, 70, 201, 4),
(29.523062, 106.667393, 'wm5zgq', '2017-08-07 07:30:24', 0, 70, 202, 2),
(29.526928, 106.668291, 'wm5zgr', '2017-08-07 07:30:25', 0, 70, 203, 3),
(29.537219, 106.64648, 'wm7b4c', '2017-08-07 07:30:26', 0, 70, 204, 6),
(29.511087, 106.661823, 'wm5zgh', '2017-08-07 07:30:27', 0, 70, 205, 1),
(29.532034, 106.65611, 'wm7b50', '2017-08-07 07:30:27', 0, 70, 206, 5),
(29.526928, 106.668291, 'wm5zgr', '2017-08-07 07:30:28', 0, 70, 207, 4),
(29.518301, 106.665003, 'wm5zgj', '2017-08-07 07:30:29', 0, 70, 208, 2),
(29.523062, 106.667393, 'wm5zgq', '2017-08-07 07:30:30', 0, 70, 209, 3),
(29.532034, 106.65611, 'wm7b50', '2017-08-07 07:30:31', 0, 70, 210, 6),
(29.509076, 106.660188, 'wm5zg5', '2017-08-07 07:30:32', 0, 70, 211, 1),
(29.526928, 106.668291, 'wm5zgr', '2017-08-07 07:30:32', 0, 70, 212, 5),
(29.523062, 106.667393, 'wm5zgq', '2017-08-07 07:30:33', 0, 70, 213, 4),
(29.511087, 106.661823, 'wm5zgh', '2017-08-07 07:30:34', 0, 70, 214, 2),
(29.518301, 106.665003, 'wm5zgj', '2017-08-07 07:30:35', 0, 70, 215, 3),
(29.526928, 106.668291, 'wm5zgr', '2017-08-07 07:30:36', 0, 70, 216, 6),
(29.511087, 106.661751, 'wm5zgh', '2017-08-07 07:30:37', 0, 70, 217, 1),
(29.523062, 106.667393, 'wm5zgq', '2017-08-07 07:30:37', 0, 70, 218, 5),
(29.518301, 106.665003, 'wm5zgj', '2017-08-07 07:30:38', 0, 70, 219, 4),
(29.509076, 106.660188, 'wm5zg5', '2017-08-07 07:30:39', 0, 70, 220, 2),
(29.511087, 106.661823, 'wm5zgh', '2017-08-07 07:30:40', 0, 70, 221, 3),
(29.523062, 106.667393, 'wm5zgq', '2017-08-07 07:30:41', 0, 70, 222, 6),
(29.518301, 106.665003, 'wm5zgj', '2017-08-07 07:30:42', 0, 70, 223, 5),
(29.511087, 106.661823, 'wm5zgh', '2017-08-07 07:30:43', 0, 70, 224, 4),
(29.511087, 106.661751, 'wm5zgh', '2017-08-07 07:30:44', 0, 70, 225, 2),
(29.509076, 106.660188, 'wm5zg5', '2017-08-07 07:30:45', 0, 70, 226, 3),
(29.518301, 106.665003, 'wm5zgj', '2017-08-07 07:30:46', 0, 70, 227, 6),
(29.511087, 106.661823, 'wm5zgh', '2017-08-07 07:30:47', 0, 70, 228, 5),
(29.509076, 106.660188, 'wm5zg5', '2017-08-07 07:30:48', 0, 70, 229, 4),
(29.511087, 106.661751, 'wm5zgh', '2017-08-07 07:30:50', 0, 70, 230, 3),
(29.511087, 106.661823, 'wm5zgh', '2017-08-07 07:30:51', 0, 70, 231, 6),
(29.509076, 106.660188, 'wm5zg5', '2017-08-07 07:30:52', 0, 70, 232, 5),
(29.511087, 106.661751, 'wm5zgh', '2017-08-07 07:30:53', 0, 70, 233, 4),
(29.509076, 106.660188, 'wm5zg5', '2017-08-07 07:30:56', 0, 70, 234, 6),
(29.511087, 106.661751, 'wm5zgh', '2017-08-07 07:30:57', 0, 70, 235, 5),
(29.511087, 106.661751, 'wm5zgh', '2017-08-07 07:31:01', 0, 70, 236, 6);

-- --------------------------------------------------------

--
-- 表的结构 `siji_status`
--

CREATE TABLE `siji_status` (
  `sid` smallint(5) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 没上班   1上班中-可接客   2上班中-正在接客  3上班中-急事不接客'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `siji`
--
ALTER TABLE `siji`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `siji_info`
--
ALTER TABLE `siji_info`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `siji_position`
--
ALTER TABLE `siji_position`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `geo` (`geo`),
  ADD KEY `sijiid` (`sid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `siji_status`
--
ALTER TABLE `siji_status`
  ADD PRIMARY KEY (`sid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `siji`
--
ALTER TABLE `siji`
  MODIFY `sid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `siji_position`
--
ALTER TABLE `siji_position`
  MODIFY `pid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
