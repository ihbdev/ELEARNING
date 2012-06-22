-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 22, 2012 at 12:32 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `authassignment`
--

CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(64) NOT NULL,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`itemname`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authassignment`
--

INSERT INTO `authassignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('Admin', 1, NULL, 'N;'),
('Employee', 4, NULL, 'N;'),
('Employee', 5, NULL, 'N;'),
('Manager', 2, NULL, 'N;'),
('Manager', 5, NULL, 'N;'),
('Manager', 6, NULL, 'N;'),
('Trainer', 3, NULL, 'N;'),
('Trainer', 6, NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `authitem`
--

CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authitem`
--

INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('Admin', 2, '', NULL, 'N;'),
('album_create', 0, '', NULL, 'N;'),
('Album_Creater', 1, '', NULL, 'N;'),
('album_delete', 0, '', NULL, 'N;'),
('Album_Editor', 1, '', NULL, 'N;'),
('album_index', 0, '', NULL, 'N;'),
('Album_Manager', 1, '', NULL, 'N;'),
('album_own_update', 0, '', 'return Yii::app()->user->id==$params ["album"]->created_by;', 'N;'),
('album_reverseStatus', 0, '', NULL, 'N;'),
('album_suggestTitle', 0, '', NULL, 'N;'),
('album_update', 0, '', NULL, 'N;'),
('app_checkbox', 0, '', NULL, 'N;'),
('app_copy', 0, '', NULL, 'N;'),
('app_create', 0, '', NULL, 'N;'),
('App_Creater', 1, '', NULL, 'N;'),
('app_delete', 0, '', NULL, 'N;'),
('app_dynamicCat', 0, '', NULL, 'N;'),
('App_Editor', 1, '', NULL, 'N;'),
('app_index', 0, '', NULL, 'N;'),
('App_Manager', 1, '', NULL, 'N;'),
('app_own_update', 0, '', NULL, 'N;'),
('app_reverseStatus', 0, '', NULL, 'N;'),
('app_suggestTitle', 0, '', NULL, 'N;'),
('app_update', 0, '', NULL, 'N;'),
('app_updateSuggest', 0, '', NULL, 'N;'),
('banner_checkbox', 0, '', NULL, 'N;'),
('banner_create', 0, '', NULL, 'N;'),
('banner_delete', 0, '', NULL, 'N;'),
('banner_index', 0, '', NULL, 'N;'),
('Banner_Manager', 1, '', NULL, 'N;'),
('banner_reverseStatus', 0, '', NULL, 'N;'),
('banner_suggestTitle', 0, '', NULL, 'N;'),
('banner_update', 0, '', '', 'N;'),
('category_configUrl', 0, '', NULL, 'N;'),
('category_create', 0, '', NULL, 'N;'),
('category_delete', 0, '', NULL, 'N;'),
('category_index', 0, '', NULL, 'N;'),
('Category_Manager', 1, '', NULL, 'N;'),
('category_setActiveAdminMenu', 0, '', NULL, 'N;'),
('category_update', 0, '', '', 'N;'),
('category_updateListOrderView', 0, '', NULL, 'N;'),
('category_validate', 0, '', NULL, 'N;'),
('category_write', 0, '', NULL, 'N;'),
('contact_checkbox', 0, '', NULL, 'N;'),
('contact_delete', 0, '', NULL, 'N;'),
('contact_index', 0, '', NULL, 'N;'),
('Contact_Manager', 1, '', NULL, 'N;'),
('contact_reverseStatus', 0, '', NULL, 'N;'),
('contact_suggestTitle', 0, '', NULL, 'N;'),
('contact_view', 0, '', NULL, 'N;'),
('Employee', 2, '', NULL, 'N;'),
('image_clear', 0, '', NULL, 'N;'),
('image_delete', 0, '', NULL, 'N;'),
('image_list', 0, '', NULL, 'N;'),
('Image_Manager', 1, '', NULL, 'N;'),
('image_reverseStatus', 0, '', NULL, 'N;'),
('image_suggestTitle', 0, '', NULL, 'N;'),
('image_update', 0, '', NULL, 'N;'),
('image_upload', 0, '', NULL, 'N;'),
('keyword_checkbox', 0, '', NULL, 'N;'),
('keyword_create', 0, '', NULL, 'N;'),
('keyword_delete', 0, '', NULL, 'N;'),
('keyword_index', 0, '', NULL, 'N;'),
('Keyword_Manager', 1, '', NULL, 'N;'),
('keyword_reverseStatus', 0, '', NULL, 'N;'),
('keyword_suggestName', 0, '', NULL, 'N;'),
('keyword_update', 0, '', NULL, 'N;'),
('language_create', 0, '', NULL, 'N;'),
('language_delete', 0, '', NULL, 'N;'),
('language_edit', 0, '', NULL, 'N;'),
('language_export', 0, '', NULL, 'N;'),
('language_import', 0, '', NULL, 'N;'),
('Language_Manager', 1, '', NULL, 'N;'),
('Manager', 2, 'Tạo và chỉnh sửa video, album, tin tức, sản phẩm', NULL, 'N;'),
('menu_configUrl', 0, '', NULL, 'N;'),
('menu_create', 0, '', NULL, 'N;'),
('menu_delete', 0, '', NULL, 'N;'),
('menu_index', 0, '', NULL, 'N;'),
('Menu_Manager', 1, '', NULL, 'N;'),
('menu_setActiveAdminMenu', 0, '', NULL, 'N;'),
('menu_update', 0, '', NULL, 'N;'),
('menu_updateListOrderView', 0, '', NULL, 'N;'),
('menu_validate', 0, '', NULL, 'N;'),
('menu_write', 0, '', NULL, 'N;'),
('news_checkbox', 0, '', NULL, 'N;'),
('news_copy', 0, '', NULL, 'N;'),
('news_create', 0, '', NULL, 'N;'),
('News_Creater', 1, '', NULL, 'N;'),
('news_delete', 0, '', NULL, 'N;'),
('news_dynamicCat', 0, '', NULL, 'N;'),
('News_Editor', 1, '', NULL, 'N;'),
('news_index', 0, '', NULL, 'N;'),
('News_Manager', 1, '', NULL, 'N;'),
('news_own_update', 0, '', 'return Yii::app()->user->id==$params ["news"]->created_by;', 'N;'),
('news_reverseStatus', 0, '', NULL, 'N;'),
('news_suggestTitle', 0, '', NULL, 'N;'),
('news_update', 0, '', NULL, 'N;'),
('news_updateSuggest', 0, '', NULL, 'N;'),
('order_checkbox', 0, '', NULL, 'N;'),
('order_delete', 0, '', NULL, 'N;'),
('order_index', 0, '', NULL, 'N;'),
('Order_Manager', 1, '', NULL, 'N;'),
('order_reverseProcessStatus', 0, '', NULL, 'N;'),
('order_reverseStatus', 0, '', NULL, 'N;'),
('order_suggestTitle', 0, '', NULL, 'N;'),
('product__own_update', 0, '', 'return Yii::app()->user->id==$params ["product"]->created_by;', 'N;'),
('product_checkbox', 0, '', NULL, 'N;'),
('product_copy', 0, '', NULL, 'N;'),
('product_create', 0, '', NULL, 'N;'),
('Product_Creater', 1, '', NULL, 'N;'),
('product_delete', 0, '', NULL, 'N;'),
('product_dynamicCat', 0, '', NULL, 'N;'),
('Product_Editor', 1, '', NULL, 'N;'),
('product_index', 0, '', NULL, 'N;'),
('Product_Manager', 1, '', NULL, 'N;'),
('product_reverseAmountStatus', 0, '', NULL, 'N;'),
('product_reverseStatus', 0, '', NULL, 'N;'),
('product_suggestName', 0, '', NULL, 'N;'),
('product_update', 0, '', NULL, 'N;'),
('product_updateSuggest', 0, '', NULL, 'N;'),
('qa_checkbox', 0, '', NULL, 'N;'),
('qa_create', 0, '', NULL, 'N;'),
('qa_delete', 0, '', NULL, 'N;'),
('qa_index', 0, '', NULL, 'N;'),
('QA_Manager', 1, '', NULL, 'N;'),
('qa_reverseStatus', 0, '', NULL, 'N;'),
('qa_suggestTitle', 0, '', NULL, 'N;'),
('qa_update', 0, '', NULL, 'N;'),
('recruitment_checkbox', 0, '', NULL, 'N;'),
('recruitment_copy', 0, '', NULL, 'N;'),
('recruitment_create', 0, '', NULL, 'N;'),
('recruitment_delete', 0, '', NULL, 'N;'),
('recruitment_dynamicCat', 0, '', NULL, 'N;'),
('recruitment_index', 0, '', NULL, 'N;'),
('Recruitment_Manager', 1, '', NULL, 'N;'),
('recruitment_suggestTitle', 0, '', NULL, 'N;'),
('recruitment_update', 0, '', NULL, 'N;'),
('recruitment_updateSuggest', 0, '', NULL, 'N;'),
('register_checkbox', 0, '', NULL, 'N;'),
('register_delete', 0, '', NULL, 'N;'),
('register_index', 0, '', NULL, 'N;'),
('Register_Manager', 1, '', NULL, 'N;'),
('register_suggestEmail', 0, '', NULL, 'N;'),
('register_suggestName', 0, '', NULL, 'N;'),
('register_view', 0, '', NULL, 'N;'),
('role_create', 0, '', NULL, 'N;'),
('role_delete', 0, '', NULL, 'N;'),
('role_index', 0, '', NULL, 'N;'),
('Role_Manager', 1, '', NULL, 'N;'),
('role_update', 0, '', NULL, 'N;'),
('role_validate', 0, '', NULL, 'N;'),
('role_write', 0, '', NULL, 'N;'),
('setting_checkbox', 0, '', NULL, 'N;'),
('setting_create', 0, '', NULL, 'N;'),
('setting_delete', 0, '', NULL, 'N;'),
('setting_index', 0, '', NULL, 'N;'),
('Setting_Manager', 1, '', NULL, 'N;'),
('setting_reverseStatus', 0, '', NULL, 'N;'),
('setting_suggestName', 0, '', NULL, 'N;'),
('setting_update', 0, '', NULL, 'N;'),
('static_page_checkbox', 0, '', NULL, 'N;'),
('static_page_copy', 0, '', NULL, 'N;'),
('static_page_create', 0, '', NULL, 'N;'),
('static_page_delete', 0, '', NULL, 'N;'),
('static_page_dynamicCat', 0, '', NULL, 'N;'),
('static_page_index', 0, '', NULL, 'N;'),
('Static_Page_Manager', 1, '', NULL, 'N;'),
('static_page_reverseStatus', 0, '', NULL, 'N;'),
('static_page_suggestTitle', 0, '', NULL, 'N;'),
('static_page_update', 0, '', NULL, 'N;'),
('static_page_updateSuggest', 0, '', NULL, 'N;'),
('support_checkbox', 0, '', NULL, 'N;'),
('support_create', 0, '', NULL, 'N;'),
('support_delete', 0, '', NULL, 'N;'),
('support_index', 0, '', NULL, 'N;'),
('Support_Manager', 1, '', NULL, 'N;'),
('support_reverseStatus', 0, '', NULL, 'N;'),
('support_suggestName', 0, '', NULL, 'N;'),
('support_update', 0, '', NULL, 'N;'),
('Trainer', 2, 'Tạo album, video, tin tức và sản phẩm', NULL, 'N;'),
('Upload_Image', 1, '', NULL, 'N;'),
('user_changePassword', 0, '', NULL, 'N;'),
('user_checkbox', 0, '', NULL, 'N;'),
('user_create', 0, '', NULL, 'N;'),
('user_delete', 0, '', NULL, 'N;'),
('user_index', 0, '', NULL, 'N;'),
('User_Manager', 1, '', NULL, 'N;'),
('user_resetPassword', 0, '', NULL, 'N;'),
('user_reverseStatus', 0, '', NULL, 'N;'),
('user_suggestEmail', 0, '', NULL, 'N;'),
('user_suggestUsername', 0, '', NULL, 'N;'),
('user_update', 0, '', NULL, 'N;'),
('video_checkbox', 0, '', NULL, 'N;'),
('video_create', 0, '', NULL, 'N;'),
('Video_Creater', 1, '', NULL, 'N;'),
('video_delete', 0, '', NULL, 'N;'),
('Video_Editor', 1, '', NULL, 'N;'),
('video_index', 0, '', NULL, 'N;'),
('Video_Manager', 1, '', NULL, 'N;'),
('video_own_update', 0, '', 'return Yii::app()->user->id==$params ["video"]->created_by;', 'N;'),
('video_reverseStatus', 0, '', NULL, 'N;'),
('video_suggestTitle', 0, '', NULL, 'N;'),
('video_update', 0, '', NULL, 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `authitemchild`
--

CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authitemchild`
--

INSERT INTO `authitemchild` (`parent`, `child`) VALUES
('Album_Creater', 'album_create'),
('Album_Editor', 'Album_Creater'),
('Trainer', 'Album_Creater'),
('Album_Manager', 'album_delete'),
('Album_Manager', 'Album_Editor'),
('Manager', 'Album_Editor'),
('Album_Creater', 'album_index'),
('Admin', 'Album_Manager'),
('Album_Creater', 'album_own_update'),
('Album_Editor', 'album_reverseStatus'),
('Album_Creater', 'album_suggestTitle'),
('Album_Editor', 'album_update'),
('album_own_update', 'album_update'),
('App_Editor', 'app_checkbox'),
('App_Creater', 'app_create'),
('App_Editor', 'App_Creater'),
('Trainer', 'App_Creater'),
('App_Manager', 'app_delete'),
('App_Creater', 'app_dynamicCat'),
('App_Manager', 'App_Editor'),
('Manager', 'App_Editor'),
('App_Creater', 'app_index'),
('Admin', 'App_Manager'),
('App_Creater', 'app_own_update'),
('App_Editor', 'app_reverseStatus'),
('App_Creater', 'app_suggestTitle'),
('App_Editor', 'app_update'),
('app_own_update', 'app_update'),
('App_Creater', 'app_updateSuggest'),
('Banner_Manager', 'banner_checkbox'),
('Banner_Manager', 'banner_create'),
('Banner_Manager', 'banner_delete'),
('Banner_Manager', 'banner_index'),
('Admin', 'Banner_Manager'),
('Banner_Manager', 'banner_reverseStatus'),
('Banner_Manager', 'banner_suggestTitle'),
('Banner_Manager', 'banner_update'),
('Category_Manager', 'category_configUrl'),
('Category_Manager', 'category_create'),
('Category_Manager', 'category_delete'),
('Category_Manager', 'category_index'),
('Admin', 'Category_Manager'),
('Category_Manager', 'category_setActiveAdminMenu'),
('Category_Manager', 'category_update'),
('Category_Manager', 'category_updateListOrderView'),
('Category_Manager', 'category_validate'),
('Category_Manager', 'category_write'),
('Contact_Manager', 'contact_checkbox'),
('Contact_Manager', 'contact_delete'),
('Contact_Manager', 'contact_index'),
('Admin', 'Contact_Manager'),
('Contact_Manager', 'contact_reverseStatus'),
('Contact_Manager', 'contact_suggestTitle'),
('Contact_Manager', 'contact_view'),
('Image_Manager', 'image_clear'),
('Image_Manager', 'image_delete'),
('Upload_Image', 'image_delete'),
('Image_Manager', 'image_list'),
('Admin', 'Image_Manager'),
('Image_Manager', 'image_reverseStatus'),
('Image_Manager', 'image_suggestTitle'),
('Image_Manager', 'image_update'),
('Upload_Image', 'image_upload'),
('Keyword_Manager', 'keyword_checkbox'),
('Keyword_Manager', 'keyword_create'),
('Keyword_Manager', 'keyword_delete'),
('Keyword_Manager', 'keyword_index'),
('Admin', 'Keyword_Manager'),
('Keyword_Manager', 'keyword_reverseStatus'),
('Keyword_Manager', 'keyword_suggestName'),
('Keyword_Manager', 'keyword_update'),
('Language_Manager', 'language_create'),
('Language_Manager', 'language_delete'),
('Language_Manager', 'language_edit'),
('Language_Manager', 'language_export'),
('Language_Manager', 'language_import'),
('Admin', 'Language_Manager'),
('Menu_Manager', 'menu_configUrl'),
('Menu_Manager', 'menu_create'),
('Menu_Manager', 'menu_delete'),
('Menu_Manager', 'menu_index'),
('Admin', 'Menu_Manager'),
('Menu_Manager', 'menu_setActiveAdminMenu'),
('Menu_Manager', 'menu_update'),
('Menu_Manager', 'menu_updateListOrderView'),
('Menu_Manager', 'menu_validate'),
('Menu_Manager', 'menu_write'),
('News_Editor', 'news_checkbox'),
('News_Creater', 'news_copy'),
('News_Creater', 'news_create'),
('News_Editor', 'News_Creater'),
('Trainer', 'News_Creater'),
('News_Manager', 'news_delete'),
('News_Creater', 'news_dynamicCat'),
('Manager', 'News_Editor'),
('News_Manager', 'News_Editor'),
('News_Creater', 'news_index'),
('Admin', 'News_Manager'),
('News_Creater', 'news_own_update'),
('News_Editor', 'news_reverseStatus'),
('News_Creater', 'news_suggestTitle'),
('News_Editor', 'news_update'),
('news_own_update', 'news_update'),
('News_Creater', 'news_updateSuggest'),
('Order_Manager', 'order_checkbox'),
('Order_Manager', 'order_delete'),
('Order_Manager', 'order_index'),
('Admin', 'Order_Manager'),
('Order_Manager', 'order_reverseProcessStatus'),
('Order_Manager', 'order_reverseStatus'),
('Order_Manager', 'order_suggestTitle'),
('Product_Creater', 'product__own_update'),
('Product_Editor', 'product_checkbox'),
('Product_Creater', 'product_copy'),
('Product_Creater', 'product_create'),
('Product_Editor', 'Product_Creater'),
('Trainer', 'Product_Creater'),
('Product_Manager', 'product_delete'),
('Product_Creater', 'product_dynamicCat'),
('Manager', 'Product_Editor'),
('Product_Manager', 'Product_Editor'),
('Product_Creater', 'product_index'),
('Admin', 'Product_Manager'),
('Product_Editor', 'product_reverseAmountStatus'),
('Product_Editor', 'product_reverseStatus'),
('Product_Creater', 'product_suggestName'),
('product__own_update', 'product_update'),
('Product_Editor', 'product_update'),
('Product_Creater', 'product_updateSuggest'),
('QA_Manager', 'qa_checkbox'),
('QA_Manager', 'qa_create'),
('QA_Manager', 'qa_delete'),
('QA_Manager', 'qa_index'),
('Admin', 'QA_Manager'),
('QA_Manager', 'qa_reverseStatus'),
('QA_Manager', 'qa_suggestTitle'),
('QA_Manager', 'qa_update'),
('Recruitment_Manager', 'recruitment_checkbox'),
('Recruitment_Manager', 'recruitment_copy'),
('Recruitment_Manager', 'recruitment_create'),
('Recruitment_Manager', 'recruitment_delete'),
('Recruitment_Manager', 'recruitment_dynamicCat'),
('Recruitment_Manager', 'recruitment_index'),
('Admin', 'Recruitment_Manager'),
('Recruitment_Manager', 'recruitment_suggestTitle'),
('Recruitment_Manager', 'recruitment_update'),
('Recruitment_Manager', 'recruitment_updateSuggest'),
('Register_Manager', 'register_checkbox'),
('Register_Manager', 'register_delete'),
('Register_Manager', 'register_index'),
('Admin', 'Register_Manager'),
('Register_Manager', 'register_suggestEmail'),
('Register_Manager', 'register_suggestName'),
('Register_Manager', 'register_view'),
('Role_Manager', 'role_create'),
('Role_Manager', 'role_delete'),
('Role_Manager', 'role_index'),
('Admin', 'Role_Manager'),
('Role_Manager', 'role_update'),
('Role_Manager', 'role_validate'),
('Role_Manager', 'role_write'),
('Setting_Manager', 'setting_checkbox'),
('Setting_Manager', 'setting_create'),
('Setting_Manager', 'setting_delete'),
('Setting_Manager', 'setting_index'),
('Admin', 'Setting_Manager'),
('Setting_Manager', 'setting_reverseStatus'),
('Setting_Manager', 'setting_suggestName'),
('Setting_Manager', 'setting_update'),
('Static_Page_Manager', 'static_page_checkbox'),
('Static_Page_Manager', 'static_page_copy'),
('Static_Page_Manager', 'static_page_create'),
('Static_Page_Manager', 'static_page_delete'),
('Static_Page_Manager', 'static_page_dynamicCat'),
('Static_Page_Manager', 'static_page_index'),
('Admin', 'Static_Page_Manager'),
('Static_Page_Manager', 'static_page_reverseStatus'),
('Static_Page_Manager', 'static_page_suggestTitle'),
('Static_Page_Manager', 'static_page_update'),
('Static_Page_Manager', 'static_page_updateSuggest'),
('Support_Manager', 'support_checkbox'),
('Support_Manager', 'support_create'),
('Support_Manager', 'support_delete'),
('Support_Manager', 'support_index'),
('Admin', 'Support_Manager'),
('Support_Manager', 'support_reverseStatus'),
('Support_Manager', 'support_suggestName'),
('Support_Manager', 'support_update'),
('Admin', 'Upload_Image'),
('Manager', 'Upload_Image'),
('Trainer', 'Upload_Image'),
('User_Manager', 'user_changePassword'),
('User_Manager', 'user_checkbox'),
('User_Manager', 'user_create'),
('User_Manager', 'user_delete'),
('User_Manager', 'user_index'),
('Admin', 'User_Manager'),
('User_Manager', 'user_resetPassword'),
('User_Manager', 'user_reverseStatus'),
('User_Manager', 'user_suggestEmail'),
('User_Manager', 'user_suggestUsername'),
('User_Manager', 'user_update'),
('Video_Editor', 'video_checkbox'),
('Video_Creater', 'video_create'),
('Trainer', 'Video_Creater'),
('Video_Editor', 'Video_Creater'),
('Video_Manager', 'video_delete'),
('Manager', 'Video_Editor'),
('Video_Manager', 'Video_Editor'),
('Video_Creater', 'video_index'),
('Admin', 'Video_Manager'),
('Video_Creater', 'video_own_update'),
('Video_Editor', 'video_reverseStatus'),
('Video_Creater', 'video_suggestTitle'),
('Video_Editor', 'video_update'),
('video_own_update', 'video_update');

-- --------------------------------------------------------

--
-- Table structure for table `pcounter_save`
--

CREATE TABLE IF NOT EXISTS `pcounter_save` (
  `save_name` varchar(10) NOT NULL,
  `save_value` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pcounter_save`
--


-- --------------------------------------------------------

--
-- Table structure for table `pcounter_users`
--

CREATE TABLE IF NOT EXISTS `pcounter_users` (
  `user_ip` varchar(39) NOT NULL,
  `user_time` int(10) unsigned NOT NULL,
  UNIQUE KEY `user_ip` (`user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pcounter_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_article`
--

CREATE TABLE IF NOT EXISTS `tbl_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'vi',
  `catid` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `special` tinyint(4) NOT NULL DEFAULT '0',
  `order_view` int(11) NOT NULL DEFAULT '0',
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `other` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  `visits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=55 ;

--
-- Dumping data for table `tbl_article`
--

INSERT INTO `tbl_article` (`id`, `lang`, `catid`, `type`, `status`, `special`, `order_view`, `title`, `alias`, `keyword`, `other`, `created_by`, `created_date`, `visits`) VALUES
(8, 'vi', 12, 2, 1, 0, 0, 'Ưu điểm của thanh toán qua thẻ cào', 'uu-diem-cua-thanh-toan-qua-the-cao', '29', '{"introimage":"13","list_suggest":"","fulltext":"<p><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong>So v\\u1edbi c&aacute;c h&igrave;nh th\\u1ee9c thanh to&aacute;n kh&aacute;c, thanh to&aacute;n qua th\\u1ebb c&agrave;o, c&oacute; nh\\u1eefng \\u01b0u \\u0111i\\u1ec3m v\\u01b0\\u1ee3t tr\\u1ed9i sau:<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><br \\/><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #284d73;\\"><strong>&nbsp;&nbsp;&nbsp; - Ti\\u1ec7n l\\u1ee3i \\u0111\\u1ec3 thanh to&aacute;n cho c&aacute;c \\u0111\\u01a1n h&agrave;ng c&oacute; gi&aacute; tr\\u1ecb nh\\u1ecf. (vd: 20 ng&agrave;n,50 ng&agrave;n ,100 ng&agrave;n VND)<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #284d73;\\"><strong>&nbsp;&nbsp;&nbsp; - Ti\\u1ec7n l\\u1ee3i \\u0111\\u1ec3 thanh to&aacute;n khi ng\\u01b0\\u1eddi mua \\u1edf c&aacute;c khu v\\u1ef1c xa ng&acirc;n h&agrave;ng ho\\u1eb7c kh&ocirc;ng c&oacute; ng&acirc;n h&agrave;ng.<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #284d73;\\"><strong>&nbsp;&nbsp;&nbsp;  - Ti\\u1ec7n l\\u1ee3i khi n\\u1ea1p ti\\u1ec1n v&agrave;o t&agrave;i kho\\u1ea3n c&aacute;c trang m\\u1ea1ng \\u0111\\u1ec3 ph\\u1ee5c v\\u1ee5 m\\u1ee5c  \\u0111&iacute;ch t\\u1ea3i t&agrave;i li\\u1ec7u, \\u0111\\u0103ng tin&nbsp; &hellip;(vd: tailieu.vn , batdongsan.com.vn&hellip;)<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #284d73;\\"><strong>&nbsp;&nbsp;&nbsp; - D\\u1ec5 d&agrave;ng quy \\u0111\\u1ed5i ng\\u01b0\\u1ee3c t\\u1eeb th\\u1ebb c&agrave;o th&agrave;nh ti\\u1ec1n m\\u1eb7t.<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #284d73;\\"><strong>&nbsp;&nbsp;&nbsp; - Chi\\u1ebft kh\\u1ea5u cho nh&agrave; cung c\\u1ea5p th\\u1ea5p h\\u01a1n nhi\\u1ec1u l\\u1ea7n so v\\u1edbi d\\u1ecbch v\\u1ee5 nh\\u1eafn tin SMS.<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #284d73;\\"><strong>&nbsp;&nbsp;&nbsp;  - IHB Vi\\u1ec7t Nam h\\u1ed7 tr\\u1ee3 kh&aacute;ch h&agrave;ng to&agrave;n b\\u1ed9 c&aacute;c kh&acirc;u trong vi\\u1ec7c thi\\u1ebft l\\u1eadp  v&agrave; tri\\u1ec3n khai d\\u1ecbch v\\u1ee5 tr&ecirc;n h\\u1ec7 th\\u1ed1ng website c\\u1ee7a \\u0111\\u1ed1i t&aacute;c.<\\/strong><\\/span><\\/p>","introtext":"So v\\u1edbi c&aacute;c h&igrave;nh th\\u1ee9c thanh to&aacute;n kh&aacute;c, thanh to&aacute;n qua th\\u1ebb c&agrave;o, c&oacute; nh\\u1eefng \\u01b0u \\u0111i\\u1ec3m v\\u01b0\\u1ee3t tr\\u1ed9i sau:\\r\\n\\r\\n&nbsp;&nbsp;&nbsp; - Ti\\u1ec7n l\\u1ee3i \\u0111\\u1ec3 thanh to&aacute;n cho c&aacute;c \\u0111\\u01a1n h&agrave;ng c&oacute; gi&aacute; tr\\u1ecb nh\\u1ecf. (vd: 20 ng&agrave;n,50 ng&agrave;n ,100 ng&agrave;n VND)\\r\\n&nbsp;&nbsp;&nbsp; - Ti\\u1ec7n l\\u1ee3i \\u0111\\u1ec3 thanh to&aacute;n khi ng\\u01b0\\u1eddi mua \\u1edf c&aacute;c khu v\\u1ef1c xa ng&acirc;n h&agrave;ng ho\\u1eb7c kh&ocirc;ng c&oacute; ng&acirc;n h&agrave;ng.\\r\\n&nbsp;&nbsp;&nbsp;  - Ti\\u1ec7n l\\u1ee3i khi n\\u1ea1p ti\\u1ec1n v&agrave;o t&agrave;i kho\\u1ea3n c&aacute;c trang m\\u1ea1ng \\u0111\\u1ec3 ph\\u1ee5c v\\u1ee5 m\\u1ee5c  \\u0111&iacute;ch t\\u1ea3i t&agrave;i li\\u1ec7u, \\u0111\\u0103ng tin&nbsp; &hellip;(vd: tailieu.vn , batdongsan.com.vn&hellip;)\\r\\n&nbsp;&nbsp;&nbsp; - D\\u1ec5 d&agrave;ng quy \\u0111\\u1ed5i ng\\u01b0\\u1ee3c t\\u1eeb th\\u1ebb c&agrave;o th&agrave;nh ...","modified":"{\\"1338621911\\":\\"1\\",\\"1338621921\\":\\"1\\",\\"1339032358\\":\\"1\\"}","metadesc":"So v\\u1edbi c\\u00e1c h\\u00ecnh th\\u1ee9c thanh to\\u00e1n kh\\u00e1c, thanh to\\u00e1n qua th\\u1ebb c\\u00e0o, c\\u00f3 nh\\u1eefng \\u01b0u \\u0111i\\u1ec3m v\\u01b0\\u1ee3t tr\\u1ed9i sau: \\u00a0\\u00a0\\u00a0 - Ti\\u1ec7n l\\u1ee3i \\u0111\\u1ec3 thanh to\\u00e1n cho c\\u00e1c \\u0111\\u01a1n ..."}', 1, 1337161723, 2),
(9, 'vi', 14, 2, 1, 0, 0, 'Tính năng của dịch vụ thanh toán qua thẻ cào', 'tinh-nang-cua-dich-vu-thanh-toan-qua-the-cao', '2', '{"introimage":"14","list_suggest":"","fulltext":"<div>\\r\\n<p class=\\"ListParagraphCxSpFirst\\" style=\\"margin: 0in 0in 6pt 0.55in; text-indent: -0.25in; text-align: justify;\\"><span style=\\"font-size: 10pt; color: #284d73;\\"><span style=\\"line-height: 115%; font-family: ''Times New Roman'';\\">-<span style=\\"font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><strong><span style=\\"line-height: 115%; font-family: Verdana;\\">T&iacute;nh n\\u0103ng n\\u1ea1p ti\\u1ec1n.<\\/span><\\/strong><span style=\\"line-height: 115%; font-family: Verdana;\\"> V&iacute; \\u0111i\\u1ec7n t\\u1eed MegaPayment h\\u1ed7 tr\\u1ee3 n\\u1ea1p ti\\u1ec1n qua c&aacute;c h&igrave;nh th\\u1ee9c:<\\/span><\\/span><\\/p>\\r\\n<p class=\\"ListParagraphCxSpMiddle\\" style=\\"margin: 0in 0in 6pt 1.05in; text-indent: -0.25in; text-align: justify;\\"><span style=\\"font-size: 10pt; color: #284d73;\\"><span style=\\"line-height: 115%; font-family: ''Courier New'';\\">+<span style=\\"font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><span style=\\"line-height: 115%; font-family: Verdana;\\">Qua h\\u1ec7 th\\u1ed1ng giao d\\u1ecbch c\\u1ee7a c&aacute;c ng&acirc;n h&agrave;ng c&oacute; k\\u1ebft n\\u1ed1i v\\u1edbi IHB Payment.<\\/span><\\/span><\\/p>\\r\\n<p class=\\"ListParagraphCxSpMiddle\\" style=\\"margin: 0in 0in 6pt 1.05in; text-indent: -0.25in; text-align: justify;\\"><span style=\\"font-size: 10pt; color: #284d73;\\"><span style=\\"line-height: 115%; font-family: ''Courier New'';\\">+<span style=\\"font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><span style=\\"line-height: 115%; font-family: Verdana;\\">Qua c&aacute;c \\u0111i\\u1ec3m n\\u1ea1p ti\\u1ec1n c\\u1ee7a IHB Payment<br \\/><\\/span><\\/span><\\/p>\\r\\n<p class=\\"ListParagraphCxSpMiddle\\" style=\\"margin: 0in 0in 6pt 1.05in; text-indent: -0.25in; text-align: justify;\\"><span style=\\"font-size: 10pt; color: #284d73;\\"><span style=\\"line-height: 115%; font-family: ''Courier New'';\\">+<span style=\\"font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><span style=\\"line-height: 115%; font-family: Verdana;\\">Qua c&aacute;c ch\\u01b0\\u01a1ng tr&igrave;nh s\\u1eed d\\u1ee5ng v&iacute; \\u0111i\\u1ec7n t\\u1eed MegaPayment c\\u1ee7a c&aacute;c \\u0111\\u1ed1i t&aacute;c.<\\/span><\\/span><\\/p>\\r\\n<p class=\\"ListParagraphCxSpMiddle\\" style=\\"margin: 12pt 0in 6pt 0.3in; text-align: justify;\\"><span style=\\"font-size: 10pt; color: #284d73;\\"><span style=\\"line-height: 115%; font-family: Verdana;\\">&nbsp;<\\/span><span style=\\"line-height: 115%; font-family: ''Times New Roman'';\\">-<span style=\\"font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><strong><span style=\\"line-height: 115%; font-family: Verdana;\\">T&iacute;nh n\\u0103ng giao d\\u1ecbch.<\\/span><\\/strong><span style=\\"line-height: 115%; font-family: Verdana;\\"> Bao g\\u1ed3m:<\\/span><\\/span><\\/p>\\r\\n<p class=\\"ListParagraphCxSpMiddle\\" style=\\"margin: 0in 0in 6pt 1.05in; text-indent: -0.25in; text-align: justify;\\"><span style=\\"font-size: 10pt; color: #284d73;\\"><span style=\\"line-height: 115%; font-family: ''Courier New'';\\">+<span style=\\"font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><span style=\\"line-height: 115%; font-family: Verdana;\\">Chuy\\u1ec3n kho\\u1ea3n gi\\u1eefa hai t&agrave;i kho\\u1ea3n V&iacute; \\u0111i\\u1ec7n t\\u1eed.<\\/span><\\/span><\\/p>\\r\\n<p class=\\"ListParagraphCxSpMiddle\\" style=\\"margin: 0in 0in 6pt 1.05in; text-indent: -0.25in; text-align: justify;\\"><span style=\\"font-size: 10pt; color: #284d73;\\"><span style=\\"line-height: 115%; font-family: ''Courier New'';\\">+<span style=\\"font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><span style=\\"line-height: 115%; font-family: Verdana;\\">Thanh to&aacute;n mua h&agrave;ng h&oacute;a d\\u1ecbch v\\u1ee5.<\\/span><\\/span><\\/p>\\r\\n<p class=\\"ListParagraphCxSpMiddle\\" style=\\"margin: 0in 0in 6pt 1.05in; text-indent: -0.25in; text-align: justify;\\"><span style=\\"font-size: 10pt; color: #284d73;\\"><span style=\\"line-height: 115%; font-family: ''Courier New'';\\">+<span style=\\"font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><span style=\\"line-height: 115%; font-family: Verdana;\\">Thanh to&aacute;n c\\u01b0\\u1edbc ph&iacute;.<\\/span><span style=\\"line-height: 115%; font-family: Verdana;\\">&nbsp;<\\/span><\\/span><\\/p>\\r\\n<p class=\\"ListParagraphCxSpMiddle\\" style=\\"margin: 0in 0in 6pt 0.55in; text-indent: -0.25in; text-align: justify;\\"><span style=\\"font-size: 10pt; color: #284d73;\\"><span style=\\"line-height: 115%; font-family: ''Times New Roman'';\\">-<span style=\\"font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><strong><span style=\\"line-height: 115%; font-family: Verdana;\\">T&iacute;nh n\\u0103ng r&uacute;t ti\\u1ec1n<\\/span><\\/strong><\\/span><\\/p>\\r\\n<p class=\\"ListParagraphCxSpLast\\" style=\\"margin: 0in 0in 6pt 1.05in; text-indent: -0.25in; text-align: justify;\\"><span style=\\"font-size: 10pt; color: #284d73;\\"><span style=\\"line-height: 115%; font-family: ''Courier New'';\\">+<span style=\\"font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/span><span style=\\"line-height: 115%; font-family: Verdana;\\">R&uacute;t ti\\u1ec1n qua h\\u1ec7 th\\u1ed1ng giao d\\u1ecbch c\\u1ee7a c&aacute;c ng&acirc;n h&agrave;ng c&oacute; k\\u1ebft n\\u1ed1i v\\u1edbi IHB Payment<br \\/><\\/span><\\/span><\\/p>\\r\\n<\\/div>","introtext":"\\r\\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T&iacute;nh n\\u0103ng n\\u1ea1p ti\\u1ec1n. V&iacute; \\u0111i\\u1ec7n t\\u1eed MegaPayment h\\u1ed7 tr\\u1ee3 n\\u1ea1p ti\\u1ec1n qua c&aacute;c h&igrave;nh th\\u1ee9c:\\r\\n+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Qua h\\u1ec7 th\\u1ed1ng giao d\\u1ecbch c\\u1ee7a c&aacute;c ng&acirc;n h&agrave;ng c&oacute; k\\u1ebft n\\u1ed1i v\\u1edbi IHB Payment.\\r\\n+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Qua c&aacute;c \\u0111i\\u1ec3m n\\u1ea1p ti\\u1ec1n c\\u1ee7a IHB Payment\\r\\n+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Qua c&aacute;c ch\\u01b0\\u01a1ng tr&igrave;nh s\\u1eed d\\u1ee5ng v&iacute; \\u0111i\\u1ec7n t\\u1eed MegaPayment c\\u1ee7a c&aacute;c \\u0111\\u1ed1i t&aacute;c.\\r\\n&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T&iacute;nh n\\u0103ng giao d\\u1ecbch. Bao g\\u1ed3m:\\r\\n+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chuy\\u1ec3n kho\\u1ea3n gi\\u1eefa hai t&agrave;i kho\\u1ea3n V&iacute; \\u0111i\\u1ec7n t\\u1eed.\\r\\n+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanh to&aacute;n mua h&agrave;ng h&oacute;a d\\u1ecbch v\\u1ee5.\\r\\n+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanh to&aacute;n c\\u01b0\\u1edbc ph&iacute;.&nbsp;\\r\\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T&iacute;nh n\\u0103ng r&uacute;t ti\\u1ec1n\\r\\n+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R&uacute;t ti\\u1ec1n qua h\\u1ec7 th\\u1ed1ng giao d\\u1ecbch c\\u1ee7a c&aacute;c ng&acirc;n h&agrave;ng c&oacute; k\\u1ebft n\\u1ed1i v\\u1edbi IHB ...","modified":"{\\"1337161884\\":\\"1\\",\\"1339032369\\":\\"1\\",\\"1339134479\\":\\"1\\"}","metadesc":" -\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 T\\u00ednh n\\u0103ng n\\u1ea1p ti\\u1ec1n. V\\u00ed \\u0111i\\u1ec7n t\\u1eed MegaPayment h\\u1ed7 tr\\u1ee3 n\\u1ea1p ti\\u1ec1n qua c\\u00e1c h\\u00ecnh th\\u1ee9c: +\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 Qua h\\u1ec7 th\\u1ed1ng giao d\\u1ecbch c\\u1ee7a c\\u00e1c ng\\u00e2n h\\u00e0ng c\\u00f3 k\\u1ebft ..."}', 1, 1337161847, 0),
(10, 'vi', 14, 2, 1, 0, 0, 'Ví điện tử MegaPayment', 'vi-dien-tu-megapayment', '2', '{"introimage":"15","list_suggest":"9,8","fulltext":"<p><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><em><span style=\\"color: #666699;\\"><strong><span style=\\"color: #000000;\\">IHBVietNam.com:  cu\\u1ed1i n\\u0103m 2011, h\\u1ee3p t&aacute;c v\\u1edbi CT CP Thanh to&aacute;n \\u0111i\\u1ec7n t\\u1eed VNPT, IHB \\u0111&atilde; tri\\u1ec3n  khai v&agrave; \\u0111\\u01b0a v&agrave;o ho\\u1ea1t \\u0111\\u1ed9ng h\\u1ec7 th\\u1ed1ng thanh to&aacute;n qua th\\u1ebb c&agrave;o MegaPayment.<\\/span> <br \\/><\\/strong><\\/span><\\/em><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><strong>1. MegaPayment l&agrave; g&igrave;?<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><img style=\\"margin-right: 10px; float: left;\\" src=\\"http:\\/\\/ihbvietnam.com\\/images\\/Article_images\\/20111213\\/Megapayment.jpg\\" alt=\\"Megapayment\\" width=\\"114\\" height=\\"38\\" \\/><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><strong>-  L&agrave; ph\\u01b0\\u01a1ng th\\u1ee9c thanh to&aacute;n gi\\u1eefa ng\\u01b0\\u1eddi mua h&agrave;ng v&agrave; doanh nghi\\u1ec7p b&aacute;n h&agrave;ng  tr\\u1ef1c tuy\\u1ebfn th&ocirc;ng qua h&igrave;nh th\\u1ee9c s\\u1eed d\\u1ee5ng c&aacute;c lo\\u1ea1i m&atilde; th\\u1ebb tr\\u1ea3 tr\\u01b0\\u1edbc.<\\/strong><br \\/><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- C\\u1ee5 th\\u1ec3 l&agrave; c&aacute;c lo\\u1ea1i th\\u1ebb sau \\u0111&acirc;y:a<\\/span><\\/strong><\\/span><\\/p>\\r\\n<table style=\\"width: 919px; height: 120px;\\" border=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\"width: 500px;\\">\\r\\n<p style=\\"text-align: left;\\"><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;&nbsp;&nbsp; o Th\\u1ebb c&agrave;o Viettel.<\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a;\\">&nbsp;<span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;&nbsp; o Th\\u1ebb c&agrave;o Mobiphone.<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a;\\">&nbsp;<span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;&nbsp; o Th\\u1ebb c&agrave;o Vinaphone.<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;&nbsp;&nbsp; o Th\\u1ebb game VTC online.<\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;&nbsp;&nbsp; o Th\\u1ebb game FPT.<\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;&nbsp;&nbsp; o Th\\u1ebb \\u0111a n\\u0103ng VNPT epay.<\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><br \\/><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<td style=\\"text-align: left;\\">\\r\\n<table border=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\"background-color: #cfc9c9; padding: 5px;\\"><span style=\\"color: #092e5a;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><span style=\\"font-size: 12pt;\\"><span style=\\"font-size: 10pt;\\">H\\u1ed7 tr\\u1ee3 k\\u1ef9 thu\\u1eadt: <\\/span><\\/span><\\/span><\\/strong><\\/span><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"> &nbsp; &nbsp; \\u0110i\\u1ec7n tho\\u1ea1i: 0906 244 804<\\/span><br \\/><span style=\\"color: #092e5a; font-size: 10pt;\\"><span style=\\"font-family: verdana,geneva;\\">Email:<\\/span><span style=\\"font-family: verdana,geneva;\\">&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href=\\"mailto:hotro@ihbvietnam.com\\">hotro@ihbvietnam.com<\\/a><\\/span><\\/span><br \\/><span style=\\"color: #092e5a; font-size: 10pt;\\"><span style=\\"font-family: verdana,geneva;\\">Yahoo: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <\\/span><span style=\\"font-family: verdana,geneva;\\"><img src=\\"http:\\/\\/mail.opi.yahoo.com\\/online?u=ihbvietnam&amp;m=g&amp;t=0\\" alt=\\"\\" \\/> ihbvietnam<\\/span><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p><span style=\\"color: #092e5a;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><span style=\\"font-size: 12pt;\\"><span style=\\"font-size: 10pt;\\"><br \\/><\\/span><\\/span><\\/span><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><span style=\\"font-size: 12pt;\\"><span style=\\"font-size: 10pt;\\"><br style=\\"font-size: 10pt;\\" \\/><\\/span><\\/span><\\/span><\\/strong><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p><span style=\\"color: #092e5a;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">2. L\\u1ee3i &iacute;ch c\\u1ee7a MegaPayment l&agrave; g&igrave;?<\\/span><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;&nbsp;&nbsp; o Th&ecirc;m m\\u1ed9t ph\\u01b0\\u01a1ng th\\u1ee9c thanh to&aacute;n cho ng\\u01b0\\u1eddi mua h&agrave;ng, b&ecirc;n c\\u1ea1nh c&aacute;c ph\\u01b0\\u01a1ng th\\u1ee9c th&ocirc;ng th\\u01b0\\u1eddng.<\\/span><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><br \\/><\\/span><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;&nbsp;&nbsp; o Ti\\u1ec7n l\\u1ee3i \\u0111\\u1ec3 thanh to&aacute;n cho c&aacute;c \\u0111\\u01a1n h&agrave;ng c&oacute; gi&aacute; tr\\u1ecb nh\\u1ecf. (vd: 20.000,50.000,100.000 VN\\u0110).<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp; o Ti\\u1ec7n l\\u1ee3i \\u0111\\u1ec3 thanh to&aacute;n khi ng\\u01b0\\u1eddi mua \\u1edf c&aacute;c khu v\\u1ef1c xa ng&acirc;n h&agrave;ng ho\\u1eb7c kh&ocirc;ng c&oacute; ng&acirc;n h&agrave;ng.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp;  o Ti\\u1ec7n l\\u1ee3i khi n\\u1ea1p ti\\u1ec1n v&agrave;o t&agrave;i kho\\u1ea3n c&aacute;c trang m\\u1ea1ng \\u0111\\u1ec3 ph\\u1ee5c v\\u1ee5 m\\u1ee5c  \\u0111&iacute;ch t\\u1ea3i t&agrave;i li\\u1ec7u, \\u0111\\u0103ng tin ...(vd: tailieu.vn ,docs.vn...)<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp; o D\\u1ec5 d&agrave;ng quy \\u0111\\u1ed5i ng\\u01b0\\u1ee3c t\\u1eeb th\\u1ebb c&agrave;o th&agrave;nh ti\\u1ec1n m\\u1eb7t.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp; o Chi\\u1ebft kh\\u1ea5u cho nh&agrave; cung c\\u1ea5p th\\u1ea5p h\\u01a1n nhi\\u1ec1u l\\u1ea7n so v\\u1edbi d\\u1ecbch v\\u1ee5 nh\\u1eafn tin SMS.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><br \\/><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><strong>3. C&aacute;ch s\\u1eed d\\u1ee5ng nh\\u01b0 th\\u1ebf n&agrave;o?<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><strong>&nbsp;&nbsp;&nbsp; 3.1 V\\u1edbi ng\\u01b0\\u1eddi mua h&agrave;ng<br \\/><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><strong>&nbsp;<\\/strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - \\u0110\\u1ec3 thanh to&aacute;n ho\\u1eb7c n\\u1ea1p ti\\u1ec1n v&agrave;o t&agrave;i kho\\u1ea3n, ng\\u01b0\\u1eddi mua ch\\u1ec9 c\\u1ea7n \\u0111\\u01a1n gi\\u1ea3n th\\u1ef1c hi\\u1ec7n 2 b\\u01b0\\u1edbc:<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Mua th\\u1ebb c&agrave;o c&oacute; m\\u1ec7nh gi&aacute; ph&ugrave; h\\u1ee3p.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Nh\\u1eadp m&atilde; th\\u1ebb v&agrave;o website thanh to&aacute;n<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  - Ngay sau khi nh\\u1eadp m&atilde;, website s\\u1ebd th&ocirc;ng b&aacute;o s\\u1ed1 ti\\u1ec1n m&agrave; kh&aacute;ch h&agrave;ng \\u0111&atilde;  nh\\u1eadp, c&ugrave;ng v\\u1edbi h&oacute;a \\u0111\\u01a1n x&aacute;c nh\\u1eadn giao d\\u1ecbch th&agrave;nh c&ocirc;ng.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><strong>&nbsp;&nbsp; 3.2 V\\u1edbi ng\\u01b0\\u1eddi b&aacute;n h&agrave;ng<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><strong>&nbsp;<\\/strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Ng\\u01b0\\u1eddi b&aacute;n s\\u1ebd \\u0111\\u01b0\\u1ee3c IHB c\\u1ea5p m\\u1ed9t t&agrave;i kho\\u1ea3n \\u0111\\u1ec3 qu\\u1ea3n l&yacute; c&aacute;c giao d\\u1ecbch.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - \\u0110\\u1ec3 ki\\u1ec3m tra t&agrave;i kho\\u1ea3n, ng\\u01b0\\u1eddi b&aacute;n ch\\u1ec9 c\\u1ea7n \\u0111\\u0103ng nh\\u1eadp v&agrave;o website: <a href=\\"http:\\/\\/www.thanhtoan.ihbvietnam.com\\/\\" target=\\"_blank\\">www.thanhtoan.ihbvietnam.com<\\/a> b\\u1eb1ng account \\u0111\\u01b0\\u1ee3c IHB c\\u1ea5p.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><br \\/><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><strong>4. T&iacute;ch h\\u1ee3p v&agrave;o website \\u0111\\u01a1n gi\\u1ea3n &amp; nhanh g\\u1ecdn<br \\/><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><strong>&nbsp;<\\/strong> &nbsp; &nbsp;&nbsp; Ph\\u01b0\\u01a1ng ch&acirc;m c\\u1ee7a IHB l&agrave; \\u0111\\u01a1n gi\\u1ea3n h&oacute;a t\\u1ed1i \\u0111a c&aacute;c thao t&aacute;c cho \\u0111\\u1ed1i t&aacute;c khi t&iacute;ch h\\u1ee3p d\\u1ecbch v\\u1ee5 v&agrave;o website c\\u1ee7a kh&aacute;ch h&agrave;ng.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp;&nbsp; V&igrave; v\\u1eady, \\u0111\\u1ec3 t&iacute;ch h\\u1ee3p d\\u1ecbch v\\u1ee5 v&agrave;o website, trong c&aacute;c tr\\u01b0\\u1eddng h\\u1ee3p th&ocirc;ng th\\u01b0\\u1eddng, kh&aacute;ch h&agrave;ng s\\u1ebd<em> kh&ocirc;ng ph\\u1ea3i can thi\\u1ec7p v&agrave;o k\\u0129 thu\\u1eadt<\\/em>. <\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp;&nbsp; Th\\u1eddi gian t&iacute;ch h\\u1ee3p ng\\u1eafn: <em>t\\u1eeb 30 ph&uacute;t \\u0111\\u1ebfn 1 ng&agrave;y<\\/em>, t&ugrave;y v&agrave;o y&ecirc;u c\\u1ea7u v&agrave; \\u0111\\u1ed9 ph\\u1ee9c t\\u1ea1p c\\u1ee7a website c\\u1ee7a kh&aacute;ch h&agrave;ng.<br \\/><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><strong>5. D&ugrave; Qu&yacute; kh&aacute;ch l&agrave; Doanh nghi\\u1ec7p hay C&aacute; nh&acirc;n...<\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><strong>&nbsp;<\\/strong>&nbsp;&nbsp;&nbsp;&nbsp; D&ugrave; Qu&yacute; kh&aacute;ch l&agrave; Doanh nghi\\u1ec7p hay c&aacute; nh&acirc;n, IHB \\u0111\\u1ec1u c&oacute; c&aacute;c h&igrave;nh th\\u1ee9c h\\u1ed7 tr\\u1ee3 ph&ugrave; h\\u1ee3p cho website c\\u1ee7a Qu&yacute; kh&aacute;ch.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp;&nbsp; N\\u1ebfu Qu&yacute; kh&aacute;ch c&oacute; b\\u1ea5t k&igrave; th\\u1eafc m\\u1eafc n&agrave;o, xin h&atilde;y g\\u1ecdi cho h\\u1ed7 tr\\u1ee3 kh&aacute;ch h&agrave;ng IHB \\u0111\\u1ec3 \\u0111\\u01b0\\u1ee3c gi\\u1ea3i \\u0111&aacute;p c\\u1ee5 th\\u1ec3.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\">&nbsp;&nbsp;&nbsp;&nbsp; B\\u1ed9 ph\\u1eadn h\\u1ed7 tr\\u1ee3 kh&aacute;ch h&agrave;ng: Mr Nam, 0906 244 804.<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #092e5a;\\"><br \\/><\\/span><\\/p>\\r\\n<p><strong><span style=\\"color: #092e5a;\\"><em><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">IHB Vi\\u1ec7t Nam h&acirc;n h\\u1ea1nh \\u0111\\u01b0\\u1ee3c ph\\u1ee5c v\\u1ee5 Qu&yacute; kh&aacute;ch,<\\/span><\\/em><\\/span><\\/strong><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt; color: #666699;\\"><strong><span style=\\"color: #092e5a;\\"><em>Xin ch&acirc;n th&agrave;nh c\\u1ea3m \\u01a1n!<\\/em><\\/span><\\/strong><\\/span><\\/p>","introtext":"IHBVietNam.com: cu\\u1ed1i n\\u0103m 2011, h\\u1ee3p t\\u00e1c v\\u1edbi CT CP Thanh to\\u00e1n \\u0111i\\u1ec7n t\\u1eed VNPT, IHB \\u0111\\u00e3 tri\\u1ec3n khai v\\u00e0 \\u0111\\u01b0a v\\u00e0o ho\\u1ea1t \\u0111\\u1ed9ng h\\u1ec7 th\\u1ed1ng thanh to\\u00e1n qua th\\u1ebb c\\u00e0o MegaPayment. 1. MegaPayment l\\u00e0 g\\u00ec? - L\\u00e0 ph\\u01b0\\u01a1ng th\\u1ee9c thanh to\\u00e1n gi\\u1eefa ng\\u01b0\\u1eddi mua h\\u00e0ng v\\u00e0 doanh nghi\\u1ec7p b\\u00e1n h\\u00e0ng tr\\u1ef1c tuy\\u1ebfn th\\u00f4ng qua h\\u00ecnh th\\u1ee9c s\\u1eed d\\u1ee5ng c\\u00e1c lo\\u1ea1i m\\u00e3 th\\u1ebb tr\\u1ea3 tr\\u01b0\\u1edbc. - C\\u1ee5 th\\u1ec3 l\\u00e0 c\\u00e1c lo\\u1ea1i th\\u1ebb sau \\u0111\\u00e2y:a \\u00a0\\u00a0\\u00a0 o Th\\u1ebb c\\u00e0o Viettel. \\u00a0\\u00a0\\u00a0 o Th\\u1ebb c\\u00e0o Mobiphone. \\u00a0\\u00a0\\u00a0 o Th\\u1ebb c\\u00e0o Vinaphone. \\u00a0\\u00a0\\u00a0 o Th\\u1ebb game VTC online. \\u00a0\\u00a0\\u00a0 o Th\\u1ebb game FPT. \\u00a0\\u00a0\\u00a0 ...","modified":"{\\"1339032385\\":\\"1\\",\\"1339055827\\":\\"1\\",\\"1339134466\\":\\"1\\"}","metadesc":"IHBVietNam.com: cu\\u1ed1i n\\u0103m 2011, h\\u1ee3p t\\u00e1c v\\u1edbi CT CP Thanh to\\u00e1n \\u0111i\\u1ec7n t\\u1eed VNPT, IHB \\u0111\\u00e3 tri\\u1ec3n khai v\\u00e0 \\u0111\\u01b0a v\\u00e0o ho\\u1ea1t \\u0111\\u1ed9ng h\\u1ec7 th\\u1ed1ng thanh to\\u00e1n qua th\\u1ebb c\\u00e0o ..."}', 1, 1337161960, 0),
(13, 'vi', 11, 2, 1, 0, 0, 'Dịch vụ SEO – IHB Việt Nam', 'dich-vu-seo--ihb-viet-nam', '29', '{"introimage":"17","list_suggest":"","fulltext":"<p><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong><span style=\\"line-height: 115%; color: #808080;\\">Internet  \\u0111&atilde; tr\\u1edf th&agrave;nh m\\u1ed9t ph\\u1ea7n quan tr\\u1ecdng trong cu\\u1ed9c s\\u1ed1ng h&agrave;ng ng&agrave;y. C&aacute;c doanh  nghi\\u1ec7p, nh&agrave; Marketing c\\u0169ng &nbsp;kh&ocirc;ng b\\u1ecf l\\u1ee1 c\\u01a1 h\\u1ed9i \\u0111\\u1ec3 ti\\u1ebfp x&uacute;c g\\u1ea7n h\\u01a1n v\\u1edbi  kh&aacute;ch h&agrave;ng c\\u1ee7a m&igrave;nh. H\\u1ecd \\u0111ang n\\u1ed7 l\\u1ef1c trong vi\\u1ec7c x&acirc;y d\\u1ef1ng th\\u01b0\\u01a1ng hi\\u1ec7u s\\u1ed1 -  h&igrave;nh \\u1ea3nh c\\u1ee7a doanh nghi\\u1ec7p tr&ecirc;n m&ocirc;i tr\\u01b0\\u1eddng internet.<\\/span><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;<strong><span style=\\"line-height: 115%;\\">SEO l&agrave; g&igrave;?<\\/span><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"line-height: 115%; color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><img style=\\"padding: 5px; float: left;\\" src=\\"http:\\/\\/ihbvietnam.com\\/images\\/Article_images\\/20111213\\/seo_services.jpg\\" alt=\\"seo services\\" width=\\"111\\" height=\\"82\\" \\/>SEO  l&agrave; thu\\u1eadt ng\\u1eef ch\\u1ec9 vi\\u1ec7c t\\u1ed1i \\u01b0u cho b\\u1ed9 m&aacute;y t&igrave;m ki\\u1ebfm. \\u0110&acirc;y l&agrave; d\\u1ecbch v\\u1ee5 gi&uacute;p  cho website c\\u1ee7a qu&yacute; kh&aacute;ch h&agrave;ng \\u0111\\u01b0\\u1ee3c hi\\u1ec3n th\\u1ecb trong top \\u0111\\u1ea7u c\\u1ee7a trang k\\u1ebft  qu\\u1ea3 t&igrave;m ki\\u1ebfm, khi kh&aacute;ch h&agrave;ng t&igrave;m ki&ecirc;m v\\u1edbi c&aacute;c t\\u1eeb kh&oacute;a li&ecirc;n quan tr&ecirc;n  Google. K\\u1ebft qu\\u1ea3 l&agrave; website s\\u1ebd thu h&uacute;t \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u l\\u01b0\\u1ee3t vi\\u1ebfng th\\u0103m h\\u01a1n v&agrave;  doanh nghi\\u1ec7p s\\u1ebd c&oacute; nhi\\u1ec1u kh&aacute;ch h&agrave;ng h\\u01a1n.<\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><strong><span style=\\"line-height: 115%;\\"><br \\/><\\/span><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><strong><span style=\\"line-height: 115%;\\">T\\u1ea1i sao ph\\u1ea3i l&agrave;m SEO?<\\/span><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><span style=\\"line-height: 115%; color: #092e5a;\\"><img style=\\"padding: 5px; float: left;\\" src=\\"http:\\/\\/ihbvietnam.com\\/images\\/Article_images\\/20111213\\/SEO-IHB.jpg\\" alt=\\"SEO-IHB\\" width=\\"112\\" height=\\"109\\" \\/><\\/span><span style=\\"line-height: 115%; color: #092e5a;\\">Sau khi thi\\u1ebft k\\u1ebf website, \\u0111\\u1ec3 website c\\u1ee7a qu&yacute; kh&aacute;ch \\u0111\\u1ebfn \\u0111\\u01b0\\u1ee3c v\\u1edbi kh&aacute;ch h&agrave;ng th&igrave; ph\\u1ea3i c&oacute; th&ecirc;m c&aacute;c gi\\u1ea3i ph&aacute;p \\u0111\\u1ec3 t\\u0103ng l\\u01b0\\u1ee3ng truy c\\u1eadp<\\/span><span style=\\"line-height: 115%; color: #092e5a;\\"> cho website. C&ocirc;ng c\\u1ee5 t&igrave;m ki\\u1ebfm (Google) l&agrave; ngu\\u1ed3n truy c\\u1eadp l\\u1edbn nh\\u1ea5t v&agrave;o  website c\\u1ee7a b\\u1ea1n v\\u1edbi 80% l\\u01b0\\u1ee3ng truy c\\u1eadp v&agrave;o 1 website b\\u1ea5t k&igrave; \\u0111\\u1ebfn t\\u1eeb  Google. C&oacute; h\\u01a1n 85% ng\\u01b0\\u1eddi d&ugrave;ng internet s\\u1eed d\\u1ee5ng c&ocirc;ng c\\u1ee5 t&igrave;m ki\\u1ebfm \\u0111\\u1ec3 t&igrave;m  ki\\u1ebfm website v&agrave; 90% trong s\\u1ed1 h\\u1ecd kh&ocirc;ng v\\u01b0\\u1ee3t qu&aacute; 3 trang k\\u1ebft qu\\u1ea3 t&igrave;m ki\\u1ebfm.  Do \\u0111&oacute;, n\\u1ebfu website c\\u1ee7a b\\u1ea1n kh&ocirc;ng \\u0111\\u01b0\\u1ee3c li\\u1ec7t k&ecirc; trong top 10 k\\u1ebft qu\\u1ea3 t&igrave;m  ki\\u1ebfm th&igrave; b\\u1ea1n \\u0111ang m\\u1ea5t \\u0111i s\\u1ef1 c\\u1ea1nh tranh c\\u1ee7a m&igrave;nh so v\\u1edbi \\u0111\\u1ed1i th\\u1ee7. SEO c\\u0169ng  l&agrave; d\\u1ecbch v\\u1ee5 qu\\u1ea3ng c&aacute;o \\u0111em l\\u1ea1i hi\\u1ec7u qu\\u1ea3 cao v\\u1edbi chi ph&iacute; r\\u1ea5t r\\u1ebb cho doanh  nghi\\u1ec7p c\\u1ee7a b\\u1ea1n.<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"line-height: 115%; color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><br \\/><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><strong><span style=\\"line-height: 115%;\\">H&atilde;y s\\u1eed d\\u1ee5ng d\\u1ecbch v\\u1ee5 SEO c\\u1ee7a IHB<\\/span><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span style=\\"line-height: 115%; color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><img style=\\"padding: 5px; float: left;\\" src=\\"http:\\/\\/ihbvietnam.com\\/images\\/Article_images\\/20111213\\/SEO-IHB-best.jpg\\" alt=\\"SEO-IHB-best\\" width=\\"120\\" height=\\"114\\" \\/>IHB cung c\\u1ea5p d\\u1ecbch v\\u1ee5 SEO ch\\u1ea5t l\\u01b0\\u1ee3ng v\\u1edbi gi&aacute; c\\u1ea3 h\\u1ee3p l&yacute;, d\\u01b0\\u1edbi \\u0111&acirc;y l&agrave; c&aacute;c \\u0111\\u1eb7c \\u0111i\\u1ec3m d\\u1ecbch v\\u1ee5 c\\u1ee7a IHB:<\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><span style=\\"line-height: 115%;\\"><span style=\\"font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp; &nbsp; o&nbsp; <\\/span><\\/span><span style=\\"line-height: 115%;\\">D\\u1ecbch  v\\u1ee5 SEO chuy&ecirc;n nghi\\u1ec7p, \\u0111\\u1ed9i ng\\u0169 SEOer nhi\\u1ec1u kinh nghi\\u1ec7m. Ch&uacute;ng t&ocirc;i c\\u1eadp  nh\\u1eadp li&ecirc;n t\\u1ee5c nh\\u1eefng thay \\u0111\\u1ed5i v\\u1ec1 thu\\u1eadt to&aacute;n t&igrave;m ki\\u1ebfm c\\u1ee7a Google.<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><span style=\\"line-height: 115%;\\"><span style=\\"font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp; &nbsp; o <\\/span><\\/span><span style=\\"line-height: 115%;\\">Qu&yacute;  kh&aacute;ch \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea3m b\\u1ea3o v\\u1ec1 ch\\u1ea5t l\\u01b0\\u1ee3ng c&ocirc;ng vi\\u1ec7c. Ch&uacute;ng t&ocirc;i ch\\u1ec9 nh\\u1eadn thanh  to&aacute;n d\\u1ecbch v\\u1ee5 khi t\\u1eeb kh&oacute;a c\\u1ee7a website b\\u1ea1n c\\u1ea3i thi\\u1ec7n \\u0111\\u01b0\\u1ee3c v\\u1ecb tr&iacute;.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-indent: -0.25in;\\"><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><span style=\\"line-height: 115%;\\"><span style=\\"font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-size-adjust: none; font-stretch: normal;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; o <\\/span><\\/span><span style=\\"line-height: 115%;\\">D\\u1ecbch v\\u1ee5 t\\u1ed1t, ch\\u0103m s&oacute;c kh&aacute;ch h&agrave;ng chu \\u0111&aacute;o.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-indent: -0.25in;\\"><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><span style=\\"line-height: 115%;\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; &nbsp; &nbsp; o Kh&aacute;ch h&agrave;ng \\u0111\\u01b0\\u1ee3c t\\u01b0 v\\u1ea5n \\u0111\\u1ea7y \\u0111\\u1ee7 v\\u1ec1 d\\u1ecbch v\\u1ee5 SEO cho website c\\u0169ng  nh\\u01b0 c&aacute;c ho\\u1ea1t \\u0111\\u1ed9ng x&acirc;y d\\u1ef1ng th\\u01b0\\u01a1ng hi\\u1ec7u s\\u1ed1.<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><strong><br \\/><\\/strong><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><strong><br \\/><\\/strong><\\/span><\\/p>\\r\\n<p style=\\"text-align: right;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><em><span style=\\"color: #092e5a;\\"><strong>Tr&acirc;n tr\\u1ecdng,<\\/strong><\\/span><\\/em><\\/span><\\/p>\\r\\n<p><span style=\\"color: #092e5a; font-family: verdana,geneva; font-size: 10pt;\\"><strong><em>IHB Vi\\u1ec7t Nam<\\/em><\\/strong><\\/span><\\/p>","introtext":"Internet  \\u0111&atilde; tr\\u1edf th&agrave;nh m\\u1ed9t ph\\u1ea7n quan tr\\u1ecdng trong cu\\u1ed9c s\\u1ed1ng h&agrave;ng ng&agrave;y. C&aacute;c doanh  nghi\\u1ec7p, nh&agrave; Marketing c\\u0169ng &nbsp;kh&ocirc;ng b\\u1ecf l\\u1ee1 c\\u01a1 h\\u1ed9i \\u0111\\u1ec3 ti\\u1ebfp x&uacute;c g\\u1ea7n h\\u01a1n v\\u1edbi  kh&aacute;ch h&agrave;ng c\\u1ee7a m&igrave;nh. H\\u1ecd \\u0111ang n\\u1ed7 l\\u1ef1c trong vi\\u1ec7c x&acirc;y d\\u1ef1ng th\\u01b0\\u01a1ng hi\\u1ec7u s\\u1ed1 -  h&igrave;nh \\u1ea3nh c\\u1ee7a doanh nghi\\u1ec7p tr&ecirc;n m&ocirc;i tr\\u01b0\\u1eddng internet.\\r\\n&nbsp;SEO l&agrave; g&igrave;?\\r\\nSEO  l&agrave; thu\\u1eadt ng\\u1eef ch\\u1ec9 vi\\u1ec7c t\\u1ed1i \\u01b0u cho b\\u1ed9 m&aacute;y t&igrave;m ki\\u1ebfm. \\u0110&acirc;y l&agrave; d\\u1ecbch v\\u1ee5 gi&uacute;p  cho website c\\u1ee7a qu&yacute; kh&aacute;ch h&agrave;ng \\u0111\\u01b0\\u1ee3c hi\\u1ec3n th\\u1ecb trong top \\u0111\\u1ea7u c\\u1ee7a trang k\\u1ebft  qu\\u1ea3 t&igrave;m ki\\u1ebfm, khi ...","modified":"{\\"1339032346\\":\\"1\\"}","metadesc":"Internet \\u0111\\u00e3 tr\\u1edf th\\u00e0nh m\\u1ed9t ph\\u1ea7n quan tr\\u1ecdng trong cu\\u1ed9c s\\u1ed1ng h\\u00e0ng ng\\u00e0y. C\\u00e1c doanh nghi\\u1ec7p, nh\\u00e0 Marketing c\\u0169ng \\u00a0kh\\u00f4ng b\\u1ecf l\\u1ee1 c\\u01a1 h\\u1ed9i \\u0111\\u1ec3 ti\\u1ebfp x\\u00fac g\\u1ea7n h\\u01a1n v\\u1edbi ..."}', 1, 1337162096, 0);
INSERT INTO `tbl_article` (`id`, `lang`, `catid`, `type`, `status`, `special`, `order_view`, `title`, `alias`, `keyword`, `other`, `created_by`, `created_date`, `visits`) VALUES
(14, 'vi', 12, 2, 1, 0, 0, '8 “chiến thuật” duy trì sức khỏe suốt mùa hè', '8-chien-thuat-duy-tri-suc-khoe-suot-mua-he', '29', '{"introimage":"18","list_suggest":"13,12,11,10,9","fulltext":"<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">\\u0110\\u1ec3 ho&agrave;n to&agrave;n kh\\u1ecfe m\\u1ea1nh tr\\u1ea3i qua m&ugrave;a h&egrave; b\\u1ea1n ch\\u1ec9 c\\u1ea7n ghi nh\\u1edb 8 \\u0111i\\u1ec1u \\u0111\\u01a1n gi\\u1ea3n.<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">C&aacute;c  chuy&ecirc;n gia kh&iacute; t\\u01b0\\u1ee3ng h\\u1ecdc li&ecirc;n t\\u1ee5c d\\u1ef1 b&aacute;o s\\u1ef1 gia t\\u0103ng nhi\\u1ec7t \\u0111\\u1ed9 v&agrave; c&aacute;c  \\u0111\\u1ee3t n&oacute;ng b&ugrave;ng ph&aacute;t. Khi kh&ocirc;ng kh&iacute; v\\u01b0\\u1ee3t qu&aacute; 32 \\u0111\\u1ed9 C th&igrave; c\\u01a1 th\\u1ec3 b\\u1eaft \\u0111\\u1ea7u  c\\u1ea3m th\\u1ea5y n&oacute;ng. S\\u1ef1 n&oacute;ng n\\u1ef1c kh&ocirc;ng ch\\u1ec9 \\u1ea3nh h\\u01b0\\u1edfng \\u0111\\u1ebfn t&acirc;m tr\\u1ea1ng m&agrave; c&ograve;n \\u1ea3nh  h\\u01b0\\u1edfng \\u0111\\u1ebfn s\\u1ee9c kh\\u1ecfe c\\u1ee7a ch&uacute;ng ta. M&ugrave;a h&egrave;, s\\u1ef1 trao \\u0111\\u1ed5i ch\\u1ea5t c\\u1ee7a con ng\\u01b0\\u1eddi  b\\u1ecb \\u0111\\u1ea9y nhanh h\\u01a1n. Kh&ocirc;ng ph\\u1ea3i ng\\u1eabu nhi&ecirc;n m&agrave; \\u0111&acirc;y l&agrave; m&ugrave;a b&ugrave;ng ph&aacute;t c\\u1ee7a  nhi\\u1ec1u d\\u1ecbch b\\u1ec7nh ti&ecirc;u h&oacute;a, \\u0111\\u1ed9t qu\\u1ef5 do nhi\\u1ec7t v&agrave; t\\u1ef7 l\\u1ec7 m\\u1eafc b\\u1ec7nh t&acirc;m th\\u1ea7n  cao.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120513\\/20120510afamilySKchienthuatduytrisuckhoe-1_bc384.jpg\\" alt=\\"20120510afamilySKchienthuatduytrisuckhoe-1_bc384\\" width=\\"450\\" height=\\"324\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">B\\u1ea3o v\\u1ec7 tim<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">M&ugrave;a  h&egrave; l&agrave; m&ugrave;a sinh l&yacute; h\\u1ecdc tim ho\\u1ea1t \\u0111\\u1ed9ng m\\u1ea1nh nh\\u1ea5t, m\\u1ec7t m\\u1ecfi nh\\u1ea5t. Khi d\\u01b0\\u01a1ng  d\\u01b0 th\\u1eeba, l\\u1eeda qu&aacute; nhi\\u1ec1u s\\u1ebd khi\\u1ebfn cho c\\u01a1 th\\u1ec3 d\\u1ec5 sinh ra kh&oacute; ch\\u1ecbu, t\\u1ee9c  gi\\u1eadn, \\u0111\\u1ed3ng th\\u1eddi c\\u0169ng l&agrave;m gi\\u1ea3m ch\\u1ee9c n\\u0103ng mi\\u1ec5n d\\u1ecbch c\\u1ee7a c\\u01a1 th\\u1ec3, l&agrave;m ph&aacute;t  sinh c&aacute;c b\\u1ec7nh kh&aacute;c nhau. \\u0110&oacute; l&agrave; ph\\u1ea7n n&agrave;o nguy&ecirc;n do v&igrave; sao m&ugrave;a h&egrave; th\\u01b0\\u1eddng  t\\u0103ng cao c&aacute;c b\\u1ec7nh nh&acirc;n huy\\u1ebft &aacute;p cao, r\\u1ed1i lo\\u1ea1n nh\\u1ecbp tim.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">D\\u01b0\\u1ee1ng t&acirc;m<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Tr\\u01b0\\u1edbc  h\\u1ebft, \\u0111\\u1ec3 tr&aacute;nh qu&aacute; n&oacute;ng v&agrave; qu&aacute; l\\u1ea1nh, n&ecirc;n tr&aacute;nh \\u0111i b\\u1ed9 d\\u01b0\\u1edbi &aacute;nh n\\u1eafng m\\u1eb7t  tr\\u1eddi thi&ecirc;u \\u0111\\u1ed1t (\\u0111\\u1eb7c bi\\u1ec7t l&agrave; l&uacute;c 12 gi\\u1edd tr\\u01b0a) d\\u1ec5 t\\u0103ng t\\u1ed1c l\\u01b0u l\\u01b0\\u1ee3ng m&aacute;u  trong m\\u1ed9t th\\u1eddi gian ng\\u1eafn, t\\u0103ng g&aacute;nh n\\u1eb7ng cho tim v&agrave; c&aacute;c m\\u1ea1ch m&aacute;u. R\\u1ea5t  nhi\\u1ec1u ng\\u01b0\\u1eddi \\u0111\\u1ec3 \\u0111i\\u1ec1u h&ograve;a kh&ocirc;ng kh&iacute; su\\u1ed1t \\u0111&ecirc;m, xen k\\u1ebd gi\\u1eefa hai m&ocirc;i tr\\u01b0\\u1eddng  n&oacute;ng v&agrave; l\\u1ea1nh c\\u0169ng s\\u1ebd t\\u0103ng kh\\u1ea3 n\\u0103ng g&acirc;y kh&oacute; ch\\u1ecbu cho tim.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Th\\u1ee9  hai, ch&uacute;ng ta n&ecirc;n ch&uacute; &yacute; \\u0103n c&aacute;c th\\u1ef1c ph\\u1ea9m nu&ocirc;i d\\u01b0\\u1ee1ng tr&aacute;i tim. Th\\u1eddi ti\\u1ebft  n&oacute;ng n\\u1ef1c, u\\u1ed1ng c&aacute;c th\\u1ee9c u\\u1ed1ng m&aacute;t nh\\u01b0 n\\u01b0\\u1edbc s&acirc;m, nh&atilde;n... hay \\u0103n ch&aacute;o k&ecirc;  t&aacute;o t&agrave;u l&agrave; l\\u1ef1a ch\\u1ecdn t\\u1ed1t. Ngo&agrave;i ra, m&ugrave;a h&egrave; n&ecirc;n h\\u1ea1n ch\\u1ebf \\u0103n c&aacute;c th\\u1ef1c ph\\u1ea9m  m\\u1eb7n, n\\u1ed9i t\\u1ea1ng \\u0111\\u1ed9ng v\\u1eadt, l&ograve;ng \\u0111\\u1ecf tr\\u1ee9ng hay c&aacute;c th\\u1ef1c ph\\u1ea9m gi&agrave;u ch\\u1ea5t b&eacute;o v&agrave;  cholesterol kh&aacute;c.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120513\\/20120510afamilySKchienthuatduytrisuckhoe-2_68fbe.jpg\\" alt=\\"20120510afamilySKchienthuatduytrisuckhoe-2_68fbe\\" width=\\"500\\" height=\\"694\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">&Iacute;t gi\\u1eadn d\\u1eef<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">M&ugrave;a  h&egrave; kh&ocirc; v&agrave; n&oacute;ng, v\\u1edbi s\\u1ef1 t\\u0103ng t\\u1ed1c c\\u1ee7a l\\u01b0u th&ocirc;ng m&aacute;u khi\\u1ebfn t&acirc;m tr\\u1ea1ng con  ng\\u01b0\\u1eddi d\\u1ec5 bi\\u1ebfn \\u0111\\u1ed9ng. B\\u1ea1n d\\u1ec5 c\\u1ea3m th\\u1ea5y m\\u1ec7t m\\u1ecfi, k&iacute;ch \\u0111\\u1ed9ng, t\\u1ee9c gi\\u1eadn, \\u0111&ocirc;i  khi kh&oacute; ch\\u1ecbu, m\\u1ea5t ng\\u1ee7 ban \\u0111&ecirc;m... Trong t&acirc;m l&yacute; h\\u1ecdc g\\u1ecdi l&agrave; Nhi\\u1ec7t t&igrave;nh c\\u1ea3m,  c&ograve;n g\\u1ecdi l&agrave; &ldquo;R\\u1ed1i lo\\u1ea1n t&igrave;nh c\\u1ea3m m&ugrave;a h&egrave;&rdquo;. S\\u1ef1 b\\u1ea5t \\u1ed5n \\u0111\\u1ecbnh v\\u1ec1 c\\u1ea3m x&uacute;c n&agrave;y  r\\u1ea5t nguy hi\\u1ec3m cho ng\\u01b0\\u1eddi cao tu\\u1ed5i, d\\u1ec5 d\\u1eabn \\u0111\\u1ebfn b\\u1ec7nh tim m\\u1ea1ch v&agrave; m\\u1ea1ch m&aacute;u  n&atilde;o. V&igrave; th\\u1ebf, duy tr&igrave; t&igrave;nh c\\u1ea3m \\u1ed5n \\u0111\\u1ecbnh v&agrave; r&egrave;n luy\\u1ec7n kh\\u1ea3 n\\u0103ng ch\\u1ecbu \\u0111\\u1ef1ng l&agrave;  \\u0111i\\u1ec1u quan tr\\u1ecdng.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">\\u0110\\u1ec3  duy tr&igrave; s\\u1ef1 \\u1ed5n \\u0111\\u1ecbnh c\\u1ee7a T&acirc;m, b\\u1ea1n c&oacute; th\\u1ec3 th\\u1eed nghi\\u1ec7m ph\\u01b0\\u01a1ng ph&aacute;p kh&iacute; c&ocirc;ng  d\\u01b0\\u1edbi \\u0111&acirc;y. T&igrave;m m\\u1ed9t c&ocirc;ng vi&ecirc;n c&acirc;y xanh hay m\\u1ed9t kh&ocirc;ng gian tho&aacute;ng m&aacute;t, b\\u1ea1n  \\u0111\\u1ee9ng tr&ecirc;n m\\u1eb7t \\u0111\\u1ea5t, nh\\u1eafm m\\u1eaft l\\u1ea1i, c&aacute;nh tay r\\u0169 xu\\u1ed1ng t\\u1ef1 nhi&ecirc;n, sau \\u0111&oacute; l\\u1ea5y  m\\u1ed9t h\\u01a1i th\\u1eadt s&acirc;u, t\\u1eeb t\\u1eeb h&iacute;t v&agrave;o b\\u1eb1ng m\\u0169i, b\\u1eaft \\u0111\\u1ea7u t\\u1eeb t\\u1eeb v\\u1edbi v&ograve;ng tay  r\\u1ed9ng m\\u1edf. B\\u1ea1n h&atilde;y t\\u01b0\\u1edfng t\\u01b0\\u1ee3ng kh&ocirc;ng kh&iacute; \\u0111\\u1ea7y l\\u1ed3ng ng\\u1ef1c, khi \\u0111&oacute; t\\u1eeb t\\u1eeb th\\u1edf  ra th&ocirc;ng qua m\\u0169i v&agrave; b&agrave;n tay t\\u1eeb t\\u1eeb h\\u1ea1 xu\\u1ed1ng.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">B&agrave;i  t\\u1eadp th\\u1edf cho ph&eacute;p c\\u01a1 th\\u1ec3 b\\u1ea1n t\\u0103ng th&ecirc;m s\\u1ee9c s\\u1ed1ng v&agrave; ni\\u1ec1m vui, \\u0111\\u1eb7c bi\\u1ec7t  gi&uacute;p lo\\u1ea1i b\\u1ecf t&igrave;nh tr\\u1ea1ng n&oacute;ng b\\u1ea5t \\u1ed5n. Ngo&agrave;i ra, \\u0103n th\\u1ee9c \\u0103n t\\u01b0\\u01a1i ngon,  th\\u1ee9c \\u0103n nh\\u1eb9 v&agrave; d\\u1ec5 ti&ecirc;u h&oacute;a, \\u0111\\u1eb7c bi\\u1ec7t l&agrave; d\\u01b0a h\\u1ea5u, d\\u01b0a chu\\u1ed9t, \\u0111&agrave;o v&agrave; c&aacute;c  lo\\u1ea1i tr&aacute;i c&acirc;y, rau qu\\u1ea3 theo m&ugrave;a kh&aacute;c. \\u0110\\u1ed1i v\\u1edbi ng\\u01b0\\u1eddi cao tu\\u1ed5i, m&ugrave;a h&egrave; n&ecirc;n  c\\u1ed1 g\\u1eafng r&egrave;n luy\\u1ec7n th&oacute;i quen ng\\u1ee7 tr\\u01b0a. Thi\\u1ebfu ng\\u1ee7 c\\u0169ng l&agrave; m\\u1ed9t l&yacute; do quan  tr\\u1ecdng khi\\u1ebfn cho ng\\u01b0\\u1eddi ta d\\u1ec5 c&aacute;u k\\u1ec9nh.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">\\u0102n th\\u1ef1c ph\\u1ea9m \\u0111\\u1eafng<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">M&ugrave;a  h&egrave; n&oacute;ng n\\u1ef1c khi\\u1ebfn cho kh\\u1ea9u v\\u1ecb b\\u1ecb thay \\u0111\\u1ed5i kh&aacute; nhi\\u1ec1u, \\u0111&ocirc;i khi th\\u1ea5y v&ocirc;  v\\u1ecb, ch&aacute;n \\u0103n. V&igrave; th\\u1ebf sau \\u0111&oacute; ch&uacute;ng ta c&oacute; xu h\\u01b0\\u1edbng &eacute;p bu\\u1ed9c b\\u1ea3n th&acirc;n ph\\u1ea3i \\u0103n  c&aacute;c th\\u1ecbt, c&aacute; \\u0111\\u1ec3 b\\u1ed5 sung, v&ocirc; t&igrave;nh l&agrave;m tr\\u1ea7m tr\\u1ecdng th&ecirc;m c&aacute;c tri\\u1ec7u ch\\u1ee9ng  ti&ecirc;u c\\u1ef1c. Tr&aacute;i l\\u1ea1i, \\u0103n c&aacute;c th\\u1ef1c ph\\u1ea9m \\u0111\\u1eafng l\\u1ea1i \\u0111&oacute;ng vai tr&ograve; nh\\u01b0 c&aacute;c m&oacute;n  khai v\\u1ecb. C&aacute;c nghi&ecirc;n c\\u1ee9u \\u0111&atilde; ch\\u1ec9 ra r\\u1eb1ng c&aacute;c lo\\u1ea1i th\\u1ef1c ph\\u1ea9m cay \\u0111\\u1eafng c&oacute;  ch\\u1ee9a c&aacute;c ch\\u1ea5t nh\\u01b0 alkaloid, axit amin, vitamin, kho&aacute;ng ch\\u1ea5t v&agrave; c&aacute;c ch\\u1ea5t  kh&aacute;c c\\u1ea7n thi\\u1ebft cho c\\u01a1 th\\u1ec3, t\\u1ed1t cho th\\u1ecb l\\u1ef1c, gi\\u1ea3i \\u0111\\u1ed9c, h\\u1ea1 s\\u1ed1t, kh&aacute;ng  khu\\u1ea9n, ch\\u1ed1ng vi&ecirc;m. \\u0102n \\u0111&uacute;ng c&aacute;ch c&oacute; th\\u1ec3 k&iacute;ch th&iacute;ch ti&ecirc;u h&oacute;a c\\u1ee7a d\\u1ea1 d&agrave;y,  t\\u0103ng c\\u1ea3m gi&aacute;c ngon mi\\u1ec7ng, lo\\u1ea1i b\\u1ecf ch\\u1ee9ng m\\u1ea5t v\\u1ecb gi&aacute;c m&ugrave;a h&egrave;, kh&oacute; ti&ecirc;u,  ch&aacute;n \\u0103n v&agrave; c&aacute;c r\\u1ed1i lo\\u1ea1n ti&ecirc;u h&oacute;a kh&aacute;c.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">M&ugrave;a h&egrave;, th\\u1ef1c ph\\u1ea9m \\u0111\\u1eafng ti&ecirc;u nh\\u1ea5t l&agrave; m\\u01b0\\u1edbp \\u0111\\u1eafng (kh\\u1ed5 qua). Ngo&agrave;i ra, c&ograve;n c&oacute; c&aacute;c lo\\u1ea1i th\\u1ea3o m\\u1ed9c \\u0111\\u1eafng kh&aacute;c nh\\u01b0 b\\u1ed3 c&ocirc;ng an...&nbsp;<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">\\u0102n th\\u1ef1c ph\\u1ea9m t&iacute;nh h&agrave;n<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">\\u0102n  th\\u1ee9c \\u0103n t&iacute;nh h&agrave;n c\\u0169ng c&oacute; vai tr&ograve; t\\u01b0\\u01a1ng t\\u1ef1 nh\\u01b0 \\u0103n th\\u1ef1c ph\\u1ea9m \\u0111\\u1eafng, ch\\u1eb3ng  h\\u1ea1n nh\\u01b0 hoa qu\\u1ea3 h\\u1ecd d\\u01b0a, c&agrave; chua, rau di\\u1ebfp c\\u1ea7n t&acirc;y v&agrave; c&aacute;c lo\\u1ea1i rau m&aacute;t m\\u1ebb  kh&aacute;c. Tuy nhi&ecirc;n, nh\\u1eefng ng\\u01b0\\u1eddi y\\u1ebfu ch\\u1ee9c n\\u0103ng ti&ecirc;u h&oacute;a, m\\u1eafc b\\u1ec7nh ti&ecirc;u h&oacute;a,  tr\\u1ebb em v&agrave; ng\\u01b0\\u1eddi cao tu\\u1ed5i c\\u1ea7n \\u0111\\u1eb7c bi\\u1ec7t ch&uacute; &yacute; \\u0111\\u1ebfn vi\\u1ec7c ti&ecirc;u th\\u1ee5 l\\u01b0\\u1ee3ng  th\\u1ef1c ph\\u1ea9m \\u0111\\u1eafng v&agrave; th\\u1ef1c ph\\u1ea9m t&iacute;nh ph&ugrave; h\\u1ee3p, tr&aacute;nh \\u0103n qu&aacute; nhi\\u1ec1u d\\u1ec5 d\\u1eabn \\u0111\\u1ebfn  l\\u1ea1nh b\\u1ee5ng v&agrave; ti&ecirc;u ch\\u1ea3y.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120513\\/20120510afamilySKchienthuatduytrisuckhoe-3_df130.jpg\\" alt=\\"20120510afamilySKchienthuatduytrisuckhoe-3_df130\\" width=\\"500\\" height=\\"694\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">\\u0110i b\\u1ed9<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">\\u0110\\u1ed1i  v\\u1edbi ng\\u01b0\\u1eddi cao tu\\u1ed5i, \\u0111\\u1eb7c bi\\u1ec7t l&agrave; nh\\u1eefng ng\\u01b0\\u1eddi c&oacute; b\\u1ec7nh m&atilde;n t&iacute;nh th&igrave; th\\u1eddi  ti\\u1ebft n&oacute;ng kh&ocirc;ng ph&ugrave; h\\u1ee3p \\u0111\\u1ec3 c\\u01a1 th\\u1ec3 tho&aacute;t m\\u1ed3 h&ocirc;i qu&aacute; nhi\\u1ec1u. Chuy\\u1ec3n \\u0111\\u1ed9ng  ch\\u1eadm nh\\u01b0 \\u0111i b\\u1ed9, thi\\u1ec1n, Yoga l&agrave; ph&ugrave; h\\u1ee3p nh\\u1ea5t cho th\\u1eddi ti\\u1ebft n&agrave;y v&agrave; ch\\u1eafc  ch\\u1eafn s\\u1ebd gi&uacute;p gi\\u1ea3m ch\\u1ee9ng m\\u1ea5t ng\\u1ee7 hi\\u1ec7u qu\\u1ea3.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Ng\\u01b0\\u1eddi  cao tu\\u1ed5i, \\u0111\\u1eb7c bi\\u1ec7t l&agrave; b\\u1ec7nh nh&acirc;n t\\u0103ng huy\\u1ebft &aacute;p, ti\\u1ec3u \\u0111\\u01b0\\u1eddng, m\\u1ed7i ng&agrave;y \\u0111i  b\\u1ed9 ch\\u1eadm t\\u1ed1t nh\\u1ea5t l&agrave; trong 15-30 ph&uacute;t v\\u1edbi kho\\u1ea3ng 70-80 b\\u01b0\\u1edbc m\\u1ed7i ph&uacute;t l&agrave;  th&iacute;ch h\\u1ee3p. \\u0110i b\\u1ed9 m\\u1ed9t ch&uacute;t khi ngh\\u1ec9 ng\\u01a1i r&aacute;o m\\u1ed3 h&ocirc;i l&agrave; th\\u1eddi \\u0111i\\u1ec3m l&yacute; t\\u01b0\\u1edfng  \\u0111\\u1ec3 \\u0103n c&aacute;c lo\\u1ea1i th\\u1ef1c ph\\u1ea9m &iacute;t ch\\u1ea5t b&eacute;o v&agrave; tr&aacute;i c&acirc;y t\\u01b0\\u01a1i c\\u0169ng nh\\u01b0 b\\u1ed5 sung  th&ecirc;m nhi\\u1ec1u n\\u01b0\\u1edbc cho c\\u01a1 th\\u1ec3.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120513\\/20120510afamilySKchienthuatduytrisuckhoe-4_f8931.jpg\\" alt=\\"20120510afamilySKchienthuatduytrisuckhoe-4_f8931\\" width=\\"500\\" height=\\"694\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">U\\u1ed1ng n\\u01b0\\u1edbc \\u0111\\u1ee7<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Th\\u1eddi  ti\\u1ebft n&oacute;ng khi\\u1ebfn c\\u01a1 th\\u1ec3 c&oacute; xu h\\u01b0\\u1edbng \\u0111\\u1ed5 m\\u1ed3 h&ocirc;i v&agrave; c&oacute; nhu c\\u1ea7u \\u0111&ograve;i h\\u1ecfi n\\u01b0\\u1edbc  ph\\u1ea3i \\u0111\\u01b0\\u1ee3c b\\u1ed5 sung k\\u1ecbp th\\u1eddi, \\u0111\\u1ea7y \\u0111\\u1ee7. Trong m&ugrave;a h&egrave;, c&oacute; nh\\u1eefng kho\\u1ea3ng th\\u1eddi  gian c\\u1ea7n \\u0111\\u1eb7c bi\\u1ec7t ch&uacute; &yacute; b\\u1ed5 sung n\\u01b0\\u1edbc cho c\\u01a1 th\\u1ec3: th\\u1ee9c d\\u1eady, tr\\u01b0\\u1edbc khi \\u0111i  ng\\u1ee7 v&agrave; t\\u1eafm. Th&ocirc;ng th\\u01b0\\u1eddng, t\\u1ed1t nh\\u1ea5t l&agrave; b\\u1ea1n n&ecirc;n c&oacute; m\\u1ed9t chai n\\u01b0\\u1edbc s\\u1eb5n trong  tay \\u0111\\u1ec3 u\\u1ed1ng b\\u1ea5t k\\u1ef3 th\\u1eddi \\u0111i\\u1ec3m n&agrave;o. M\\u1ed9t s\\u1ed1 ng\\u01b0\\u1eddi th&iacute;ch th\\u1ee9c u\\u1ed1ng l\\u1ea1nh v&agrave;o  m&ugrave;a h&egrave;, tr&ecirc;n th\\u1ef1c t\\u1ebf \\u0111i\\u1ec1u n&agrave;y kh&ocirc;ng th\\u1ec3 l&agrave; d\\u1ecbu c\\u01a1n kh&aacute;t c\\u1ee7a h\\u1ecd. \\u0110i\\u1ec1u  ng\\u1ea1c nhi&ecirc;n l&agrave; v&agrave;o nh\\u1eefng ng&agrave;y n&oacute;ng, tr&agrave; n&oacute;ng l\\u1ea1i l&agrave; th\\u1ee9c u\\u1ed1ng th&iacute;ch h\\u1ee3p  gi&uacute;p th&uacute;c \\u0111\\u1ea9y s\\u1ef1 b&agrave;i ti\\u1ebft c\\u1ee7a tuy\\u1ebfn m\\u1ed3 h&ocirc;i. M\\u1ed3 h&ocirc;i b&agrave;i ti\\u1ebft nhi\\u1ec1u qua da  n&ecirc;n l&agrave;m gi\\u1ea3m nhi\\u1ec7t \\u0111\\u1ed9 b\\u1ec1 m\\u1eb7t. Ngo&agrave;i b\\u1ed5 sung n\\u01b0\\u1edbc \\u1ea5m, b\\u1ea1n c\\u0169ng c&oacute; th&ecirc;m  r\\u1ea5t nhi\\u1ec1u l\\u1ef1a ch\\u1ecdn kh&aacute;c nh\\u01b0 \\u0103n c&aacute;c lo\\u1ea1i rau v&agrave; tr&aacute;i c&acirc;y l\\u1ee3i ti\\u1ec3u, ch\\u1eb3ng  h\\u1ea1n nh\\u01b0 d\\u01b0a h\\u1ea5u, h\\u1ea1t sen...<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">N\\u1ebfu \\u0111\\u1ed5 m\\u1ed3 h&ocirc;i qu&aacute; nhi\\u1ec1u th&igrave; b\\u1ea1n n&ecirc;n u\\u1ed1ng n\\u01b0\\u1edbc mu\\u1ed1i lo&atilde;ng thay v&igrave; u\\u1ed1ng n\\u01b0\\u1edbc \\u0111un s&ocirc;i.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">B\\u1ed5 sung Kali<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Th\\u1eddi  ti\\u1ebft n&oacute;ng khi\\u1ebfn h&agrave;m l\\u01b0\\u1ee3ng kali trong c\\u01a1 th\\u1ec3 d\\u1ec5 d&agrave;ng b\\u1ecb h\\u1ea1 th\\u1ea5p, m\\u1ed3 h&ocirc;i  ti\\u1ebft ra nhi\\u1ec1u c&agrave;ng khi\\u1ebfn cho l\\u01b0\\u1ee3ng natri v&agrave; kali hao h\\u1ee5t nhanh ch&oacute;ng.  Trong tr\\u01b0\\u1eddng h\\u1ee3p h\\u1ea1 kali m&aacute;u, b\\u1ea1n s\\u1ebd th\\u1ea5y b\\u1ee7n r\\u1ee7n ch&acirc;n tay, tim c\\u0169ng h\\u1ed3i  h\\u1ed9p, t\\u1ee9c ng\\u1ef1c, bu\\u1ed3n n&ocirc;n. V&igrave; v\\u1eady, b\\u1ed5 sung Kali c\\u0169ng l&agrave; y\\u1ebfu t\\u1ed1 c\\u1ea7n thi\\u1ebft.  Ngu\\u1ed3n th\\u1ef1c ph\\u1ea9m gi&agrave;u Kali m&agrave; b\\u1ea1n c&oacute; th\\u1ec3 l\\u1ef1a ch\\u1ecdn l&agrave; th\\u1ecbt l\\u1ee3n n\\u1ea1c, h\\u1ea3i  s\\u1ea3n, th\\u1ecbt b&ograve;, c\\u1ea3i b\\u1eafp, khoai t&acirc;y, chu\\u1ed1i...<\\/span><\\/p>\\r\\n<p style=\\"text-align: right;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Th&uacute;y Ph\\u1ea1m<\\/span><\\/strong><\\/p>","introtext":"\\u0110\\u1ec3 ho&agrave;n to&agrave;n kh\\u1ecfe m\\u1ea1nh tr\\u1ea3i qua m&ugrave;a h&egrave; b\\u1ea1n ch\\u1ec9 c\\u1ea7n ghi nh\\u1edb 8 \\u0111i\\u1ec1u \\u0111\\u01a1n gi\\u1ea3n.\\r\\nC&aacute;c  chuy&ecirc;n gia kh&iacute; t\\u01b0\\u1ee3ng h\\u1ecdc li&ecirc;n t\\u1ee5c d\\u1ef1 b&aacute;o s\\u1ef1 gia t\\u0103ng nhi\\u1ec7t \\u0111\\u1ed9 v&agrave; c&aacute;c  \\u0111\\u1ee3t n&oacute;ng b&ugrave;ng ph&aacute;t. Khi kh&ocirc;ng kh&iacute; v\\u01b0\\u1ee3t qu&aacute; 32 \\u0111\\u1ed9 C th&igrave; c\\u01a1 th\\u1ec3 b\\u1eaft \\u0111\\u1ea7u  c\\u1ea3m th\\u1ea5y n&oacute;ng. S\\u1ef1 n&oacute;ng n\\u1ef1c kh&ocirc;ng ch\\u1ec9 \\u1ea3nh h\\u01b0\\u1edfng \\u0111\\u1ebfn t&acirc;m tr\\u1ea1ng m&agrave; c&ograve;n \\u1ea3nh  h\\u01b0\\u1edfng \\u0111\\u1ebfn s\\u1ee9c kh\\u1ecfe c\\u1ee7a ch&uacute;ng ta. M&ugrave;a h&egrave;, s\\u1ef1 trao \\u0111\\u1ed5i ch\\u1ea5t c\\u1ee7a con ng\\u01b0\\u1eddi  b\\u1ecb \\u0111\\u1ea9y nhanh h\\u01a1n. Kh&ocirc;ng ph\\u1ea3i ng\\u1eabu nhi&ecirc;n m&agrave; \\u0111&acirc;y l&agrave; m&ugrave;a ...","modified":"{\\"1338621817\\":\\"1\\",\\"1338621830\\":\\"1\\",\\"1338621881\\":\\"1\\",\\"1338621894\\":\\"1\\",\\"1339032335\\":\\"1\\"}","metadesc":"\\u0110\\u1ec3 ho\\u00e0n to\\u00e0n kh\\u1ecfe m\\u1ea1nh tr\\u1ea3i qua m\\u00f9a h\\u00e8 b\\u1ea1n ch\\u1ec9 c\\u1ea7n ghi nh\\u1edb 8 \\u0111i\\u1ec1u \\u0111\\u01a1n gi\\u1ea3n. C\\u00e1c chuy\\u00ean gia kh\\u00ed t\\u01b0\\u1ee3ng h\\u1ecdc li\\u00ean t\\u1ee5c d\\u1ef1 b\\u00e1o s\\u1ef1 gia ..."}', 1, 1337162162, 4),
(15, 'vi', 14, 2, 1, 0, 0, 'Ngủ bao nhiêu là đủ? ', 'ngu-bao-nhieu-la-du-', '2', '{"introimage":"19","list_suggest":"13,9,14","fulltext":"<h2 style=\\"margin-top: 10px; margin-right: 20px; margin-bottom: 10px; margin-left: 20px; outline-style: none; outline-width: initial; outline-color: initial; font-family: ''Times New Roman'', Georgia, serif; font-size: 12pt; font-weight: bold; color: #000000;\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">Tr\\u1ebb em ph\\u1ea3i \\u0111\\u01b0\\u1ee3c ng\\u1ee7 kho\\u1ea3ng 8 ti\\u1ebfng \\u0111\\u1ebfn 9 ti\\u1ebfng l&agrave; v\\u1eeba \\u0111\\u1ee7. Ng\\u01b0\\u1eddi l\\u1edbn c&oacute; gi\\u1ea5c ng\\u1ee7 t\\u1eeb 6-8 ti\\u1ebfng m\\u1ed9t ng&agrave;y l&agrave; \\u0111\\u1ee7.<\\/span><\\/h2>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">Nhi\\u1ec1u  ng\\u01b0\\u1eddi v&igrave; m\\u1ea3i m&ecirc; c&ocirc;ng vi\\u1ec7c, v&igrave; c&aacute;c tr\\u1eadn game v&agrave; nh\\u1eefng l&yacute; do kh&aacute;c th\\u01b0\\u1eddng  khi\\u1ebfn h\\u1ecd ng\\u1ee7 qu&aacute; &iacute;t ho\\u1eb7c qu&aacute; nhi\\u1ec1u v\\u1edbi nh\\u1eefng gi\\u1edd gi\\u1ea5c kh&ocirc;ng \\u0111&uacute;ng s\\u1ebd d\\u1ec5  g&acirc;y ra nh\\u1eefng ch\\u1ee9ng b\\u1ec7nh nguy hi\\u1ec3m v&agrave; c&oacute; h\\u1ea1i cho s\\u1ee9c kho\\u1ebb.&nbsp;<\\/span><\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\">T\\u1ea7m quan tr\\u1ecdng c\\u1ee7a gi\\u1ea5c ng\\u1ee7<\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">M\\u1ed7i  ng&agrave;y c&oacute; 24 ti\\u1ebfng \\u0111\\u1ed3ng h\\u1ed3 v&agrave; gi\\u1ea5c ng\\u1ee7 c\\u1ee7a m\\u1ed7i ng\\u01b0\\u1eddi chi\\u1ebfm 1\\/3 t\\u1ee9c l&agrave;  kho\\u1ea3ng 8 ti\\u1ebfng 1 ng&agrave;y. V&igrave; v\\u1eady, gi\\u1ea5c ng\\u1ee7 l&agrave; m\\u1ed9t ph\\u1ea7n kh&ocirc;ng th\\u1ec3 thi\\u1ebfu \\u0111\\u1ed1i  v\\u1edbi m\\u1ed7i ng\\u01b0\\u1eddi ch&uacute;ng ta.<\\/span><\\/p>\\r\\n<div style=\\"outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman''; padding: 0px; margin: 0px;\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">Tuy  nhi&ecirc;n, nh\\u1ecbp sinh h\\u1ecdc c\\u1ee7a con ng\\u01b0\\u1eddi \\u0111&atilde; quy \\u0111\\u1ecbnh th&oacute;i quen ng\\u1ee7 c\\u1ee7a m\\u1ed7i  ng\\u01b0\\u1eddi, kh&ocirc;ng ph\\u1ea3i c\\u1ee9 ng\\u1ee7 \\u0111\\u1ee7 8h ti\\u1ebfng trong m\\u1ed9t ng&agrave;y l&agrave; t\\u1ed1t, m&agrave; \\u0111i\\u1ec1u c\\u01a1  b\\u1ea3n l&agrave; ph\\u1ea3i ng\\u1ee7 \\u0111&uacute;ng, ng\\u1ee7 \\u0111\\u1ee7 \\u0111\\u1ec3 \\u0111\\u1ea3m b\\u1ea3o s\\u1ee9c kho\\u1ebb.<\\/span><\\/div>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\"><img style=\\"outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman''; padding: 0px; margin: 0px;\\" src=\\"http:\\/\\/images.family.channelvn.net\\/Images\\/Uploaded\\/ngocdung\\/2008\\/11\\/bengungon.jpg\\" alt=\\"\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">Kh&ocirc;ng \\u0111\\u01b0\\u1ee3c ng\\u1ee7 qu&aacute; nhi\\u1ec1u ban ng&agrave;y v&agrave; th\\u1ee9c v&agrave;o ban \\u0111&ecirc;m. Kh&ocirc;ng n&ecirc;n ng\\u1ee7 l\\u01a1 m\\u01a1, ng\\u1eaft qu&atilde;ng.<\\/span><\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">Theo  c&aacute;c nghi&ecirc;n c\\u1ee9u cho bi\\u1ebft, tr\\u1ebb em v&agrave; thanh thi\\u1ebfu ni&ecirc;n thi\\u1ebfu ng\\u1ee7 g\\u1eb7p nhi\\u1ec1u  v\\u1ea5n \\u0111\\u1ec1 v\\u1ec1 h\\u1ecdc t\\u1eadp, s\\u1ee9c kh\\u1ecfe, h&agrave;nh vi v&agrave; kh&iacute; s\\u1eafc h\\u01a1n so v\\u1edbi c&aacute;c h\\u1ecdc sinh  ng\\u1ee7 &iacute;t nh\\u1ea5t 9 gi\\u1edd m\\u1ed7i \\u0111&ecirc;m. Nh\\u1eefng ng\\u01b0\\u1eddi l\\u1edbn n\\u1ebfu ng\\u1ee7 &iacute;t h\\u01a1n 6 ti\\u1ebfng m\\u1ed9t  ng&agrave;y v&agrave; qu&aacute; 9 ti\\u1ebfng m\\u1ed9t ng&agrave;y c\\u0169ng s\\u1ebd c&oacute; nh\\u1eefng \\u1ea3nh h\\u01b0\\u1edfng nghi&ecirc;m tr\\u1ecdng \\u0111\\u1ebfn  s\\u1ee9c kho\\u1ebb.<\\/span><\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"outline-style: none; outline-width: initial; outline-color: initial; font-weight: bold; color: #000000; font-family: verdana, geneva; font-size: 10pt; padding: 0px; margin: 0px;\\">Nh\\u1eefng \\u1ea3nh h\\u01b0\\u1edfng c\\u1ee7a s\\u1ef1 thi\\u1ebfu ng\\u1ee7<\\/span><\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">-  S\\u1ef1 thi\\u1ebfu h\\u1ee5t th\\u1eddi gian ng\\u1ee7 th\\u01b0\\u1eddng xuy&ecirc;n s\\u1ebd d\\u1eabn \\u0111\\u1ebfn nhi\\u1ec1u nguy h\\u1ea1i, \\u0111i\\u1ec1u  \\u0111\\u1ea7u ti&ecirc;n m&agrave; s\\u1ef1 thi\\u1ebfu ng\\u1ee7 l&agrave;m \\u1ea3nh h\\u01b0\\u1edfng \\u0111&oacute; l&agrave; c\\u0103ng th\\u1eb3ng th\\u1ea7n kinh.<\\/span><\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">Nhi\\u1ec1u  nghi&ecirc;n c\\u1ee9u \\u0111&atilde; ch\\u1ec9 ra r\\u1eb1ng, h\\u01a1n 20% nh\\u1eefng sinh vi&ecirc;n b\\u1ecb bu\\u1ed3n ng\\u1ee7 v&agrave; ng\\u1ee7  nhi\\u1ec1u tr&ecirc;n l\\u1edbn h\\u1ecdc khi\\u1ebfn h\\u1ecd m\\u1eafc nh\\u1eefng ch\\u1ee9ng b\\u1ec7nh v\\u1ec1 th\\u1ea7n kinh. Vi\\u1ec7c ng\\u1ee7  qu&aacute; nhi\\u1ec1u c\\u0169ng khi\\u1ebfn cho c\\u01a1 th\\u1ec3 b\\u1ecb suy nh\\u01b0\\u1ee3c, thi\\u1ebfu t\\u1ec9nh t&aacute;o v&agrave; minh  m\\u1eabn.<\\/span><\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">- Thi\\u1ebfu ng\\u1ee7 c\\u0169ng l&agrave; nguy&ecirc;n nh&acirc;n khi\\u1ebfn cho tr\\u1ebb ch\\u1eadm ph&aacute;t tri\\u1ec3n v&agrave; thi\\u1ebfu minh m\\u1eabn, kh\\u1ea3 n\\u0103ng ti\\u1ebfp thu k&eacute;m.<\\/span><\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">- Thi\\u1ebfu ng\\u1ee7 \\u0111\\u1eb7c bi\\u1ec7t nguy hi\\u1ec3m v\\u1edbi nh\\u1eefng ng\\u01b0\\u1eddi s\\u1eed d\\u1ee5ng ph\\u01b0\\u01a1ng ti\\u1ec7n giao th&ocirc;ng.<\\/span><\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">-  Nh\\u1eefng ng\\u01b0\\u1eddi lao \\u0111\\u1ed9ng tr&iacute; &oacute;c nhi\\u1ec1u c\\u1ea7n \\u0111\\u01b0\\u1ee3c ng\\u1ee7 \\u0111\\u1ee7 gi\\u1ea5c, n\\u1ebfu t&igrave;nh tr\\u1ea1ng  thi\\u1ebfu ng\\u1ee7 k&eacute;o d&agrave;i s\\u1ebd d\\u1eabn \\u0111\\u1ebfn r\\u1ed1i lo\\u1ea1n th\\u1ea7n kinh, suy nh\\u01b0\\u1ee3c h\\u1ec7 tu\\u1ea7n ho&agrave;n  n&atilde;o v&agrave; sinh ra nhi\\u1ec1u ch\\u1ee9ng b\\u1ec7nh v\\u1ec1 n&atilde;o.<\\/span><\\/p>\\r\\n<p style=\\"margin-top: 2%; margin-right: auto !important; margin-bottom: 2%; margin-left: auto !important; outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman'';\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">\\u0110\\u1ed1i  v\\u1edbi m\\u1ed7i ng\\u01b0\\u1eddi, gi\\u1ea5c ng\\u1ee7 l&agrave; \\u0111i\\u1ec1u kh&ocirc;ng th\\u1ec3 thi\\u1ebfu, ch&iacute;nh v&igrave; v\\u1eady, \\u0111\\u1ec3 gi\\u1eef  m\\u1ed9t s\\u1ee9c kho\\u1ebb t\\u1ed1t, ngo&agrave;i vi\\u1ec7c t\\u1eadp luy\\u1ec7n v&agrave; \\u0103n u\\u1ed1ng \\u0111\\u1ea7y \\u0111\\u1ee7 \\u0111&uacute;ng c&aacute;ch c&ograve;n  c\\u1ea7n ph\\u1ea3i ng\\u1ee7 \\u0111\\u1ee7 v&agrave; ng\\u1ee7 \\u0111&uacute;ng \\u0111\\u1ec3 \\u0111\\u1ea3m b\\u1ea3o m\\u1ed9t s\\u1ee9c kho\\u1ebb t\\u1ed1t v&agrave; m\\u1ed9t tinh th\\u1ea7n  kho\\u1ebb m\\u1ea1nh.<\\/span><\\/p>\\r\\n<div id=\\"author\\" style=\\"outline-style: none; outline-width: initial; outline-color: initial; font-size: 12pt; color: #000000; font-family: ''Times New Roman''; padding: 0px; margin: 0px;\\"><span style=\\"font-family: verdana, geneva; font-size: 10pt;\\">Theo&nbsp;<span style=\\"outline-style: none; outline-width: initial; outline-color: initial; font-weight: bold; color: #000000; padding: 0px; margin: 0px;\\">Ho&agrave;ng Mai<\\/span><\\/span><\\/div>","introtext":"Tr\\u1ebb em ph\\u1ea3i \\u0111\\u01b0\\u1ee3c ng\\u1ee7 kho\\u1ea3ng 8 ti\\u1ebfng \\u0111\\u1ebfn 9 ti\\u1ebfng l&agrave; v\\u1eeba \\u0111\\u1ee7. Ng\\u01b0\\u1eddi l\\u1edbn c&oacute; gi\\u1ea5c ng\\u1ee7 t\\u1eeb 6-8 ti\\u1ebfng m\\u1ed9t ng&agrave;y l&agrave; \\u0111\\u1ee7.\\r\\nNhi\\u1ec1u  ng\\u01b0\\u1eddi v&igrave; m\\u1ea3i m&ecirc; c&ocirc;ng vi\\u1ec7c, v&igrave; c&aacute;c tr\\u1eadn game v&agrave; nh\\u1eefng l&yacute; do kh&aacute;c th\\u01b0\\u1eddng  khi\\u1ebfn h\\u1ecd ng\\u1ee7 qu&aacute; &iacute;t ho\\u1eb7c qu&aacute; nhi\\u1ec1u v\\u1edbi nh\\u1eefng gi\\u1edd gi\\u1ea5c kh&ocirc;ng \\u0111&uacute;ng s\\u1ebd d\\u1ec5  g&acirc;y ra nh\\u1eefng ch\\u1ee9ng b\\u1ec7nh nguy hi\\u1ec3m v&agrave; c&oacute; h\\u1ea1i cho s\\u1ee9c kho\\u1ebb.&nbsp;\\r\\nT\\u1ea7m quan tr\\u1ecdng c\\u1ee7a gi\\u1ea5c ng\\u1ee7\\r\\nM\\u1ed7i  ng&agrave;y c&oacute; 24 ti\\u1ebfng \\u0111\\u1ed3ng h\\u1ed3 v&agrave; gi\\u1ea5c ng\\u1ee7 c\\u1ee7a m\\u1ed7i ng\\u01b0\\u1eddi chi\\u1ebfm 1\\/3 t\\u1ee9c l&agrave;  kho\\u1ea3ng 8 ti\\u1ebfng ...","modified":"{\\"1337162242\\":\\"1\\",\\"1337162244\\":\\"1\\",\\"1337162756\\":\\"1\\",\\"1339032314\\":\\"1\\",\\"1339134451\\":\\"1\\",\\"1339154754\\":\\"1\\"}","metadesc":"Tr\\u1ebb em ph\\u1ea3i \\u0111\\u01b0\\u1ee3c ng\\u1ee7 kho\\u1ea3ng 8 ti\\u1ebfng \\u0111\\u1ebfn 9 ti\\u1ebfng l\\u00e0 v\\u1eeba \\u0111\\u1ee7. Ng\\u01b0\\u1eddi l\\u1edbn c\\u00f3 gi\\u1ea5c ng\\u1ee7 t\\u1eeb 6-8 ti\\u1ebfng m\\u1ed9t ng\\u00e0y l\\u00e0 \\u0111\\u1ee7. Nhi\\u1ec1u ng\\u01b0\\u1eddi v\\u00ec m\\u1ea3i ..."}', 1, 1337162228, 1),
(16, 'vi', 12, 2, 1, 0, 0, 'Cách tập thể dục đơn giản tại nhà', 'cach-tap-the-duc-don-gian-tai-nha', '29', '{"introimage":"20","list_suggest":"","fulltext":"<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">M\\u1ed9t s\\u1ed1 t\\u1eadp luy\\u1ec7n c&oacute; th\\u1ec3 d\\u1ec5 d&agrave;ng \\u0111\\u01b0\\u1ee3c th\\u1ef1c hi\\u1ec7n m\\u1ed9t c&aacute;ch tho\\u1ea3i m&aacute;i t\\u1ea1i ph&ograve;ng kh&aacute;ch c\\u1ee7a b\\u1ea1n.<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">B\\u1ea1n  c&oacute; th\\u1ec3 tho\\u1ea3i m&aacute;i t\\u1eadp luy\\u1ec7n v\\u1edbi s\\u1ef1 thu\\u1eadn ti\\u1ec7n v&agrave; kh&ocirc;ng kh&iacute; tho\\u1ea3i m&aacute;i.  B\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp luy\\u1ec7n m\\u1ed9t m&igrave;nh ho\\u1eb7c r\\u1ee7 th&ecirc;m b\\u1ea1n \\u0111\\u1ebfn t\\u1eadp c&ugrave;ng nh\\u01b0ng ph\\u1ea3i  t\\u01b0 v\\u1ea5n b&aacute;c s\\u0129 c\\u1ee7a b\\u1ea1n tr\\u01b0\\u1edbc khi b\\u1eaft \\u0111\\u1ea7u m\\u1ed9t ch\\u01b0\\u01a1ng tr&igrave;nh t\\u1eadp th\\u1ec3 d\\u1ee5c  m\\u1edbi. D\\u01b0\\u1edbi \\u0111&acirc;y l&agrave; m\\u1ed9t v&agrave;i \\u0111i\\u1ec1u \\u0111\\u01a1n gi\\u1ea3n b\\u1ea1n c&oacute; th\\u1ec3 l&agrave;m.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Leo b\\u1eadc thang<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">N\\u1ebfu  nh&agrave; b\\u1ea1n \\u1edf c&oacute; c\\u1ea7u thang, b\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp luy\\u1ec7n ch\\u1ec9 \\u0111\\u01a1n gi\\u1ea3n b\\u1eb1ng c&aacute;ch leo  c\\u1ea7u thang. \\u0110\\u1ec3 b\\u1eaft \\u0111\\u1ea7u, b\\u01b0\\u1edbc l&ecirc;n c\\u1ea7u thang \\u0111\\u1ea7u ti&ecirc;n, v&agrave; sau \\u0111&oacute; quay tr\\u1edf  l\\u1ea1i. L\\u1eb7p l\\u1ea1i \\u0111\\u1ed9ng th&aacute;i n&agrave;y tr&ecirc;n c\\u1ea7u thang \\u0111\\u1ea7u ti&ecirc;n m\\u01b0\\u1eddi l\\u1ea7n. Sau \\u0111&oacute; \\u0111i  b\\u1ed9 l&ecirc;n c\\u1ea7u thang \\u0111\\u1ea7u ti&ecirc;n, v&agrave; sau \\u0111&oacute; quay tr\\u1edf l\\u1ea1i. L\\u1eb7p l\\u1ea1i m\\u01b0\\u1eddi l\\u1ea7n. B\\u1ea1n  ch\\u1eafc ch\\u1eafn s\\u1ebd c\\u1ea3m th\\u1ea5y \\u0111au ch&acirc;n khi b\\u01b0\\u1edbc \\u0111\\u1ebfn b\\u01b0\\u1edbc cu\\u1ed1i c&ugrave;ng. N\\u1ebfu b\\u1ea1n c\\u1ea3m  th\\u1ea5y h\\u01a1i ch&oacute;ng m\\u1eb7t, b\\u1ea1n h&atilde;y b\\u01b0\\u1edbc ch\\u1eadm l\\u1ea1i. H&atilde;y t\\u1eadp luy\\u1ec7n v\\u1edbi ba c\\u1ea7u  thang \\u0111\\u1ea7u ti&ecirc;n, v&agrave; d\\u1ea7n d\\u1ea7n x&acirc;y d\\u1ef1ng \\u0111\\u1ed9 b\\u1ec1n c\\u1ee7a b\\u1ea1n trong nh\\u1eefng tu\\u1ea7n v&agrave;  th&aacute;ng t\\u1edbi.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">T\\u1eadp luy\\u1ec7n v\\u1edbi gi\\u1ecf qu\\u1ea7n &aacute;o<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">T\\u1eadp  luy\\u1ec7n v\\u1edbi m\\u1ed9t gi\\u1ecf \\u0111\\u1ea7y qu\\u1ea7n &aacute;o c&oacute; t&aacute;c d\\u1ee5ng h\\u01a1n nhi\\u1ec1u khi l&agrave;m vi\\u1ec7c v\\u1eb7t  trong gia \\u0111&igrave;nh. N&oacute; c&oacute; t&aacute;c d\\u1ee5ng nh\\u01b0 m\\u1ed9t m&aacute;y t\\u1eadp th\\u1ec3 d\\u1ee5c c&aacute;nh tay. Gi\\u1eef gi\\u1ecf  tr&ecirc;n \\u0111\\u1ea7u b\\u1ea1n v&agrave; n&acirc;ng l&ecirc;n r\\u1ed3i h\\u1ea1 xu\\u1ed1ng. L&agrave;m \\u0111\\u1ed9ng t&aacute;c n&agrave;y &iacute;t nh\\u1ea5t ba l\\u1ea7n.  N\\u1ebfu n&oacute; l&agrave; qu&aacute; n\\u1eb7ng v\\u1edbi b\\u1ea1n, b\\u1ea1n c&oacute; th\\u1ec3 b\\u1ecf b\\u1edbt qu\\u1ea7n &aacute;o ra. B&agrave;i t\\u1eadp n&agrave;y  s\\u1ebd c&oacute; t&aacute;c d\\u1ee5ng vai, c&aacute;nh tay tr&ecirc;n v&agrave; c\\u01a1 l\\u01b0ng tr&ecirc;n. Thay \\u0111\\u1ed5i n&agrave;y t\\u1eadp th\\u1ec3  d\\u1ee5c b\\u1eb1ng c&aacute;ch n\\u1eb1m th\\u1eb3ng l\\u01b0ng c\\u1ee7a b\\u1ea1n, v&agrave; n&acirc;ng gi\\u1ecf l&ecirc;n v&agrave; h\\u1ea1 xu\\u1ed1ng ng\\u1ef1c  c\\u1ee7a b\\u1ea1n.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Th\\u1ec3 d\\u1ee5c tr&ecirc;n chi\\u1ebfc chi\\u1ebfu<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">C&oacute;  nhi\\u1ec1u b&agrave;i t\\u1eadp t\\u1ea1i ch\\u1ed7 m&agrave; b\\u1ea1n c&oacute; th\\u1ec3 th\\u1ef1c hi\\u1ec7n t\\u1ea1i nh&agrave;. H&atilde;y d&ugrave;ng m\\u1ed9t  chi\\u1ebfc chi\\u1ebfu t\\u1eadp v&agrave; c\\u1ed1 g\\u1eafng t\\u1eadp c&aacute;c \\u0111\\u1ed9ng t&aacute;c c\\u0103ng c\\u01a1, n&acirc;ng ch&acirc;n l&ecirc;n cao  v&agrave; g\\u1eadp ng\\u01b0\\u1eddi. H&atilde;y ch&uacute; &yacute; t\\u1eadp \\u0111&uacute;ng c&aacute;ch n\\u1ebfu kh&ocirc;ng b\\u1ea1n c&oacute; th\\u1ec3 g&acirc;y th\\u01b0\\u01a1ng  t\\u1ed5n cho ch&iacute;nh m&igrave;nh.<\\/span><\\/p>\\r\\n<p class=\\"caption\\" style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120322\\/1332237186-taptheduc1-suckhoe.eva.jpg\\" alt=\\"1332237186-taptheduc1-suckhoe.eva\\" width=\\"450\\" height=\\"373\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-family: verdana,geneva; font-size: 8pt;\\">N&ecirc;n c\\u1ed1 g\\u1eafng k\\u1ebft h\\u1ee3p t\\u1eadp th\\u1ec3 d\\u1ee5c v&agrave;o c&ocirc;ng vi\\u1ec7c h&agrave;ng ng&agrave;y c\\u1ee7a b\\u1ea1n b\\u1ea5t c\\u1ee9 khi n&agrave;o c&oacute; th\\u1ec3 (\\u1ea3nh minh h\\u1ecda)<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Luy\\u1ec7n t\\u1eadp v\\u1edbi d\\u1ee5ng c\\u1ee5<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">H&atilde;y  s\\u1eafm cho m&igrave;nh m\\u1ed9t d\\u1ee5ng c\\u1ee5 t\\u1eadp th\\u1ec3 d\\u1ee5c n&agrave;o \\u0111\\u1ea5y, v&iacute; d\\u1ee5 b&oacute;ng t\\u1eadp chuy&ecirc;n  d\\u1ee5ng, ho\\u1eb7c m&aacute;y t\\u1eadp ch\\u1ea1y. B\\u1ea1n s\\u1ebd tho\\u1ea3i m&aacute;i luy\\u1ec7n t\\u1eadp b\\u1ea5t c\\u1ee9 l&uacute;c n&agrave;o r&atilde;nh  r\\u1ed7i v&agrave; h\\u1ee9ng th&uacute;. Ho\\u1eb7c c&oacute; th\\u1ec3 v\\u1eeba t\\u1eadp v\\u1eeba theo d&otilde;i ch\\u01b0\\u01a1ng tr&igrave;nh TV y&ecirc;u  th&iacute;ch c\\u1ee7a m&igrave;nh.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">T\\u1eadp th\\u1ec3 d\\u1ee5c ngay tr&ecirc;n gh\\u1ebf l&agrave;m vi\\u1ec7c<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">V\\u1edbi  m\\u1ed9t chi\\u1ebfc gh\\u1ebf v\\u0103n ph&ograve;ng v\\u1edbi b&aacute;nh xe, b\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp luy\\u1ec7n ngay t\\u1ea1i b&agrave;n  l&agrave;m vi\\u1ec7c c\\u1ee7a b\\u1ea1n. Ch\\u1ec9 c\\u1ea7n t\\u1eadp luy\\u1ec7n trong khi b\\u1ea1n ng\\u1ed3i tr&ecirc;n gh\\u1ebf v&agrave; s\\u1eed  d\\u1ee5ng c\\u01a1 b\\u1eafp c\\u1ee7a c&aacute;nh tay c\\u1ee7a b\\u1ea1n \\u0111\\u1ec3 k&eacute;o m&igrave;nh l\\u1ea1i g\\u1ea7n b&agrave;n l&agrave;m vi\\u1ec7c v&agrave; \\u0111\\u1ea9y  m&igrave;nh ra xa. \\u0110i\\u1ec1u n&agrave;y s\\u1ebd l&agrave;m cho b\\u1eafp tay c\\u1ee7a b\\u1ea1n r\\u1eafn ch\\u1eafc.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">T\\u1eadp trong l&uacute;c n\\u1ea5u \\u0103n<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Cu\\u1ed9c  s\\u1ed1ng b\\u1eadn r\\u1ed9n, v&igrave; v\\u1eady h&atilde;y th\\u1eed \\u0111a nhi\\u1ec7m v\\u1ee5 n\\u1ebfu b\\u1ea1n kh&ocirc;ng c&oacute; th\\u1eddi gian ph&ugrave;  h\\u1ee3p \\u0111\\u1ec3 t\\u1eadp luy\\u1ec7n th&iacute;ch h\\u1ee3p. Trong khi n\\u1ea5u n\\u01b0\\u1edbng, b\\u1ea1n n&ecirc;n c\\u1ed1 g\\u1eafng k\\u1ebft  h\\u1ee3p t\\u1eadp th\\u1ec3 d\\u1ee5c v&agrave;o c&ocirc;ng vi\\u1ec7c h&agrave;ng ng&agrave;y c\\u1ee7a b\\u1ea1n b\\u1ea5t c\\u1ee9 khi n&agrave;o c&oacute; th\\u1ec3.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Th\\u1ef1c hi\\u1ec7n theo c&aacute;c b\\u01b0\\u1edbc \\u0111\\u01a1n gi\\u1ea3n v&agrave; b\\u1ea1n s\\u1ebd c\\u1ea3m th\\u1ea5y ph&ugrave; h\\u1ee3p.<\\/span><\\/p>\\r\\n<p style=\\"text-align: right;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Theo Eva<\\/span><\\/strong><\\/p>","introtext":"M\\u1ed9t s\\u1ed1 t\\u1eadp luy\\u1ec7n c&oacute; th\\u1ec3 d\\u1ec5 d&agrave;ng \\u0111\\u01b0\\u1ee3c th\\u1ef1c hi\\u1ec7n m\\u1ed9t c&aacute;ch tho\\u1ea3i m&aacute;i t\\u1ea1i ph&ograve;ng kh&aacute;ch c\\u1ee7a b\\u1ea1n.\\r\\nB\\u1ea1n  c&oacute; th\\u1ec3 tho\\u1ea3i m&aacute;i t\\u1eadp luy\\u1ec7n v\\u1edbi s\\u1ef1 thu\\u1eadn ti\\u1ec7n v&agrave; kh&ocirc;ng kh&iacute; tho\\u1ea3i m&aacute;i.  B\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp luy\\u1ec7n m\\u1ed9t m&igrave;nh ho\\u1eb7c r\\u1ee7 th&ecirc;m b\\u1ea1n \\u0111\\u1ebfn t\\u1eadp c&ugrave;ng nh\\u01b0ng ph\\u1ea3i  t\\u01b0 v\\u1ea5n b&aacute;c s\\u0129 c\\u1ee7a b\\u1ea1n tr\\u01b0\\u1edbc khi b\\u1eaft \\u0111\\u1ea7u m\\u1ed9t ch\\u01b0\\u01a1ng tr&igrave;nh t\\u1eadp th\\u1ec3 d\\u1ee5c  m\\u1edbi. D\\u01b0\\u1edbi \\u0111&acirc;y l&agrave; m\\u1ed9t v&agrave;i \\u0111i\\u1ec1u \\u0111\\u01a1n gi\\u1ea3n b\\u1ea1n c&oacute; th\\u1ec3 l&agrave;m.\\r\\nLeo b\\u1eadc thang\\r\\nN\\u1ebfu  nh&agrave; b\\u1ea1n \\u1edf c&oacute; c\\u1ea7u thang, b\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp luy\\u1ec7n ch\\u1ec9 \\u0111\\u01a1n ...","modified":"{\\"1338873428\\":\\"1\\",\\"1338873515\\":\\"1\\",\\"1338873534\\":\\"1\\",\\"1338873669\\":\\"1\\",\\"1339032303\\":\\"1\\"}","metadesc":"M\\u1ed9t s\\u1ed1 t\\u1eadp luy\\u1ec7n c\\u00f3 th\\u1ec3 d\\u1ec5 d\\u00e0ng \\u0111\\u01b0\\u1ee3c th\\u1ef1c hi\\u1ec7n m\\u1ed9t c\\u00e1ch tho\\u1ea3i m\\u00e1i t\\u1ea1i ph\\u00f2ng kh\\u00e1ch c\\u1ee7a b\\u1ea1n. B\\u1ea1n c\\u00f3 th\\u1ec3 tho\\u1ea3i m\\u00e1i t\\u1eadp luy\\u1ec7n v\\u1edbi s\\u1ef1 thu\\u1eadn ..."}', 1, 1337162790, 4);
INSERT INTO `tbl_article` (`id`, `lang`, `catid`, `type`, `status`, `special`, `order_view`, `title`, `alias`, `keyword`, `other`, `created_by`, `created_date`, `visits`) VALUES
(17, 'vi', 14, 2, 1, 0, 0, '“Đổi gió”phong cách hoàng gia', 'doi-giophong-cach-hoang-gia', '2', '{"introimage":"21","list_suggest":"16,15,14,13,12","fulltext":"<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">M\\u1ed9t  m&ugrave;a h&egrave; qu&aacute; nhi\\u1ec1u bi\\u1ebfn \\u0111\\u1ed9ng v\\u1ec1 phong c&aacute;ch th\\u1eddi trang nh\\u01b0 n\\u0103m nay s\\u1ebd  khi\\u1ebfn b\\u1ea1n kh&oacute; l\\u1ef1a ch\\u1ecdn cho m&igrave;nh nh\\u1eefng b\\u1ed9 trang ph\\u1ee5c ho&agrave;n h\\u1ea3o. <\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">&ETH;\\u1ec3  kh&ocirc;ng &ldquo;sa \\u0111&agrave;&rdquo; v&agrave;o nh\\u1eefng ki\\u1ec3u d&aacute;ng &ldquo;lo\\u1ea1n&rdquo; chi ti\\u1ebft th\\u01b0\\u1eddng th\\u1ea5y tr&ecirc;n th\\u1ecb  tr\\u01b0\\u1eddng th\\u1eddi trang hi\\u1ec7n nay, b\\u1ea1n h&atilde;y \\u0111\\u1ecbnh h&igrave;nh m\\u1ed9t phong c&aacute;ch cho ri&ecirc;ng  m&igrave;nh nh&eacute;, r\\u1ea5t sang tr\\u1ecdng m&agrave; kh&ocirc;ng h\\u1ec1 gi\\u1ea3m \\u0111\\u1ed9 x&igrave;-tin, \\u0111&oacute; l&agrave; th\\u1eddi trang  c\\u1ee7a nh\\u1eefng c&ocirc; ti\\u1ec3u th\\u01b0 ho&agrave;ng gia th\\u1eddi hi\\u1ec7n \\u0111\\u1ea1i.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Lan t\\u1ecfa t\\u1eeb m&agrave;n \\u1ea3nh nh\\u1ecf<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Phong  c&aacute;ch th\\u1eddi trang ho&agrave;ng gia kh&ocirc;ng ch\\u1ec9 l&agrave;m c&aacute;c c&ocirc; n&agrave;ng &ldquo;r\\u1ee5ng r\\u1eddi&rdquo; m&agrave; c&ograve;n  khi\\u1ebfn nhi\\u1ec1u ch&agrave;ng trai &ldquo;\\u0111\\u1ed5 nghi&ecirc;ng ng\\u1ea3&rdquo; \\u0111\\u1ea5y. V&igrave; s\\u1ee9c lan t\\u1ecfa c\\u1ee7a phong  c&aacute;ch th&uacute; v\\u1ecb n&agrave;y m&agrave; trang ph\\u1ee5c c\\u1ee7a c&aacute;c ch&agrave;ng trai ng&agrave;y c&agrave;ng xu\\u1ea5t hi\\u1ec7n  nhi\\u1ec1u chi ti\\u1ebft l\\u1ea5p l&aacute;nh &aacute;nh b\\u1ea1c, &aacute;nh v&agrave;ng. Nh\\u1eefng chi ti\\u1ebft n&agrave;y \\u0111\\u01b0\\u1ee3c c&aacute;ch  \\u0111i\\u1ec7u v&agrave; m&ocirc; ph\\u1ecfng theo trang ph\\u1ee5c \\u0111\\u1eadm ch\\u1ea5t qu&yacute; t\\u1ed9c Anh.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120513\\/20100904snsd2seoulbeats_6deec.jpg\\" alt=\\"20100904snsd2seoulbeats_6deec\\" width=\\"400\\" height=\\"424\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-family: verdana,geneva; font-size: 8pt;\\">Nh\\u1eefng chi\\u1ebfc v&aacute;y &ldquo;ho&agrave;ng gia&rdquo; c&aacute;ch \\u0111i\\u1ec7u r\\u1ea5t ph&ugrave; h\\u1ee3p v\\u1edbi ng&agrave;y h&egrave; n&oacute;ng b\\u1ee9c.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Kh&ocirc;ng  th\\u1ec3 ph\\u1ee7 nh\\u1eadn s\\u1ee9c h&uacute;t c\\u1ee7a nh\\u1eefng b\\u1ed9 trang ph\\u1ee5c mang h\\u01a1i h\\u01b0\\u1edbng ho&agrave;ng gia  lan t\\u1ecfa t\\u1eeb nh\\u1eefng b\\u1ed9 phim truy\\u1ec1n h&igrave;nh H&agrave;n Qu\\u1ed1c. V\\u1edbi vai di\\u1ec5n Kim Hang Ah  trong b\\u1ed9 phim truy\\u1ec1n h&igrave;nh The King 2 hearts, ng\\u01b0\\u1eddi \\u0111\\u1eb9p Ha Ji Won tr\\u1edf  th&agrave;nh &ldquo;bi\\u1ec3u t\\u01b0\\u1ee3ng th\\u1eddi trang ho&agrave;ng gia&rdquo;. Trong nh\\u1eefng t\\u1eadp \\u0111\\u1ea7u c\\u1ee7a phim,  Ha Won Ji ch\\u1ee7 y\\u1ebfu xu\\u1ea5t hi\\u1ec7n trong nh\\u1eefng b\\u1ed9 qu&acirc;n ph\\u1ee5c ho&agrave;ng gia c&oacute; v\\u1ebb h\\u01a1i  &ldquo;nam t&iacute;nh&rdquo;, nh\\u01b0ng c\\u0169ng t\\u1ea1o \\u0111\\u01b0\\u1ee3c phong c&aacute;ch ri&ecirc;ng, kh&aacute; \\u0111\\u1eb7c bi\\u1ec7t. Cho \\u0111\\u1ebfn  khi c&ocirc; n&agrave;ng b\\u1eaft \\u0111\\u1ea7u tr&uacute;t b\\u1ecf b\\u1ed9 qu&acirc;n ph\\u1ee5c \\u0111\\u1ec3 di\\u1ec7n nh\\u1eefng b\\u1ed9 trang ph\\u1ee5c  \\u0111\\u1eaft ti\\u1ec1n v&agrave; quy\\u1ebfn r\\u0169 th&igrave; s\\u1ee9c h&uacute;t c\\u1ee7a phong c&aacute;ch th\\u1eddi trang ho&agrave;ng gia \\u0111&atilde;  th\\u1ef1c s\\u1ef1 quy\\u1ebfn r\\u0169 c\\u1ea3 nh\\u1eefng kh&aacute;n gi\\u1ea3 kh&oacute; t&iacute;nh nh\\u1ea5t.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">&ldquo;Chi&ecirc;u&rdquo;  ph\\u1ed1i \\u0111\\u1ed3 c\\u1ee7a c&ocirc; n&agrave;ng Ha Ji Won kh&aacute; tinh t\\u1ebf, l&uacute;c l&agrave; chi\\u1ebfc &aacute;o v&agrave;ng k\\u1ebft h\\u1ee3p  v\\u1edbi ch&acirc;n v&aacute;y x&ograve;e, t\\u1ea1o h&igrave;nh \\u1ea3nh n\\u1eef t&iacute;nh, khi l&agrave; chi\\u1ebfc &aacute;o tr\\u1eafng v\\u1edbi d\\u1ea3i  n\\u01a1 \\u0111en ph\\u1ea7n c\\u1ed5, k\\u1ebft h\\u1ee3p v\\u1edbi &aacute;o kho&aacute;c ng\\u1eafn v&agrave; ch&acirc;n v&aacute;y, t\\u1ea1o v\\u1ebb tr\\u1ebb  trung... X&igrave;-tai c\\u1ee7a c&ocirc; n&agrave;ng &ldquo;ngo&agrave;i 30&rdquo; n&agrave;y \\u0111&atilde; th\\u1ef1c s\\u1ef1 l&agrave;m kh&aacute;n gi\\u1ea3 m&ecirc;  m\\u1ec7t. B\\u1ea3n th&acirc;n n\\u1eef di\\u1ec5n vi&ecirc;n Ha Ji Won c\\u0169ng r\\u1ea5t th&iacute;ch nh\\u1eefng trang ph\\u1ee5c  n&agrave;y, c&ocirc; b&agrave;y t\\u1ecf: &ldquo;T&ocirc;i r\\u1ea5t h\\u1ea1nh ph&uacute;c v&igrave; m&igrave;nh c&oacute; th\\u1ec3 di\\u1ec7n nh\\u1eefng b\\u1ed9 qu\\u1ea7n &aacute;o  m&agrave; m&igrave;nh lu&ocirc;n ao \\u01b0\\u1edbc \\u0111\\u01b0\\u1ee3c m\\u1eb7c&rdquo;.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120513\\/57cs10_95df5.jpg\\" alt=\\"57cs10_95df5\\" width=\\"400\\" height=\\"285\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Tuy  nhi&ecirc;n, b\\u1ea1n ch\\u1ec9 c&oacute; th\\u1ec3 tham kh\\u1ea3o phong c&aacute;ch th\\u1eddi trang ho&agrave;ng gia c\\u1ee7a c&aacute;c  n\\u1eef di\\u1ec5n vi&ecirc;n H&agrave;n Qu\\u1ed1c cho nh\\u1eefng bu\\u1ed5i \\u0111i ch\\u01a1i, d\\u1ea1o ph\\u1ed1. C&ograve;n nh\\u1eefng c&ocirc;  n&agrave;ng c&ocirc;ng s\\u1edf m&ecirc; phong c&aacute;ch th\\u1eddi trang qu&yacute; t\\u1ed9c th&igrave; sao nh\\u1ec9? T\\u1ea5t nhi&ecirc;n,  b\\u1ea1n kh&ocirc;ng th\\u1ec3 ph\\u1ed1i \\u0111\\u1ed3 theo ki\\u1ec3u r\\u01b0\\u1eddm r&agrave;, nhi\\u1ec1u m&agrave;u s\\u1eafc v&agrave; chi ti\\u1ebft \\u0111\\u1ebfn  n\\u01a1i l&agrave;m vi\\u1ec7c, v&igrave; th\\u1ebf, b\\u1ea1n h&atilde;y c&acirc;n nh\\u1eafc v&agrave; tham kh\\u1ea3o th\\u1eadt k\\u1ef9 nh\\u1eefng b&iacute;  quy\\u1ebft d\\u01b0\\u1edbi \\u0111&acirc;y \\u0111\\u1ec3 t\\u1ea1o cho m&igrave;nh phong c&aacute;ch ri&ecirc;ng t\\u1ea1i c&ocirc;ng s\\u1edf nh&eacute;!<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">&ETH;i\\u1ec7u m&agrave; v\\u1eabn n\\u0103ng \\u0111\\u1ed9ng<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">V\\u1edbi  ph&aacute;i \\u0111\\u1eb9p, v\\u1ebb ngo&agrave;i b&oacute;ng b\\u1ea9y v&agrave; s&agrave;nh \\u0111i\\u1ec7u d\\u01b0\\u1eddng nh\\u01b0 ch\\u01b0a \\u0111\\u1ee7 v&igrave; ai c\\u0169ng  mu\\u1ed1n phong c&aacute;ch c\\u1ee7a m&igrave;nh ph\\u1ea3i th\\u1eadt \\u0111\\u1eb7c bi\\u1ec7t. \\u0110&acirc;y c\\u0169ng l&agrave; mong mu\\u1ed1n c\\u1ee7a  r\\u1ea5t nhi\\u1ec1u ph\\u1ee5 n\\u1eef lu&ocirc;n mu\\u1ed1n m&igrave;nh th\\u1ef1c s\\u1ef1 n\\u1ed5i b\\u1eadt trong m\\u1eaft b\\u1ea1n b&egrave; v&agrave; \\u0111\\u1ed3ng  nghi\\u1ec7p. Hi\\u1ec3u \\u0111\\u01b0\\u1ee3c \\u0111i\\u1ec1u \\u0111&oacute;, c&aacute;c nh&agrave; thi\\u1ebft k\\u1ebf th\\u1eddi trang \\u0111&atilde; th\\u1ed5i c\\u01a1n gi&oacute;  m\\u1edbi mang phong c&aacute;ch ho&agrave;ng gia tr&ecirc;n nh\\u1eefng b\\u1ed9 trang ph\\u1ee5c c&ocirc;ng s\\u1edf d&agrave;nh cho  ph&aacute;i \\u0111\\u1eb9p. B\\u1ea1n s\\u1ebd kh&ocirc;ng lo m&igrave;nh b\\u1ecb &ldquo;l\\u1ea1c m\\u1ed1t&rdquo; d&ugrave; xu\\u1ea5t hi\\u1ec7n \\u1edf b\\u1ea5t c\\u1ee9 n\\u01a1i  \\u0111&acirc;u.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120513\\/vayaothoitrang1311844279_e8bdc.jpg\\" alt=\\"vayaothoitrang1311844279_e8bdc\\" width=\\"360\\" height=\\"537\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Nh\\u1eefng  t&ocirc;ng m&agrave;u ch\\u1ee7 \\u0111\\u1ea1o nh\\u01b0 v&agrave;ng, \\u0111en, tr\\u1eafng v&agrave; pastel ch&iacute;nh l&agrave; t&acirc;m \\u0111i\\u1ec3m cho  xu h\\u01b0\\u1edbng th\\u1eddi trang v&agrave; c\\u0169ng l&agrave; l\\u1ef1a ch\\u1ecdn tuy\\u1ec7t v\\u1eddi cho m&ugrave;a h&egrave; n\\u0103m nay.  Nh\\u1eefng b\\u1ed9 c&aacute;nh \\u0111\\u01b0\\u1ee3c bi\\u1ebfn t\\u1ea5u \\u0111a d\\u1ea1ng c\\u0169ng l&agrave; g\\u1ee3i &yacute; th&uacute; v\\u1ecb \\u0111\\u1ec3 c&aacute;c qu&yacute; c&ocirc;  c&ocirc;ng s\\u1edf ho&agrave;n to&agrave;n c&oacute; th\\u1ec3 t\\u1ef1 tin v&agrave; quy\\u1ebfn r\\u0169 trong m\\u1eaft m\\u1ecdi ng\\u01b0\\u1eddi.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">B\\u1ea1n  c&oacute; th\\u1ec3 kh&eacute;o l&eacute;o l\\u1ef1a ch\\u1ecdn cho m&igrave;nh m\\u1ed9t m\\u1eabu v&aacute;y, &aacute;o th\\u1eadt ph&ugrave; h\\u1ee3p \\u0111\\u1ec3 ng\\u01b0\\u1eddi  \\u0111\\u1ed1i di\\u1ec7n kh&ocirc;ng th\\u1ec3 nh\\u1ea7m l\\u1eabn phong c&aacute;ch c\\u1ee7a b\\u1ea1n v\\u1edbi nh\\u1eefng ki\\u1ec3u c\\u1ee9ng nh\\u1eafc  v&agrave; qu&aacute; c\\u1ed5 \\u0111i\\u1ec3n. Ngo&agrave;i nh\\u1eefng ch\\u1ea5t li\\u1ec7u v\\u1ea3i b&oacute;ng m\\u1ec1m, thun th&igrave; ch\\u1ea5t li\\u1ec7u  pha ren ph\\u1ea7n c\\u1ed5 c\\u0169ng kh&aacute; \\u1ea5n t\\u01b0\\u1ee3ng n\\u1ebfu b\\u1ea1n mu\\u1ed1n khoe kh&eacute;o v&oacute;c d&aacute;ng m\\u1ec1m  m\\u1ea1i v&agrave; g\\u1ee3i c\\u1ea3m c\\u1ee7a m&igrave;nh.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">\\u0110\\u1ec3  l&agrave;m m\\u1edbi s\\u1ef1 xu\\u1ea5t hi\\u1ec7n c\\u1ee7a m&igrave;nh t\\u1ea1i c&ocirc;ng s\\u1edf m\\u1ed7i ng&agrave;y, ngo&agrave;i ch&acirc;n v&aacute;y, b\\u1ea1n  c&oacute; th\\u1ec3 \\u0111i\\u1ec3m th&ecirc;m b\\u1eb1ng nh\\u1eefng thi\\u1ebft k\\u1ebf v&aacute;y li\\u1ec1n, may chi\\u1ebft ly, vai b\\u1ed3ng  &ocirc;m d&aacute;ng thon th\\u1ea3. C&aacute;c \\u0111i\\u1ec3m nh\\u1ea5n tr&ecirc;n th&acirc;n v&aacute;y, nh&igrave;n chung \\u0111\\u1ec1u d\\u1eebng \\u1edf m\\u1ee9c  bi\\u1ebfn t\\u1ea5u v\\u1eeba ph\\u1ea3i, kh&ocirc;ng qu&aacute; r\\u01b0\\u1eddm r&agrave;, m&agrave; v\\u1eabn t&ocirc;n l&ecirc;n n&eacute;t n\\u1eef t&iacute;nh d\\u1ecbu  d&agrave;ng c\\u1ee7a ph&aacute;i \\u0111\\u1eb9p.<\\/span><\\/p>\\r\\n<p style=\\"text-align: right;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Th\\u1ee7y Ki\\u1ec1u<\\/span><\\/strong><\\/p>","introtext":"M\\u1ed9t  m&ugrave;a h&egrave; qu&aacute; nhi\\u1ec1u bi\\u1ebfn \\u0111\\u1ed9ng v\\u1ec1 phong c&aacute;ch th\\u1eddi trang nh\\u01b0 n\\u0103m nay s\\u1ebd  khi\\u1ebfn b\\u1ea1n kh&oacute; l\\u1ef1a ch\\u1ecdn cho m&igrave;nh nh\\u1eefng b\\u1ed9 trang ph\\u1ee5c ho&agrave;n h\\u1ea3o. \\r\\n&ETH;\\u1ec3  kh&ocirc;ng &ldquo;sa \\u0111&agrave;&rdquo; v&agrave;o nh\\u1eefng ki\\u1ec3u d&aacute;ng &ldquo;lo\\u1ea1n&rdquo; chi ti\\u1ebft th\\u01b0\\u1eddng th\\u1ea5y tr&ecirc;n th\\u1ecb  tr\\u01b0\\u1eddng th\\u1eddi trang hi\\u1ec7n nay, b\\u1ea1n h&atilde;y \\u0111\\u1ecbnh h&igrave;nh m\\u1ed9t phong c&aacute;ch cho ri&ecirc;ng  m&igrave;nh nh&eacute;, r\\u1ea5t sang tr\\u1ecdng m&agrave; kh&ocirc;ng h\\u1ec1 gi\\u1ea3m \\u0111\\u1ed9 x&igrave;-tin, \\u0111&oacute; l&agrave; th\\u1eddi trang  c\\u1ee7a nh\\u1eefng c&ocirc; ti\\u1ec3u th\\u01b0 ho&agrave;ng gia th\\u1eddi hi\\u1ec7n \\u0111\\u1ea1i.\\r\\nLan t\\u1ecfa t\\u1eeb m&agrave;n \\u1ea3nh nh\\u1ecf\\r\\nPhong  c&aacute;ch th\\u1eddi trang ho&agrave;ng gia ...","modified":"{\\"1339032291\\":\\"1\\",\\"1339134437\\":\\"1\\"}","metadesc":"M\\u1ed9t m\\u00f9a h\\u00e8 qu\\u00e1 nhi\\u1ec1u bi\\u1ebfn \\u0111\\u1ed9ng v\\u1ec1 phong c\\u00e1ch th\\u1eddi trang nh\\u01b0 n\\u0103m nay s\\u1ebd khi\\u1ebfn b\\u1ea1n kh\\u00f3 l\\u1ef1a ch\\u1ecdn cho m\\u00ecnh nh\\u1eefng b\\u1ed9 trang ph\\u1ee5c ho\\u00e0n h\\u1ea3o. \\u00d0\\u1ec3 ..."}', 1, 1337162825, 0),
(18, 'vi', 14, 2, 1, 0, 0, '3 bí quyết khỏe mạnh và giữ vóc dáng của chị em', '3-bi-quyet-khoe-manh-va-giu-voc-dang-cua-chi-em', '29', '{"introimage":"22","list_suggest":"","fulltext":"<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Trong b&agrave;i vi\\u1ebft n&agrave;y, b\\u1ea1n s\\u1ebd t&igrave;m th\\u1ea5y 3 l\\u1eddi khuy&ecirc;n h\\u1eefu &iacute;ch gi&uacute;p n&acirc;ng cao s\\u1ee9c kh\\u1ecfe v&agrave; gi\\u1eef g&igrave;n v&oacute;c d&aacute;ng cho ph&aacute;i \\u0111\\u1eb9p.<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">B&eacute;o  ph&igrave; \\u0111\\u01b0\\u1ee3c nhanh ch&oacute;ng tr\\u1edf th&agrave;nh v\\u1ea5n \\u0111\\u1ec1 lo l\\u1eafng ph\\u1ed5 bi\\u1ebfn nh\\u1ea5t \\u0111\\u1ed1i v\\u1edbi t\\u1ea5t  c\\u1ea3 m\\u1ecdi ng\\u01b0\\u1eddi tr&ecirc;n th\\u1ebf gi\\u1edbi ch\\u1ee9 kh&ocirc;ng ch\\u1ec9 ri&ecirc;ng g&igrave; v\\u1edbi ch\\u1ecb em, m\\u1eb7c d&ugrave;  theo nghi&ecirc;n c\\u1ee9u th&igrave; ch\\u1ecb em l&agrave; \\u0111\\u1ed1i t\\u01b0\\u1ee3ng d\\u1ec5 b\\u1ecb th\\u1eeba c&acirc;n h\\u01a1n nam gi\\u1edbi.  Th\\u1eeba c&acirc;n c&oacute; th\\u1ec3 g&acirc;y ra r\\u1ea5t nhi\\u1ec1u v\\u1ea5n \\u0111\\u1ec1 s\\u1ee9c kh\\u1ecfe nh\\u01b0 b\\u1ec7nh ti\\u1ec3u \\u0111\\u01b0\\u1eddng v&agrave;  \\u0111au tim. Trong b&agrave;i vi\\u1ebft n&agrave;y, b\\u1ea1n s\\u1ebd t&igrave;m th\\u1ea5y 3 l\\u1eddi khuy&ecirc;n h\\u1eefu &iacute;ch gi&uacute;p  n&acirc;ng cao s\\u1ee9c kh\\u1ecfe v&agrave; gi\\u1eef g&igrave;n v&oacute;c d&aacute;ng cho ph&aacute;i \\u0111\\u1eb9p.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">1. C&aacute;c b&agrave;i t\\u1eadp v\\u1ec1 tr\\u1ecdng l\\u01b0\\u1ee3ng<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">M\\u1ed9t  trong nh\\u1eefng \\u0111i\\u1ec1u k&igrave; di\\u1ec7u l\\u1edbn nh\\u1ea5t ng&agrave;y nay l&agrave; ph\\u1ee5 n\\u1eef c&oacute; th\\u1ec3 ph&aacute;t tri\\u1ec3n  c\\u01a1 b\\u1eafp nh\\u01b0 \\u0111&agrave;n &ocirc;ng n\\u1ebfu h\\u1ecd luy\\u1ec7n t\\u1eadp c&aacute;c b&agrave;i t\\u1eadp li&ecirc;n quan \\u0111\\u1ebfn tr\\u1ecdng  l\\u01b0\\u1ee3ng. Tuy nhi&ecirc;n, s\\u1ef1 th\\u1eadt th&igrave; ng\\u01b0\\u1eddi ph\\u1ee5 n\\u1eef kh&ocirc;ng th\\u1ec3 nh\\u1eadn \\u0111\\u01b0\\u1ee3c c&agrave;ng  nhi\\u1ec1u c\\u01a1 b\\u1eafp v&agrave; c\\u01a1 b\\u1eafp cu\\u1ed3n cu\\u1ed9n nh\\u01b0 nh\\u1eefng ng\\u01b0\\u1eddi \\u0111&agrave;n &ocirc;ng b\\u1edfi v&igrave; c&aacute;c  hormone ch\\u1ecbu tr&aacute;ch nhi\\u1ec7m v\\u1ec1 x&acirc;y d\\u1ef1ng c\\u01a1 b\\u1eafp (testosterone) kh&ocirc;ng c&oacute;  nhi\\u1ec1u \\u0111&aacute;ng k\\u1ec3 trong c\\u01a1 th\\u1ec3 ng\\u01b0\\u1eddi ph\\u1ee5 n\\u1eef.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120429\\/120429afamilykhoemanhavar_c311a.jpg\\" alt=\\"120429afamilykhoemanhavar_c311a\\" width=\\"450\\" height=\\"281\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Nh\\u01b0ng  m\\u1eb7t kh&aacute;c, luy\\u1ec7n t\\u1eadp v\\u1edbi tr\\u1ecdng l\\u01b0\\u1ee3ng l\\u1ea1i gi&uacute;p qu&aacute; tr&igrave;nh trao \\u0111\\u1ed5i ch\\u1ea5t  c\\u1ee7a b\\u1ea1n v&agrave; \\u0111\\u1ed1t ch&aacute;y ch\\u1ea5t b&eacute;o nhi\\u1ec1u ch\\u1ea5t b&eacute;o trong c\\u01a1 th\\u1ec3 h\\u01a1n, \\u0111\\u1ed3ng th\\u1eddi  n&oacute; l\\u1ea1i l&agrave;m cho x\\u01b0\\u01a1ng c\\u1ee7a b\\u1ea1n m\\u1ea1nh m\\u1ebd h\\u01a1n. V\\u1eady n&ecirc;n, c&oacute; th\\u1ec3 n&oacute;i, nh\\u1eefng b&agrave;i  luy\\u1ec7n t\\u1eadp v\\u1ec1 tr\\u1ecdng l\\u01b0\\u1ee3ng l&agrave; r\\u1ea5t h\\u1eefu &iacute;ch. B\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp v\\u1edbi b&agrave;i t\\u1eadp  n&acirc;ng t\\u1ea1 \\u1edf m\\u1ee9c v\\u1eeba ph\\u1ea3i ho\\u1eb7c \\u0111\\u1ea9y v\\u1eadt n\\u1eb7ng.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">2. L\\u01b0u &yacute; v\\u1ec1 canxi<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Sau  35 tu\\u1ed5i, ng\\u01b0\\u1eddi ph\\u1ee5 n\\u1eef c&oacute; th\\u1ec3 ph\\u1ea3i \\u0111\\u1ed1i m\\u1eb7t v\\u1edbi m\\u1ed9t s\\u1ed1 suy tho&aacute;i v\\u1ec1 x\\u01b0\\u01a1ng  nghi&ecirc;m tr\\u1ecdng v&agrave; c\\u0169ng c&oacute; th\\u1ec3 g&acirc;y ra r\\u1ea5t nhi\\u1ec1u \\u0111au \\u0111\\u1edbn v&agrave; gi\\u1ea3m s&uacute;t v\\u1ec1  chi\\u1ec1u cao. C&aacute;c b&aacute;c s\\u0129 khuy&ecirc;n r\\u1eb1ng ph\\u1ee5 n\\u1eef tr\\u01b0\\u1edfng th&agrave;nh ph\\u1ea3i c\\u1ea7n &iacute;t nh\\u1ea5t  l&agrave; 1000 \\u0111\\u1ebfn 1300 mg canxi m\\u1ed7i ng&agrave;y \\u0111\\u1ec3 gi\\u1eef cho x\\u01b0\\u01a1ng m\\u1ea1nh m\\u1ebd v&agrave; kh\\u1ecfe  m\\u1ea1nh. \\u0110i\\u1ec1u r\\u1ea5t quan tr\\u1ecdng l&agrave; b\\u1ea1n c\\u1ea7n u\\u1ed1ng s\\u1eefa m\\u1ed7i ng&agrave;y \\u0111\\u1ec3 th\\u1ef1c hi\\u1ec7n nhu  c\\u1ea7u canxi c\\u1ee7a m&igrave;nh, v\\u1edbi 250 ml s\\u1eefa ch\\u1ee9a kho\\u1ea3ng 300 mg canxi. C&aacute;c lo\\u1ea1i  th\\u1ef1c ph\\u1ea9m gi&agrave;u canxi kh&aacute;c bao g\\u1ed3m ph&ocirc; mai, s\\u1eefa chua, h\\u1ea1nh nh&acirc;n v&agrave; c&aacute;...  c\\u0169ng r\\u1ea5t t\\u1ed1t cho s\\u1ee9c kh\\u1ecfe.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120429\\/120429afamilykhoemanh_6c58f.jpg\\" alt=\\"120429afamilykhoemanh_6c58f\\" width=\\"450\\" height=\\"435\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">3. \\u0110\\u1eebng s\\u1ee3 b&eacute;o<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">M\\u1ed9t  quan ni\\u1ec7m sai l\\u1ea7m kh&aacute;c trong s\\u1ed1 h&agrave;ng lo\\u1ea1t nh\\u1eefng sai l\\u1ea7m c\\u1ee7a ch\\u1ecb em l&agrave;  n&ecirc;n tr&aacute;nh ho&agrave;n to&agrave;n ch\\u1ea5t b&eacute;o \\u0111\\u1ec3 lu&ocirc;n kh\\u1ecfe m\\u1ea1nh. Tuy nhi&ecirc;n, s\\u1ef1 th\\u1eadt l&agrave; c\\u01a1  th\\u1ec3 c\\u1ee7a ch&uacute;ng ta c\\u1ea7n m\\u1ed9t s\\u1ed1 ch\\u1ea5t b&eacute;o l&agrave;nh m\\u1ea1nh \\u0111\\u1ec3 duy tr&igrave; cho ho\\u1ea1t \\u0111\\u1ed9ng  c\\u1ee7a c\\u01a1 th\\u1ec3 \\u0111\\u01b0\\u1ee3c \\u0111&uacute;ng ch\\u1ee9c n\\u0103ng c\\u1ee7a n&oacute;. Ch\\u1ea5t b&eacute;o gi&uacute;p trong vi\\u1ec7c s\\u1ea3n  xu\\u1ea5t k&iacute;ch th&iacute;ch t\\u1ed1 quan tr\\u1ecdng kh&aacute;c nhau cho c\\u01a1 th\\u1ec3. H\\u01a1n n\\u1eefa, ch\\u1ea5t b&eacute;o  c\\u0169ng cung c\\u1ea5p \\u0111\\u1ec7m cho kh\\u1edbp v&agrave; ng\\u0103n ng\\u1eeba c&aacute;c kh\\u1edbp \\u0111au.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">M\\u1eb7c  d&ugrave; ch\\u1ea5t b&eacute;o quan tr\\u1ecdng cho c\\u01a1 th\\u1ec3 c\\u1ee7a ch&uacute;ng ta nh\\u01b0ng b\\u1ea1n c\\u1ea7n ph\\u1ea3i ch\\u1eafc  ch\\u1eafn r\\u1eb1ng l\\u01b0\\u1ee3ng ch\\u1ea5t b&eacute;o ti&ecirc;u th\\u1ee5 n&ecirc;n bao g\\u1ed3m c&aacute;c ngu\\u1ed3n t\\u1ef1 nhi&ecirc;n nh\\u01b0 c&aacute;,  d\\u1ea7u &ocirc; liu v&agrave; c&aacute;c lo\\u1ea1i h\\u1ea1t. N&ecirc;n tr&aacute;nh th\\u1ee9c \\u0103n v\\u1eb7t v&igrave; ch&uacute;ng c&oacute; ch\\u1ee9a ch\\u1ea5t  b&eacute;o trans c\\u1ef1c k\\u1ef3 kh&ocirc;ng l&agrave;nh m\\u1ea1nh cho s\\u1ee9c kh\\u1ecfe.<\\/span><\\/p>\\r\\n<p style=\\"text-align: right;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Theo afamily<\\/span><\\/strong><\\/p>","introtext":"Trong b&agrave;i vi\\u1ebft n&agrave;y, b\\u1ea1n s\\u1ebd t&igrave;m th\\u1ea5y 3 l\\u1eddi khuy&ecirc;n h\\u1eefu &iacute;ch gi&uacute;p n&acirc;ng cao s\\u1ee9c kh\\u1ecfe v&agrave; gi\\u1eef g&igrave;n v&oacute;c d&aacute;ng cho ph&aacute;i \\u0111\\u1eb9p.\\r\\nB&eacute;o  ph&igrave; \\u0111\\u01b0\\u1ee3c nhanh ch&oacute;ng tr\\u1edf th&agrave;nh v\\u1ea5n \\u0111\\u1ec1 lo l\\u1eafng ph\\u1ed5 bi\\u1ebfn nh\\u1ea5t \\u0111\\u1ed1i v\\u1edbi t\\u1ea5t  c\\u1ea3 m\\u1ecdi ng\\u01b0\\u1eddi tr&ecirc;n th\\u1ebf gi\\u1edbi ch\\u1ee9 kh&ocirc;ng ch\\u1ec9 ri&ecirc;ng g&igrave; v\\u1edbi ch\\u1ecb em, m\\u1eb7c d&ugrave;  theo nghi&ecirc;n c\\u1ee9u th&igrave; ch\\u1ecb em l&agrave; \\u0111\\u1ed1i t\\u01b0\\u1ee3ng d\\u1ec5 b\\u1ecb th\\u1eeba c&acirc;n h\\u01a1n nam gi\\u1edbi.  Th\\u1eeba c&acirc;n c&oacute; th\\u1ec3 g&acirc;y ra r\\u1ea5t nhi\\u1ec1u v\\u1ea5n \\u0111\\u1ec1 s\\u1ee9c kh\\u1ecfe nh\\u01b0 b\\u1ec7nh ti\\u1ec3u \\u0111\\u01b0\\u1eddng v&agrave;  \\u0111au tim. Trong b&agrave;i ...","modified":"{\\"1338622059\\":\\"1\\",\\"1338622088\\":\\"1\\",\\"1339032277\\":\\"1\\"}","metadesc":"Trong b\\u00e0i vi\\u1ebft n\\u00e0y, b\\u1ea1n s\\u1ebd t\\u00ecm th\\u1ea5y 3 l\\u1eddi khuy\\u00ean h\\u1eefu \\u00edch gi\\u00fap n\\u00e2ng cao s\\u1ee9c kh\\u1ecfe v\\u00e0 gi\\u1eef g\\u00ecn v\\u00f3c d\\u00e1ng cho ph\\u00e1i \\u0111\\u1eb9p. B\\u00e9o ph\\u00ec \\u0111\\u01b0\\u1ee3c nhanh ..."}', 1, 1337162888, 2),
(19, 'vi', 11, 2, 1, 0, 0, 'Trà kinh giới giải độc cơ thể mùa nóng', 'tra-kinh-gioi-giai-doc-co-the-mua-nong', '29', '{"introimage":"23","list_suggest":"","fulltext":"<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">C&acirc;y kinh gi\\u1edbi c&oacute; th\\u1ec3 d&ugrave;ng \\u0111\\u1ec3 pha th&agrave;nh tr&agrave;, u\\u1ed1ng v\\u1eeba th\\u01a1m l\\u1ea1i c&oacute; nhi\\u1ec1u t&aacute;c d\\u1ee5ng h\\u1eefu hi\\u1ec7u cho s\\u1ee9c s\\u1ee9c kh\\u1ecfe.<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">C&acirc;y  kinh gi\\u1edbi (Origanum majorana) c&oacute; ngu\\u1ed3n g\\u1ed1c \\u1edf khu v\\u1ef1c \\u0110\\u1ecba Trung H\\u1ea3i. \\u0110&acirc;y  l&agrave; m\\u1ed9t lo\\u1ea1i th\\u1ea3o d\\u01b0\\u1ee3c th\\u01a1m, t\\u01b0\\u1ee3ng tr\\u01b0ng cho h\\u1ea1nh ph&uacute;c c\\u1ee7a nh\\u1eefng ng\\u01b0\\u1eddi  La M&atilde; c\\u1ed5 \\u0111\\u1ea1i. C&acirc;y kinh gi\\u1edbi \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng r\\u1ea5t nhi\\u1ec1u trong \\u1ea9m th\\u1ef1c nh\\u1edd v&agrave;o  m&ugrave;i h\\u01b0\\u01a1ng nh\\u1eb9 nh&agrave;ng c\\u1ee7a n&oacute;. Ngo&agrave;i ra, c&acirc;y kinh gi\\u1edbi c\\u0169ng \\u0111\\u01b0\\u1ee3c \\u0111&aacute;nh gi&aacute;  cao v\\u1ec1 nh\\u1eefng l\\u1ee3i &iacute;ch y h\\u1ecdc c\\u1ee7a n&oacute;.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">C&acirc;y kinh gi\\u1edbi c&oacute; th\\u1ec3 d&ugrave;ng \\u0111\\u1ec3 pha th&agrave;nh tr&agrave;, u\\u1ed1ng v\\u1eeba th\\u01a1m l\\u1ea1i c&oacute; nhi\\u1ec1u t&aacute;c d\\u1ee5ng h\\u1eefu hi\\u1ec7u cho s\\u1ee9c kh\\u1ecfe.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">C&aacute;ch th\\u1ee9c pha tr&agrave; kinh gi\\u1edbi<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">-  Th&ecirc;m m\\u1ed9t mu\\u1ed7ng c&agrave; ph&ecirc; \\u0111\\u1ea7y c&aacute;c lo\\u1ea1i th\\u1ea3o d\\u01b0\\u1ee3c kinh gi\\u1edbi v&agrave;o n\\u01b0\\u1edbc l\\u1ea1nh.  Sau \\u0111&oacute; \\u0111un s&ocirc;i l&ecirc;n. Sau khi s&ocirc;i, gi\\u1ea3m nhi\\u1ec7t v&agrave; \\u0111\\u1ec3 cho n&oacute; h\\u01a1i s&ocirc;i trong  kho\\u1ea3ng 15 ph&uacute;t.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">-  L\\u1ecdc ch\\u1ea5t l\\u1ecfng n&agrave;y v&agrave;o m\\u1ed9t t&aacute;ch v&agrave; pha th&ecirc;m m\\u1ed9t ch&uacute;t m\\u1eadt ong cho c&oacute; v\\u1ecb  ng\\u1ecdt, tr&aacute;nh s\\u1eed d\\u1ee5ng \\u0111\\u01b0\\u1eddng n\\u1ebfu b\\u1ea1n kh&ocirc;ng mu\\u1ed1n t\\u0103ng c&acirc;n qu&aacute; nhanh.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- C&oacute; th\\u1ec3 th&ecirc;m m\\u1ed9t ch&uacute;t n\\u01b0\\u1edbc chanh s\\u1ebd t\\u0103ng c\\u01b0\\u1eddng h\\u01b0\\u01a1ng v\\u1ecb. L&yacute; t\\u01b0\\u1edfng nh\\u1ea5t, b\\u1ea1n c&oacute; th\\u1ec3 u\\u1ed1ng ba t&aacute;ch tr&agrave; kinh gi\\u1edbi trong m\\u1ed9t ng&agrave;y.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Gi&aacute; tr\\u1ecb dinh d\\u01b0\\u1ee1ng c\\u1ee7a tr&agrave; kinh gi\\u1edbi<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">C&aacute;c ch\\u1ea5t dinh d\\u01b0\\u1ee1ng trong tr&agrave; kinh gi\\u1edbi bao g\\u1ed3m tinh d\\u1ea7u v&agrave; axit.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- \\u0110&oacute; l&agrave; m\\u1ed9t ngu\\u1ed3n vitamin A, B3, B6, C, D v&agrave; K, c&ugrave;ng v\\u1edbi k\\u1ebdm, canxi, rosmarinic, oleic, tannin, nicotinic acid ursolic.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- Tinh d\\u1ea7u kinh gi\\u1edbi bao g\\u1ed3m terpinen, tecpineol, carvacrol v&agrave; sistosterine beta.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- Kinh gi\\u1edbi c&oacute; ch\\u1ee9a ch\\u1ea5t flavonoid c&oacute; t&iacute;nh kh&aacute;ng vi&ecirc;m, c&oacute; vai tr&ograve; nh\\u01b0 l&agrave; m\\u1ed9t thu\\u1ed1c an th\\u1ea7n nh\\u1eb9.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120513\\/1336558321-trakinhgioi4-suckhoe.eva.jpg\\" alt=\\"1336558321-trakinhgioi4-suckhoe.eva\\" width=\\"450\\" height=\\"338\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-family: verdana,geneva; font-size: 8pt;\\">Kinh gi\\u1edbi c&oacute; ch\\u1ee9a ch\\u1ea5t flavonoid c&oacute; t&iacute;nh kh&aacute;ng vi&ecirc;m, c&oacute; vai tr&ograve; nh\\u01b0 l&agrave; m\\u1ed9t thu\\u1ed1c an th\\u1ea7n nh\\u1eb9.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- Kinh gi\\u1edbi l&agrave; m\\u1ed9t ch\\u1ea5t kh\\u1eed tr&ugrave;ng t\\u1ef1 nhi&ecirc;n v&agrave; c&oacute; \\u0111\\u1eb7c t&iacute;nh kh&aacute;ng khu\\u1ea9n, kh&aacute;ng virus v&agrave; kh&aacute;ng n\\u1ea5m.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- Kinh gi\\u1edbi gi&agrave;u kho&aacute;ng ch\\u1ea5t nh\\u01b0 kali, mangan, \\u0111\\u1ed3ng, s\\u1eaft v&agrave; ph\\u1ed1t pho.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- M\\u1ed9t l\\u1ee3i th\\u1ebf n\\u1eefa l&agrave; kinh gi\\u1edbi c&oacute; ch\\u1ee9a h&agrave;m l\\u01b0\\u1ee3ng r\\u1ea5t th\\u1ea5p c&aacute;c ch\\u1ea5t b&eacute;o b&atilde;o h&ograve;a v&agrave; natri.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">L\\u1ee3i &iacute;ch c\\u1ee7a tr&agrave; kinh gi\\u1edbi<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">-  Tr&agrave; kinh gi\\u1edbi gi&uacute;p gi\\u1ea3m c&aacute;c tri\\u1ec7u ch\\u1ee9ng c\\u1ee7a c&aacute;c v\\u1ea5n \\u0111\\u1ec1 h&ocirc; h\\u1ea5p, ho khan,  vi&ecirc;m ph\\u1ebf qu\\u1ea3n, c\\u1ea3m l\\u1ea1nh v&agrave; vi&ecirc;m xoang. Lo\\u1ea1i tr&agrave; n&agrave;y r\\u1ea5t tuy\\u1ec7t v\\u1eddi cho  c&aacute;c b\\u1ec7nh nh&acirc;n hen suy\\u1ec5n.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- Tr&agrave; kinh gi\\u1edbi th&uacute;c \\u0111\\u1ea9y s\\u1ee9c kh\\u1ecfe tim m\\u1ea1ch, c\\u1ea3i thi\\u1ec7n l\\u01b0u l\\u01b0\\u1ee3ng m&aacute;u \\u0111\\u1ebfn tim, v&agrave; l&agrave;m gi\\u1ea3m cholesterol x\\u1ea5u trong c\\u01a1 th\\u1ec3.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">-  Tr&agrave; kinh gi\\u1edbi c&ograve;n t\\u1ed1t cho ti&ecirc;u h&oacute;a: N&oacute; l&agrave;m gi\\u1ea3m nh\\u1eefng c\\u01a1n bu\\u1ed3n n&ocirc;n v&agrave;  \\u0111\\u1ea7y h\\u01a1i, k&iacute;ch th&iacute;ch s\\u1ef1 th&egrave;m \\u0103n v&agrave; h\\u1ed7 tr\\u1ee3 ti&ecirc;u h&oacute;a. Ti&ecirc;u th\\u1ee5 tr&agrave; kinh  gi\\u1edbi trong m\\u1ed9t th\\u1eddi gian d&agrave;i c&ograve;n gi&uacute;p \\u0111\\u1ed1i ph&oacute; v\\u1edbi ch\\u1ee9ng r\\u1ed1i lo\\u1ea1n \\u0103n  u\\u1ed1ng.<\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120513\\/1336558233-trakinhgioi-suckhoe.eva.jpg\\" alt=\\"1336558233-trakinhgioi-suckhoe.eva\\" width=\\"500\\" height=\\"671\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-family: verdana,geneva; font-size: 8pt;\\">Tr&agrave; kinh gi\\u1edbi lo\\u1ea1i b\\u1ecf \\u0111\\u1ed9c t\\u1ed1 kh\\u1ecfi c\\u01a1 th\\u1ec3.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">-  Tr&agrave; kinh gi\\u1edbi gi&uacute;p gi\\u1ea3m \\u0111au: Nh\\u1edd t&iacute;nh ch\\u1ea5t ch\\u1ed1ng vi&ecirc;m m&agrave; tr&agrave; kinh gi\\u1edbi  c&oacute; th\\u1ec3 l&agrave;m gi\\u1ea3m r\\u1ea5t nhi\\u1ec1u \\u0111au nh\\u1ee9c nh\\u01b0 \\u0111au r\\u0103ng, \\u0111au \\u0111\\u1ea7u, vi&ecirc;m kh\\u1edbp,  kinh nguy\\u1ec7t b\\u1ecb chu\\u1ed9t r&uacute;t...<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">-  Tr&agrave; kinh gi\\u1edbi lo\\u1ea1i b\\u1ecf \\u0111\\u1ed9c t\\u1ed1 kh\\u1ecfi c\\u01a1 th\\u1ec3: Tr&agrave; kinh gi\\u1edbi k&iacute;ch th&iacute;ch \\u0111\\u1ed5  m\\u1ed3 h&ocirc;i v&agrave; gi&uacute;p lo\\u1ea1i b\\u1ecf \\u0111\\u1ed9c t\\u1ed1 th&ocirc;ng qua m\\u1ed3 h&ocirc;i, v&agrave; do \\u0111&oacute; r\\u1ea5t t\\u1ed1t cho  nh\\u1eefng ng\\u01b0\\u1eddi th\\u01b0\\u1eddng xuy&ecirc;n b\\u1ecb c&uacute;m.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">-  Tr&agrave; kinh gi\\u1edbi l&agrave;m d\\u1ecbu c\\u01a1 th\\u1ec3 v&agrave; t&acirc;m tr&iacute;: N&oacute; l&agrave;m d\\u1ecbu th\\u1ea7n kinh v&agrave; l&agrave;m  d\\u1ecbu ch\\u1ee9ng \\u0111au n\\u1eeda \\u0111\\u1ea7u. \\u0110i\\u1ec1u n&agrave;y c\\u0169ng hi\\u1ec7u qu\\u1ea3 trong vi\\u1ec7c l&agrave;m gi\\u1ea3m ch\\u1ee9ng  m\\u1ea5t ng\\u1ee7.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Tuy  nhi&ecirc;n, c\\u0169ng nh\\u01b0 b\\u1ea5t k&igrave; loai th\\u1ea3o d\\u01b0\\u1ee3c n&agrave;o, ng\\u01b0\\u1eddi ta v\\u1eabn c\\u1ea7n h\\u1ebft s\\u1ee9c  th\\u1eadn tr\\u1ecdng khi ti&ecirc;u th\\u1ee5. C&aacute;c r\\u1ee7i ro r\\u1ea5t c&oacute; kh\\u1ea3 n\\u0103ng x\\u1ea3y ra n\\u1ebfu ti&ecirc;u th\\u1ee5  qu&aacute; m\\u1ee9c ho\\u1eb7c l&agrave; c\\u01a1 th\\u1ec3 c&oacute; ph\\u1ea3n \\u1ee9ng v\\u1edbi b\\u1ea5t k&igrave; ch\\u1ea5t n&agrave;o trong tr&agrave; kinh  gi\\u1edbi. \\u0110&acirc;y l&agrave; l&yacute; do t\\u1ea1i sao b\\u1ea1n n&ecirc;n h\\u1ecfi &yacute; ki\\u1ebfn b&aacute;c s\\u0129 c\\u1ee7a m&igrave;nh tr\\u01b0\\u1edbc khi  s\\u1eed d\\u1ee5ng ho\\u1eb7c khi c&oacute; d\\u1ea5u hi\\u1ec7u l\\u1ea1 trong l&uacute;c s\\u1eed d\\u1ee5ng. N\\u1ebfu kh&ocirc;ng c&oacute; v\\u1ea5n \\u0111\\u1ec1  g&igrave; \\u0111\\u1eb7c bi\\u1ec7t th&igrave; s\\u1eed d\\u1ee5ng c&aacute;c lo\\u1ea1i th\\u1ea3o d\\u01b0\\u1ee3c kinh gi\\u1edbi theo \\u0111&uacute;ng t\\u1ef7 l\\u1ec7 v&agrave;  h\\u01b0\\u1edbng d\\u1eabn c&oacute; th\\u1ec3 c&oacute; l\\u1ee3i cho b\\u1ea1n r\\u1ea5t nhi\\u1ec1u.<\\/span><\\/p>\\r\\n<p style=\\"text-align: right;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Theo Eva<\\/span><\\/strong><\\/p>","introtext":"C&acirc;y kinh gi\\u1edbi c&oacute; th\\u1ec3 d&ugrave;ng \\u0111\\u1ec3 pha th&agrave;nh tr&agrave;, u\\u1ed1ng v\\u1eeba th\\u01a1m l\\u1ea1i c&oacute; nhi\\u1ec1u t&aacute;c d\\u1ee5ng h\\u1eefu hi\\u1ec7u cho s\\u1ee9c s\\u1ee9c kh\\u1ecfe.\\r\\nC&acirc;y  kinh gi\\u1edbi (Origanum majorana) c&oacute; ngu\\u1ed3n g\\u1ed1c \\u1edf khu v\\u1ef1c \\u0110\\u1ecba Trung H\\u1ea3i. \\u0110&acirc;y  l&agrave; m\\u1ed9t lo\\u1ea1i th\\u1ea3o d\\u01b0\\u1ee3c th\\u01a1m, t\\u01b0\\u1ee3ng tr\\u01b0ng cho h\\u1ea1nh ph&uacute;c c\\u1ee7a nh\\u1eefng ng\\u01b0\\u1eddi  La M&atilde; c\\u1ed5 \\u0111\\u1ea1i. C&acirc;y kinh gi\\u1edbi \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng r\\u1ea5t nhi\\u1ec1u trong \\u1ea9m th\\u1ef1c nh\\u1edd v&agrave;o  m&ugrave;i h\\u01b0\\u01a1ng nh\\u1eb9 nh&agrave;ng c\\u1ee7a n&oacute;. Ngo&agrave;i ra, c&acirc;y kinh gi\\u1edbi c\\u0169ng \\u0111\\u01b0\\u1ee3c \\u0111&aacute;nh gi&aacute;  cao v\\u1ec1 nh\\u1eefng l\\u1ee3i &iacute;ch y h\\u1ecdc c\\u1ee7a n&oacute;.\\r\\nC&acirc;y kinh gi\\u1edbi ...","modified":"{\\"1339032266\\":\\"1\\"}","metadesc":"C\\u00e2y kinh gi\\u1edbi c\\u00f3 th\\u1ec3 d\\u00f9ng \\u0111\\u1ec3 pha th\\u00e0nh tr\\u00e0, u\\u1ed1ng v\\u1eeba th\\u01a1m l\\u1ea1i c\\u00f3 nhi\\u1ec1u t\\u00e1c d\\u1ee5ng h\\u1eefu hi\\u1ec7u cho s\\u1ee9c s\\u1ee9c kh\\u1ecfe. C\\u00e2y kinh gi\\u1edbi (Origanum majorana) c\\u00f3 ..."}', 1, 1337162928, 0),
(20, 'vi', 11, 2, 1, 0, 0, 'Những thói quen khiến "bụng phệ"', 'nhung-thoi-quen-khien-bung-phe', '2', '{"introimage":"24","list_suggest":"9,8","fulltext":"<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">D\\u01b0\\u1edbi  \\u0111&acirc;y l&agrave; 5 th&oacute;i quen khi\\u1ebfn v&ograve;ng b\\u1ee5ng c\\u1ee7a b\\u1ea1n ng&agrave;y c&agrave;ng to ra, \\u0111\\u01b0\\u1ee3c c&aacute;c  chuy&ecirc;n gia dinh d\\u01b0\\u1ee1ng c\\u1ee7a \\u1ea4n \\u0110\\u1ed9 khuy\\u1ebfn c&aacute;o tr&ecirc;n t\\u1edd Times of India:<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120513\\/120511afamilyskbungphe_b5b2a.jpg\\" alt=\\"120511afamilyskbungphe_b5b2a\\" width=\\"500\\" height=\\"332\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">B\\u1ecf  b\\u1eefa: Chuy&ecirc;n gia dinh d\\u01b0\\u1ee1ng Jivesh Shetty chia s\\u1ebb, ch&uacute;ng ta c&oacute; khuynh  h\\u01b0\\u1edbng \\u0103n nhi\\u1ec1u h\\u01a1n sau m\\u1ed7i l\\u1ea7n b\\u1ecf b\\u1eefa. V&igrave; v\\u1eady, vi\\u1ec7c chia nh\\u1ecf b\\u1eefa \\u0103n m\\u1ed7i  2-3 gi\\u1edd s\\u1ebd gi&uacute;p ch&uacute;ng ta kh&ocirc;ng c\\u1ea3m th\\u1ea5y \\u0111&oacute;i v&agrave; kh&ocirc;ng \\u0103n \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u h\\u01a1n.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Ch&egrave;  ch&eacute;n: Theo chuy&ecirc;n gia dinh d\\u01b0\\u1ee1ng Namita Nanal, ch\\u1ea5t c\\u1ed3n ch\\u1ee9a nhi\\u1ec1u  calorie v&agrave; th\\u01b0\\u1eddng th&igrave; b\\u1ea1n s\\u1ebd c\\u1ea3m th\\u1ea5y \\u0111&oacute;i h\\u01a1n sau khi nh\\u1eadu.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">D&ugrave;ng  c&aacute;c s\\u1ea3n ph\\u1ea9m \\u0103n ki&ecirc;ng: Ti&ecirc;u th\\u1ee5 k\\u1eb9o kh&ocirc;ng \\u0111\\u01b0\\u1eddng, s\\u1eefa chua, th\\u1ee9c \\u0103n v\\u1eb7t  &iacute;t b&eacute;o ho\\u1eb7c n\\u01b0\\u1edbc u\\u1ed1ng d&agrave;nh cho ng\\u01b0\\u1eddi \\u0103n ki&ecirc;ng kh&ocirc;ng gi&uacute;p ch&uacute;ng ta duy  tr&igrave; tr\\u1ecdng l\\u01b0\\u1ee3ng v\\u1ec1 l&acirc;u d&agrave;i. Nh\\u1eefng ch\\u1ea5t ng\\u1ecdt nh&acirc;n t\\u1ea1o khi\\u1ebfn c\\u01a1 th\\u1ec3 t&iacute;ch  tr\\u1eef nhi\\u1ec1u ch\\u1ea5t b&eacute;o h\\u01a1n.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Kh&ocirc;ng  \\u0103n b&aacute;nh m&igrave;: B&aacute;nh m&igrave; l&agrave;m b\\u1eb1ng ng\\u0169 c\\u1ed1c gi&uacute;p l\\u01b0\\u1ee3ng insulin trong c\\u01a1 th\\u1ec3  t\\u0103ng v&agrave; gi\\u1ea3m c\\u01a1 h\\u1ed9i cho vi\\u1ec7c t&iacute;ch tr\\u1eef ch\\u1ea5t b&eacute;o \\u1edf v&ograve;ng b\\u1ee5ng.<\\/span><br \\/><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Kh&ocirc;ng  \\u0103n th\\u1ef1c ph\\u1ea9m ch\\u1ee9a nhi\\u1ec1u ch\\u1ea5t b&eacute;o: Kh&ocirc;ng ph\\u1ea3i m\\u1ecdi lo\\u1ea1i ch\\u1ea5t b&eacute;o \\u0111\\u1ec1u b\\u1ea5t  l\\u1ee3i. Nh\\u1eefng lo\\u1ea1i ch\\u1ea5t b&eacute;o t\\u1eeb qu\\u1ea3 l&ecirc; t&agrave;u, b&aacute;nh sandwich, salad, d\\u1ea7u &ocirc; liu,  d\\u1ea7u h\\u01b0\\u1edbng d\\u01b0\\u01a1ng, \\u0111\\u1eadu ph\\u1ed9ng r\\u1ea5t c\\u1ea7n thi\\u1ebft cho c\\u01a1 th\\u1ec3.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Tr&aacute;nh xa m\\u1ecdi lo\\u1ea1i ch\\u1ea5t b&eacute;o s\\u1ebd kh&ocirc;ng c&oacute; l\\u1ee3i cho c\\u01a1 th\\u1ec3 ch&uacute;ng ta.<\\/span><\\/p>\\r\\n<p style=\\"text-align: right;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Theo Thanhnien<\\/span><\\/strong><\\/p>","introtext":"D\\u01b0\\u1edbi  \\u0111&acirc;y l&agrave; 5 th&oacute;i quen khi\\u1ebfn v&ograve;ng b\\u1ee5ng c\\u1ee7a b\\u1ea1n ng&agrave;y c&agrave;ng to ra, \\u0111\\u01b0\\u1ee3c c&aacute;c  chuy&ecirc;n gia dinh d\\u01b0\\u1ee1ng c\\u1ee7a \\u1ea4n \\u0110\\u1ed9 khuy\\u1ebfn c&aacute;o tr&ecirc;n t\\u1edd Times of India:\\r\\n\\r\\nB\\u1ecf  b\\u1eefa: Chuy&ecirc;n gia dinh d\\u01b0\\u1ee1ng Jivesh Shetty chia s\\u1ebb, ch&uacute;ng ta c&oacute; khuynh  h\\u01b0\\u1edbng \\u0103n nhi\\u1ec1u h\\u01a1n sau m\\u1ed7i l\\u1ea7n b\\u1ecf b\\u1eefa. V&igrave; v\\u1eady, vi\\u1ec7c chia nh\\u1ecf b\\u1eefa \\u0103n m\\u1ed7i  2-3 gi\\u1edd s\\u1ebd gi&uacute;p ch&uacute;ng ta kh&ocirc;ng c\\u1ea3m th\\u1ea5y \\u0111&oacute;i v&agrave; kh&ocirc;ng \\u0103n \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u h\\u01a1n.\\r\\nCh&egrave;  ch&eacute;n: Theo chuy&ecirc;n gia dinh d\\u01b0\\u1ee1ng Namita Nanal, ch\\u1ea5t c\\u1ed3n ch\\u1ee9a nhi\\u1ec1u  calorie v&agrave; th\\u01b0\\u1eddng th&igrave; ...","modified":"{\\"1339032252\\":\\"1\\",\\"1339055789\\":\\"1\\",\\"1339154825\\":\\"1\\",\\"1339154832\\":\\"1\\",\\"1339154871\\":\\"1\\"}","metadesc":"D\\u01b0\\u1edbi \\u0111\\u00e2y l\\u00e0 5 th\\u00f3i quen khi\\u1ebfn v\\u00f2ng b\\u1ee5ng c\\u1ee7a b\\u1ea1n ng\\u00e0y c\\u00e0ng to ra, \\u0111\\u01b0\\u1ee3c c\\u00e1c chuy\\u00ean gia dinh d\\u01b0\\u1ee1ng c\\u1ee7a \\u1ea4n \\u0110\\u1ed9 khuy\\u1ebfn c\\u00e1o tr\\u00ean t\\u1edd Times of ..."}', 1, 1337163012, 2);
INSERT INTO `tbl_article` (`id`, `lang`, `catid`, `type`, `status`, `special`, `order_view`, `title`, `alias`, `keyword`, `other`, `created_by`, `created_date`, `visits`) VALUES
(21, 'vi', 14, 2, 0, 0, 0, 'Cách tập thể dục đơn giản tại nhà', 'danh-muc-32-cach-tap-the-duc-don-gian-tai-nha', '29', '{"introimage":"25","list_suggest":"","fulltext":"<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">M\\u1ed9t s\\u1ed1 t\\u1eadp luy\\u1ec7n c&oacute; th\\u1ec3 d\\u1ec5 d&agrave;ng \\u0111\\u01b0\\u1ee3c th\\u1ef1c hi\\u1ec7n m\\u1ed9t c&aacute;ch tho\\u1ea3i m&aacute;i t\\u1ea1i ph&ograve;ng kh&aacute;ch c\\u1ee7a b\\u1ea1n.<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">B\\u1ea1n  c&oacute; th\\u1ec3 tho\\u1ea3i m&aacute;i t\\u1eadp luy\\u1ec7n v\\u1edbi s\\u1ef1 thu\\u1eadn ti\\u1ec7n v&agrave; kh&ocirc;ng kh&iacute; tho\\u1ea3i m&aacute;i.  B\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp luy\\u1ec7n m\\u1ed9t m&igrave;nh ho\\u1eb7c r\\u1ee7 th&ecirc;m b\\u1ea1n \\u0111\\u1ebfn t\\u1eadp c&ugrave;ng nh\\u01b0ng ph\\u1ea3i  t\\u01b0 v\\u1ea5n b&aacute;c s\\u0129 c\\u1ee7a b\\u1ea1n tr\\u01b0\\u1edbc khi b\\u1eaft \\u0111\\u1ea7u m\\u1ed9t ch\\u01b0\\u01a1ng tr&igrave;nh t\\u1eadp th\\u1ec3 d\\u1ee5c  m\\u1edbi. D\\u01b0\\u1edbi \\u0111&acirc;y l&agrave; m\\u1ed9t v&agrave;i \\u0111i\\u1ec1u \\u0111\\u01a1n gi\\u1ea3n b\\u1ea1n c&oacute; th\\u1ec3 l&agrave;m.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Leo b\\u1eadc thang<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">N\\u1ebfu  nh&agrave; b\\u1ea1n \\u1edf c&oacute; c\\u1ea7u thang, b\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp luy\\u1ec7n ch\\u1ec9 \\u0111\\u01a1n gi\\u1ea3n b\\u1eb1ng c&aacute;ch leo  c\\u1ea7u thang. \\u0110\\u1ec3 b\\u1eaft \\u0111\\u1ea7u, b\\u01b0\\u1edbc l&ecirc;n c\\u1ea7u thang \\u0111\\u1ea7u ti&ecirc;n, v&agrave; sau \\u0111&oacute; quay tr\\u1edf  l\\u1ea1i. L\\u1eb7p l\\u1ea1i \\u0111\\u1ed9ng th&aacute;i n&agrave;y tr&ecirc;n c\\u1ea7u thang \\u0111\\u1ea7u ti&ecirc;n m\\u01b0\\u1eddi l\\u1ea7n. Sau \\u0111&oacute; \\u0111i  b\\u1ed9 l&ecirc;n c\\u1ea7u thang \\u0111\\u1ea7u ti&ecirc;n, v&agrave; sau \\u0111&oacute; quay tr\\u1edf l\\u1ea1i. L\\u1eb7p l\\u1ea1i m\\u01b0\\u1eddi l\\u1ea7n. B\\u1ea1n  ch\\u1eafc ch\\u1eafn s\\u1ebd c\\u1ea3m th\\u1ea5y \\u0111au ch&acirc;n khi b\\u01b0\\u1edbc \\u0111\\u1ebfn b\\u01b0\\u1edbc cu\\u1ed1i c&ugrave;ng. N\\u1ebfu b\\u1ea1n c\\u1ea3m  th\\u1ea5y h\\u01a1i ch&oacute;ng m\\u1eb7t, b\\u1ea1n h&atilde;y b\\u01b0\\u1edbc ch\\u1eadm l\\u1ea1i. H&atilde;y t\\u1eadp luy\\u1ec7n v\\u1edbi ba c\\u1ea7u  thang \\u0111\\u1ea7u ti&ecirc;n, v&agrave; d\\u1ea7n d\\u1ea7n x&acirc;y d\\u1ef1ng \\u0111\\u1ed9 b\\u1ec1n c\\u1ee7a b\\u1ea1n trong nh\\u1eefng tu\\u1ea7n v&agrave;  th&aacute;ng t\\u1edbi.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">T\\u1eadp luy\\u1ec7n v\\u1edbi gi\\u1ecf qu\\u1ea7n &aacute;o<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">T\\u1eadp  luy\\u1ec7n v\\u1edbi m\\u1ed9t gi\\u1ecf \\u0111\\u1ea7y qu\\u1ea7n &aacute;o c&oacute; t&aacute;c d\\u1ee5ng h\\u01a1n nhi\\u1ec1u khi l&agrave;m vi\\u1ec7c v\\u1eb7t  trong gia \\u0111&igrave;nh. N&oacute; c&oacute; t&aacute;c d\\u1ee5ng nh\\u01b0 m\\u1ed9t m&aacute;y t\\u1eadp th\\u1ec3 d\\u1ee5c c&aacute;nh tay. Gi\\u1eef gi\\u1ecf  tr&ecirc;n \\u0111\\u1ea7u b\\u1ea1n v&agrave; n&acirc;ng l&ecirc;n r\\u1ed3i h\\u1ea1 xu\\u1ed1ng. L&agrave;m \\u0111\\u1ed9ng t&aacute;c n&agrave;y &iacute;t nh\\u1ea5t ba l\\u1ea7n.  N\\u1ebfu n&oacute; l&agrave; qu&aacute; n\\u1eb7ng v\\u1edbi b\\u1ea1n, b\\u1ea1n c&oacute; th\\u1ec3 b\\u1ecf b\\u1edbt qu\\u1ea7n &aacute;o ra. B&agrave;i t\\u1eadp n&agrave;y  s\\u1ebd c&oacute; t&aacute;c d\\u1ee5ng vai, c&aacute;nh tay tr&ecirc;n v&agrave; c\\u01a1 l\\u01b0ng tr&ecirc;n. Thay \\u0111\\u1ed5i n&agrave;y t\\u1eadp th\\u1ec3  d\\u1ee5c b\\u1eb1ng c&aacute;ch n\\u1eb1m th\\u1eb3ng l\\u01b0ng c\\u1ee7a b\\u1ea1n, v&agrave; n&acirc;ng gi\\u1ecf l&ecirc;n v&agrave; h\\u1ea1 xu\\u1ed1ng ng\\u1ef1c  c\\u1ee7a b\\u1ea1n.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Th\\u1ec3 d\\u1ee5c tr&ecirc;n chi\\u1ebfc chi\\u1ebfu<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">C&oacute;  nhi\\u1ec1u b&agrave;i t\\u1eadp t\\u1ea1i ch\\u1ed7 m&agrave; b\\u1ea1n c&oacute; th\\u1ec3 th\\u1ef1c hi\\u1ec7n t\\u1ea1i nh&agrave;. H&atilde;y d&ugrave;ng m\\u1ed9t  chi\\u1ebfc chi\\u1ebfu t\\u1eadp v&agrave; c\\u1ed1 g\\u1eafng t\\u1eadp c&aacute;c \\u0111\\u1ed9ng t&aacute;c c\\u0103ng c\\u01a1, n&acirc;ng ch&acirc;n l&ecirc;n cao  v&agrave; g\\u1eadp ng\\u01b0\\u1eddi. H&atilde;y ch&uacute; &yacute; t\\u1eadp \\u0111&uacute;ng c&aacute;ch n\\u1ebfu kh&ocirc;ng b\\u1ea1n c&oacute; th\\u1ec3 g&acirc;y th\\u01b0\\u01a1ng  t\\u1ed5n cho ch&iacute;nh m&igrave;nh.<\\/span><\\/p>\\r\\n<p class=\\"caption\\" style=\\"text-align: center;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\"><img style=\\"vertical-align: middle;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/20120322\\/1332237186-taptheduc1-suckhoe.eva.jpg\\" alt=\\"1332237186-taptheduc1-suckhoe.eva\\" width=\\"450\\" height=\\"373\\" \\/><\\/span><\\/p>\\r\\n<p style=\\"text-align: center;\\"><span style=\\"font-family: verdana,geneva; font-size: 8pt;\\">N&ecirc;n c\\u1ed1 g\\u1eafng k\\u1ebft h\\u1ee3p t\\u1eadp th\\u1ec3 d\\u1ee5c v&agrave;o c&ocirc;ng vi\\u1ec7c h&agrave;ng ng&agrave;y c\\u1ee7a b\\u1ea1n b\\u1ea5t c\\u1ee9 khi n&agrave;o c&oacute; th\\u1ec3 (\\u1ea3nh minh h\\u1ecda)<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Luy\\u1ec7n t\\u1eadp v\\u1edbi d\\u1ee5ng c\\u1ee5<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">H&atilde;y  s\\u1eafm cho m&igrave;nh m\\u1ed9t d\\u1ee5ng c\\u1ee5 t\\u1eadp th\\u1ec3 d\\u1ee5c n&agrave;o \\u0111\\u1ea5y, v&iacute; d\\u1ee5 b&oacute;ng t\\u1eadp chuy&ecirc;n  d\\u1ee5ng, ho\\u1eb7c m&aacute;y t\\u1eadp ch\\u1ea1y. B\\u1ea1n s\\u1ebd tho\\u1ea3i m&aacute;i luy\\u1ec7n t\\u1eadp b\\u1ea5t c\\u1ee9 l&uacute;c n&agrave;o r&atilde;nh  r\\u1ed7i v&agrave; h\\u1ee9ng th&uacute;. Ho\\u1eb7c c&oacute; th\\u1ec3 v\\u1eeba t\\u1eadp v\\u1eeba theo d&otilde;i ch\\u01b0\\u01a1ng tr&igrave;nh TV y&ecirc;u  th&iacute;ch c\\u1ee7a m&igrave;nh.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">T\\u1eadp th\\u1ec3 d\\u1ee5c ngay tr&ecirc;n gh\\u1ebf l&agrave;m vi\\u1ec7c<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">V\\u1edbi  m\\u1ed9t chi\\u1ebfc gh\\u1ebf v\\u0103n ph&ograve;ng v\\u1edbi b&aacute;nh xe, b\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp luy\\u1ec7n ngay t\\u1ea1i b&agrave;n  l&agrave;m vi\\u1ec7c c\\u1ee7a b\\u1ea1n. Ch\\u1ec9 c\\u1ea7n t\\u1eadp luy\\u1ec7n trong khi b\\u1ea1n ng\\u1ed3i tr&ecirc;n gh\\u1ebf v&agrave; s\\u1eed  d\\u1ee5ng c\\u01a1 b\\u1eafp c\\u1ee7a c&aacute;nh tay c\\u1ee7a b\\u1ea1n \\u0111\\u1ec3 k&eacute;o m&igrave;nh l\\u1ea1i g\\u1ea7n b&agrave;n l&agrave;m vi\\u1ec7c v&agrave; \\u0111\\u1ea9y  m&igrave;nh ra xa. \\u0110i\\u1ec1u n&agrave;y s\\u1ebd l&agrave;m cho b\\u1eafp tay c\\u1ee7a b\\u1ea1n r\\u1eafn ch\\u1eafc.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">T\\u1eadp trong l&uacute;c n\\u1ea5u \\u0103n<\\/span><\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Cu\\u1ed9c  s\\u1ed1ng b\\u1eadn r\\u1ed9n, v&igrave; v\\u1eady h&atilde;y th\\u1eed \\u0111a nhi\\u1ec7m v\\u1ee5 n\\u1ebfu b\\u1ea1n kh&ocirc;ng c&oacute; th\\u1eddi gian ph&ugrave;  h\\u1ee3p \\u0111\\u1ec3 t\\u1eadp luy\\u1ec7n th&iacute;ch h\\u1ee3p. Trong khi n\\u1ea5u n\\u01b0\\u1edbng, b\\u1ea1n n&ecirc;n c\\u1ed1 g\\u1eafng k\\u1ebft  h\\u1ee3p t\\u1eadp th\\u1ec3 d\\u1ee5c v&agrave;o c&ocirc;ng vi\\u1ec7c h&agrave;ng ng&agrave;y c\\u1ee7a b\\u1ea1n b\\u1ea5t c\\u1ee9 khi n&agrave;o c&oacute; th\\u1ec3.<\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Th\\u1ef1c hi\\u1ec7n theo c&aacute;c b\\u01b0\\u1edbc \\u0111\\u01a1n gi\\u1ea3n v&agrave; b\\u1ea1n s\\u1ebd c\\u1ea3m th\\u1ea5y ph&ugrave; h\\u1ee3p.<\\/span><\\/p>\\r\\n<p style=\\"text-align: right;\\"><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Theo Eva<\\/span><\\/strong><\\/p>","introtext":"M\\u1ed9t s\\u1ed1 t\\u1eadp luy\\u1ec7n c&oacute; th\\u1ec3 d\\u1ec5 d&agrave;ng \\u0111\\u01b0\\u1ee3c th\\u1ef1c hi\\u1ec7n m\\u1ed9t c&aacute;ch tho\\u1ea3i m&aacute;i t\\u1ea1i ph&ograve;ng kh&aacute;ch c\\u1ee7a b\\u1ea1n.\\r\\nB\\u1ea1n  c&oacute; th\\u1ec3 tho\\u1ea3i m&aacute;i t\\u1eadp luy\\u1ec7n v\\u1edbi s\\u1ef1 thu\\u1eadn ti\\u1ec7n v&agrave; kh&ocirc;ng kh&iacute; tho\\u1ea3i m&aacute;i.  B\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp luy\\u1ec7n m\\u1ed9t m&igrave;nh ho\\u1eb7c r\\u1ee7 th&ecirc;m b\\u1ea1n \\u0111\\u1ebfn t\\u1eadp c&ugrave;ng nh\\u01b0ng ph\\u1ea3i  t\\u01b0 v\\u1ea5n b&aacute;c s\\u0129 c\\u1ee7a b\\u1ea1n tr\\u01b0\\u1edbc khi b\\u1eaft \\u0111\\u1ea7u m\\u1ed9t ch\\u01b0\\u01a1ng tr&igrave;nh t\\u1eadp th\\u1ec3 d\\u1ee5c  m\\u1edbi. D\\u01b0\\u1edbi \\u0111&acirc;y l&agrave; m\\u1ed9t v&agrave;i \\u0111i\\u1ec1u \\u0111\\u01a1n gi\\u1ea3n b\\u1ea1n c&oacute; th\\u1ec3 l&agrave;m.\\r\\nLeo b\\u1eadc thang\\r\\nN\\u1ebfu  nh&agrave; b\\u1ea1n \\u1edf c&oacute; c\\u1ea7u thang, b\\u1ea1n c&oacute; th\\u1ec3 t\\u1eadp luy\\u1ec7n ch\\u1ec9 \\u0111\\u01a1n ...","modified":"{\\"1338536928\\":\\"1\\",\\"1339032241\\":\\"1\\"}","metadesc":"M\\u1ed9t s\\u1ed1 t\\u1eadp luy\\u1ec7n c\\u00f3 th\\u1ec3 d\\u1ec5 d\\u00e0ng \\u0111\\u01b0\\u1ee3c th\\u1ef1c hi\\u1ec7n m\\u1ed9t c\\u00e1ch tho\\u1ea3i m\\u00e1i t\\u1ea1i ph\\u00f2ng kh\\u00e1ch c\\u1ee7a b\\u1ea1n. B\\u1ea1n c\\u00f3 th\\u1ec3 tho\\u1ea3i m\\u00e1i t\\u1eadp luy\\u1ec7n v\\u1edbi s\\u1ef1 thu\\u1eadn ..."}', 1, 1337163047, 0),
(22, 'vi', 12, 2, 1, 7, 0, '5 động tác yoga tập buổi sáng', '5-dong-tac-yoga-tap-buoi-sang', '2', '{"introimage":"26","list_suggest":"21,20,19,18,17","fulltext":"<div><strong><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">D&agrave;nh  kho\\u1ea3ng 15 ph&uacute;t m\\u1ed7i s&aacute;ng v\\u1edbi v&agrave;i \\u0111\\u1ed9ng t&aacute;c yoga s\\u1ebd gi&uacute;p b\\u1ea1n c&oacute; c\\u01a1 th\\u1ec3 d\\u1ebbo  dai v&agrave; t\\u0103ng c\\u01b0\\u1eddng s\\u1ee9c kho\\u1ebb cho m\\u1ed9t ng&agrave;y m\\u1edbi tr&agrave;n \\u0111\\u1ea7y h\\u1ee9ng kh\\u1edfi v&agrave; n\\u0103ng  \\u0111\\u1ed9ng.<\\/span><\\/strong><\\/div>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><img style=\\"display: block; margin-left: auto; margin-right: auto;\\" src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/Articles_picts\\/20110915\\/halasana.jpg\\" alt=\\"halasana\\" width=\\"506\\" height=\\"338\\" \\/><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong>T\\u01b0 th\\u1ebf con c&aacute; (Matsyasana)<\\/strong><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">N\\u1eb1m  ng\\u1eeda, hai ch&acirc;n \\u0111\\u1eb7t s&aacute;t nhau, b\\u1ebb ng\\u01b0\\u1ee3c m\\u0169i ch&acirc;n h\\u01b0\\u1edbng v\\u1ec1 \\u0111\\u1ea7u, gi\\u1eef hai  \\u0111\\u1ea7u g\\u1ed1i th\\u1eb3ng. Nghi&ecirc;ng b&ecirc;n ph\\u1ea3i l&oacute;t tay tr&aacute;i, nghi&ecirc;ng b&ecirc;n tr&aacute;i l&oacute;t tay  ph\\u1ea3i, hai c&aacute;nh tay th\\u1eb3ng, l&ograve;ng b&agrave;n tay &uacute;p, khu\\u1ef7u tay gi\\u1ea5u d\\u01b0\\u1edbi th&acirc;n c&agrave;ng  nhi\\u1ec1u c&agrave;ng t\\u1ed1t. H&iacute;t s&acirc;u, b\\u1ea9y ng\\u1ef1c l&ecirc;n kh\\u1ecfi s&agrave;n, th\\u1ea3 l\\u1ecfng c\\u1ed5, bu&ocirc;ng l\\u1ecfng  \\u0111\\u1ec9nh \\u0111\\u1ea7u xu\\u1ed1ng s&agrave;n. V&agrave;o th\\u1ebf th&igrave; h&iacute;t th\\u1edf s&acirc;u v&agrave; \\u0111\\u1ec1u, l\\u1ed3ng ng\\u1ef1c \\u01b0\\u1ee1n cong  h\\u1ebft m\\u1ee9c, 90% \\u0111\\u1ed9 n\\u1eb7ng d\\u1ed3n l&ecirc;n hai khu\\u1ef7u tay, 10% \\u0111\\u1ed9 n\\u1eb7ng \\u1edf \\u0111\\u1ec9nh \\u0111\\u1ea7u.&nbsp;&nbsp;&nbsp;<\\/span><\\/p>\\r\\n<table border=\\"0\\" cellpadding=\\"0\\" align=\\"center\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\"padding: 0.75pt; background-color: transparent; border: medium none #f0f0f0;\\">\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\">&nbsp; <\\/span><\\/p>\\r\\n<table align=\\"left\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><img src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/Articles_picts\\/20110915\\/yoga-1.jpg\\" alt=\\"yoga-1\\" width=\\"350\\" height=\\"96\\" \\/><br \\/><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n&nbsp;<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\"padding: 0.75pt; background-color: transparent; border: medium none #f0f0f0;\\">\\r\\n<p style=\\"margin: 0in 0in 0pt; text-align: center;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong><strong>&nbsp;<\\/strong><\\/strong><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><em>T&aacute;c d\\u1ee5ng<\\/em><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">T&aacute;c  d\\u1ee5ng v&agrave;o tuy\\u1ebfn c\\u1eadn gi&aacute;p, gi&uacute;p \\u0111i\\u1ec1u ti\\u1ebft canxi, ki\\u1ec3m so&aacute;t li\\u1ec1u l\\u01b0\\u1ee3ng c\\u1ee7a  n&oacute; trong m&aacute;u v&agrave; kh\\u1ea3 n\\u0103ng c\\u01a1 th\\u1ec3 h\\u1ea5p thu n&oacute;. Ch\\u1ec9nh s\\u1eeda vai khom. T\\u0103ng  dung t&iacute;ch ph\\u1ed5i. Gi\\u1ea3m c&aacute;c c\\u01a1n co th\\u1eaft \\u1edf kh&iacute; qu\\u1ea3n. Gi&uacute;p l&agrave;m gi\\u1ea3m b\\u1ec7nh  suy\\u1ec5n v&agrave; c&aacute;c b\\u1ec7nh v\\u1ec1 \\u0111\\u01b0\\u1eddng h&ocirc; h\\u1ea5p. K&iacute;ch th&iacute;ch v&agrave; t\\u0103ng c\\u01b0\\u1eddng ch\\u1ee9c n\\u0103ng  c\\u1ee7a tuy\\u1ebfn y&ecirc;n v&agrave; tuy\\u1ebfn t&ugrave;ng.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><br \\/><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong>T\\u01b0 th\\u1ebf c&aacute;i c&agrave;y (Halasana)<\\/strong><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">N\\u1eb1m  ng\\u1eeda tr&ecirc;n s&agrave;n, hai b&agrave;n ch&acirc;n s&aacute;t nhau, b\\u1ebb ng\\u01b0\\u1ee3c m\\u0169i ch&acirc;n h\\u01b0\\u1edbng v\\u1ec1 \\u0111\\u1ea7u,  gi\\u1eef \\u0111\\u1ea7u g\\u1ed1i th\\u1eb3ng. Hai c&aacute;nh tay d\\u1ecdc hai b&ecirc;n th&acirc;n, l&ograve;ng b&agrave;n tay &uacute;p. Hai  vai th\\u1ea3 l\\u1ecfng. C\\u1eb1m h\\u01b0\\u1edbng v\\u1ec1 ph&iacute;a ng\\u1ef1c. H&iacute;t v&agrave;o, n&acirc;ng hai ch&acirc;n l&ecirc;n qua  kh\\u1ecfi \\u0111\\u1ea7u, h\\u1ea1 hai ch&acirc;n xu\\u1ed1ng s&agrave;n t\\u1eeb t\\u1eeb c&oacute; ki\\u1ec3m so&aacute;t, d&ugrave;ng tay \\u0111\\u1ee1 l\\u01b0ng  (b\\u1ed1n ng&oacute;n tay \\u0111\\u1ee1 l\\u01b0ng, ng&oacute;n tay c&aacute;i \\u0111\\u1ee1 h&ocirc;ng). V&agrave;o th\\u1ebf th&igrave; h&iacute;t th\\u1edf s&acirc;u v&agrave;  \\u0111\\u1ec1u, m\\u1eaft t\\u1eadp trung v&agrave;o r\\u1ed1n, hai khu\\u1ef7u tay c&agrave;ng g\\u1ea7n nhau c&agrave;ng t\\u1ed1t, hai  \\u0111\\u1ea7u g\\u1ed1i th\\u1eb3ng, b\\u1ebb ng\\u01b0\\u1ee3c m\\u0169i ch&acirc;n h\\u01b0\\u1edbng v\\u1ec1 \\u0111\\u1ea7u, g&oacute;t ch&acirc;n h\\u01b0\\u1edbng v\\u1ec1 s&agrave;n.&nbsp;&nbsp;&nbsp;<\\/span><\\/p>\\r\\n<table border=\\"0\\" cellpadding=\\"0\\" align=\\"center\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\"padding: 0.75pt; background-color: transparent; border: medium none #f0f0f0;\\">\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\">&nbsp; <\\/span><\\/p>\\r\\n<table align=\\"left\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><img src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/Articles_picts\\/20110915\\/yoga-2.jpg\\" alt=\\"yoga-2\\" width=\\"300\\" height=\\"215\\" \\/><br \\/><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n&nbsp;<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\"padding: 0.75pt; background-color: transparent; border: medium none #f0f0f0;\\">\\r\\n<p style=\\"margin: 0in 0in 0pt; text-align: center;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong><strong>&nbsp;<\\/strong><\\/strong><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><em>T&aacute;c d\\u1ee5ng<\\/em><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Gi\\u1ea3i  to\\u1ea3 c\\u0103ng th\\u1eb3ng v&ugrave;ng c\\u1ed5 v&agrave; vai. Xoa b&oacute;p c&aacute;c c\\u01a1 quan n\\u1ed9i t\\u1ea1ng, l&agrave;m gi\\u1ea3m  b\\u1edbt c&aacute;c ch\\u1ee9ng kh&oacute; ti&ecirc;u hay t&aacute;o b&oacute;n. L&agrave;m gi\\u1ea3m ch\\u1ee9ng m\\u1ea5t ng\\u1ee7 ho\\u1eb7c ng\\u1ee7  kh&ocirc;ng ngon gi\\u1ea5c. Gi&uacute;p tr&iacute; n&atilde;o s&aacute;ng su\\u1ed1t, th\\u0103ng b\\u1eb1ng n\\u1ed9i t&acirc;m.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><br \\/><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong>M&aacute;y bay nghi&ecirc;ng c&aacute;nh v\\u1edbi bi\\u1ebfn th\\u1ec3 hai ch&acirc;n xo\\u1ea1c r\\u1ed9ng<\\/strong><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Xo\\u1ea1c  r\\u1ed9ng h\\u1ebft m\\u1ee9c hai ch&acirc;n, ch\\u1ed1ng hai b&agrave;n tay tr&ecirc;n s&agrave;n, ph&iacute;a sau l\\u01b0ng, c&aacute;c  ng&oacute;n tay h\\u01b0\\u1edbng ra ph&iacute;a sau. Ng\\u1eeda \\u0111\\u1ea7u ra sau v&agrave; t\\u1ef1a ng\\u01b0\\u1eddi l&ecirc;n hai b&agrave;n  tay. H&iacute;t v&agrave;o, \\u0111\\u1ed3ng th\\u1eddi n&acirc;ng h&ocirc;ng cao h\\u1ebft m\\u1ee9c, c\\u1ed1 g\\u1eafng d&aacute;n hai b&agrave;n ch&acirc;n  xu\\u1ed1ng s&agrave;n. V&agrave;o th\\u1ebf, h&iacute;t th\\u1edf s&acirc;u v&agrave; \\u0111\\u1ec1u, ng\\u1eeda c\\u1ed5 t\\u1ed1i \\u0111a, \\u0111\\u1ea7u g\\u1ed1i gi\\u1eef  th\\u1eb3ng.&nbsp;&nbsp;<\\/span><\\/p>\\r\\n<table border=\\"0\\" cellpadding=\\"0\\" align=\\"center\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\"padding: 0.75pt; background-color: transparent; border: medium none #f0f0f0;\\">\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\">&nbsp; <\\/span><\\/p>\\r\\n<table align=\\"left\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><img src=\\"http:\\/\\/dantri.vcmedia.vn\\/Uploaded\\/phuongtt\\/thang11.08\\/yoga-71108c.jpg\\" border=\\"0\\" alt=\\"\\" \\/><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n&nbsp;<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\"padding: 0.75pt; background-color: transparent; border: medium none #f0f0f0;\\">\\r\\n<p style=\\"margin: 0in 0in 0pt; text-align: center;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong><strong>&nbsp;<\\/strong><\\/strong><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><em>T&aacute;c d\\u1ee5ng<\\/em><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">T\\u0103ng c\\u01b0\\u1eddng s\\u1ee9c m\\u1ea1nh c\\u1ee7a vai, tay v&agrave; h&ocirc;ng, khi\\u1ebfn ch&uacute;ng m\\u1ec1m d\\u1ebbo, \\u0111\\u1ed3ng th\\u1eddi t\\u0103ng c\\u01b0\\u1eddng s\\u1ef1 ph\\u1ed1i h\\u1ee3p c\\u01a1 b\\u1eafp v&agrave; tr\\u1ea1ng th&aacute;i c&acirc;n b\\u1eb1ng.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><br \\/><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong>G\\u1eadp ng\\u01b0\\u1eddi ra ph&iacute;a tr\\u01b0\\u1edbc (Paschimothanasana) v\\u1edbi bi\\u1ebfn th\\u1ec3 hai ch&acirc;n xo\\u1ea1c r\\u1ed9ng<\\/strong><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Xo\\u1ea1c  r\\u1ed9ng h\\u1ebft m\\u1ee9c hai ch&acirc;n. H&iacute;t s&acirc;u v&agrave;o, gi\\u01a1 hai c&aacute;nh tay cao qu&aacute; \\u0111\\u1ea7u, tay  song song mang tai. K&eacute;o gi&atilde;n c\\u1ed9t s\\u1ed1ng t\\u1ed1i \\u0111a. Th\\u1edf ra, trong khi h\\u1ea1 th&acirc;n  ng\\u01b0\\u1eddi ra ph&iacute;a tr\\u01b0\\u1edbc, l\\u01b0ng gi\\u1eef th\\u1eb3ng \\u0111\\u1ec3 k&eacute;o gi&atilde;n t\\u1ed1i \\u0111a c\\u01a1 b\\u1eafp v&ugrave;ng l\\u01b0ng.  Tay n\\u1eafm l\\u1ea5y hai ng&oacute;n ch&acirc;n c&aacute;i, b\\u1ebb ng\\u01b0\\u1ee3c m\\u0169i ch&acirc;n l&ecirc;n. V&agrave;o th\\u1ebf, h&iacute;t th\\u1edf  s&acirc;u v&agrave; \\u0111\\u1ec1u, gi\\u1eef th&acirc;n ng\\u01b0\\u1eddi kh&ocirc;ng nh\\u1ea5p nh\\u1ed5m l&ecirc;n xu\\u1ed1ng, g\\u1ed1i gi\\u1eef th\\u1eb3ng ch\\u1ea1m  s&aacute;t s&agrave;n. N\\u1ebfu \\u0111\\u01b0\\u1ee3c c&oacute; th\\u1ec3 t\\u1ef1a c\\u1eb1m v&agrave; cu\\u1ed1i c&ugrave;ng l&agrave; ng\\u1ef1c xu\\u1ed1ng s&agrave;n.&nbsp;&nbsp;<\\/span><\\/p>\\r\\n<table border=\\"0\\" cellpadding=\\"0\\" align=\\"center\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\"padding: 0.75pt; background-color: transparent; border: medium none #f0f0f0;\\">\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\">&nbsp; <\\/span><\\/p>\\r\\n<table align=\\"left\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><img src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/Articles_picts\\/20110915\\/yoga-4.jpg\\" alt=\\"yoga-4\\" width=\\"300\\" height=\\"195\\" \\/><br \\/><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n&nbsp;<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\"padding: 0.75pt; background-color: transparent; border: medium none #f0f0f0;\\">\\r\\n<p style=\\"margin: 0in 0in 0pt; text-align: center;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong><strong>&nbsp;<\\/strong><\\/strong><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><em>T&aacute;c d\\u1ee5ng<\\/em><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">K&eacute;o  gi&atilde;n to&agrave;n b\\u1ed9 m\\u1eb7t sau c\\u1ee7a th&acirc;n ng\\u01b0\\u1eddi&nbsp;- h&ocirc;ng, c\\u1ed9t s\\u1ed1ng v&agrave; c\\u01a1 b\\u1eafp ch&acirc;n v&agrave;  l\\u01b0ng. Gi\\u1ea3m b\\u1edbt s\\u1ee9c &eacute;p tr&ecirc;n c\\u1ed9t s\\u1ed1ng v&agrave; ch\\u1ee9ng \\u0111au th\\u1ea7n kinh to\\u1ea1. T\\u0103ng  c\\u01b0\\u1eddng v&agrave; k&eacute;o gi&atilde;n c&aacute;c d&acirc;y ch\\u1eb1ng. \\u0110i\\u1ec1u ch\\u1ec9nh ch\\u1ee9c n\\u0103ng tuy\\u1ebfn tu\\u1ef5, h\\u1ed7 tr\\u1ee3  t&iacute;ch c\\u1ef1c cho nh\\u1eefng ng\\u01b0\\u1eddi m\\u1eafc ch\\u1ee9ng b\\u1ec7nh ti\\u1ec3u \\u0111\\u01b0\\u1eddng v&agrave; gi\\u1ea3m glucose  huy\\u1ebft.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong>&nbsp;<\\/strong>&nbsp;<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong>T\\u01b0 th\\u1ebf \\u0111\\u1ee9ng tr&ecirc;n vai (Sarvangasana)<\\/strong><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">N\\u1eb1m  ng\\u1eeda tr&ecirc;n s&agrave;n, hai b&agrave;n ch&acirc;n s&aacute;t nhau, b\\u1ebb ng\\u01b0\\u1ee3c m\\u0169i ch&acirc;n h\\u01b0\\u1edbng v\\u1ec1 \\u0111\\u1ea7u,  gi\\u1eef \\u0111\\u1ea7u g\\u1ed1i th\\u1eb3ng. Hai c&aacute;nh tay d\\u1ecdc hai b&ecirc;n th&acirc;n, l&ograve;ng b&agrave;n tay &uacute;p. Hai  vai th\\u1ea3 l\\u1ecfng. C\\u1eb1m h\\u01b0\\u1edbng v\\u1ec1 ph&iacute;a ng\\u1ef1c. H&iacute;t v&agrave;o, n&acirc;ng hai ch&acirc;n l&ecirc;n, d&ugrave;ng  tay \\u0111\\u1ee1 l\\u01b0ng (b\\u1ed1n ng&oacute;n tay \\u0111\\u1ee1 l\\u01b0ng, ng&oacute;n tay c&aacute;i \\u0111\\u1ee1 h&ocirc;ng). V&agrave;o th\\u1ebf th&igrave;  h&iacute;t th\\u1edf s&acirc;u v&agrave; \\u0111\\u1ec1u, m\\u1eaft t\\u1eadp trung v&agrave;o r\\u1ed1n, hai khu\\u1ef7u tay c&agrave;ng g\\u1ea7n nhau  c&agrave;ng t\\u1ed1t, b&agrave;n ch&acirc;n th\\u1ea3 l\\u1ecfng, g\\u1ed1i gi\\u1eef th\\u1eb3ng.&nbsp;&nbsp;<\\/span><\\/p>\\r\\n<table border=\\"0\\" cellpadding=\\"0\\" align=\\"center\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\"padding: 0.75pt; background-color: transparent; border: medium none #f0f0f0;\\">\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-size: 10pt; font-family: verdana,geneva;\\">&nbsp; <\\/span><\\/p>\\r\\n<table align=\\"left\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><img src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/Articles_picts\\/20110915\\/yoga-5.jpg\\" alt=\\"yoga-5\\" width=\\"300\\" height=\\"450\\" \\/><br \\/><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n&nbsp;<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\"padding: 0.75pt; background-color: transparent; border: medium none #f0f0f0;\\">\\r\\n<p style=\\"margin: 0in 0in 0pt; text-align: center;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><strong><strong>&nbsp;<\\/strong><\\/strong><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\"><em>T&aacute;c d\\u1ee5ng<\\/em><\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Th\\u0103ng  b\\u1eb1ng ch\\u1ee9c n\\u0103ng c\\u1ee7a tuy\\u1ebfn gi&aacute;p, v\\u1ed1n l&agrave; \\u0111\\u1ea7u n&atilde;o c\\u1ee7a c&aacute;c tuy\\u1ebfn n\\u1ed9i ti\\u1ebft,  \\u0111i\\u1ec1u ch\\u1ec9nh qu&aacute; tr&igrave;nh trao \\u0111\\u1ed5i ch\\u1ea5t v&agrave; s\\u1ea3n sinh nhi\\u1ec7t, ki\\u1ec3m so&aacute;t nh\\u1ecbp  tim. Ng\\u0103n ng\\u1eeba vi\\u1ec7c t\\u1ee5 m&aacute;u \\u1edf chi d\\u01b0\\u1edbi, xoa d\\u1ecbu t\\u0129nh m\\u1ea1ch, gi&uacute;p tim c&oacute; c\\u01a1  h\\u1ed9i ngh\\u1ec9 ng\\u01a1i. Gi\\u1ea3m t&igrave;nh tr\\u1ea1ng u\\u1ec3 o\\u1ea3i v&agrave; tr&igrave; \\u0111\\u1ed9n \\u1edf tr&iacute; n&atilde;o. K&iacute;ch th&iacute;ch  lu\\u1ed3ng kh&iacute; \\u0111i qua kinh v\\u1ecb, ti\\u1ec3u tr&agrave;ng, b&agrave;ng quang, t&acirc;m b&agrave;o, ngo\\u1ea1i t&acirc;m m\\u1ea1c  v&agrave; th\\u1eadn.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">K\\u1ebft th&uacute;c b&agrave;i t\\u1eadp v\\u1edbi t\\u01b0 th\\u1ebf x&aacute;c ch\\u1ebft (Sarvasana)<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">-  N\\u1eb1m ng\\u1eeda tr&ecirc;n s&agrave;n, hai b&agrave;n ch&acirc;n \\u0111\\u1ec3 c&aacute;ch nhau 50cm (g&oacute;t ch&acirc;n ngay m&eacute;p  th\\u1ea3m), hai ch&acirc;n th\\u1eb3ng nh\\u01b0ng th\\u1ea3 l\\u1ecfng, c&aacute;c \\u0111\\u1ea7u ng&oacute;n ch&acirc;n ng\\u1ea3 sang hai  b&ecirc;n.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">-  Hai c&aacute;nh tay t\\u1ea1o g&oacute;c 450 so v\\u1edbi th&acirc;n ng\\u01b0\\u1eddi (khu\\u1ef7u tay n\\u1eb1m trong m&eacute;p  th\\u1ea3m), hai b&agrave;n tay th\\u1ea3 l\\u1ecfng, l&ograve;ng b&agrave;n tay ng\\u1eeda, c&aacute;c ng&oacute;n tay h\\u01a1i cong.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- L\\u01b0ng &aacute;p s&aacute;t s&agrave;n, \\u0111\\u1ea7u v\\u1ec1 ch&iacute;nh di\\u1ec7n, c\\u1eb1m h\\u01b0\\u1edbng v\\u1ec1 ng\\u1ef1c.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">- Th\\u1ea3 l\\u1ecfng c\\u01a1 th\\u1ec3, nh\\u1eafm m\\u1eaft l\\u1ea1i, h\\u01b0\\u1edbng &yacute; th\\u1ee9c v&agrave;o h\\u01a1i th\\u1edf, h&iacute;t th\\u1edf b\\u1eb1ng m\\u0169i, b\\u1ee5ng ph\\u1ed3ng l&ecirc;n x\\u1eb9p xu\\u1ed1ng theo h\\u01a1i th\\u1edf nh\\u1ecbp 4 - 8.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt; text-align: right;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Khoemoingay&nbsp;&nbsp;&nbsp;&nbsp; <\\/span><\\/p>\\r\\n<p style=\\"margin: 0in 0in 0pt;\\"><span style=\\"font-family: verdana,geneva; font-size: 10pt;\\">Theo <em>S&agrave;i G&ograve;n Ti\\u1ebfp Th\\u1ecb<\\/em><\\/span><\\/p>","introtext":"D&agrave;nh  kho\\u1ea3ng 15 ph&uacute;t m\\u1ed7i s&aacute;ng v\\u1edbi v&agrave;i \\u0111\\u1ed9ng t&aacute;c yoga s\\u1ebd gi&uacute;p b\\u1ea1n c&oacute; c\\u01a1 th\\u1ec3 d\\u1ebbo  dai v&agrave; t\\u0103ng c\\u01b0\\u1eddng s\\u1ee9c kho\\u1ebb cho m\\u1ed9t ng&agrave;y m\\u1edbi tr&agrave;n \\u0111\\u1ea7y h\\u1ee9ng kh\\u1edfi v&agrave; n\\u0103ng  \\u0111\\u1ed9ng.\\r\\n\\r\\nT\\u01b0 th\\u1ebf con c&aacute; (Matsyasana)\\r\\nN\\u1eb1m  ng\\u1eeda, hai ch&acirc;n \\u0111\\u1eb7t s&aacute;t nhau, b\\u1ebb ng\\u01b0\\u1ee3c m\\u0169i ch&acirc;n h\\u01b0\\u1edbng v\\u1ec1 \\u0111\\u1ea7u, gi\\u1eef hai  \\u0111\\u1ea7u g\\u1ed1i th\\u1eb3ng. Nghi&ecirc;ng b&ecirc;n ph\\u1ea3i l&oacute;t tay tr&aacute;i, nghi&ecirc;ng b&ecirc;n tr&aacute;i l&oacute;t tay  ph\\u1ea3i, hai c&aacute;nh tay th\\u1eb3ng, l&ograve;ng b&agrave;n tay &uacute;p, khu\\u1ef7u tay gi\\u1ea5u d\\u01b0\\u1edbi th&acirc;n c&agrave;ng  nhi\\u1ec1u c&agrave;ng t\\u1ed1t. H&iacute;t s&acirc;u, b\\u1ea9y ng\\u1ef1c l&ecirc;n kh\\u1ecfi s&agrave;n, ...","modified":"{\\"1337227916\\":\\"1\\",\\"1339031704\\":\\"1\\",\\"1339032221\\":\\"1\\",\\"1339055869\\":\\"1\\",\\"1339154741\\":\\"1\\"}","metadesc":"D\\u00e0nh kho\\u1ea3ng 15 ph\\u00fat m\\u1ed7i s\\u00e1ng v\\u1edbi v\\u00e0i \\u0111\\u1ed9ng t\\u00e1c yoga s\\u1ebd gi\\u00fap b\\u1ea1n c\\u00f3 c\\u01a1 th\\u1ec3 d\\u1ebbo dai v\\u00e0 t\\u0103ng c\\u01b0\\u1eddng s\\u1ee9c kho\\u1ebb cho m\\u1ed9t ng\\u00e0y m\\u1edbi tr\\u00e0n \\u0111\\u1ea7y ..."}', 1, 1337163094, 1),
(23, 'vi', 12, 2, 0, 2, 0, 'Nghỉ trưa bằng cách thư giãn với yoga, salsa', 'nghi-trua-bang-cach-thu-gian-voi-yoga-salsa', '2', '{"introimage":"76","list_suggest":"","fulltext":"<div style=\\"text-align: left; padding: 5px;\\">\\r\\n<div style=\\"padding-right: 8px;\\"><strong><span style=\\"font-family: verdana,geneva;\\">\\u0102n  nhanh r\\u1ed3i ng\\u1ee7, \\u0111i c&agrave; ph&ecirc; v\\u1edbi b\\u1ea1n b&egrave;, shopping gi\\u1ebft th\\u1eddi gi\\u1edd&hellip; c&oacute; nhi\\u1ec1u  c&aacute;ch ngh\\u1ec9 tr\\u01b0a c\\u1ee7a gi\\u1edbi c&ocirc;ng ch\\u1ee9c v\\u0103n ph&ograve;ng. Tuy nhi&ecirc;n, th\\u1eddi gian g\\u1ea7n  \\u0111&acirc;y nhi\\u1ec1u ng\\u01b0\\u1eddi \\u0111&atilde; ch\\u1ecdn cho m&igrave;nh c&aacute;ch s\\u1eed d\\u1ee5ng th\\u1eddi gian ngh\\u1ec9 tr\\u01b0a b\\u1eb1ng  c&aacute;ch&hellip; kh&ocirc;ng ng\\u1ee7 tr\\u01b0a.<\\/span><\\/strong><\\/div>\\r\\n<\\/div>\\r\\n<div style=\\"padding: 5px; text-align: justify;\\">\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\"><strong>Ngh\\u1ec9 tr\\u01b0a b\\u1eb1ng c&aacute;ch th\\u01b0 gi&atilde;n v\\u1edbi yoga, salsa<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\">Phong  tr&agrave;o t\\u1eadp yoga \\u0111&atilde; lan r\\u1ed9ng \\u1edf TP.HCM, nh\\u01b0ng t\\u1eadp yoga v&agrave;o bu\\u1ed5i tr\\u01b0a th&igrave;  g\\u1ea7n \\u0111&acirc;y m\\u1edbi \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u ng\\u01b0\\u1eddi \\u0111\\u1ec3 &yacute; \\u0111\\u1ebfn. Anh Tr&igrave;nh, qu\\u1ea3n l&yacute; trung t&acirc;m D&aacute;ng  Ng\\u1ecdc cho bi\\u1ebft: &ldquo;Kh\\u1edfi \\u0111\\u1ea7u t\\u1eeb y&ecirc;u c\\u1ea7u c\\u1ee7a m\\u1ed9t nh&oacute;m h\\u1ecdc vi&ecirc;n l&agrave; nh&acirc;n vi&ecirc;n  \\u0111&agrave;i truy\\u1ec1n h&igrave;nh, h\\u1ecd qu&aacute; b\\u1eadn vi\\u1ec7c n&ecirc;n ch\\u1ec9 c&oacute; th\\u1ec3 h\\u1ecdc v&agrave;o bu\\u1ed5i tr\\u01b0a. R\\u1ed3i  t\\u1eeb \\u0111&oacute; nhi\\u1ec1u kh&aacute;ch h&agrave;ng kh&aacute;c c\\u0169ng \\u0111\\u0103ng k&yacute; l\\u1ebb, th\\u1ebf l&agrave; CLB m\\u1edf r\\u1ed9ng th&ecirc;m gi\\u1edd  h\\u1ecdc. Ngo&agrave;i yoga c&ograve;n c&oacute; c&aacute;c l\\u1edbp aerobic, belly &ndash; fitness, salsa c\\u0169ng c&oacute;  nhi\\u1ec1u h\\u1ecdc vi&ecirc;n tham gia t\\u1eeb 10 &ndash; 11g, 11g45 &ndash; 12g45&hellip;&rdquo;<\\/span><\\/span><\\/p>\\r\\n<table style=\\"width: 200px;\\" border=\\"0\\" cellspacing=\\"1\\" cellpadding=\\"1\\" align=\\"center\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\"><img src=\\"http:\\/\\/khoemoingay.com\\/images\\/stories\\/Articles_picts\\/20110915\\/Yoga-buoi-trua.jpg\\" alt=\\"Yoga-buoi-trua\\" width=\\"425\\" height=\\"282\\" \\/><br \\/> <\\/span><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\"text-align: center;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\"><em>V\\u1edbi  cu\\u1ed9c s\\u1ed1ng b\\u1eadn r\\u1ed9n, vi\\u1ec7c t\\u1eadp yoga bu\\u1ed5i tr\\u01b0a l&agrave; xu h\\u01b0\\u1edbng \\u0111ang \\u0111\\u01b0\\u1ee3c gi\\u1edbi  v\\u0103n ph&ograve;ng \\u01b0a chu\\u1ed9ng, do v\\u1eeba ti\\u1ebft ki\\u1ec7m th\\u1eddi gian v\\u1eeba l&agrave; c&aacute;ch ch\\u0103m s&oacute;c s\\u1ee9c  kho\\u1ebb hi\\u1ec7u qu\\u1ea3. <\\/em><\\/span><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\">Ch\\u1ecb  Di\\u1ec7p, l&agrave;m vi\\u1ec7c t\\u1ea1i qu\\u1eadn 1, tr\\u01b0\\u1edbc th\\u01b0\\u1eddng t\\u1eadp bu\\u1ed5i chi\\u1ec1u nh\\u01b0ng sau khi  t\\u1eadp yoga bu\\u1ed5i tr\\u01b0a \\u0111\\u01b0\\u1ee3c hai bu\\u1ed5i t\\u1ea1i Yoga Living th&igrave; chuy\\u1ec3n h\\u1eb3n sang gi\\u1edd  t\\u1eadp m\\u1edbi. &ldquo;Ti\\u1ebft ki\\u1ec7m \\u0111\\u01b0\\u1ee3c th\\u1eddi gian, gi&uacute;p t&ocirc;i th&ecirc;m s\\u1ea3ng kho&aacute;i v&agrave; nh\\u1ea5t l&agrave;  tr&aacute;nh \\u0111\\u01b0\\u1ee3c nh\\u1eefng c\\u01a1n m\\u01b0a chi\\u1ec1u&rdquo; &ndash; ch\\u1ecb Di\\u1ec7p gi\\u1ea3i th&iacute;ch. T\\u1eadp yoga, salsa  bu\\u1ed5i tr\\u01b0a c&oacute; b\\u1ea5t ti\\u1ec7n l&agrave; sau khi t\\u1eadp s\\u1ebd ra m\\u1ed3 h&ocirc;i nhi\\u1ec1u. Nh\\u01b0ng r\\u1ea5t nhanh  ch&oacute;ng, s\\u1ef1 b\\u1ea5t ti\\u1ec7n \\u0111\\u01b0\\u1ee3c kh\\u1eafc ph\\u1ee5c khi c&aacute;c trung t&acirc;m \\u0111\\u1ea7u t\\u01b0 l\\u1ea1i c&aacute;c  ph&ograve;ng v\\u1ec7 sinh, c&oacute; ch\\u1ed7 t\\u1eafm, kh\\u0103n t\\u1eafm s\\u1ea1ch s\\u1ebd, th\\u1eadm ch&iacute; n\\u1ebfu c&oacute; nhu c\\u1ea7u c&oacute;  c\\u1ea3 spa ch\\u0103m s&oacute;c da, g\\u1ed9i \\u0111\\u1ea7u l&agrave;m t&oacute;c t\\u1ea1i ch\\u1ed7.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\">\\u1ede  H&agrave; N\\u1ed9i, t\\u1ea1i trung t&acirc;m Ad yoga 1 \\u1edf 57 L&aacute;ng H\\u1ea1, c&aacute;c l\\u1edbp h\\u1ecdc bu\\u1ed5i tr\\u01b0a  c\\u0169ng b\\u1eaft \\u0111\\u1ea7u c&oacute; nhi\\u1ec1u h\\u1ecdc vi&ecirc;n v\\u1edbi \\u0111\\u1ed1i t\\u01b0\\u1ee3ng ch&iacute;nh l&agrave; gi\\u1edbi nh&acirc;n vi&ecirc;n v\\u0103n  ph&ograve;ng, h\\u1ecdc t\\u1eeb 11g30 &ndash; 12g30; 12g05 &ndash; 13g05. N\\u1ebfu h\\u1ecdc vi&ecirc;n c&oacute; nhu c\\u1ea7u  t\\u0103ng bu\\u1ed5i c\\u0169ng s\\u1ebd \\u0111\\u01b0\\u1ee3c \\u0111&aacute;p \\u1ee9ng. H\\u1ecdc vi&ecirc;n c&ograve;n c&oacute; th\\u1ec3 d&ugrave;ng b\\u1eefa \\u0103n chay v\\u1edbi  gi&aacute; 25.000 \\u0111\\u1ed3ng\\/ph\\u1ea7n ngay t\\u1ea1i ch\\u1ed7 t\\u1eadp.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\">\\u0110\\u1ea1i  di\\u1ec7n c&aacute;c trung t&acirc;m th\\u1ec3 d\\u1ee5c, yoga c&ograve;n cho bi\\u1ebft th&ecirc;m, t\\u1eeb khi c&oacute; c&aacute;c l\\u1edbp  h\\u1ecdc v&agrave;o bu\\u1ed5i tr\\u01b0a, h\\u1ecd c&oacute; th&ecirc;m m\\u1ed9t l\\u01b0\\u1ee3ng kh&aacute;ch m\\u1edbi, t\\u0103ng doanh thu, h\\u1ea1n  ch\\u1ebf c&aacute;c m\\u1eb7t b\\u1eb1ng b\\u1ecb b\\u1ecf tr\\u1ed1ng v&agrave; tr&aacute;nh \\u0111\\u01b0\\u1ee3c t&igrave;nh tr\\u1ea1ng qu&aacute; t\\u1ea3i v&agrave;o c&aacute;c  l\\u1edbp chi\\u1ec1u t\\u1ed1i.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\"><strong>Bu\\u1ed5i tr\\u01b0a \\u0111i&hellip; h\\u1ecdc n\\u1ea5u \\u0103n<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\">11g  \\u0111\\u01b0\\u1ee3c ngh\\u1ec9 tr\\u01b0a, ch\\u1ecb Thu Ho&agrave;i \\u1edf ph\\u1ed1 Nguy\\u1ec5n Th&aacute;i H\\u1ecdc v\\u1ed9i v&agrave;ng t\\u1edbi l\\u1edbp h\\u1ecdc  n\\u1ea5u \\u0103n tr&ecirc;n ph\\u1ed1 Kim M&atilde; Th\\u01b0\\u1ee3ng, H&agrave; N\\u1ed9i. \\u1ede l\\u1edbp h\\u1ecdc c\\u1ee7a ch\\u1ecb Ho&agrave;i c&oacute; t&aacute;m  ng\\u01b0\\u1eddi th&igrave; t\\u1ea5t c\\u1ea3 \\u0111\\u1ec1u l&agrave; nh&acirc;n vi&ecirc;n v\\u0103n ph&ograve;ng. Gi\\u1edd tr\\u01b0a l&agrave; th\\u1eddi gian l&yacute;  t\\u01b0\\u1edfng nh\\u1ea5t \\u0111\\u1ec3 h\\u1ecdc v&igrave; sau gi\\u1edd l&agrave;m vi\\u1ec7c c&aacute;c ch\\u1ecb ph\\u1ea3i v\\u1ec1 lo cho gia \\u0111&igrave;nh.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\">C&ocirc;ng  ty c\\u1ed5 ph\\u1ea7n \\u0111&agrave;o t\\u1ea1o d\\u1ecbch v\\u1ee5 kh&aacute;ch s\\u1ea1n nh&agrave; h&agrave;ng Qu\\u1ea3 T&aacute;o V&agrave;ng, n\\u01a1i ch\\u1ecb Thu  Ho&agrave;i c&ugrave;ng c&aacute;c b\\u1ea1n tham gia h\\u1ecdc, l&agrave; m\\u1ed9t trong nhi\\u1ec1u trung t&acirc;m d\\u1ea1y n\\u1ea5u \\u0103n  t\\u1ea1i H&agrave; N\\u1ed9i. C&ocirc;ng ty c&oacute; r\\u1ea5t nhi\\u1ec1u l\\u1edbp h\\u1ecdc n\\u1ea5u \\u0103n kh&aacute;c nhau nh\\u01b0 &Acirc;u, &Aacute;,  l\\u1edbp c\\u01a1 b\\u1ea3n, l\\u1edbp n&acirc;ng cao&hellip; C&aacute;c l\\u1edbp h\\u1ecdc bu\\u1ed5i tr\\u01b0a cho nh&acirc;n vi&ecirc;n v\\u0103n ph&ograve;ng  ng&agrave;y c&agrave;ng thu h&uacute;t nhi\\u1ec1u ng\\u01b0\\u1eddi. Th\\u1eddi gian h\\u1ecdc t\\u1eeb 11g30 \\u0111\\u1ebfn 13g c&aacute;c ng&agrave;y  t\\u1eeb th\\u1ee9 hai \\u0111\\u1ebfn th\\u1ee9 s&aacute;u. H\\u1ecdc ph&iacute; kho\\u1ea3ng 100.000 \\u0111\\u1ed3ng\\/m&oacute;n. M\\u1ed7i l\\u1edbp c&oacute; 6 &ndash;  12 h\\u1ecdc vi&ecirc;n. Nh\\u1eefng l\\u1edbp n&agrave;y ch\\u1ee7 y\\u1ebfu h\\u1ecdc th\\u1eddi gian ng\\u1eafn v&agrave;o bu\\u1ed5i tr\\u01b0a v\\u1edbi  nh\\u1eefng m&oacute;n \\u0103n \\u0111\\u01a1n gi\\u1ea3n cho b\\u1eefa c\\u01a1m h&agrave;ng ng&agrave;y. M\\u1ed9t kho&aacute; h\\u1ecdc k&eacute;o d&agrave;i 20  ng&agrave;y v\\u1edbi gi&aacute; h\\u1ecdc kho\\u1ea3ng 2 tri\\u1ec7u \\u0111\\u1ed3ng (\\u0111&atilde; bao g\\u1ed3m \\u0111\\u1ed3 d&ugrave;ng n\\u1ea5u \\u0103n). Sau  m\\u1ed7i bu\\u1ed5i th\\u1ef1c h&agrave;nh, h\\u1ecdc sinh c&ugrave;ng nhau th\\u01b0\\u1edfng th\\u1ee9c k\\u1ebft qu\\u1ea3 h\\u1ecdc t\\u1eadp l&agrave;  b\\u1eefa \\u0103n tr\\u01b0a lu&ocirc;n.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-family: verdana,geneva;\\"><span style=\\"font-size: small;\\">Ch\\u1ecb  Thu Ho&agrave;i cho bi\\u1ebft, l\\u1edbp h\\u1ecdc c\\u1ee7a ch\\u1ecb \\u0111\\u1ec1u l&agrave; ph\\u1ee5 n\\u1eef tr\\u1ebb, \\u0111&atilde; l\\u1eadp gia \\u0111&igrave;nh  v&agrave; mu\\u1ed1n h\\u1ecdc m\\u1ed9t kho&aacute; n\\u1ea5u \\u0103n \\u0111\\u1ec3 t\\u1ef1 tay ch\\u1ebf bi\\u1ebfn nh\\u1eefng m&oacute;n \\u0103n ngon cho  nh\\u1eefng ng\\u01b0\\u1eddi th&acirc;n c\\u1ee7a m&igrave;nh. &ldquo;Thay v&igrave; tr\\u01b0\\u1edbc \\u0111&acirc;y hay \\u0103n v&agrave; ngh\\u1ec9 t\\u1ea1i v\\u0103n  ph&ograve;ng th&igrave; b&acirc;y gi\\u1edd m&igrave;nh r\\u1ea5t th&iacute;ch h\\u1ecdc n\\u1ea5u \\u0103n v&igrave; v\\u1eeba gi&uacute;p gi\\u1ea3m stress l\\u1ea1i  \\u0111em \\u0111\\u1ebfn ni\\u1ec1m vui cho cu\\u1ed9c s\\u1ed1ng gia \\u0111&igrave;nh&rdquo;, ch\\u1ecb Ho&agrave;i n&oacute;i.<\\/span><\\/span><\\/p>\\r\\n<\\/div>\\r\\n<div style=\\"padding: 5px;\\"><span style=\\"font-family: verdana,geneva;\\"><strong>Ngu\\u1ed3n tin<\\/strong>: S&agrave;i G&ograve;n ti\\u1ebfp th\\u1ecb<\\/span><\\/div>","introtext":"\\r\\n\\u0102n  nhanh r\\u1ed3i ng\\u1ee7, \\u0111i c&agrave; ph&ecirc; v\\u1edbi b\\u1ea1n b&egrave;, shopping gi\\u1ebft th\\u1eddi gi\\u1edd&hellip; c&oacute; nhi\\u1ec1u  c&aacute;ch ngh\\u1ec9 tr\\u01b0a c\\u1ee7a gi\\u1edbi c&ocirc;ng ch\\u1ee9c v\\u0103n ph&ograve;ng. Tuy nhi&ecirc;n, th\\u1eddi gian g\\u1ea7n  \\u0111&acirc;y nhi\\u1ec1u ng\\u01b0\\u1eddi \\u0111&atilde; ch\\u1ecdn cho m&igrave;nh c&aacute;ch s\\u1eed d\\u1ee5ng th\\u1eddi gian ngh\\u1ec9 tr\\u01b0a b\\u1eb1ng  c&aacute;ch&hellip; kh&ocirc;ng ng\\u1ee7 tr\\u01b0a.\\r\\n\\r\\n\\r\\nNgh\\u1ec9 tr\\u01b0a b\\u1eb1ng c&aacute;ch th\\u01b0 gi&atilde;n v\\u1edbi yoga, salsa\\r\\nPhong  tr&agrave;o t\\u1eadp yoga \\u0111&atilde; lan r\\u1ed9ng \\u1edf TP.HCM, nh\\u01b0ng t\\u1eadp yoga v&agrave;o bu\\u1ed5i tr\\u01b0a th&igrave;  g\\u1ea7n \\u0111&acirc;y m\\u1edbi \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u ng\\u01b0\\u1eddi \\u0111\\u1ec3 &yacute; \\u0111\\u1ebfn. Anh Tr&igrave;nh, qu\\u1ea3n l&yacute; trung t&acirc;m D&aacute;ng  Ng\\u1ecdc cho bi\\u1ebft: &ldquo;Kh\\u1edfi \\u0111\\u1ea7u ...","modified":"{\\"1337222342\\":\\"1\\",\\"1337222344\\":\\"1\\",\\"1337227786\\":\\"1\\",\\"1337227791\\":\\"1\\",\\"1338536910\\":\\"1\\",\\"1338610026\\":\\"1\\",\\"1338622577\\":\\"1\\",\\"1338623519\\":\\"1\\",\\"1339031692\\":\\"1\\",\\"1339033233\\":\\"1\\",\\"1339055777\\":\\"1\\",\\"1339055861\\":\\"1\\"}","metadesc":" \\u0102n nhanh r\\u1ed3i ng\\u1ee7, \\u0111i c\\u00e0 ph\\u00ea v\\u1edbi b\\u1ea1n b\\u00e8, shopping gi\\u1ebft th\\u1eddi gi\\u1edd\\u2026 c\\u00f3 nhi\\u1ec1u c\\u00e1ch ngh\\u1ec9 tr\\u01b0a c\\u1ee7a gi\\u1edbi c\\u00f4ng ch\\u1ee9c v\\u0103n ph\\u00f2ng. Tuy nhi\\u00ean, th\\u1eddi gian ..."}', 1, 1337163133, 3);
INSERT INTO `tbl_article` (`id`, `lang`, `catid`, `type`, `status`, `special`, `order_view`, `title`, `alias`, `keyword`, `other`, `created_by`, `created_date`, `visits`) VALUES
(54, 'vi', 11, 2, 1, 0, 0, 'Test', 'test', '2', '{"introimage":"145","list_suggest":"","metadesc":"Test","fulltext":"&lt;div&gt;Ng\\u01b0\\u1eddi Italy \\u0111&amp;atilde; cho th\\u1ea5y h\\u1ecd kh&amp;ocirc;ng ph\\u1ea3i ch\\u1ec9 bi\\u1ebft tr&amp;ocirc;ng ch\\u1edd v&amp;agrave;o s\\u1ef1 gi&amp;uacute;p \\u0111\\u1ee1  c\\u1ee7a \\u0111\\u1ed9i b&amp;oacute;ng kh&amp;aacute;c khi t\\u1ef1 gi\\u1ea3i c\\u1ee9u ch&amp;iacute;nh m&amp;igrave;nh b\\u1eb1ng chi\\u1ebfn th\\u1eafng v&amp;ocirc; c&amp;ugrave;ng  quan tr\\u1ecdng tr\\u01b0\\u1edbc CH Ireland. \\u0110&amp;acirc;y m\\u1edbi l&amp;agrave; y\\u1ebfu t\\u1ed1 ch&amp;iacute;nh gi&amp;uacute;p Italy gi&amp;agrave;nh  quy\\u1ec1n v&amp;agrave;o t\\u1ee9 k\\u1ebft ch\\u1ee9 kh&amp;ocirc;ng ph\\u1ea3i b&amp;agrave;n th\\u1eafng mu\\u1ed9n c\\u1ee7a Jesus Navas trong  tr\\u1eadn \\u0111\\u1ea5u gi\\u1eefa T&amp;acirc;y Ban Nha v&amp;agrave; Croatia.&lt;\\/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;\\/div&gt;\\r\\n&lt;div&gt;\\u0110\\u1ed9i b&amp;oacute;ng thi&amp;ecirc;n thanh lu&amp;ocirc;n c&amp;oacute; truy\\u1ec1n th\\u1ed1ng kh\\u1edfi \\u0111\\u1ea7u ch\\u1eadm ch\\u1ea1p \\u1edf c&amp;aacute;c gi\\u1ea3i  \\u0111\\u1ea5u l\\u1edbn v&amp;agrave; Euro 2012 n&amp;agrave;y c\\u0169ng kh&amp;ocirc;ng ph\\u1ea3i ngo\\u1ea1i l\\u1ec7. B\\u01b0\\u1edbc v&amp;agrave;o l\\u01b0\\u1ee3t \\u0111\\u1ea5u  cu\\u1ed1i c&amp;ugrave;ng, Italy b\\u1ecb \\u0111\\u1ea9y v&amp;agrave;o t&amp;igrave;nh th\\u1ebf hi\\u1ec3m ngh&amp;egrave;o khi ch\\u1ec9 c&amp;oacute; 2 \\u0111i\\u1ec3m v&amp;agrave;  bu\\u1ed9c ph\\u1ea3i gi&amp;agrave;nh chi\\u1ebfn th\\u1eafng tr\\u01b0\\u1edbc Ireland \\u0111\\u1ec3 nu&amp;ocirc;i hy v\\u1ecdng v&amp;agrave;o v&amp;ograve;ng sau.  B&amp;ecirc;n c\\u1ea1nh \\u0111&amp;oacute;, h\\u1ecd c\\u0169ng tr&amp;ocirc;ng ch\\u1edd nh\\u1eefng nh&amp;agrave; \\u0111\\u01b0\\u01a1ng kim v&amp;ocirc; \\u0111\\u1ecbch T&amp;acirc;y Ban Nha  s\\u1ebd thi \\u0111\\u1ea5u h\\u1ebft m&amp;igrave;nh tr\\u01b0\\u1edbc Croatia. &amp;Aacute;m \\u1ea3nh l\\u1ecbch s\\u1eed khi\\u1ebfn ng\\u01b0\\u1eddi h&amp;acirc;m m\\u1ed9  c\\u0169ng nh\\u01b0 c&amp;aacute;c c\\u1ea7u th\\u1ee7 Italy lo ng\\u1ea1i v\\u1ec1 vi\\u1ec7c li&amp;ecirc;n minh T&amp;acirc;y Ban Nha v&amp;agrave;  Croatia c&amp;oacute; m\\u1ed9t tr\\u1eadn h&amp;ograve;a v\\u1edbi t\\u1ef7 s\\u1ed1 \\u0111\\u1ee7 \\u0111\\u1ec3 khi\\u1ebfn \\u0111\\u1ed9i b&amp;oacute;ng thi&amp;ecirc;n thanh ph\\u1ea3i  v\\u1ec1 n\\u01b0\\u1edbc. Nh\\u01b0ng m\\u1ecdi lo l\\u1eafng \\u0111&amp;atilde; \\u0111\\u01b0\\u1ee3c xua tan khi Italy th\\u1ec3 hi\\u1ec7n \\u0111\\u1eb3ng c\\u1ea5p  v&amp;agrave; b\\u1ea3n l\\u0129nh c\\u1ee7a m&amp;igrave;nh \\u0111&amp;uacute;ng l&amp;uacute;c, qua \\u0111&amp;oacute; t\\u1ef1 \\u0111\\u1ecbnh \\u0111o\\u1ea1t s\\u1ed1 ph\\u1eadn \\u1edf v&amp;ograve;ng b\\u1ea3ng  Euro n\\u0103m nay.&lt;\\/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;\\/div&gt;\\r\\n&lt;div&gt;\\r\\n&lt;table class=&quot;tplCaption&quot; style=&quot;width: 100%;&quot; border=&quot;0&quot; align=&quot;center&quot;&gt;\\r\\n&lt;tbody&gt;\\r\\n&lt;tr&gt;\\r\\n&lt;td&gt;&lt;img style=&quot;width: 479px; height: 351px;&quot; src=&quot;http:\\/\\/l.f1.img.vnexpress.net\\/2012\\/06\\/19\\/cassano-1340057802_480x0.jpg&quot; alt=&quot;&quot; \\/&gt;&lt;\\/td&gt;\\r\\n&lt;\\/tr&gt;\\r\\n&lt;tr&gt;\\r\\n&lt;td class=&quot;caption&quot;&gt;&lt;span&gt;Cassano v&amp;agrave; Pirlo ph\\u1ed1i h\\u1ee3p ghi b&amp;agrave;n m\\u1edf t\\u1ef7 s\\u1ed1 cho Italy.&lt;\\/span&gt;&lt;\\/td&gt;\\r\\n&lt;\\/tr&gt;\\r\\n&lt;\\/tbody&gt;\\r\\n&lt;\\/table&gt;\\r\\n&lt;\\/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;\\/div&gt;\\r\\n&lt;div&gt;M\\u1ecdi nh\\u1eadn \\u0111\\u1ecbnh tr\\u01b0\\u1edbc tr\\u1eadn \\u0111\\u1ea5u \\u0111\\u1ec1u cho r\\u1eb1ng \\u0111&amp;acirc;y s\\u1ebd l&amp;agrave; m\\u1ed9t tr\\u1eadn th\\u1eafng d\\u1ec5  c\\u1ee7a Italy khi CH Ireland \\u0111&amp;atilde; kh&amp;ocirc;ng c&amp;ograve;n m\\u1ee5c ti&amp;ecirc;u sau khi b\\u1ecb lo\\u1ea1i \\u1edf l\\u01b0\\u1ee3t  \\u0111\\u1ea5u tr\\u01b0\\u1edbc. Tuy nhi&amp;ecirc;n th\\u1ea7y tr&amp;ograve; Trapattoni kh&amp;ocirc;ng khi\\u1ebfn ng\\u01b0\\u1eddi h&amp;acirc;m m\\u1ed9 ph\\u1ea3i  th\\u1ea5t v\\u1ecdng khi nh\\u1eadp cu\\u1ed9c r\\u1ea5t quy\\u1ebft t&amp;acirc;m v&amp;agrave; khi\\u1ebfn cho Italy c&amp;oacute; 30 ph&amp;uacute;t \\u0111\\u1ea7u  b\\u1ebf t\\u1eafc ho&amp;agrave;n to&amp;agrave;n. Trong th\\u1ebf tr\\u1eadn nh\\u01b0 v\\u1eady, b\\u1ea5t ng\\u1edd \\u0111&amp;atilde; \\u0111\\u1ebfn t\\u1eeb m\\u1ed9t pha b&amp;oacute;ng  c\\u1ed1 \\u0111\\u1ecbnh khi Cassano b\\u1eadt cao \\u0111&amp;aacute;nh \\u0111\\u1ea7u l&amp;agrave;m tung l\\u01b0\\u1edbi Shay Given sau qu\\u1ea3  ph\\u1ea1t g&amp;oacute;c c\\u1ee7a Pirlo (&lt;a href=&quot;http:\\/\\/euro2012.vnexpress.net\\/video-euro\\/video-euro\\/ban-mo-ty-so-tran-italy-ireland-1724206.html?p=1&quot;&gt;&lt;strong&gt;xem clip&lt;\\/strong&gt;&lt;\\/a&gt;).  Hi\\u1ec7p hai c\\u0169ng di\\u1ec5n ra kh&amp;ocirc;ng c&amp;oacute; g&amp;igrave; kh&amp;aacute;c hi\\u1ec7p m\\u1ed9t. Hai \\u0111\\u1ed9i ch\\u01a1i quy\\u1ebft  li\\u1ec7t v\\u1edbi 6 th\\u1ebb v&amp;agrave;ng v&amp;agrave; 1 th\\u1ebb \\u0111\\u1ecf gi&amp;agrave;nh cho Keith Andrews b&amp;ecirc;n ph&amp;iacute;a CH  Ireland. Ph\\u1ea3i \\u0111\\u1ebfn ph&amp;uacute;t thi \\u0111\\u1ea5u ch&amp;iacute;nh th\\u1ee9c cu\\u1ed1i c&amp;ugrave;ng, Balotelli sau khi  v&amp;agrave;o s&amp;acirc;n t\\u1eeb b\\u0103ng gh\\u1ebf d\\u1ef1 b\\u1ecb \\u0111&amp;atilde; c&amp;oacute; c&amp;uacute; ng\\u1ea3 ng\\u01b0\\u1eddi m&amp;oacute;c b&amp;oacute;ng \\u0111\\u1eb3ng c\\u1ea5p \\u0111\\u1ec3 \\u1ea5n  \\u0111\\u1ecbnh t\\u1ef7 s\\u1ed1 2-0 cho Italy (&lt;a href=&quot;http:\\/\\/euro2012.vnexpress.net\\/video-euro\\/video-euro\\/ban-thang-thu-hai-tran-italy-ireland-1724210.html?p=1&quot;&gt;&lt;strong&gt;xem clip&lt;\\/strong&gt;&lt;\\/a&gt;).&lt;\\/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;\\/div&gt;\\r\\n&lt;div&gt;M\\u1ed9t chi\\u1ebfn th\\u1eafng kh&amp;ocirc;ng khi\\u1ebfn ng\\u01b0\\u1eddi h&amp;acirc;m m\\u1ed9 b\\u1ea5t ng\\u1edd nh\\u01b0ng \\u0111&amp;acirc;y th\\u1ef1c s\\u1ef1 l&amp;agrave;  m\\u1ed9t b\\u01b0\\u1edbc ngo\\u1eb7t quan tr\\u1ecdng v\\u1edbi Italy \\u1edf Euro n\\u0103m nay. K\\u1ec3 t\\u1eeb th&amp;aacute;ng 11 n\\u0103m  ngo&amp;aacute;i, Italy ch\\u01b0a t\\u1eebng \\u0111\\u01b0\\u1ee3c n\\u1ebfm m&amp;ugrave;i chi\\u1ebfn th\\u1eafng v&amp;agrave; k\\u1ebft qu\\u1ea3 c&amp;oacute; \\u0111\\u01b0\\u1ee3c trong  tr\\u1eadn \\u0111\\u1ea5u n&amp;agrave;y ngo&amp;agrave;i &amp;yacute; ngh\\u0129a \\u0111i\\u1ec3m s\\u1ed1 c&amp;ograve;n l&amp;agrave; m\\u1ed9t c&amp;uacute; h&amp;iacute;ch v\\u1ec1 m\\u1eb7t tinh th\\u1ea7n  v\\u1edbi th\\u1ea7y tr&amp;ograve; Prandelli. \\u0110\\u1eb7c bi\\u1ec7t, sau hai tr\\u1eadn \\u0111\\u1ea5u \\u0111\\u1ea7u ti&amp;ecirc;n khi h&amp;agrave;ng  ti\\u1ec1n \\u0111\\u1ea1o th\\u1ec3 hi\\u1ec7n m\\u1ed9t phong \\u0111\\u1ed9 ngh&amp;egrave;o n&amp;agrave;n v&amp;agrave; ph\\u1ea3i nh\\u1eadn r\\u1ea5t nhi\\u1ec1u ch\\u1ec9  tr&amp;iacute;ch th&amp;igrave; b\\u1ed9 \\u0111&amp;ocirc;i Cassano &amp;ndash; Balotelli \\u0111&amp;atilde; l&amp;ecirc;n ti\\u1ebfng \\u0111&amp;uacute;ng l&amp;uacute;c gi&amp;uacute;p Italy  ti\\u1ebfn v&amp;agrave;o t\\u1ee9 k\\u1ebft. Chi\\u1ebfn th\\u1eafng n&amp;agrave;y \\u0111&amp;atilde; gi&amp;uacute;p Italy gi\\u1ea3i quy\\u1ebft r\\u1ea5t nhi\\u1ec1u v\\u1ea5n  \\u0111\\u1ec1 v&amp;agrave; hy v\\u1ecdng h\\u1ecd s\\u1ebd ch\\u01a1i ng&amp;agrave;y c&amp;agrave;ng t\\u1ed1t h\\u01a1n \\u1edf nh\\u1eefng v&amp;ograve;ng \\u0111\\u1ea5u sau.&lt;\\/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;\\/div&gt;\\r\\n&lt;div&gt;Quay tr\\u1edf l\\u1ea1i tr\\u1eadn \\u0111\\u1ea5u gi\\u1eefa hai \\u0111\\u1ed9i \\u0111&amp;ecirc;m qua. CH Ireland sau khi b\\u1ecb lo\\u1ea1i \\u1edf  v&amp;ograve;ng \\u0111\\u1ea5u tr\\u01b0\\u1edbc \\u0111&amp;atilde; nh\\u1eadp cu\\u1ed9c m\\u1ed9t c&amp;aacute;ch r\\u1ea5t tho\\u1ea3i m&amp;aacute;i. Vi\\u1ec7c kh&amp;ocirc;ng c&amp;ograve;n &amp;aacute;p  l\\u1ef1c khi\\u1ebfn h\\u1ecd ch\\u01a1i b&amp;oacute;ng t\\u1ef1 tin h\\u01a1n r\\u1ea5t nhi\\u1ec1u so v\\u1edbi nh\\u1eefng g&amp;igrave; th\\u1ec3 hi\\u1ec7n  trong tr\\u1eadn \\u0111\\u1ea5u g\\u1eb7p Croatia hay T&amp;acirc;y Ban Nha. \\u0110\\u1ed9i b&amp;oacute;ng c\\u1ee7a Trapattoni gi\\u1eef  c\\u1ef1 ly \\u0111\\u1ed9i h&amp;igrave;nh h\\u1ee3p l&amp;yacute; v&amp;agrave; lu&amp;ocirc;n ch\\u1ee7 \\u0111\\u1ed9ng b\\u1eaft ng\\u01b0\\u1eddi ngay khi c&amp;oacute; th\\u1ec3. \\u0110i\\u1ec1u  n&amp;agrave;y khi\\u1ebfn Italy g\\u1eb7p kh&amp;oacute; kh\\u0103n trong vi\\u1ec7c ti\\u1ebfp c\\u1eadn khung th&amp;agrave;nh c\\u1ee7a Shay  Given. Trong h\\u01a1n n\\u1eeda ti\\u1ebfng \\u0111\\u1ed3ng h\\u1ed3 \\u0111\\u1ea7u ti&amp;ecirc;n, Pirlo c&amp;ugrave;ng \\u0111\\u1ed3ng \\u0111\\u1ed9i th\\u1ec3  hi\\u1ec7n s\\u1ef1 b\\u1ebf t\\u1eafc khi kh&amp;ocirc;ng c&amp;oacute; n\\u1ed5i m\\u1ed9t t&amp;igrave;nh hu\\u1ed1ng nguy hi\\u1ec3m n&amp;agrave;o v\\u1ec1 ph&amp;iacute;a \\u0111\\u1ed1i  ph\\u01b0\\u01a1ng ngo\\u1ea1i tr\\u1eeb nh\\u1eefng pha s&amp;uacute;t b&amp;oacute;ng c\\u1ea7u may c\\u1ee7a De Rossi hay  Balzaretti.&lt;\\/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;\\/div&gt;\\r\\n&lt;div&gt;Th\\u1ebf nh\\u01b0ng v&amp;agrave;o kho\\u1ea3ng th\\u1eddi gian 15 ph&amp;uacute;t cu\\u1ed1i hi\\u1ec7p m\\u1ed9t, Italy l\\u1ea1i c&amp;oacute; \\u0111\\u01b0\\u1ee3c  nh\\u1eefng t&amp;igrave;nh hu\\u1ed1ng nguy hi\\u1ec3m th\\u1ef1c s\\u1ef1. \\u0110\\u1ea7u ti&amp;ecirc;n l&amp;agrave; pha \\u0111i b&amp;oacute;ng r\\u1ea5t hay b&amp;ecirc;n  c&amp;aacute;nh tr&amp;aacute;i c\\u1ee7a Balzaretti tr\\u01b0\\u1edbc khi t\\u1ea1t v&amp;agrave;o v&amp;ograve;ng c\\u1ea5m cho Di Natale xoay  ng\\u01b0\\u1eddi d\\u1ee9t \\u0111i\\u1ec3m, \\u0111&amp;aacute;ng ti\\u1ebfc c&amp;uacute; s&amp;uacute;t c\\u1ee7a ti\\u1ec1n \\u0111\\u1ea1o Udinese \\u0111i tr&amp;uacute;ng ng\\u01b0\\u1eddi  trung v\\u1ec7 St. Ledger. Ngay sau \\u0111&amp;oacute;, ph&amp;uacute;t th\\u1ee9 34, Di Natale ti\\u1ebfp t\\u1ee5c c&amp;oacute; c\\u01a1  h\\u1ed9i khi tho&amp;aacute;t xu\\u1ed1ng \\u0111\\u1ed1i m\\u1eb7t v\\u1edbi Shay Given. Ti\\u1ec1n \\u0111\\u1ea1o Italy v\\u01b0\\u1ee3t qua \\u0111\\u01b0\\u1ee3c  th\\u1ee7 m&amp;ocirc;n Ireland nh\\u01b0ng c&amp;uacute; s&amp;uacute;t t\\u1eeb s&amp;aacute;t \\u0111\\u01b0\\u1eddng bi&amp;ecirc;n ngang sau \\u0111&amp;oacute; c\\u1ee7a anh \\u0111&amp;atilde;  b\\u1ecb Richard Dunne ph&amp;aacute; ra.&lt;\\/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;\\/div&gt;\\r\\n&lt;div&gt;S\\u1ee9c &amp;eacute;p d\\u1ed3n d\\u1eadp c\\u1ee7a Italy cu\\u1ed1i c&amp;ugrave;ng c\\u0169ng \\u0111&amp;atilde; mang l\\u1ea1i hi\\u1ec7u qu\\u1ea3. Ph&amp;uacute;t 35,  t\\u1eeb pha \\u0111&amp;aacute; ph\\u1ea1t g&amp;oacute;c c\\u1ee7a Pirlo b&amp;ecirc;n c&amp;aacute;nh tr&amp;aacute;i, Cassano b\\u1eadt cao \\u0111&amp;aacute;nh \\u0111\\u1ea7u \\u0111\\u01b0a  b&amp;oacute;ng ch\\u1ea1m m&amp;eacute;p d\\u01b0\\u1edbi x&amp;agrave; ngang khung th&amp;agrave;nh CH Ireland r\\u1ed3i l\\u0103n qua v\\u1ea1ch v&amp;ocirc;i  tr\\u01b0\\u1edbc khi b\\u1ecb Damien Duff ph&amp;aacute; ra. Tr\\u1ecdng t&amp;agrave;i \\u0111&amp;atilde; ch&amp;iacute;nh x&amp;aacute;c khi c&amp;ocirc;ng nh\\u1eadn  b&amp;agrave;n th\\u1eafng n&amp;agrave;y cho Italy v&amp;agrave; Cassano c&amp;oacute; pha l\\u1eadp c&amp;ocirc;ng \\u0111\\u01b0a Italy d\\u1eabn 1-0  tr\\u01b0\\u1edbc khi hi\\u1ec7p m\\u1ed9t k\\u1ebft th&amp;uacute;c.&lt;\\/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;\\/div&gt;\\r\\n&lt;div&gt;K\\u1ecbch b\\u1ea3n hi\\u1ec7p hai c\\u0169ng t\\u01b0\\u01a1ng t\\u1ef1 nh\\u01b0 hi\\u1ec7p m\\u1ed9t. Italy l&amp;agrave; \\u0111\\u1ed9i ch\\u01a1i &amp;eacute;p s&amp;acirc;n  trong nh\\u1eefng ph&amp;uacute;t \\u0111\\u1ea7u ti&amp;ecirc;n v\\u1edbi nh\\u1eefng pha d\\u1ee9t \\u0111i\\u1ec3m c\\u1ee7a Di Natale, De Rossi  hay Marchisio. Tuy nhi&amp;ecirc;n t\\u1ea5t c\\u1ea3 \\u0111\\u1ec1u thi\\u1ebfu ch&amp;iacute;nh x&amp;aacute;c ho\\u1eb7c kh&amp;ocirc;ng \\u0111\\u1ee7 kh&amp;oacute;  \\u0111\\u1ec3 \\u0111&amp;aacute;nh b\\u1ea1i Shay Given.&lt;\\/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;\\/div&gt;\\r\\n&lt;div&gt;Sau kho\\u1ea3ng th\\u1eddi gian \\u0111\\u1ea7u hi\\u1ec7p hai, HLV Trapattoni b\\u1eaft \\u0111\\u1ea7u c&amp;oacute; nh\\u1eefng s\\u1ef1  thay \\u0111\\u1ed5i nh\\u1eb1m t\\u0103ng c\\u01b0\\u1eddng h&amp;agrave;ng c&amp;ocirc;ng khi tung th&amp;ecirc;m m\\u1ed9t ti\\u1ec1n \\u0111\\u1ea1o l&amp;agrave; Shane  Long v&amp;agrave;o s&amp;acirc;n. C&amp;ugrave;ng v\\u1edbi vi\\u1ec7c Italy ch\\u1ee7 \\u0111\\u1ed9ng ch\\u01a1i ch\\u1eadm, CH Ireland l&amp;uacute;c n&amp;agrave;y  m\\u1edbi l&amp;agrave; \\u0111\\u1ed9i c&amp;oacute; th\\u1eddi l\\u01b0\\u1ee3ng ki\\u1ec3m so&amp;aacute;t b&amp;oacute;ng nhi\\u1ec1u h\\u01a1n. H\\u1ecd c&amp;oacute; c\\u01a1 h\\u1ed9i v\\u1edbi hai  pha s&amp;uacute;t b&amp;oacute;ng t\\u1eeb ngo&amp;agrave;i v&amp;ograve;ng c\\u1ea5m c\\u1ee7a Keith Andrews nh\\u01b0ng \\u0111\\u1ec1u kh&amp;ocirc;ng th\\u1eafng  \\u0111\\u01b0\\u1ee3c Buffon. Trong khi \\u0111&amp;oacute; b&amp;ecirc;n ph&amp;aacute;i Italy, Pirlo c\\u0169ng c&amp;oacute; \\u0111\\u01b0\\u1ee3c hai t&amp;igrave;nh  hu\\u1ed1ng s&amp;uacute;t ph\\u1ea1t \\u1edf v\\u1ecb tr&amp;iacute; kh&amp;aacute; thu\\u1eadn l\\u1ee3i, \\u0111&amp;aacute;ng ti\\u1ebfc l&amp;agrave; ti\\u1ec1n v\\u1ec7 c\\u1ee7a Juve \\u0111\\u01b0a  b&amp;oacute;ng \\u0111i thi\\u1ebfu ch&amp;iacute;nh x&amp;aacute;c.&lt;\\/div&gt;\\r\\n&lt;div&gt;&amp;nbsp;&lt;\\/div&gt;\\r\\n&lt;div&gt;V\\u01b0\\u1ee3t qua CH Ireland m\\u1ed9t c&amp;aacute;ch thuy\\u1ebft ph\\u1ee5c, Italy \\u0111&amp;atilde; ch\\u1ee9ng minh m&amp;igrave;nh l&amp;agrave;  m\\u1ed9t th&amp;aacute;ch th\\u1ee9c th\\u1ef1c s\\u1ef1 cho b\\u1ea5t c\\u1ee9 \\u0111\\u1ed9i b&amp;oacute;ng n&amp;agrave;o \\u1edf Euro n\\u0103m nay. Nh\\u1ea5t l&amp;agrave;  khi b\\u1ed9 \\u0111&amp;ocirc;i ti\\u1ec1n \\u0111\\u1ea1o Cassano v&amp;agrave; Balotelli \\u0111&amp;atilde; th&amp;ocirc;ng n&amp;ograve;ng, \\u0111o&amp;agrave;n qu&amp;acirc;n thi&amp;ecirc;n  thanh s\\u1eb5n s&amp;agrave;ng \\u0111&amp;oacute;n ti\\u1ebfp m\\u1ecdi \\u0111\\u1ed1i th\\u1ee7. Tr\\u1eadn t\\u1ee9 k\\u1ebft c\\u1ee7a Italy s\\u1ebd di\\u1ec5n ra  v&amp;agrave;o \\u0111&amp;ecirc;m ng&amp;agrave;y 24\\/6 t\\u1edbi \\u0111&amp;acirc;y v&amp;agrave; r\\u1ea5t c&amp;oacute; th\\u1ec3 h\\u1ecd s\\u1ebd ph\\u1ea3i ch\\u1ea1m tr&amp;aacute;n m\\u1ed9t trong  hai &amp;ocirc;ng l\\u1edbn l&amp;agrave; Anh ho\\u1eb7c Ph&amp;aacute;p.&lt;\\/div&gt;","introtext":"Ng\\u01b0\\u1eddi Italy \\u0111\\u00e3 cho th\\u1ea5y h\\u1ecd kh\\u00f4ng ph\\u1ea3i ch\\u1ec9 bi\\u1ebft tr\\u00f4ng ch\\u1edd v\\u00e0o s\\u1ef1 gi\\u00fap \\u0111\\u1ee1 c\\u1ee7a \\u0111\\u1ed9i b\\u00f3ng kh\\u00e1c khi t\\u1ef1 gi\\u1ea3i c\\u1ee9u ch\\u00ednh m\\u00ecnh b\\u1eb1ng chi\\u1ebfn th\\u1eafng v\\u00f4 c\\u00f9ng quan tr\\u1ecdng tr\\u01b0\\u1edbc CH Ireland. \\u0110\\u00e2y m\\u1edbi l\\u00e0 y\\u1ebfu t\\u1ed1 ch\\u00ednh gi\\u00fap Italy gi\\u00e0nh quy\\u1ec1n v\\u00e0o t\\u1ee9 k\\u1ebft ch\\u1ee9 kh\\u00f4ng ph\\u1ea3i b\\u00e0n th\\u1eafng mu\\u1ed9n c\\u1ee7a Jesus Navas trong tr\\u1eadn \\u0111\\u1ea5u gi\\u1eefa T\\u00e2y Ban Nha v\\u00e0 Croatia. \\u00a0 \\u0110\\u1ed9i b\\u00f3ng thi\\u00ean thanh lu\\u00f4n c\\u00f3 truy\\u1ec1n th\\u1ed1ng kh\\u1edfi \\u0111\\u1ea7u ch\\u1eadm ch\\u1ea1p \\u1edf c\\u00e1c gi\\u1ea3i \\u0111\\u1ea5u l\\u1edbn v\\u00e0 Euro 2012 n\\u00e0y c\\u0169ng kh\\u00f4ng ph\\u1ea3i ngo\\u1ea1i l\\u1ec7. B\\u01b0\\u1edbc v\\u00e0o l\\u01b0\\u1ee3t \\u0111\\u1ea5u cu\\u1ed1i c\\u00f9ng, ...","modified":"{\\"1340070573\\":\\"1\\"}"}', 3, 1339392419, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE IF NOT EXISTS `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(11) NOT NULL,
  `lang` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'vi',
  `alias` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `special` tinyint(4) DEFAULT NULL,
  `order_view` smallint(6) NOT NULL,
  `keyword` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `type`, `lang`, `alias`, `name`, `parent_id`, `special`, `order_view`, `keyword`, `other`, `created_by`, `created_date`) VALUES
(1, 3, 'vi', 'vietnam', 'Vietnam', 0, 1, 3, '', '{"introimage":"","description":"","metadesc":"","modified":"{\\"1339668473\\":\\"1\\"}"}', 1, 1339668362),
(2, 3, 'vi', 'english', 'English', 0, 1, 1, '', '{"introimage":"","description":"","metadesc":"","modified":"{\\"1339668473\\":\\"1\\"}"}', 1, 1339668368),
(3, 3, 'vi', 'german', 'German', 0, 1, 2, '', '{"introimage":"","description":"","metadesc":"","modified":"{\\"1339668473\\":\\"1\\"}"}', 1, 1339668372),
(4, 3, 'vi', 'south-africa', 'South Africa', 0, 1, 4, '', '{"description":"","metadesc":""}', 1, 1339669096),
(6, 3, 'vi', 'thailand', 'Thailand', 0, 1, 5, '', '{"description":"","metadesc":""}', 1, 1339669409);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_exam`
--

CREATE TABLE IF NOT EXISTS `tbl_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `office_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `test_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` int(11) NOT NULL,
  `finish_time` int(11) NOT NULL,
  `other` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_exam`
--

INSERT INTO `tbl_exam` (`id`, `status`, `office_id`, `type`, `test_id`, `start_time`, `finish_time`, `other`, `created_by`, `created_date`, `title`) VALUES
(6, 1, 6, 3, '18', 1340060400, 1340321280, '{"list_users":"[\\"3\\",\\"1\\",\\"4\\",\\"5\\"]","modified":"{\\"1339820604\\":null,\\"1339820609\\":null,\\"1339820611\\":null,\\"1339820700\\":null,\\"1339820737\\":null,\\"1339821125\\":null,\\"1339831443\\":\\"1\\",\\"1339831639\\":\\"1\\",\\"1339831800\\":\\"1\\",\\"1339831804\\":\\"1\\",\\"1339831806\\":\\"1\\",\\"1339838270\\":\\"1\\",\\"1340188653\\":null,\\"1340188707\\":null,\\"1340188709\\":null,\\"1340188717\\":null,\\"1340188744\\":null,\\"1340243697\\":null,\\"1340243737\\":\\"1\\",\\"1340252488\\":\\"1\\",\\"1340254070\\":\\"1\\",\\"1340254071\\":\\"1\\",\\"1340269556\\":\\"1\\"}"}', 1, 1339820591, 'Test 06/21/2012 Thailand'),
(7, 1, 3, 3, '19', 1339889220, 1340503200, '{"list_users":"[\\"3\\",\\"1\\"]","modified":"{\\"1340188636\\":null,\\"1340253966\\":\\"1\\",\\"1340253967\\":\\"1\\",\\"1340253984\\":\\"1\\",\\"1340254084\\":\\"1\\",\\"1340267783\\":\\"1\\",\\"1340267799\\":\\"1\\"}"}', 1, 1339823526, 'Test 06/21/2012 VietNam');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_image`
--

CREATE TABLE IF NOT EXISTS `tbl_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `title` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `parent_attribute` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(4) NOT NULL DEFAULT '0',
  `src` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_language`
--

CREATE TABLE IF NOT EXISTS `tbl_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `translation` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=98 ;

--
-- Dumping data for table `tbl_language`
--

INSERT INTO `tbl_language` (`id`, `lang`, `origin`, `translation`, `category`, `module`, `controller`, `action`) VALUES
(1, 'en', 'Update successfully', '', '', '', 'markingUpSkill', 'update'),
(2, 'en', 'Marking-up', '', '', '', 'markingUpSkill', 'update'),
(3, 'en', 'Marking-up Level', '', '', '', 'markingUpSkill', 'update'),
(4, 'en', 'List tests', '', '', '', 'markingUpSkill', 'update'),
(5, 'en', 'Add new test marking-up final', '', '', '', 'markingUpSkill', 'update'),
(6, 'en', 'Add new test marking-up level', '', '', '', 'markingUpSkill', 'update'),
(7, 'en', 'Test title', '', '', '', 'markingUpSkill', 'update'),
(8, 'en', 'List questions', '', '', '', 'markingUpSkill', 'update'),
(9, 'en', 'Question', '', '', '', 'markingUpSkill', 'update'),
(10, 'en', 'Title', '', '', '', 'markingUpSkill', 'update'),
(11, 'en', 'File', '', '', '', 'markingUpSkill', 'update'),
(12, 'en', 'Add question', '', '', '', 'markingUpSkill', 'update'),
(13, 'en', 'Update', '', '', '', 'markingUpSkill', 'update'),
(14, 'en', 'Marking-up', '', '', '', 'markingUpSkill', 'create'),
(15, 'en', 'Marking-up Level', '', '', '', 'markingUpSkill', 'create'),
(16, 'en', 'Add new test marking-up level', '', '', '', 'markingUpSkill', 'create'),
(17, 'en', 'List tests', '', '', '', 'markingUpSkill', 'create'),
(18, 'en', 'Test title', '', '', '', 'markingUpSkill', 'create'),
(19, 'en', 'List questions', '', '', '', 'markingUpSkill', 'create'),
(20, 'en', 'Question', '', '', '', 'markingUpSkill', 'create'),
(21, 'en', 'Title', '', '', '', 'markingUpSkill', 'create'),
(22, 'en', 'File', '', '', '', 'markingUpSkill', 'create'),
(23, 'en', 'Add question', '', '', '', 'markingUpSkill', 'create'),
(24, 'en', 'Create', '', '', '', 'markingUpSkill', 'create'),
(25, 'en', 'Add new test marking-up final', '', '', '', 'markingUpSkill', 'create'),
(26, 'en', 'Update', '', '', '', 'markingUpSkill', 'create'),
(27, 'en', 'List test Marking-up', '', '', '', 'markingUpSkill', 'index'),
(28, 'en', 'Add new test marking-up final', '', '', '', 'markingUpSkill', 'index'),
(29, 'en', 'Add new test marking-up level', '', '', '', 'markingUpSkill', 'index'),
(30, 'en', 'Status', '', '', '', 'markingUpSkill', 'index'),
(31, 'en', 'Change status', '', '', '', 'markingUpSkill', 'index'),
(32, 'en', 'Tools', '', '', '', 'markingUpSkill', 'index'),
(33, 'en', 'Are you sure that you want to delete the test?', '', '', '', 'markingUpSkill', 'index'),
(34, 'en', 'Delete succcessfully', '', '', '', 'markingUpSkill', 'index'),
(35, 'en', 'Edit', '', '', '', 'markingUpSkill', 'index'),
(36, 'en', 'Delete', '', '', '', 'markingUpSkill', 'index'),
(37, 'en', 'Copy', '', '', '', 'markingUpSkill', 'index'),
(38, 'en', 'tests', '', '', '', 'markingUpSkill', 'index'),
(39, 'en', 'Choise level', '', '', '', 'markingUpSkill', 'create'),
(40, 'en', 'Level', '', '', '', 'markingUpSkill', 'create'),
(41, 'en', 'Choise level', '', '', '', 'markingUpSkill', 'update'),
(42, 'en', 'Level', '', '', '', 'markingUpSkill', 'update'),
(43, 'en', 'Trang thông báo lỗi', '', 'layout', '', '', ''),
(44, 'en', 'List results', '', '', '', 'exam', 'index'),
(45, 'en', 'Add new result', '', '', '', 'exam', 'index'),
(46, 'en', 'Search', '', '', '', 'exam', 'index'),
(47, 'en', 'Status', '', '', '', 'exam', 'index'),
(48, 'en', 'Change status', '', '', '', 'exam', 'index'),
(49, 'en', 'Tools', '', '', '', 'exam', 'index'),
(50, 'en', 'Are you sure that you want to delete the result?', '', '', '', 'exam', 'index'),
(51, 'en', 'Delete succcessfully', '', '', '', 'exam', 'index'),
(52, 'en', 'Edit', '', '', '', 'exam', 'index'),
(53, 'en', 'Delete', '', '', '', 'exam', 'index'),
(54, 'en', 'Copy', '', '', '', 'exam', 'index'),
(55, 'en', 'results', '', '', '', 'exam', 'index'),
(56, 'en', 'List exams', '', '', '', 'exam', 'update'),
(57, 'en', 'Add new exam', '', '', '', 'exam', 'update'),
(58, 'en', 'Select', '', '', '', 'exam', 'update'),
(59, 'en', 'Add', '', '', '', 'exam', 'update'),
(60, 'en', 'Remove', '', '', '', 'exam', 'update'),
(61, 'en', 'Update successfully', '', '', '', 'exam', 'update'),
(62, 'en', 'Tools', '', '', '', 'news', 'index'),
(63, 'en', 'Tools', '', '', '', 'user', 'index'),
(64, 'en', 'List exams', '', '', '', 'result', 'index'),
(65, 'en', 'Add new exam', '', '', '', 'result', 'index'),
(66, 'en', 'Search', '', '', '', 'result', 'index'),
(67, 'en', 'List exams', '', '', '', 'exam', 'create'),
(68, 'en', 'Select', '', '', '', 'exam', 'create'),
(69, 'en', 'Add', '', '', '', 'exam', 'create'),
(70, 'en', 'Remove', '', '', '', 'exam', 'create'),
(71, 'en', 'List exams', '', '', '', 'exam', 'index'),
(72, 'en', 'Add new exam', '', '', '', 'exam', 'index'),
(73, 'en', 'Are you sure that you want to delete the exam?', '', '', '', 'exam', 'index'),
(74, 'en', 'exams', '', '', '', 'exam', 'index'),
(75, 'en', 'Tools', '', '', '', 'result', 'index'),
(76, 'en', 'Are you sure that you want to delete the exam?', '', '', '', 'result', 'index'),
(77, 'en', 'Delete succcessfully', '', '', '', 'result', 'index'),
(78, 'en', 'Delete', '', '', '', 'result', 'index'),
(79, 'en', 'exams', '', '', '', 'result', 'index'),
(80, 'en', 'Finish', '', '', '', 'exam', 'view'),
(81, 'en', 'Test guide', '', '', '', 'markingUpSkill', 'update'),
(82, 'en', 'Finish', '', '', '', 'exam', 'store'),
(83, 'en', 'Status', '', '', '', 'result', 'index'),
(84, 'en', 'Change status', '', '', '', 'result', 'index'),
(85, 'en', 'Edit', '', '', '', 'result', 'index'),
(86, 'en', 'Copy', '', '', '', 'result', 'index'),
(87, 'en', 'List results', '', '', '', 'result', 'index'),
(88, 'en', 'List exams', '', '', '', 'result', 'list'),
(89, 'en', 'Add new exam', '', '', '', 'result', 'list'),
(90, 'en', 'Search', '', '', '', 'result', 'list'),
(91, 'en', 'Tools', '', '', '', 'result', 'list'),
(92, 'en', 'Are you sure that you want to delete the exam?', '', '', '', 'result', 'list'),
(93, 'en', 'Delete succcessfully', '', '', '', 'result', 'list'),
(94, 'en', 'Delete', '', '', '', 'result', 'list'),
(95, 'en', 'exams', '', '', '', 'result', 'list'),
(96, 'en', 'List results', '', '', '', 'result', 'list'),
(97, 'en', 'View results', '', '', '', 'result', 'index');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material`
--

CREATE TABLE IF NOT EXISTS `tbl_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  `content` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_material`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE IF NOT EXISTS `tbl_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `order_view` smallint(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `other` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=53 ;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `type`, `name`, `parent_id`, `order_view`, `status`, `other`, `created_by`, `created_date`) VALUES
(1, 1, 'Home', 0, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390251),
(2, 1, 'Language Skills', 0, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390275),
(3, 1, 'Introduction', 2, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390286),
(4, 1, 'Final Test', 2, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390292),
(5, 1, 'Knowledge Skills', 0, 3, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390312),
(6, 1, 'Western Europe', 5, 1, 0, '{"controller":"product","action":"index","description":"","params":"","modified":"{\\"1339390336\\":\\"1\\"}"}', 1, 1339390330),
(7, 1, 'Eastern Europe', 5, 2, 0, '{"controller":"product","action":"index","description":"","params":"","modified":"{\\"1339390369\\":\\"1\\"}"}', 1, 1339390360),
(8, 1, 'ZA', 5, 3, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390384),
(9, 1, 'Vietnam', 5, 4, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390394),
(10, 1, 'USA', 5, 5, 0, '{"controller":"product","action":"index","description":"","params":"","modified":"{\\"1339390406\\":\\"1\\"}"}', 1, 1339390399),
(11, 1, 'Coding', 0, 4, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390416),
(12, 1, 'Profile/Branch Coding', 11, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390432),
(13, 1, 'Cookbox/Info', 12, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390447),
(14, 1, 'Training', 12, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390473),
(15, 1, 'General Test', 14, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390618),
(16, 1, 'Protagonists', 14, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390648),
(17, 1, 'Topics', 14, 3, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390662),
(18, 1, 'Ratings', 14, 4, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390670),
(19, 1, 'Area & Time', 14, 5, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390686),
(20, 1, 'Validation Test', 12, 3, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390702),
(21, 1, 'Datail Coding', 11, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390735),
(22, 1, 'Cookbox/Info', 21, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390749),
(23, 1, 'Training', 21, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390758),
(24, 1, 'Allianz', 23, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390773),
(25, 1, 'Bundesbank', 23, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390798),
(26, 1, 'Analysten', 23, 3, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390830),
(27, 1, 'Info', 24, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390869),
(28, 1, 'Protagonists', 24, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390948),
(29, 1, 'Topics', 24, 3, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339390999),
(30, 1, 'Ratings & Source', 24, 4, 0, '{"controller":"product","action":"index","description":"","params":"","modified":"{\\"1339391033\\":\\"1\\"}"}', 1, 1339391025),
(31, 1, 'Validation Test', 21, 3, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391071),
(32, 1, 'Test by Training', 31, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391100),
(33, 1, 'Allianz 1', 31, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391119),
(34, 1, 'Allianz 2', 31, 3, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391134),
(35, 1, 'Marking up', 0, 5, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391169),
(36, 1, 'Introduction', 35, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391183),
(37, 1, 'Test Level', 35, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391195),
(38, 1, 'Final Test', 35, 3, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391209),
(39, 1, 'Validation Test', 0, 6, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391217),
(40, 1, 'Trainer', 0, 7, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391234),
(41, 1, 'New', 40, 1, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391244),
(42, 1, 'Medium', 40, 2, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391253),
(43, 1, 'Advance', 40, 3, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391265),
(44, 1, 'Manager', 0, 8, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391292),
(45, 1, 'Administrator', 0, 9, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391315),
(46, 1, 'System', 0, 10, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391325),
(47, 1, 'Log activities', 46, 1, 0, '{"controller":"product","action":"index","description":"","params":"","modified":"{\\"1339391353\\":\\"1\\"}"}', 1, 1339391346),
(48, 1, 'Guide', 0, 11, 0, '{"controller":"product","action":"index","description":"","params":""}', 1, 1339391365),
(49, 1, 'Guide for Trainer', 48, 2, 0, '{"controller":"product","action":"index","description":"","params":"","modified":"{\\"1339391424\\":\\"1\\"}"}', 1, 1339391379),
(50, 1, 'Guide for Manager', 48, 3, 0, '{"controller":"product","action":"index","description":"","params":"","modified":"{\\"1339391424\\":\\"1\\"}"}', 1, 1339391390),
(51, 1, 'Guide for Employee', 48, 1, 0, '{"controller":"product","action":"index","description":"","params":"","modified":"{\\"1339391424\\":\\"1\\"}"}', 1, 1339391409),
(52, 1, 'Guide for Administrator', 48, 4, 0, '{"controller":"product","action":"index","description":"","params":"","modified":"{\\"1339391424\\":\\"1\\"}"}', 1, 1339391418);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question`
--

CREATE TABLE IF NOT EXISTS `tbl_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `type` smallint(6) NOT NULL,
  `material_id` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=66 ;

--
-- Dumping data for table `tbl_question`
--

INSERT INTO `tbl_question` (`id`, `status`, `type`, `material_id`, `level`, `title`, `content`, `answer`, `other`, `created_by`, `created_date`) VALUES
(1, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,0,1,0]', '0', 1, 1339571416),
(2, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,0,1,1]', '0', 1, 1339571462),
(3, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,1,0,0]', '0', 1, 1339571882),
(4, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,1,0,1]', '0', 1, 1339571996),
(5, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,1,0,0]', '0', 1, 1339572259),
(6, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,1,0,0]', '0', 1, 1339572586),
(7, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,0,1,0,1]', '0', 1, 1339572650),
(8, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,1,0,1]', '0', 1, 1339573557),
(9, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,1,1,0]', '0', 1, 1339575781),
(10, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,0,1,0]', '0', 1, 1339575852),
(11, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,0,1]', '0', 1, 1339576644),
(12, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,1,0]', '0', 1, 1339576689),
(13, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,1,1,0,0]', '0', 1, 1339576812),
(14, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,1,0,0]', '0', 1, 1339579619),
(15, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,0,1]', '0', 1, 1339579639),
(16, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,1,0]', '0', 1, 1339580691),
(17, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,1,1,0,0]', '0', 1, 1339581917),
(18, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,1,0,1,0]', '{"supplement":"link"}', 1, 1339582015),
(19, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,0,1,0]', '{"supplement":"link"}', 1, 1339582789),
(20, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,1,1,0]', '{"supplement":"link"}', 1, 1339583370),
(21, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,1,0]', '{"supplement":"link"}', 1, 1339584973),
(22, 0, 1, 0, 0, 'Title 4', '["A","B","C","D","E"]', '[1,0,0,1,0]', '{"supplement":"link4"}', 1, 1339584998),
(23, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,1,1]', '{"supplement":"link"}', 1, 1339636724),
(24, 0, 1, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,0,1,0]', '{"supplement":"link"}', 1, 1339636740),
(25, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,0,1]', '{"supplement":"link"}', 1, 1339642479),
(26, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,0,1]', '{"supplement":"link"}', 1, 1339642496),
(27, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,0,1]', '{"supplement":"link"}', 1, 1339643070),
(28, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,0,1,1,0]', '{"supplement":"link"}', 1, 1339643086),
(29, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,1,0]', '{"supplement":"link"}', 1, 1339648122),
(30, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,0,1]', '{"supplement":"link"}', 1, 1339648163),
(31, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,0,0,1,1]', '{"supplement":"link"}', 1, 1339648184),
(32, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,0,0,1]', '{"supplement":"link"}', 1, 1339651591),
(33, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[1,0,1,1,0]', '{"supplement":"link"}', 1, 1339664626),
(34, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,0,0,1,1]', '{"supplement":"link4"}', 1, 1339664640),
(35, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,0,0,1]', '{"supplement":"link"}', 1, 1339666282),
(36, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,0,1,1,0]', '{"supplement":"link"}', 1, 1339666296),
(38, 0, 3, 0, 0, 'TỨ BẤT TỬ gồm những ai?', '["Th\\u00e1nh M\\u1eabu Li\\u1ec5u H\\u1ea1nh","H\\u01b0ng \\u0110\\u1ea1o V\\u01b0\\u01a1ng","L\\u1ea1c Long Qu\\u00e2n","Ch\\u1eed \\u0110\\u1ed3ng T\\u1eed","L\\u00fd Th\\u01b0\\u1eddng Ki\\u1ec7t"]', '[1,0,1,1,0]', '{"modified":"{\\"1340256085\\":\\"1\\",\\"1340256095\\":\\"1\\",\\"1340256099\\":\\"1\\",\\"1340256102\\":\\"1\\"}"}', 1, 1339666731),
(39, 0, 3, 0, 0, 'Câu hỏi 1', '["L\\u1ef1a ch\\u1ecdn 1","L\\u1ef1a ch\\u1ecdn 2","L\\u1ef1a ch\\u1ecdn 3","L\\u1ef1a ch\\u1ecdn 4"]', '[0,0,1,1]', '{"supplement":"link file tham kh\\u1ea3o"}', 1, 1340074757),
(40, 0, 3, 0, 0, 'Nhân vật nào trong những nhân vật dưới đây được dân gian tôn là Tứ Bất Tử', '["Th\\u00e1nh Gi\\u00f3ng","L\\u1ea1c Long Qu\\u00e2n","Tr\\u1ea7n H\\u01b0ng \\u0110\\u1ea1o","C\\u00f4ng ch\\u00faa Li\\u1ec5u H\\u1ea1nh","Tr\\u1ea5n V\\u0169","Ch\\u1eed \\u0110\\u1ed3ng T\\u1eed"]', '[1,0,0,1,0,1]', '{"supplement":"link"}', 1, 1340075788),
(41, 0, 3, 0, 0, 'Hồ Chí Minh đọc tuyên ngôn độc lập vào ngày tháng năm nào?', '["2\\/4\\/1946","2\\/9\\/1945","3\\/5\\/1944","19\\/5\\/1954","Tri\\u1ec7u Vi\\u1ec7t V\\u01b0\\u01a1ng"]', '[0,1,0,0,0]', '{"supplement":"link","modified":"{\\"1340103439\\":\\"1\\",\\"1340103443\\":\\"1\\",\\"1340103447\\":\\"1\\",\\"1340103454\\":\\"1\\"}"}', 1, 1340103426),
(42, 0, 3, 0, 0, 'Đức đã vô định WC bao nhiêu lần?', '["1","2","3","4","Tri\\u1ec7u Vi\\u1ec7t V\\u01b0\\u01a1ng"]', '[0,0,1,0,0]', '{"supplement":"","modified":"{\\"1340103527\\":\\"1\\"}"}', 1, 1340103515),
(44, 0, 3, 0, 0, 'Cộng đồng ASEAN gồm bao nhiêu nước?', '["8","9","10","11"]', '[0,0,1,0]', '{"supplement":""}', 1, 1340155589),
(46, 0, 3, 0, 0, 'Bản Tuyên Ngôn Độc Lập được Hồ Chí Minh đọc ở đâu?', '["H\\u1ed9i tr\\u01b0\\u1eddng Ba \\u0110\\u00ecnh","Qu\\u1ea3ng tr\\u01b0\\u1eddng Ba \\u0110\\u00ecnh","Nh\\u00e0 h\\u00e1t l\\u1edbn"]', '[0,1,0]', '{"supplement":"link","modified":"{\\"1340159825\\":null,\\"1340160308\\":null,\\"1340178876\\":null,\\"1340179051\\":null,\\"1340179636\\":null}"}', 1, 1340155733),
(48, 0, 3, 0, 0, 'Thăng Long là tên cũ của thành phố nào?', '["H\\u1ea3i Ph\\u00f2ng","Qu\\u1ea3ng Ninh","S\\u00e0i G\\u00f2n","H\\u00e0 N\\u1ed9i","B\\u1eafc Ninh"]', '[0,0,0,1,0]', '{"supplement":"link","modified":"{\\"1340163246\\":null}"}', 1, 1340163193),
(50, 0, 3, 0, 0, 'Ông cha ta có câu ', '["31","35","36","39"]', '[0,0,1,0]', '{"supplement":"link","modified":"{\\"1340179100\\":null,\\"1340179109\\":null}"}', 1, 1340179022),
(51, 0, 3, 0, 0, 'Hà Nôi ... phố phường', '["35","36","37","38"]', '[0,1,0,0]', '{"supplement":"link","modified":"{\\"1340179803\\":null,\\"1340179831\\":null,\\"1340179832\\":null,\\"1340179834\\":null,\\"1340184987\\":null,\\"1340184992\\":null,\\"1340185027\\":null,\\"1340185059\\":null,\\"1340187588\\":null,\\"1340187591\\":null,\\"1340187594\\":null,\\"1340187595\\":null}"}', 1, 1340179789),
(52, 0, 3, 0, 0, 'IHB Việt Nam thành lập năm nào?', '["2010","2011","2012","2013","2014"]', '[0,0,1,0,0]', '{"supplement":"","modified":"{\\"1340182793\\":null,\\"1340184749\\":null}"}', 1, 1340179976),
(54, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,1,0,0]', '{"supplement":""}', 1, 1340186228),
(55, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,1,0,0]', '{"supplement":""}', 1, 1340186296),
(56, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,1,0,0]', '{"supplement":""}', 1, 1340186375),
(57, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,1,0,0]', '{"supplement":""}', 1, 1340186412),
(58, 0, 3, 0, 0, 'Title', '["A","B","C","D","E"]', '[0,1,1,0,0]', '{"supplement":""}', 1, 1340186477),
(59, 0, 3, 0, 0, 'Title', '["A","B","C","D"]', '[0,1,0,1]', '{"supplement":"link"}', 1, 1340187621),
(60, 0, 3, 0, 0, 'Những tên nào dưới đây từng là quốc hiệu của nước ta?', '["V\\u0103n Lang","Mi\\u1ebfn \\u0110i\\u1ec7n","\\u0110\\u1ea1i Vi\\u1ec7t","\\u0110\\u1ea1i C\\u1ed3 Vi\\u1ec7t","M\\u00e3 Nh\\u0129 Lai"]', '[1,0,1,1,0]', '{"supplement":"link","modified":"{\\"1340187710\\":null,\\"1340187729\\":null}"}', 1, 1340187651),
(61, 0, 3, 0, 0, 'Theo thần thoại Việt Nam ai là quốc mẫu của đất nước ta?', '["M\\u1ef5 Ch\\u00e2u","\\u00c2u C\\u01a1","B\\u00e0 Tri\\u1ec7u","Hai B\\u00e0 Tr\\u01b0ng"]', '[0,1,0,0]', '{"supplement":"","modified":"{\\"1340187759\\":null,\\"1340187831\\":null}"}', 1, 1340187747),
(63, 0, 3, 0, 0, 'Con sông lớn nhất Việt Nam?', '["S\\u00f4ng H\\u1ed3ng","S\\u00f4ng C\\u1eeda Long","S\\u00f4ng M\\u00e3"]', '[0,1,0]', '{"supplement":"","modified":"{\\"1340188173\\":null,\\"1340188204\\":null}"}', 1, 1340188124),
(64, 0, 3, 0, 0, 'Ngày sinh nhật của IHB Việt Nam', '["2\\/4\\/2011","2\\/3\\/2011","4\\/10\\/2011"]', '[0,0,1]', '{"supplement":""}', 1, 1340188169),
(65, 0, 3, 0, 0, 'Vị thái hậu rất nổi tiếng trong lịch sử Việt Nam', '["\\u1ef6 Lan","Ng\\u1ecdc H\\u00e2n","Ng\\u1ecdc Trinh","V\\u00f4 Di\\u1ec7m"]', '[1,0,0,0]', '{"supplement":"","modified":"{\\"1340188277\\":null}"}', 1, 1340188270);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_result`
--

CREATE TABLE IF NOT EXISTS `tbl_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `office_id` int(11) NOT NULL,
  `answer` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tbl_result`
--

INSERT INTO `tbl_result` (`id`, `exam_id`, `user_id`, `office_id`, `answer`, `other`) VALUES
(11, 7, 1, 0, '{"60":[1,0,1,1,0],"61":[0,1,0,0]}', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

CREATE TABLE IF NOT EXISTS `tbl_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `category` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=223 ;

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`id`, `type`, `name`, `parent_id`, `category`, `other`, `created_by`, `created_date`) VALUES
(1, 1, 'album_index', 0, 'album', '{"description":"","modified":"{\\"1339061118\\":\\"1\\",\\"1339061225\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338350490),
(3, 1, 'album_delete', 0, 'album', '{"description":"","modified":"{\\"1339061230\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338350500),
(4, 1, 'album_create', 0, 'album', '{"description":"","modified":"{\\"1339061234\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338350503),
(5, 1, 'album_own_update', 0, 'album', '{"description":"","modified":"{\\"1338372517\\":\\"1\\",\\"1338372528\\":\\"1\\",\\"1338372630\\":\\"1\\",\\"1338373413\\":\\"1\\",\\"1338373458\\":\\"1\\",\\"1338373744\\":\\"1\\",\\"1339061240\\":\\"1\\"}","value":[],"bizRule":"return Yii::app()->user->id==$params [\\"album\\"]->created_by;"}', 1, 1338350532),
(6, 1, 'album_reverseStatus', 0, 'album', '{"description":"","modified":"{\\"1339061251\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338350537),
(7, 1, 'album_suggestTitle', 0, 'banner', '{"description":"","modified":"{\\"1339061255\\":\\"1\\",\\"1339061266\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338350573),
(8, 2, 'Album_Manager', 0, '', '{"value":["3"],"description":"","modified":"{\\"1338351001\\":\\"1\\",\\"1338353846\\":\\"1\\",\\"1338353856\\":\\"1\\",\\"1338353918\\":\\"1\\",\\"1338353992\\":\\"1\\",\\"1338354717\\":\\"1\\",\\"1338354855\\":\\"1\\",\\"1338354898\\":\\"1\\",\\"1338354919\\":\\"1\\",\\"1338355059\\":\\"1\\",\\"1338363932\\":\\"1\\",\\"1338364252\\":\\"1\\",\\"1338364667\\":\\"1\\",\\"1338364929\\":\\"1\\",\\"1338364942\\":\\"1\\",\\"1338364963\\":\\"1\\",\\"1338364997\\":\\"1\\",\\"1338365118\\":\\"1\\",\\"1338365132\\":\\"1\\",\\"1338365173\\":\\"1\\",\\"1338365184\\":\\"1\\",\\"1338365418\\":\\"1\\",\\"1338365621\\":\\"1\\",\\"1338365705\\":\\"1\\",\\"1338365752\\":\\"1\\",\\"1338373841\\":\\"1\\",\\"1338521178\\":\\"1\\",\\"1338521180\\":\\"1\\",\\"1339059128\\":\\"1\\"}"}', 1, 1338350597),
(9, 2, 'Album_Editor', 8, '', '{"value":["164","6"],"description":"","modified":"{\\"1338351007\\":\\"1\\",\\"1338353502\\":\\"1\\",\\"1338353869\\":\\"1\\",\\"1338353998\\":\\"1\\",\\"1338365681\\":\\"1\\",\\"1338365700\\":\\"1\\",\\"1338365760\\":\\"1\\",\\"1338373850\\":\\"1\\",\\"1338521187\\":\\"1\\",\\"1338521189\\":\\"1\\",\\"1339058962\\":\\"1\\",\\"1339059102\\":\\"1\\"}"}', 1, 1338350605),
(10, 2, 'Album_Creater', 9, '', '{"value":["1","4","5","7"],"description":"","modified":"{\\"1338351009\\":\\"1\\",\\"1338353528\\":\\"1\\",\\"1338354003\\":\\"1\\",\\"1338365766\\":\\"1\\",\\"1338368241\\":\\"1\\",\\"1338373866\\":\\"1\\",\\"1338521200\\":\\"1\\",\\"1339058968\\":\\"1\\"}"}', 1, 1338350621),
(11, 3, 'Admin', 0, '', '{"value":["8","133","136","137","138","141","142","143","144","145","148","149","152","153","154","155","156","179","184","194","206","221"],"description":"","modified":"{\\"1338366376\\":\\"1\\",\\"1338773682\\":\\"1\\",\\"1338783816\\":\\"1\\",\\"1338787523\\":\\"1\\",\\"1339045254\\":\\"1\\",\\"1339064127\\":\\"1\\"}"}', 1, 1338351231),
(14, 1, 'banner_index', 0, 'banner', '{"description":"","modified":"{\\"1339061263\\":\\"1\\",\\"1339061270\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352039),
(15, 1, 'banner_create', 0, 'banner', '{"description":"","modified":"{\\"1339061275\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352045),
(16, 1, 'banner_suggestTitle', 0, 'banner', '{"description":"","modified":"{\\"1339061281\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352052),
(17, 1, 'banner_update', 0, 'banner', '{"description":"","modified":"{\\"1338440180\\":\\"1\\",\\"1338442064\\":\\"1\\",\\"1339061288\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352059),
(18, 1, 'banner_reverseStatus', 0, 'banner', '{"description":"","modified":"{\\"1339061293\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352065),
(19, 1, 'banner_delete', 0, 'banner', '{"description":"","modified":"{\\"1339061304\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352073),
(20, 1, 'banner_checkbox', 0, 'banner', '{"description":"","modified":"{\\"1339061316\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352083),
(21, 1, 'category_index', 0, 'category', '{"description":"","modified":"{\\"1339061323\\":\\"1\\",\\"1339061334\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352095),
(22, 1, 'category_create', 0, 'category', '{"description":"","modified":"{\\"1339061340\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352102),
(23, 1, 'category_write', 0, 'category', '{"description":"","modified":"{\\"1339061345\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352108),
(24, 1, 'category_validate', 0, 'category', '{"description":"","modified":"{\\"1339061352\\":\\"1\\",\\"1339061422\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352119),
(25, 1, 'category_update', 0, 'category', '{"description":"","modified":"{\\"1338440224\\":\\"1\\",\\"1338442400\\":\\"1\\",\\"1339061370\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352132),
(26, 1, 'category_updateListOrderView', 0, 'category', '{"description":"","modified":"{\\"1339061386\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352144),
(27, 1, 'category_delete', 0, 'category', '{"description":"","modified":"{\\"1339061434\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352153),
(28, 1, 'category_configUrl', 0, 'category', '{"description":"","modified":"{\\"1339061439\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352161),
(29, 1, 'category_setActiveAdminMenu', 0, 'category', '{"description":"","modified":"{\\"1339061446\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352171),
(30, 1, 'contact_view', 0, 'contact', '{"description":"","modified":"{\\"1339061473\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352198),
(31, 1, 'contact_index', 0, 'contact', '{"description":"","modified":"{\\"1339061487\\":\\"1\\"}","bizRule":"","value":[]}', 1, 1338352207),
(33, 1, 'contact_suggestTitle', 0, '', '{"description":""}', 1, 1338352225),
(35, 1, 'contact_reverseStatus', 0, '', '{"description":""}', 1, 1338352250),
(36, 1, 'contact_delete', 0, '', '{"description":""}', 1, 1338352260),
(37, 1, 'contact_checkbox', 0, '', '{"description":""}', 1, 1338352268),
(38, 1, 'video_index', 0, '', '{"description":""}', 1, 1338352286),
(39, 1, 'video_create', 0, '', '{"description":""}', 1, 1338352294),
(40, 1, 'video_suggestTitle', 0, '', '{"description":""}', 1, 1338352304),
(41, 1, 'video_own_update', 0, '', '{"description":"","modified":"{\\"1338440343\\":\\"1\\"}","bizRule":"return Yii::app()->user->id==$params [\\"video\\"]->created_by;","value":[]}', 1, 1338352314),
(42, 1, 'video_reverseStatus', 0, '', '{"description":""}', 1, 1338352324),
(43, 1, 'video_delete', 0, '', '{"description":""}', 1, 1338352334),
(44, 1, 'video_checkbox', 0, '', '{"description":""}', 1, 1338352343),
(45, 1, 'image_upload', 0, '', '{"description":""}', 1, 1338352355),
(46, 1, 'image_list', 0, '', '{"description":""}', 1, 1338352367),
(47, 1, 'image_suggestTitle', 0, '', '{"description":""}', 1, 1338352381),
(48, 1, 'image_update', 0, '', '{"description":""}', 1, 1338352392),
(49, 1, 'image_reverseStatus', 0, '', '{"description":""}', 1, 1338352406),
(50, 1, 'image_delete', 0, '', '{"description":""}', 1, 1338352416),
(51, 1, 'image_clear', 0, '', '{"description":""}', 1, 1338352424),
(52, 1, 'keyword_index', 0, '', '{"description":""}', 1, 1338352439),
(53, 1, 'keyword_create', 0, '', '{"description":""}', 1, 1338352450),
(54, 1, 'keyword_suggestName', 0, '', '{"description":""}', 1, 1338352460),
(55, 1, 'keyword_update', 0, '', '{"description":""}', 1, 1338352468),
(56, 1, 'keyword_reverseStatus', 0, '', '{"description":""}', 1, 1338352476),
(57, 1, 'keyword_delete', 0, '', '{"description":""}', 1, 1338352484),
(58, 1, 'keyword_checkbox', 0, '', '{"description":""}', 1, 1338352490),
(59, 1, 'language_edit', 0, '', '{"description":""}', 1, 1338352506),
(60, 1, 'language_create', 0, '', '{"description":""}', 1, 1338352515),
(61, 1, 'language_delete', 0, '', '{"description":""}', 1, 1338352526),
(62, 1, 'language_import', 0, '', '{"description":""}', 1, 1338352537),
(63, 1, 'language_export', 0, '', '{"description":""}', 1, 1338352558),
(64, 1, 'news_index', 0, '', '{"description":""}', 1, 1338352572),
(65, 1, 'news_create', 0, '', '{"description":""}', 1, 1338352579),
(66, 1, 'news_suggestTitle', 0, '', '{"description":""}', 1, 1338352590),
(67, 1, 'news_own_update', 0, '', '{"description":"","modified":"{\\"1338440407\\":\\"1\\"}","bizRule":"return Yii::app()->user->id==$params [\\"news\\"]->created_by;","value":[]}', 1, 1338352593),
(68, 1, 'news_reverseStatus', 0, '', '{"description":""}', 1, 1338352601),
(69, 1, 'news_delete', 0, '', '{"description":""}', 1, 1338352610),
(70, 1, 'news_checkbox', 0, '', '{"description":""}', 1, 1338352617),
(71, 1, 'news_copy', 0, '', '{"description":""}', 1, 1338352625),
(72, 1, 'news_dynamicCat', 0, '', '{"description":""}', 1, 1338352637),
(73, 1, 'news_updateSuggest', 0, '', '{"description":""}', 1, 1338352646),
(74, 1, 'order_index', 0, '', '{"description":""}', 1, 1338352662),
(76, 1, 'order_suggestTitle', 0, '', '{"description":""}', 1, 1338352678),
(78, 1, 'order_reverseStatus', 0, '', '{"description":""}', 1, 1338352692),
(79, 1, 'order_delete', 0, '', '{"description":""}', 1, 1338352703),
(80, 1, 'order_checkbox', 0, '', '{"description":""}', 1, 1338352706),
(81, 1, 'order_reverseProcessStatus', 0, '', '{"description":""}', 1, 1338352714),
(82, 1, 'product_index', 0, '', '{"description":""}', 1, 1338352734),
(83, 1, 'product_create', 0, '', '{"description":""}', 1, 1338352742),
(84, 1, 'product_suggestName', 0, '', '{"description":""}', 1, 1338352750),
(85, 1, 'product__own_update', 0, '', '{"description":"","modified":"{\\"1338439826\\":\\"1\\"}","bizRule":"return Yii::app()->user->id==$params [\\"product\\"]->created_by;","value":[]}', 1, 1338352758),
(86, 1, 'product_reverseStatus', 0, '', '{"description":""}', 1, 1338352762),
(87, 1, 'product_delete', 0, '', '{"description":""}', 1, 1338352773),
(88, 1, 'product_checkbox', 0, '', '{"description":""}', 1, 1338352776),
(89, 1, 'product_copy', 0, '', '{"description":""}', 1, 1338352782),
(90, 1, 'product_dynamicCat', 0, '', '{"description":""}', 1, 1338352788),
(91, 1, 'product_updateSuggest', 0, '', '{"description":""}', 1, 1338352796),
(92, 1, 'product_reverseAmountStatus', 0, '', '{"description":""}', 1, 1338352802),
(93, 1, 'qa_index', 0, '', '{"description":""}', 1, 1338352818),
(94, 1, 'qa_create', 0, '', '{"description":""}', 1, 1338352825),
(95, 1, 'qa_suggestTitle', 0, '', '{"description":""}', 1, 1338352840),
(96, 1, 'qa_update', 0, '', '{"description":""}', 1, 1338352842),
(97, 1, 'qa_reverseStatus', 0, '', '{"description":""}', 1, 1338352850),
(98, 1, 'qa_delete', 0, '', '{"description":""}', 1, 1338352859),
(99, 1, 'qa_checkbox', 0, '', '{"description":""}', 1, 1338352866),
(100, 1, 'setting_index', 0, '', '{"description":""}', 1, 1338352972),
(101, 1, 'setting_create', 0, '', '{"description":""}', 1, 1338352980),
(102, 1, 'setting_suggestName', 0, '', '{"description":""}', 1, 1338352987),
(103, 1, 'setting_update', 0, '', '{"description":""}', 1, 1338352994),
(104, 1, 'setting_reverseStatus', 0, '', '{"description":""}', 1, 1338353000),
(105, 1, 'setting_delete', 0, '', '{"description":""}', 1, 1338353008),
(106, 1, 'setting_checkbox', 0, '', '{"description":""}', 1, 1338353014),
(107, 1, 'static_page_index', 0, '', '{"description":""}', 1, 1338353024),
(108, 1, 'static_page_create', 0, '', '{"description":""}', 1, 1338353036),
(109, 1, 'static_page_suggestTitle', 0, '', '{"description":""}', 1, 1338353039),
(111, 1, 'static_page_reverseStatus', 0, '', '{"description":""}', 1, 1338353052),
(112, 1, 'static_page_delete', 0, '', '{"description":""}', 1, 1338353061),
(113, 1, 'static_page_checkbox', 0, '', '{"description":""}', 1, 1338353064),
(114, 1, 'static_page_copy', 0, '', '{"description":""}', 1, 1338353069),
(115, 1, 'static_page_dynamicCat', 0, '', '{"description":""}', 1, 1338353079),
(116, 1, 'static_page_updateSuggest', 0, '', '{"description":""}', 1, 1338353083),
(117, 1, 'user_index', 0, '', '{"description":""}', 1, 1338353124),
(118, 1, 'user_create', 0, '', '{"description":""}', 1, 1338353131),
(119, 1, 'user_suggestUsername', 0, '', '{"description":""}', 1, 1338353137),
(120, 1, 'user_suggestEmail', 0, '', '{"description":""}', 1, 1338353147),
(121, 1, 'user_update', 0, '', '{"description":""}', 1, 1338353151),
(122, 1, 'user_reverseStatus', 0, '', '{"description":""}', 1, 1338353157),
(123, 1, 'user_delete', 0, '', '{"description":""}', 1, 1338353163),
(124, 1, 'user_checkbox', 0, '', '{"description":""}', 1, 1338353170),
(125, 1, 'user_changePassword', 0, '', '{"description":""}', 1, 1338353175),
(126, 1, 'user_resetPassword', 0, '', '{"description":""}', 1, 1338353182),
(127, 1, 'role_index', 0, '', '{"description":""}', 1, 1338353383),
(128, 1, 'role_create', 0, '', '{"description":""}', 1, 1338353401),
(129, 1, 'role_write', 0, '', '{"description":""}', 1, 1338353415),
(130, 1, 'role_validate', 0, '', '{"description":""}', 1, 1338353421),
(131, 1, 'role_update', 0, '', '{"description":""}', 1, 1338353427),
(132, 1, 'role_delete', 0, '', '{"description":""}', 1, 1338353435),
(133, 2, 'Banner_Manager', 0, '', '{"value":["14","15","16","17","18","19","20"],"description":"","modified":"{\\"1338354698\\":\\"1\\",\\"1338365774\\":\\"1\\",\\"1338521210\\":\\"1\\"}"}', 1, 1338353460),
(136, 2, 'Category_Manager', 0, '', '{"value":["21","22","23","24","25","26","27","28","29"],"description":"","modified":"{\\"1338521220\\":\\"1\\"}"}', 1, 1338365845),
(137, 2, 'Contact_Manager', 0, '', '{"value":["30","31","33","35","36","37"],"description":"","modified":"{\\"1338365909\\":\\"1\\",\\"1338521232\\":\\"1\\"}"}', 1, 1338365876),
(138, 2, 'Video_Manager', 0, '', '{"value":["43"],"description":"","modified":"{\\"1338365916\\":\\"1\\",\\"1338365928\\":\\"1\\",\\"1338456729\\":\\"1\\",\\"1338521243\\":\\"1\\",\\"1339059190\\":\\"1\\"}"}', 1, 1338365892),
(139, 2, 'Video_Editor', 138, '', '{"value":["168","42","44"],"description":"","modified":"{\\"1338440619\\":\\"1\\",\\"1338521254\\":\\"1\\",\\"1339058980\\":\\"1\\",\\"1339059164\\":\\"1\\",\\"1339059182\\":\\"1\\"}"}', 1, 1338365949),
(140, 2, 'Video_Creater', 139, '', '{"value":["38","39","40","41"],"description":"","modified":"{\\"1338440566\\":\\"1\\",\\"1338521270\\":\\"1\\",\\"1339058986\\":\\"1\\"}"}', 1, 1338365963),
(141, 2, 'Image_Manager', 0, '', '{"value":["46","47","48","49","50","51"],"description":"","modified":"{\\"1338521281\\":\\"1\\"}"}', 1, 1338366010),
(142, 2, 'Upload_Image', 0, '', '{"value":["45","50"],"description":"","modified":"{\\"1338522652\\":\\"1\\"}"}', 1, 1338366033),
(143, 2, 'Keyword_Manager', 0, '', '{"value":["52","53","54","55","56","57","58"],"description":"","modified":"{\\"1339045046\\":\\"1\\",\\"1339045048\\":\\"1\\"}"}', 1, 1338366052),
(144, 2, 'Language_Manager', 0, '', '{"value":["59","60","61","62","63"],"description":"","modified":"{\\"1339045059\\":\\"1\\",\\"1339045061\\":\\"1\\"}"}', 1, 1338366070),
(145, 2, 'News_Manager', 0, '', '{"value":["69"],"description":"","modified":"{\\"1338456709\\":\\"1\\",\\"1339045076\\":\\"1\\",\\"1339059274\\":\\"1\\"}"}', 1, 1338366090),
(146, 2, 'News_Editor', 145, '', '{"value":["169","68","70"],"description":"","modified":"{\\"1338440650\\":\\"1\\",\\"1339045087\\":\\"1\\",\\"1339058999\\":\\"1\\",\\"1339059263\\":\\"1\\",\\"1339146604\\":\\"1\\"}"}', 1, 1338366108),
(147, 2, 'News_Creater', 146, '', '{"value":["64","65","66","67","71","72","73"],"description":"","modified":"{\\"1338368442\\":\\"1\\",\\"1338440665\\":\\"1\\",\\"1339045097\\":\\"1\\",\\"1339059005\\":\\"1\\"}"}', 1, 1338366121),
(148, 2, 'Order_Manager', 0, '', '{"value":["74","76","78","79","80","81"],"description":"","modified":"{\\"1339045106\\":\\"1\\"}"}', 1, 1338366145),
(149, 2, 'Product_Manager', 0, '', '{"value":["87"],"description":"","modified":"{\\"1338456758\\":\\"1\\",\\"1339045118\\":\\"1\\",\\"1339059330\\":\\"1\\"}"}', 1, 1338366167),
(150, 2, 'Product_Editor', 149, '', '{"value":["165","86","88","92"],"description":"","modified":"{\\"1338440703\\":\\"1\\",\\"1339045126\\":\\"1\\",\\"1339059015\\":\\"1\\",\\"1339059302\\":\\"1\\"}"}', 1, 1338366189),
(151, 2, 'Product_Creater', 150, '', '{"value":["82","83","84","85","89","90","91"],"description":"","modified":"{\\"1338368560\\":\\"1\\",\\"1338439992\\":\\"1\\",\\"1338440692\\":\\"1\\",\\"1339045136\\":\\"1\\",\\"1339059021\\":\\"1\\"}"}', 1, 1338366204),
(152, 2, 'QA_Manager', 0, '', '{"value":["93","94","95","96","97","98","99"],"description":"","modified":"{\\"1339045144\\":\\"1\\"}"}', 1, 1338366226),
(153, 2, 'Setting_Manager', 0, '', '{"value":["100","101","102","103","104","105","106"],"description":"","modified":"{\\"1339045152\\":\\"1\\"}"}', 1, 1338366249),
(154, 2, 'Static_Page_Manager', 0, '', '{"value":["107","108","109","111","112","113","114","115","116","207"],"description":"","modified":"{\\"1339045163\\":\\"1\\",\\"1339056811\\":\\"1\\",\\"1339056812\\":\\"1\\"}"}', 1, 1338366266),
(155, 2, 'User_Manager', 0, '', '{"value":["117","118","119","120","121","122","123","124","125","126"],"description":"","modified":"{\\"1339045174\\":\\"1\\"}"}', 1, 1338366287),
(156, 2, 'Role_Manager', 0, '', '{"value":["127","128","129","130","131","132"],"description":"","modified":"{\\"1339045181\\":\\"1\\"}"}', 1, 1338366316),
(157, 3, 'Manager', 0, '', '{"description":"T\\u1ea1o v\\u00e0 ch\\u1ec9nh s\\u1eeda video, album, tin t\\u1ee9c, s\\u1ea3n ph\\u1ea9m","value":["9","139","142","146","150","220"],"modified":"{\\"1338520114\\":\\"1\\",\\"1338520131\\":\\"1\\",\\"1338520155\\":\\"1\\",\\"1339064133\\":\\"1\\",\\"1340244410\\":\\"1\\",\\"1340244426\\":\\"1\\"}"}', 1, 1338366404),
(164, 1, 'album_update', 5, 'album', '{"description":"","value":[],"modified":"{\\"1339061247\\":\\"1\\"}","bizRule":""}', 1, 1338372545),
(165, 1, 'product_update', 85, '', '{"bizRule":"","description":"","value":[]}', 1, 1338439863),
(168, 1, 'video_update', 41, '', '{"bizRule":"","description":"","value":[]}', 1, 1338440354),
(169, 1, 'news_update', 67, '', '{"bizRule":"","description":"","value":[]}', 1, 1338440428),
(171, 3, 'Trainer', 0, '', '{"value":["10","140","142","147","151","219"],"description":"T\\u1ea1o album, video, tin t\\u1ee9c v\\u00e0 s\\u1ea3n ph\\u1ea9m","modified":"{\\"1338520083\\":\\"1\\",\\"1338520144\\":\\"1\\",\\"1338520149\\":\\"1\\",\\"1339064137\\":\\"1\\",\\"1340244415\\":\\"1\\",\\"1340244433\\":\\"1\\"}"}', 1, 1338520067),
(172, 1, 'support_index', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338773568),
(173, 1, 'support_create', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338773578),
(174, 1, 'support_suggestName', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338773586),
(175, 1, 'support_update', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338773592),
(176, 1, 'support_reverseStatus', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338773600),
(177, 1, 'support_delete', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338773607),
(178, 1, 'support_checkbox', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338773613),
(179, 2, 'Support_Manager', 0, '', '{"value":["172","173","174","175","176","177","178"],"description":"","modified":"{\\"1339045189\\":\\"1\\"}"}', 1, 1338773642),
(180, 1, 'register_index', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338783757),
(181, 1, 'register_view', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338783766),
(182, 1, 'register_delete', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338783771),
(183, 1, 'register_checkbox', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338783777),
(184, 2, 'Register_Manager', 0, '', '{"value":["180","181","182","183","195","196"],"description":"","modified":"{\\"1338799005\\":\\"1\\",\\"1338799719\\":\\"1\\",\\"1339045199\\":\\"1\\"}"}', 1, 1338783800),
(185, 1, 'recruitment_index', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338787433),
(186, 1, 'recruitment_create', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338787447),
(187, 1, 'recruitment_suggestTitle', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338787455),
(188, 1, 'recruitment_update', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338787461),
(189, 1, 'recruitment_delete', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338787467),
(190, 1, 'recruitment_checkbox', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338787473),
(191, 1, 'recruitment_copy', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338787480),
(192, 1, 'recruitment_dynamicCat', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338787487),
(193, 1, 'recruitment_updateSuggest', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338787493),
(194, 2, 'Recruitment_Manager', 0, '', '{"value":["185","186","187","188","189","190","191","192","193"],"description":"","modified":"{\\"1339045207\\":\\"1\\"}"}', 1, 1338787514),
(195, 1, 'register_suggestName', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338799687),
(196, 1, 'register_suggestEmail', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1338799694),
(197, 1, 'menu_index', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1339044916),
(198, 1, 'menu_create', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1339044925),
(199, 1, 'menu_write', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1339044932),
(200, 1, 'menu_validate', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1339044954),
(201, 1, 'menu_update', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1339044961),
(202, 1, 'menu_updateListOrderView', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1339044969),
(203, 1, 'menu_delete', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1339044975),
(204, 1, 'menu_configUrl', 0, '', '{"bizRule":"","description":"","value":[]}', 1, 1339044982),
(205, 1, 'menu_setActiveAdminMenu', 0, 'menu', '{"bizRule":"","description":"","value":[],"modified":"{\\"1339061515\\":\\"1\\",\\"1339061529\\":\\"1\\"}"}', 1, 1339044988),
(206, 2, 'Menu_Manager', 0, '', '{"value":["197","198","199","200","201","202","203","204","205"],"description":""}', 1, 1339045242),
(207, 1, 'static_page_update', 0, 'static_page', '{"bizRule":"","description":"","value":[],"modified":"{\\"1339061501\\":\\"1\\"}"}', 1, 1339056761),
(208, 1, 'app_index', 0, 'app', '{"bizRule":"","description":"","value":[]}', 1, 1339063760),
(209, 1, 'app_create', 0, 'app', '{"bizRule":"","description":"","value":[]}', 1, 1339063771),
(210, 1, 'app_suggestTitle', 0, 'app', '{"bizRule":"","description":"","value":[]}', 1, 1339063781),
(211, 1, 'app_reverseStatus', 0, 'app', '{"bizRule":"","description":"","value":[]}', 1, 1339063796),
(212, 1, 'app_delete', 0, 'app', '{"bizRule":"","description":"","value":[]}', 1, 1339063808),
(213, 1, 'app_checkbox', 0, 'app', '{"bizRule":"","description":"","value":[]}', 1, 1339063818),
(214, 1, 'app_copy', 0, 'app', '{"bizRule":"","description":"","value":[]}', 1, 1339063827),
(215, 1, 'app_dynamicCat', 0, 'app', '{"bizRule":"","description":"","value":[]}', 1, 1339063835),
(216, 1, 'app_updateSuggest', 0, 'app', '{"bizRule":"","description":"","value":[]}', 1, 1339063844),
(217, 1, 'app_own_update', 0, 'app', '{"bizRule":"","description":"","value":[],"modified":"{\\"1339063906\\":\\"1\\"}"}', 1, 1339063862),
(218, 1, 'app_update', 217, 'app', '{"bizRule":"","description":"","value":[]}', 1, 1339063890),
(219, 2, 'App_Creater', 220, '', '{"value":["208","209","210","215","216","217"],"description":"","modified":"{\\"1339064067\\":\\"1\\",\\"1339064110\\":\\"1\\"}"}', 1, 1339064008),
(220, 2, 'App_Editor', 221, '', '{"value":["211","213","218"],"description":"","modified":"{\\"1339064102\\":\\"1\\"}"}', 1, 1339064055),
(221, 2, 'App_Manager', 0, '', '{"value":["212"],"description":""}', 1, 1339064088),
(222, 3, 'Employee', 0, '', '{"description":"","value":[]}', 1, 1340244446);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE IF NOT EXISTS `tbl_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=60 ;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`id`, `name`, `value`, `category`, `description`) VALUES
(1, 'SIZE_REMARK_PRODUCT', '6', 'Product', ''),
(2, 'SIZE_HOME_NEWS', '4', 'News', ''),
(3, 'HOME_INTRO_LENGTH', '25', 'News', ''),
(4, 'META_AUTHOR', 'IHB Việt Nam', 'System', ''),
(5, 'META_COPYRIGHT', 'IHB Việt Nam', 'System', ''),
(6, 'META_KEYWORD', 'IHB, Website, SEO', 'System', ''),
(7, 'META_DESCRIPTION', 'CMS iPhoenix', 'System', ''),
(8, 'FRONT_SITE_TITLE', '.:IHB Việt Nsam:.', 'System', ''),
(9, 'EMAIL_CONTACT', 'thanhlx0204@gmail.com', 'System', ''),
(10, 'HOTLINE', '0906244804', 'System', ''),
(11, 'COMPANY', 'IHB Việt Nam', 'System', ''),
(12, 'ADDRESS_SHOWROOM', 'Nhà số 6, ngõ 850, đường Láng', 'System', ''),
(13, 'TEL/FAX', '0906244804', 'System', ''),
(14, 'MOBILE', '0906244804', 'System', ''),
(15, 'EMAIL', 'thanhlx0204@gmail.com', 'System', ''),
(16, 'DESIGN_BY', 'Design by IHB Việt Nam', 'System', ''),
(17, 'LIMIT_SIMILAR_NEWS', '4', 'News', ''),
(18, 'SIZE_BESTSELLER_PRODUCT', '3', 'Product', ''),
(19, 'BANK_ACCOUNT', '0123456789 - Ngân hàng Vietcombank chi nhánh Nam Định', 'System', ''),
(20, 'MA_SO_THUE', '00123456789', 'System', ''),
(21, 'WEBSITE', 'www.donoithatgo.vn', 'System', ''),
(22, 'ADDRESS', 'Nhà số 6, ngõ 850, đường Láng', 'System', ''),
(23, 'MOBILE_SHOWROOM', '0906244804', 'System', ''),
(24, 'PRODUCT_PAGE_SIZE', '3', 'Product', ''),
(25, 'NEWS_PAGE_SIZE', '1', 'News', ''),
(26, 'LIST_INTRO_LENGTH', '20', 'News', ''),
(27, 'STATICPAGE_PAGE_SIZE', '10', 'StaticPage', ''),
(28, 'LIMIT_SIMILAR_PRODUCT', '4', 'Product', ''),
(29, 'QA_PAGE_SIZE', '2', 'QA', ''),
(30, 'QA_INTRO_LENGTH', '25', 'QA', ''),
(31, 'LIMIT_SIMILAR_QA', '4', 'QA', ''),
(32, 'ALBUM_PAGE_SIZE', '3', 'Album', ''),
(33, 'LIMIT_SIMILAR_ALBUM', '4', 'Album', ''),
(34, 'GALLERYVIDEO_PAGE_SIZE', '4', 'GalleryVideo', ''),
(35, 'LIMIT_SIMILAR_GALLERYVIDEO', '2', 'GalleryVideo', ''),
(36, 'SEARCH_PAGE_SIZE', '3', 'Product', ''),
(37, 'DEFAULT_PAGE_SIZE', '9', 'System', ''),
(38, 'ADMIN_LANGUAGE', 'vi', 'System', ''),
(39, 'LIST_INTROHOME_LENGTH', '25', 'News', ''),
(40, 'HOTLINE_HANOI', '0906244804', 'Contact', ''),
(41, 'HOTLINE_SAIGON', '0934748686', 'Contact', ''),
(42, 'HOTLINE_DANANG', '0934748686', 'Contact', ''),
(43, 'CONTACT_SUPPORT_1', 'thanhlx0204@gmail.com', 'Contact', ''),
(44, 'CONTACT_SUPPORT_2', 'thanhlx0204@gmail.com', 'Contact', ''),
(45, 'CONTACT_SUPPORT_3', 'thanhlx0204@gmail.com', 'Contact', ''),
(46, 'CONTACT_NAME', 'Lê Xuân Thành', 'Contact', ''),
(47, 'CONTACT_MAIL', 'thanhlx0204@gmail.com', 'Contact', ''),
(48, 'CONTACT_ADDRESS', 'Nhà số 6, ngõ 850, đường Láng', 'Contact', ''),
(49, 'CONTACT_PHONE', '0934748686', 'Contact', ''),
(50, 'CONTACT_FAX', '0934748686', 'Contact', ''),
(51, 'PRODUCT_SERVICE_1', '3', 'Product', ''),
(52, 'PRODUCT_SERVICE_2', '3', 'Product', ''),
(53, 'PRODUCT_SERVICE_3', '3', 'Product', ''),
(54, 'FAX', '04.35565 863', 'System', ''),
(55, 'COPYRIGHT', 'Design by IHB Việt Nam', 'System', ''),
(56, 'SIZE_SUPPORT', '2', 'Support', ''),
(57, 'APP_PAGE_SIZE', '1', 'Application', ''),
(58, 'LIMIT_SIMILAR_APP', '4', 'Application', ''),
(59, 'HOME_PRODUCT_PAGE_SIZE', '3', 'Product', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_test`
--

CREATE TABLE IF NOT EXISTS `tbl_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `catid` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tbl_test`
--

INSERT INTO `tbl_test` (`id`, `type`, `status`, `catid`, `level`, `title`, `other`, `created_by`, `created_date`) VALUES
(13, 3, 1, 0, 1, 'Marking-up Level title 3', '{"content":"[\\"27\\",\\"28\\"]","modified":"{\\"1339649135\\":\\"1\\",\\"1339649136\\":\\"1\\"}"}', 1, 1339643249),
(14, 3, 1, 0, 8, 'Marking-up Level title 2', '{"content":"[\\"27\\",\\"28\\",\\"32\\"]","modified":"{\\"1339643520\\":\\"1\\",\\"1339643534\\":\\"1\\",\\"1339643939\\":\\"1\\",\\"1339643947\\":\\"1\\",\\"1339643990\\":\\"1\\",\\"1339644273\\":\\"1\\",\\"1339648256\\":\\"1\\",\\"1339649123\\":\\"1\\",\\"1339649125\\":\\"1\\",\\"1339651594\\":\\"1\\"}"}', 1, 1339643249),
(16, 3, 1, 0, 3, 'Test title', '{"content":"[\\"33\\",\\"34\\"]"}', 1, 1339664642),
(17, 3, 1, 0, 0, 'Test title', '{"content":"[\\"35\\",\\"36\\"]"}', 1, 1339666297),
(18, 3, 1, 0, 0, 'Kiểm tra lịch sử Việt Nam', '{"content":"[\\"38\\",\\"46\\",\\"51\\",\\"52\\"]","modified":"{\\"1340155419\\":null,\\"1340155471\\":null,\\"1340155630\\":null,\\"1340155661\\":null,\\"1340155735\\":null,\\"1340160961\\":null,\\"1340178912\\":null,\\"1340179000\\":null,\\"1340179628\\":null,\\"1340179793\\":null,\\"1340179820\\":null,\\"1340179976\\":null,\\"1340184773\\":null,\\"1340187597\\":null,\\"1340256122\\":\\"1\\",\\"1340256135\\":\\"1\\",\\"1340269737\\":\\"1\\"}","description":"L\\u1ecbch s\\u1eed Vi\\u1ec7t Nam r\\u1ea5t \\u0111\\u00e1ng t\\u1ef1 h\\u00e0o"}', 1, 1339666760),
(19, 3, 1, 0, 0, 'Test IQ', '{"content":"[\\"60\\",\\"61\\"]","modified":"{\\"1340187852\\":null,\\"1340268909\\":\\"1\\",\\"1340269157\\":\\"1\\"}","description":"Theo nh\\u1eadn \\u0111\\u1ecbnh c\\u1ee7a th\\u00ed sinh t\\u1ea1i TP HCM, \\u0111\\u1ec1 thi m\\u00f4n V\\u0103n s\\u00e1ng nay kh\\u00e1 hay, kh\\u00f4ng ch\\u1ec9 t\\u1ea1o c\\u01a1 h\\u1ed9i cho h\\u1ecdc sinh \\u0111\\u01b0\\u1ee3c quy\\u1ec1n l\\u1ef1a ch\\u1ecdn m\\u00e0 c\\u00f2n n\\u00eau l\\u00ean nh\\u1eefng v\\u1ea5n \\u0111\\u1ec1 th\\u1ef1c t\\u1ebf trong x\\u00e3 h\\u1ed9i.\\r\\n"}', 1, 1340187754),
(20, 3, 1, 0, 8, 'Test đầu vào', '{"content":"[\\"63\\",\\"64\\",\\"65\\"]","modified":"{\\"1340269242\\":\\"1\\"}","description":"H\\u00f4m qua, t\\u1ea1i tu\\u1ea7n l\\u1ec5 Elise \\u01b0u \\u0111\\u00e3i 50% t\\u1ea5t c\\u1ea3 c\\u00e1c m\\u1eb7t h\\u00e0ng tr\\u00ean to\\u00e0n qu\\u1ed1c b\\u1eaft \\u0111\\u1ea7u t\\u1eeb 18h ng\\u00e0y 20\\/06 \\u0111\\u1ebfn h\\u1ebft ng\\u00e0y 28\\/0620\\/06 tr\\u00ean to\\u00e0n h\\u1ec7 th\\u1ed1ng ch\\u1eadt c\\u1ee9ng kh\\u00e1ch h\\u00e0ng \\u0111\\u1ebfn tham quan v\\u00e0 mua s\\u1eafm, sau khi th\\u00f4ng tin ch\\u01b0\\u01a1ng tr\\u00ecnh khai tr\\u01b0\\u01a1ng showroom n\\u00e0y \\u0111\\u01b0\\u1ee3c gi\\u1edbi truy\\u1ec1n th\\u00f4ng \\u0111\\u01b0a tin tr\\u01b0\\u1edbc \\u0111\\u00f3 m\\u1ed9t ng\\u00e0y.\\r\\n\\r\\nS\\u1ef1 ki\\u1ec7n \\u0111\\u00e3 thu h\\u00fat l\\u01b0\\u1ee3ng kh\\u00e1ch h\\u00e0ng \\u0111\\u1ebfn ch\\u1eadt c\\u1ee9ng kh\\u00f4ng gian b\\u00ean trong v\\u00e0 b\\u00ean ngo\\u00e0i c\\u1ee7a showroom v\\u1edbi di\\u1ec7n t\\u00edch h\\u01a1n 250m2. C\\u00e1c ch\\u01b0\\u01a1ng tr\\u00ecnh ngh\\u1ec7 thu\\u1eadt h\\u1ea5p d\\u1eabn v\\u00e0 show di\\u1ec5n th\\u1eddi t', 1, 1340188271);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tmp_result`
--

CREATE TABLE IF NOT EXISTS `tbl_tmp_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `office_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `answer` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `other` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_tmp_result`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `office_id` int(11) NOT NULL,
  `other` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `salt`, `status`, `email`, `office_id`, `other`) VALUES
(1, 'admin', '068bf8c42edece5daa08c9ec0dc0b317', '4f570d19da3d07.31748483', 1, 'kythuat@ihbvietnam.com', 1, '{"phone":"0906244804","address":"Truong Son, An Lao, Hai Phong","firstname":"YHCT","lastname":"YHCT","register_date":1331006642,"last_visit_date":1331006642}'),
(4, 'E00004', '8a4ba744ed9b946d329e01179237d3c9', '4fe2974777b1f6.23426112', 1, 'admin@grizzlyclassifieds.com', 2, '{"status":0,"firstname":"Le","lastname":"Thanh","register_date":1340249927,"last_visit_date":1340249927}'),
(5, 'ME0005', 'c133a99fe5ae6e7710da9cb65a000105', '4fe2982c7938d5.70279062', 1, 'nam.nguyen@ihbvietnam.com', 1, '{"status":0,"firstname":"Le","lastname":"Truong","register_date":1340250156,"last_visit_date":1340250156}'),
(6, 'MT0006', '99f2bd95cd04f00773238c28009be36a', '4fe29b5f21dea0.94982358', 1, 'bien.vo@ihbvietnam.com', 3, '{"status":0,"firstname":"Vo Hoang","lastname":"Bien","register_date":1340250975,"last_visit_date":1340250975}');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
