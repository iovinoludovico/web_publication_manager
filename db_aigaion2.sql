-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 09, 2017 at 08:55 PM
-- Server version: 5.6.35
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_aigaion2`
--

-- --------------------------------------------------------

--
-- Table structure for table `aigaiongeneral`
--

CREATE TABLE `aigaiongeneral` (
  `version` varchar(10) NOT NULL DEFAULT '',
  `releaseversion` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aigaiongeneral`
--

INSERT INTO `aigaiongeneral` (`version`, `releaseversion`) VALUES
('V2.50', '2.0');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `pub_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `location` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `ismain` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `mime` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `isremote` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `att_id` int(10) UNSIGNED NOT NULL,
  `read_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `edit_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `derived_read_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `derived_edit_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`pub_id`, `location`, `note`, `ismain`, `user_id`, `mime`, `name`, `isremote`, `att_id`, `read_access_level`, `edit_access_level`, `group_id`, `derived_read_access_level`, `derived_edit_access_level`) VALUES
(1, '2015 A Comparison Between Semantic And Syntactic Software Metrics.pdf-e086dc07a727927d67cea90100a97e38.pdf', '', 'TRUE', 1, 'application/pdf', '2015 A Comparison Between Semantic And Syntactic Software Metrics.pdf', 'FALSE', 1, 'intern', 'intern', 0, 'intern', 'intern');

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(10) UNSIGNED NOT NULL,
  `surname` varchar(255) NOT NULL,
  `von` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `institute` varchar(255) NOT NULL,
  `specialchars` enum('FALSE','TRUE') NOT NULL DEFAULT 'FALSE',
  `cleanname` varchar(255) NOT NULL DEFAULT '',
  `jr` varchar(255) DEFAULT '',
  `synonym_of` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `surname`, `von`, `firstname`, `email`, `url`, `institute`, `specialchars`, `cleanname`, `jr`, `synonym_of`) VALUES
(1, 'Recchioni', '', 'Marco', 'marco.recchioni@univaq.it', '', 'University of L\'Aquila - MESVA', 'FALSE', 'Recchioni, Marco', '', 0),
(2, 'Castello', '', 'Valentina', '', '', 'University of L\'Aquila - MESVA', 'FALSE', 'Castello, Valentina', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `availablerights`
--

CREATE TABLE `availablerights` (
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `availablerights`
--

INSERT INTO `availablerights` (`name`, `description`) VALUES
('attachment_read', 'read attachments'),
('attachment_edit', 'add, edit and delete attachments'),
('database_manage', 'manage the database'),
('note_read', 'read comments'),
('note_edit', 'add, edit and delete own comments'),
('publication_edit', 'add, edit and delete publications'),
('topic_subscription', 'change own topic subscriptions'),
('topic_edit', 'add, edit and delete topics'),
('user_edit_self', 'edit own profile (user rights not included)'),
('user_edit_all', 'edit all profiles (user rights not included)'),
('user_assign_rights', 'assign user rights'),
('bookmarklist', 'use a persistent bookmarklist'),
('read_all_override', 'read all attachments, publications, topics and notes, overriding access levels'),
('edit_all_override', 'edit all attachments, publications, topics and notes, overriding access levels'),
('export_email', 'export publications through email'),
('request_copies', 'request copies of a publication from the author');

-- --------------------------------------------------------

--
-- Table structure for table `changehistory`
--

CREATE TABLE `changehistory` (
  `version` varchar(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `changehistory`
--

INSERT INTO `changehistory` (`version`, `type`, `description`) VALUES
('2.0.0.beta', 'bugfix,features,layout,security', '\n              Aigaion 2.0 introduces many new features, among which:\n			\n			  Customizable access levels (public, intern, private) for publications, topics, notes and attachments\n			  Improved import and export code\n			  User group management\n			  Better support for guest users\n			  Modules for integrating login management with other systems such as wiki or CMS systems\n			  Persistent bookmark lists\n			  Improved topic assignment for publications\n			  Better update management\n			  Flexible sort options for publication list display\n			'),
('2.0.1.beta', 'bugfix,features', 'The first bug reports on the beta release are fixed. Furthermore, automated install scripts have been added to the release.'),
('2.0.2.beta', 'bugfix', 'Many bug fixes.'),
('2.1.0', 'bugfix,features,layout,security', '\n        Aigaion 2.1 is the first non-beta version of Aigaion.\n        \n        Besides solving a few security issues, it contains a multitude of new features and existing features have been improved in many ways.\n        Some examples are:\n        - export via email\n        - major improvements in the bibtex import facilities\n        - new handling of bibtex special characters, allowing many new characters and making it very simple to add new characters in the future\n        - an improved and more stable login module\n        - advanced search capabilities\n        \n        But there are also countless other improvements both small and large!\n         \n        Many thanks to our users who contributed ideas, code and extensive testing sessions!\n        '),
('2.1.1', 'bugfix', '\n        Aigaion 2.1.1 is a bug fix release.\n        '),
('2.1.2', 'bugfix,features,layout', '\n==================\nMAJOR IMPROVEMENTS\n==================\nBackup restore function is back  -- It is now possible again to restore\nold backups by entering the originally exported backup data into the\nrestore function from the maintenance page.\n===\nPerformance improvement -- several libraries have been improved to\noptimize the database access and speed up paginated display of large\nlists of publications.\n===\nInternationalisation -- Aigaion now officialy has multi-language\nsupport. Four languages are immediately available in this release,\nthanks to the hard work of Manuel Strehl, and the translators mentioned \non the translation wiki: Norwegian, German, English and Dutch.\n==================\nMINOR IMPROVEMENTS\n==================\nKeyword clouds -- Topic and author pages now show keyword clouds, with different\nfont sizes for the keywords depending on how important they are in the\npublications under a certain topic or for a certain author.\n===\nBibTeX to UTF8 conversion -- We have extended and improved the\nBibTeX2UTF8 conversions (and the other way around). In addition, we have\nwritten a set of testing functions to spot recurring bugs easier. \nThis was supported by heavy testing from Peter Mosses.\n===\nImport: better feedback and input checking -- The input data entered in\nthe import screen is tested more thoroughly for certain problems, and if\nthe import fails, a better feedback message is given.\n===\nTinyMCE editor for editing notes -- It is now possible to edit notes\nusing the great editor TinyMCE, which allows a WYSIWYG basic formatting\ninterface. To enable it, check the box in the configuration screen.\n===\nIE display cleanup -- Many display issues in Internet Explorer were fixed\n===\nDocumentation -- We have extended the in-code documentation and the\ndocumentation on the Wiki pages\n===\nNew CodeIgniter version -- Thanks to the help of Dennis Allerkamp,\nAigaion now runs on CodeIgniter version 1.7\n==================\n        '),
('2.2', 'bugfix,features,layout', '\nIntroduction of custom fields for authors, topics and publications\nIntroduction of author aliases\nNew languages\nNew CodeIgniter version \nCustomizable publication summary\n        '),
('2.5', 'bugfix,features', '\n    	- new CodeIgniter version \n    	- added db indexes\n		');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `setting` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`setting`, `value`) VALUES
('CFG_ADMIN', 'Admin'),
('CFG_ADMINMAIL', 'admin@... (mail server)'),
('ALLOWED_ATTACHMENT_EXTENSIONS', '.doc,.gif,.gz,.htm,.html,.jpeg,.jpg,.pdf,.png,.ps,.tar,.tif,.tiff,.txt,.zip,.z'),
('ALLOW_ALL_EXTERNAL_ATTACHMENTS', 'FALSE'),
('WINDOW_TITLE', 'A Web Based Annotated Bibliography'),
('ALWAYS_INCLUDE_PAPERS_FOR_TOPIC', 'TRUE'),
('SHOW_TOPICS_ON_FRONTPAGE', 'FALSE'),
('SHOW_TOPICS_ON_FRONTPAGE_LIMIT', '5'),
('SERVER_NOT_WRITABLE', 'FALSE'),
('PUBLICATION_XREF_MERGE', 'FALSE'),
('BIBTEX_STRINGS_IN', ''),
('LOGIN_ENABLE_ANON', 'FALSE'),
('LOGIN_DEFAULT_ANON', ''),
('ATT_DEFAULT_READ', 'intern'),
('ATT_DEFAULT_EDIT', 'intern'),
('PUB_DEFAULT_READ', 'intern'),
('PUB_DEFAULT_EDIT', 'intern'),
('NOTE_DEFAULT_READ', 'intern'),
('NOTE_DEFAULT_EDIT', 'intern'),
('TOPIC_DEFAULT_READ', 'intern'),
('TOPIC_DEFAULT_EDIT', 'intern'),
('DEFAULTPREF_THEME', 'default'),
('DEFAULTPREF_LANGUAGE', 'en'),
('DEFAULTPREF_SUMMARYSTYLE', 'author'),
('DEFAULTPREF_AUTHORDISPLAYSTYLE', 'fvl'),
('DEFAULTPREF_LISTSTYLE', '50'),
('LOGIN_ENABLE_DELEGATED_LOGIN', 'FALSE'),
('LOGIN_DELEGATES', ''),
('LOGIN_DISABLE_INTERNAL_LOGIN', 'FALSE'),
('LOGIN_MANAGE_GROUPS_THROUGH_EXTERNAL_MODULE', 'FALSE'),
('DEFAULTPREF_SIMILAR_AUTHOR_TEST', 'c');

-- --------------------------------------------------------

--
-- Table structure for table `customfields`
--

CREATE TABLE `customfields` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customfieldsinfo`
--

CREATE TABLE `customfieldsinfo` (
  `type_id` int(10) UNSIGNED NOT NULL,
  `type` enum('publication','author','topic') NOT NULL DEFAULT 'publication',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grouprightsprofilelink`
--

CREATE TABLE `grouprightsprofilelink` (
  `group_id` int(10) NOT NULL,
  `rightsprofile_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grouprightsprofilelink`
--

INSERT INTO `grouprightsprofilelink` (`group_id`, `rightsprofile_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 3),
(3, 4),
(4, 2),
(4, 3),
(4, 4),
(5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `keyword_id` int(10) NOT NULL,
  `keyword` text NOT NULL,
  `cleankeyword` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logintegration`
--

CREATE TABLE `logintegration` (
  `token` varchar(30) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `serial` int(11) NOT NULL DEFAULT '0',
  `keepchecking` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `status` enum('active','loggedout','loggedin') NOT NULL DEFAULT 'active',
  `sitename` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notecrossrefid`
--

CREATE TABLE `notecrossrefid` (
  `note_id` int(10) NOT NULL,
  `xref_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_id` int(10) UNSIGNED NOT NULL,
  `pub_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `rights` enum('public','private') NOT NULL DEFAULT 'public',
  `text` mediumtext,
  `read_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `edit_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `derived_read_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `derived_edit_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `pub_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `year` varchar(127) NOT NULL DEFAULT '',
  `actualyear` varchar(127) NOT NULL DEFAULT '',
  `title` mediumtext NOT NULL,
  `bibtex_id` varchar(255) NOT NULL,
  `report_type` varchar(255) NOT NULL DEFAULT '',
  `pub_type` enum('Article','Book','Booklet','Inbook','Incollection','Inproceedings','Manual','Mastersthesis','Misc','Phdthesis','Proceedings','Techreport','Unpublished') DEFAULT NULL,
  `survey` tinyint(1) NOT NULL DEFAULT '0',
  `mark` int(11) NOT NULL DEFAULT '5',
  `series` varchar(127) NOT NULL DEFAULT '',
  `volume` varchar(127) NOT NULL DEFAULT '',
  `publisher` varchar(127) NOT NULL DEFAULT '',
  `location` varchar(127) NOT NULL DEFAULT '',
  `issn` varchar(32) NOT NULL DEFAULT '',
  `isbn` varchar(32) NOT NULL DEFAULT '',
  `firstpage` varchar(10) NOT NULL DEFAULT '0',
  `lastpage` varchar(10) NOT NULL DEFAULT '0',
  `journal` varchar(255) NOT NULL DEFAULT '',
  `booktitle` varchar(255) NOT NULL DEFAULT '',
  `number` varchar(255) NOT NULL DEFAULT '',
  `institution` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `chapter` varchar(127) NOT NULL DEFAULT '',
  `edition` varchar(255) NOT NULL DEFAULT '',
  `howpublished` varchar(255) NOT NULL DEFAULT '',
  `month` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `school` varchar(255) NOT NULL DEFAULT '',
  `note` mediumtext NOT NULL,
  `abstract` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `doi` varchar(255) NOT NULL DEFAULT '',
  `crossref` varchar(255) NOT NULL,
  `namekey` varchar(255) NOT NULL,
  `userfields` mediumtext NOT NULL,
  `specialchars` enum('FALSE','TRUE') NOT NULL DEFAULT 'FALSE',
  `cleanjournal` varchar(255) NOT NULL DEFAULT '',
  `cleantitle` varchar(255) NOT NULL DEFAULT '',
  `cleanauthor` text,
  `read_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `edit_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `derived_read_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `derived_edit_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `pages` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  `coverimage` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`pub_id`, `user_id`, `year`, `actualyear`, `title`, `bibtex_id`, `report_type`, `pub_type`, `survey`, `mark`, `series`, `volume`, `publisher`, `location`, `issn`, `isbn`, `firstpage`, `lastpage`, `journal`, `booktitle`, `number`, `institution`, `address`, `chapter`, `edition`, `howpublished`, `month`, `organization`, `school`, `note`, `abstract`, `url`, `doi`, `crossref`, `namekey`, `userfields`, `specialchars`, `cleanjournal`, `cleantitle`, `cleanauthor`, `read_access_level`, `edit_access_level`, `group_id`, `derived_read_access_level`, `derived_edit_access_level`, `pages`, `status`, `coverimage`) VALUES
(1, 1, '2007', '2007', 'An innovative training system by digital terrestrial television: TSC-learning', '', '', 'Article', 0, 3, '', '', '', '', '', '', '0', '0', 'Web-based Education (WBE 2007)', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'FALSE', 'Web-based Education (WBE 2007)', 'An innovative training system by digital terrestrial television: TSC-learning', 'Recchioni, Marco Castello, Valentina', 'intern', 'intern', 0, 'intern', 'intern', '', 'accepted', '');

-- --------------------------------------------------------

--
-- Table structure for table `publicationauthorlink`
--

CREATE TABLE `publicationauthorlink` (
  `pub_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rank` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `is_editor` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publicationauthorlink`
--

INSERT INTO `publicationauthorlink` (`pub_id`, `author_id`, `rank`, `is_editor`) VALUES
(1, 1, 1, 'N'),
(1, 2, 2, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `publicationkeywordlink`
--

CREATE TABLE `publicationkeywordlink` (
  `pub_id` int(10) NOT NULL,
  `keyword_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rightsprofilerightlink`
--

CREATE TABLE `rightsprofilerightlink` (
  `rightsprofile_id` int(10) NOT NULL,
  `right_name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rightsprofilerightlink`
--

INSERT INTO `rightsprofilerightlink` (`rightsprofile_id`, `right_name`) VALUES
(1, 'database_manage'),
(1, 'edit_all_override'),
(1, 'read_all_override'),
(1, 'user_assign_rights'),
(1, 'user_edit_all'),
(2, 'attachment_edit'),
(2, 'note_edit'),
(2, 'publication_edit'),
(2, 'topic_edit'),
(2, 'user_edit_self'),
(3, 'attachment_read'),
(3, 'bookmarklist'),
(3, 'note_read'),
(3, 'topic_subscription');

-- --------------------------------------------------------

--
-- Table structure for table `rightsprofiles`
--

CREATE TABLE `rightsprofiles` (
  `rightsprofile_id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rightsprofiles`
--

INSERT INTO `rightsprofiles` (`rightsprofile_id`, `name`) VALUES
(1, 'admin_rights'),
(2, 'editor_rights'),
(3, 'reader_rights'),
(4, 'guest_rights');

-- --------------------------------------------------------

--
-- Table structure for table `topicpublicationlink`
--

CREATE TABLE `topicpublicationlink` (
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pub_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topicpublicationlink`
--

INSERT INTO `topicpublicationlink` (`topic_id`, `pub_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cleanname` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `url` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `read_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `edit_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `derived_read_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern',
  `derived_edit_access_level` enum('private','public','intern','group') NOT NULL DEFAULT 'intern'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `name`, `cleanname`, `description`, `url`, `user_id`, `read_access_level`, `edit_access_level`, `group_id`, `derived_read_access_level`, `derived_edit_access_level`) VALUES
(1, 'Top', '', 'No description. This topic is in itself not relevant, it is just a \'topmost parent\' for the topic hierarchy.', '', 0, 'public', 'intern', 0, 'public', 'intern');

-- --------------------------------------------------------

--
-- Table structure for table `topictopiclink`
--

CREATE TABLE `topictopiclink` (
  `source_topic_id` int(10) NOT NULL DEFAULT '0',
  `target_topic_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Hierarchy of topics; typed relations';

-- --------------------------------------------------------

--
-- Table structure for table `userbookmarklists`
--

CREATE TABLE `userbookmarklists` (
  `user_id` int(10) NOT NULL,
  `pub_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergrouplink`
--

CREATE TABLE `usergrouplink` (
  `user_id` int(10) NOT NULL,
  `group_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpublicationmark`
--

CREATE TABLE `userpublicationmark` (
  `pub_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `mark` enum('','1','2','3','4','5') NOT NULL DEFAULT '3',
  `hasread` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpublicationmark`
--

INSERT INTO `userpublicationmark` (`pub_id`, `user_id`, `mark`, `hasread`) VALUES
(1, 1, '3', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `userrights`
--

CREATE TABLE `userrights` (
  `user_id` int(10) NOT NULL,
  `right_name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userrights`
--

INSERT INTO `userrights` (`user_id`, `right_name`) VALUES
(1, 'attachment_edit'),
(1, 'attachment_read'),
(1, 'bookmarklist'),
(1, 'database_manage'),
(1, 'edit_all_override'),
(1, 'note_edit'),
(1, 'note_edit_all'),
(1, 'note_edit_self'),
(1, 'note_read'),
(1, 'publication_edit'),
(1, 'read_all_override'),
(1, 'topic_edit'),
(1, 'topic_subscription'),
(1, 'user_assign_rights'),
(1, 'user_edit_all'),
(1, 'user_edit_self');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `theme` varchar(255) NOT NULL DEFAULT 'darkdefault',
  `password_invalidated` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `newwindowforatt` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `summarystyle` varchar(255) NOT NULL DEFAULT 'author',
  `authordisplaystyle` varchar(255) NOT NULL DEFAULT 'vlf',
  `liststyle` smallint(6) NOT NULL DEFAULT '0',
  `login` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `initials` varchar(10) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `betweenname` varchar(10) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `csname` varchar(10) DEFAULT NULL,
  `abbreviation` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `u_rights` tinyint(2) NOT NULL DEFAULT '0',
  `lastreviewedtopic` int(10) NOT NULL DEFAULT '1',
  `type` enum('group','anon','normal','external') NOT NULL DEFAULT 'normal',
  `lastupdatecheck` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `exportinbrowser` enum('TRUE','FALSE') NOT NULL DEFAULT 'TRUE',
  `utf8bibtex` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE',
  `language` varchar(20) NOT NULL DEFAULT 'english',
  `similar_author_test` varchar(20) NOT NULL DEFAULT 'default'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `theme`, `password_invalidated`, `newwindowforatt`, `summarystyle`, `authordisplaystyle`, `liststyle`, `login`, `password`, `initials`, `firstname`, `betweenname`, `surname`, `csname`, `abbreviation`, `email`, `u_rights`, `lastreviewedtopic`, `type`, `lastupdatecheck`, `exportinbrowser`, `utf8bibtex`, `language`, `similar_author_test`) VALUES
(1, 'default', 'FALSE', 'TRUE', 'title', 'fvl', 50, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'AA', 'Admin', 'the', 'Admin', NULL, 'ADM', '', 0, 1, 'normal', 1502294036, 'TRUE', 'FALSE', 'en', 'default'),
(2, 'darkdefault', 'FALSE', 'FALSE', 'author', 'vlf', 0, '', '', NULL, NULL, NULL, 'admins', NULL, 'adm_grp', '', 0, 1, 'group', 0, 'TRUE', 'FALSE', 'en', 'default'),
(3, 'darkdefault', 'FALSE', 'FALSE', 'author', 'vlf', 0, '', '', NULL, NULL, NULL, 'readers', NULL, 'read_grp', '', 0, 1, 'group', 0, 'TRUE', 'FALSE', 'en', 'default'),
(4, 'darkdefault', 'FALSE', 'FALSE', 'author', 'vlf', 0, '', '', NULL, NULL, NULL, 'editors', NULL, 'ed_grp', '', 0, 1, 'group', 0, 'TRUE', 'FALSE', 'en', 'default'),
(5, 'darkdefault', 'FALSE', 'FALSE', 'author', 'vlf', 0, '', '', NULL, NULL, NULL, 'guests', NULL, 'gue_grp', '', 0, 1, 'group', 0, 'TRUE', 'FALSE', 'en', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `usertopiclink`
--

CREATE TABLE `usertopiclink` (
  `collapsed` int(2) NOT NULL DEFAULT '0',
  `user_id` int(10) NOT NULL DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `star` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertopiclink`
--

INSERT INTO `usertopiclink` (`collapsed`, `user_id`, `topic_id`, `star`) VALUES
(0, 1, 1, 0),
(0, 2, 1, 0),
(0, 3, 1, 0),
(0, 4, 1, 0),
(0, 5, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aigaiongeneral`
--
ALTER TABLE `aigaiongeneral`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`att_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`) USING HASH,
  ADD KEY `author_cleanname` (`cleanname`) USING BTREE,
  ADD KEY `author_synonym_of` (`synonym_of`) USING HASH;

--
-- Indexes for table `availablerights`
--
ALTER TABLE `availablerights`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `changehistory`
--
ALTER TABLE `changehistory`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`setting`);

--
-- Indexes for table `customfields`
--
ALTER TABLE `customfields`
  ADD PRIMARY KEY (`entry_id`);

--
-- Indexes for table `customfieldsinfo`
--
ALTER TABLE `customfieldsinfo`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `grouprightsprofilelink`
--
ALTER TABLE `grouprightsprofilelink`
  ADD PRIMARY KEY (`group_id`,`rightsprofile_id`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`keyword_id`);

--
-- Indexes for table `logintegration`
--
ALTER TABLE `logintegration`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`pub_id`) USING HASH,
  ADD KEY `publication_derived_read_access_level` (`derived_read_access_level`) USING HASH,
  ADD KEY `publication_group_id` (`group_id`) USING HASH,
  ADD KEY `publication_user_id` (`user_id`) USING HASH,
  ADD KEY `publication_title` (`title`(255)) USING BTREE,
  ADD KEY `publication_pub_type` (`pub_type`) USING HASH,
  ADD KEY `publication_cleantitle` (`cleantitle`) USING BTREE;

--
-- Indexes for table `publicationauthorlink`
--
ALTER TABLE `publicationauthorlink`
  ADD PRIMARY KEY (`pub_id`,`author_id`,`is_editor`) USING HASH,
  ADD KEY `pal_author_id` (`author_id`) USING HASH;

--
-- Indexes for table `publicationkeywordlink`
--
ALTER TABLE `publicationkeywordlink`
  ADD PRIMARY KEY (`pub_id`,`keyword_id`);

--
-- Indexes for table `rightsprofilerightlink`
--
ALTER TABLE `rightsprofilerightlink`
  ADD PRIMARY KEY (`rightsprofile_id`,`right_name`);

--
-- Indexes for table `rightsprofiles`
--
ALTER TABLE `rightsprofiles`
  ADD PRIMARY KEY (`rightsprofile_id`);

--
-- Indexes for table `topicpublicationlink`
--
ALTER TABLE `topicpublicationlink`
  ADD PRIMARY KEY (`topic_id`,`pub_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `topictopiclink`
--
ALTER TABLE `topictopiclink`
  ADD PRIMARY KEY (`source_topic_id`),
  ADD KEY `target_topic_id` (`target_topic_id`);

--
-- Indexes for table `userbookmarklists`
--
ALTER TABLE `userbookmarklists`
  ADD PRIMARY KEY (`user_id`,`pub_id`);

--
-- Indexes for table `usergrouplink`
--
ALTER TABLE `usergrouplink`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `userpublicationmark`
--
ALTER TABLE `userpublicationmark`
  ADD PRIMARY KEY (`pub_id`,`user_id`),
  ADD KEY `pub_id_mark` (`pub_id`,`mark`) USING HASH;

--
-- Indexes for table `userrights`
--
ALTER TABLE `userrights`
  ADD PRIMARY KEY (`right_name`,`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `usertopiclink`
--
ALTER TABLE `usertopiclink`
  ADD PRIMARY KEY (`user_id`,`topic_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `att_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `customfields`
--
ALTER TABLE `customfields`
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customfieldsinfo`
--
ALTER TABLE `customfieldsinfo`
  MODIFY `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `keyword_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
  MODIFY `pub_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rightsprofiles`
--
ALTER TABLE `rightsprofiles`
  MODIFY `rightsprofile_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
