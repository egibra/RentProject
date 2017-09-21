-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2017 at 11:13 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktyvavimo_kodai`
--

CREATE TABLE `aktyvavimo_kodai` (
  `id` int(11) NOT NULL,
  `kodas` text COLLATE utf8_lithuanian_ci NOT NULL,
  `fk_vartotojas` varchar(30) COLLATE utf8_lithuanian_ci NOT NULL,
  `pasibaigimo_data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `aktyvavimo_kodai`
--

INSERT INTO `aktyvavimo_kodai` (`id`, `kodas`, `fk_vartotojas`, `pasibaigimo_data`) VALUES
(1, '3c26bce4-522d-4183-9e4a-a39d79bf57be', 'ret@rrr.lep', '2017-05-22 11:38:50'),
(4, '6e84b2a3-56be-414b-bcc5-6f2c2bcd2f95', 'herkus.dauksas@gmail.com', '2017-05-22 17:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `daiktas`
--

CREATE TABLE `daiktas` (
  `pavadinimas` varchar(40) COLLATE utf8_lithuanian_ci NOT NULL,
  `verte` decimal(6,2) NOT NULL,
  `paros_kaina` decimal(5,2) NOT NULL,
  `isleidimo_data` date NOT NULL,
  `trumpas_aprasymas` text COLLATE utf8_lithuanian_ci NOT NULL,
  `ilgas_aprasymas` text COLLATE utf8_lithuanian_ci,
  `nuolaida_proc` decimal(5,2) NOT NULL DEFAULT '0.00',
  `kiekis_turimas_viso` int(11) NOT NULL,
  `kiekis_isnuomota_dabar` int(11) NOT NULL,
  `kiekis_isnuomota_viso` int(11) NOT NULL,
  `kodas` char(7) COLLATE utf8_lithuanian_ci NOT NULL,
  `pagrindine_nuotrauka` int(11) DEFAULT NULL,
  `kategorija` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `ar_nuomojamas` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `daiktas`
--

INSERT INTO `daiktas` (`pavadinimas`, `verte`, `paros_kaina`, `isleidimo_data`, `trumpas_aprasymas`, `ilgas_aprasymas`, `nuolaida_proc`, `kiekis_turimas_viso`, `kiekis_isnuomota_dabar`, `kiekis_isnuomota_viso`, `kodas`, `pagrindine_nuotrauka`, `kategorija`, `id`, `ar_nuomojamas`) VALUES
('Sed nulla ante,', '87.72', '5.43', '2009-06-02', 'sapien.', 'hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu.', '0.00', 17, 0, 0, 'M9F03DN', NULL, 3, 1, 1),
('arcu.', '47.45', '5.88', '2011-03-03', 'Nulla tincidunt, neque vitae semper egestas, urna justo', 'neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in', '61.00', 2, 0, 44, 'K2I87AG', NULL, 1, 2, 1),
('felis eget', '88.25', '3.57', '2001-06-11', 'at, iaculis quis,', 'blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit,', '22.00', 10, 0, 2, 'V6Y22HT', NULL, 2, 3, 1),
('eget odio.', '85.23', '1.18', '2015-03-22', 'vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet', 'convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse', '76.00', 19, 0, 40, 'U2W69WD', NULL, 3, 4, 1),
('vulputate, posuere vulputate,', '28.09', '2.61', '2014-06-28', 'dolor vitae dolor. Donec', 'Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue,', '13.00', 19, 0, 0, 'F3A56PQ', NULL, 4, 5, 1),
('rutrum eu, ultrices', '14.46', '2.86', '2003-05-05', 'lorem vitae odio', 'Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra.', '12.00', 3, 0, 20, 'K3U73NF', NULL, 2, 6, 1),
('posuere', '68.88', '8.79', '2010-11-27', 'ac, fermentum vel, mauris. Integer sem elit, pharetra', 'Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum', '50.00', 19, 0, 18, 'N8W60UP', NULL, 3, 7, 1),
('nisi', '18.98', '9.64', '2011-01-03', 'Suspendisse dui.', 'ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet,', '47.00', 10, 0, 10, 'E4O37ZC', NULL, 1, 8, 1),
('Suspendisse', '84.94', '0.03', '2015-10-24', 'pretium aliquet, metus urna convallis erat, eget', 'sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula', '48.00', 12, 0, 17, 'P2H49VV', NULL, 4, 9, 1),
('orci. Phasellus dapibus', '94.64', '1.11', '2005-04-28', 'feugiat placerat velit. Quisque', 'ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit', '41.00', 12, 0, 38, 'X8U23MX', NULL, 3, 10, 1),
('quis turpis vitae', '10.78', '5.17', '2015-09-09', 'aliquet libero.', 'rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida', '46.00', 5, 0, 21, 'W1L37SM', NULL, 1, 11, 1),
('non, vestibulum', '78.45', '4.29', '2016-09-06', 'Phasellus fermentum convallis', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies', '44.00', 1, 0, 44, 'H4U02KT', NULL, 3, 12, 1),
('Praesent interdum ligula', '94.13', '1.74', '2001-11-23', 'mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum.', 'Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras', '13.00', 9, 0, 41, 'C4U74QQ', NULL, 1, 13, 1),
('nibh enim, gravida', '11.98', '9.04', '2004-09-01', 'turpis vitae purus gravida sagittis.', 'dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique', '57.00', 1, 0, 17, 'B5U59WO', NULL, 3, 14, 1),
('quis accumsan', '83.43', '6.81', '2012-03-02', 'nonummy. Fusce fermentum fermentum arcu. Vestibulum ante', 'feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat', '72.00', 9, 0, 45, 'Y2O66OJ', NULL, 1, 15, 1),
('est.', '70.48', '2.52', '2012-07-21', 'quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla.', 'a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non,', '10.00', 13, 0, 13, 'Q1M73PC', NULL, 1, 16, 1),
('neque', '53.27', '3.42', '2004-06-25', 'dolor elit, pellentesque a, facilisis non,', 'Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', '75.00', 4, 0, 37, 'O4S40MS', NULL, 4, 17, 1),
('Proin non', '6.31', '6.06', '2010-01-14', 'Fusce mollis. Duis sit', 'tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas', '28.00', 9, 0, 39, 'V6X70KC', NULL, 3, 18, 1),
('adipiscing elit. Aliquam', '52.54', '6.36', '2007-01-10', 'egestas. Sed pharetra, felis', 'arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus', '62.00', 13, 0, 45, 'S6M10GV', NULL, 4, 19, 1),
('consectetuer adipiscing elit.', '83.79', '5.86', '2006-06-26', 'neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce', 'Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque.', '41.00', 1, 0, 1, 'Y5J19QA', NULL, 3, 20, 1),
('et magnis', '71.07', '8.51', '2000-07-05', 'neque. Morbi quis', 'metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim.', '33.00', 3, 0, 21, 'J3J90BD', NULL, 2, 21, 1),
('sagittis. Duis', '47.51', '2.07', '2017-01-11', 'Integer', 'a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros.', '41.00', 18, 0, 9, 'E8K79TB', NULL, 4, 22, 1),
('sem, consequat', '6.98', '5.60', '2000-11-26', 'Ut tincidunt orci quis lectus. Nullam suscipit,', 'Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at', '23.00', 1, 0, 47, 'J5Q39JQ', NULL, 3, 23, 1),
('vulputate', '97.91', '5.10', '2014-05-02', 'congue a, aliquet vel, vulputate eu, odio.', 'ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget', '12.00', 16, 0, 2, 'B3C32QX', NULL, 1, 24, 1),
('odio. Phasellus at', '16.09', '2.81', '2004-09-08', 'ultricies sem', 'natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed', '75.00', 8, 0, 6, 'F3H59NV', NULL, 2, 25, 1),
('fames ac turpis', '9.09', '3.11', '2008-03-23', 'faucibus lectus, a', 'lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis', '50.00', 5, 0, 2, 'N1I08YS', NULL, 2, 26, 1),
('suscipit nonummy.', '9.60', '7.62', '2010-05-16', 'pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum.', 'Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac', '39.00', 12, 0, 6, 'W2V72KJ', NULL, 4, 27, 1),
('ornare placerat, orci', '28.45', '3.79', '2006-05-13', 'metus eu', 'vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae', '22.00', 17, 0, 12, 'N5N68YS', NULL, 2, 28, 1),
('Integer', '94.69', '6.21', '2006-05-27', 'Fusce feugiat. Lorem ipsum', 'pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis', '18.00', 11, 0, 10, 'E5F22FT', NULL, 4, 29, 1),
('vel arcu.', '70.93', '8.73', '2011-02-27', 'tincidunt', 'nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede,', '24.00', 16, 0, 11, 'D5Y47ZH', NULL, 4, 30, 1),
('non sapien molestie', '61.24', '6.92', '2012-05-05', 'vulputate velit', 'at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique', '11.00', 15, 0, 11, 'R8T56FE', NULL, 4, 31, 1),
('a, dui. Cras', '37.19', '9.40', '2006-02-24', 'magna', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In', '17.00', 3, 0, 38, 'H7P91YI', NULL, 4, 32, 1),
('Class aptent taciti', '88.38', '1.75', '2013-10-20', 'ac nulla.', 'Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis,', '81.00', 2, 0, 31, 'O4C61MV', NULL, 1, 33, 1),
('Vestibulum', '98.50', '1.43', '2011-02-17', 'in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est', 'laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis', '82.00', 4, 0, 30, 'E9E56OM', NULL, 4, 34, 1),
('Sed auctor', '22.84', '7.35', '2003-08-06', 'nibh. Phasellus nulla. Integer', 'molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus', '88.00', 12, 0, 49, 'W9N41NJ', NULL, 1, 35, 1),
('Vestibulum', '30.29', '1.89', '2004-09-24', 'tincidunt', 'dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor,', '42.00', 17, 0, 49, 'E4W73XM', NULL, 3, 36, 1),
('odio', '18.87', '9.52', '2006-07-16', 'nulla vulputate dui, nec tempus mauris', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu', '22.00', 2, 0, 24, 'S8X87ID', NULL, 4, 37, 1),
('dolor.', '54.60', '3.64', '2013-05-12', 'convallis in, cursus et,', 'lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer', '55.00', 19, 0, 47, 'T3K96LD', NULL, 1, 38, 1),
('sit', '88.42', '0.57', '2001-01-10', 'eu', 'dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien', '53.00', 13, 0, 8, 'A8M53CR', NULL, 4, 39, 1),
('commodo hendrerit.', '54.34', '2.61', '2011-11-29', 'dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu', 'felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl.', '28.00', 10, 0, 30, 'B6B59YG', NULL, 4, 40, 1),
('lectus', '83.96', '7.74', '2013-12-14', 'cursus.', 'lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat', '41.00', 1, 0, 18, 'W6Q24ZO', NULL, 3, 41, 1),
('vulputate eu,', '10.18', '4.18', '2014-03-14', 'enim. Sed nulla ante,', 'mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis', '62.00', 10, 0, 48, 'R7C78AH', NULL, 4, 42, 1),
('imperdiet dictum', '16.44', '6.34', '2000-11-07', 'In', 'auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem', '71.00', 19, 0, 47, 'P3K26QQ', NULL, 1, 43, 1),
('blandit.', '74.16', '6.86', '2016-11-20', 'Nullam enim. Sed nulla ante, iaculis', 'fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim.', '11.00', 16, 0, 41, 'Z6L09NN', NULL, 1, 44, 1),
('et netus', '74.70', '4.08', '2007-11-12', 'at lacus. Quisque purus sapien, gravida non, sollicitudin', 'primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem', '30.00', 15, 0, 46, 'U5Q13KF', NULL, 1, 45, 1),
('dictum eu,', '85.84', '6.21', '2001-10-31', 'risus a ultricies adipiscing, enim mi tempor', 'penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem', '28.00', 11, 0, 27, 'G0E08ZB', NULL, 3, 46, 1),
('Aenean', '56.86', '4.69', '2016-04-12', 'ridiculus', 'Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis', '15.00', 7, 0, 42, 'F8J61LK', NULL, 1, 47, 1),
('orci luctus et', '16.65', '7.47', '2014-05-24', 'Mauris eu turpis. Nulla aliquet. Proin velit. Sed', 'luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus', '19.00', 11, 0, 8, 'D9G43RE', NULL, 2, 48, 1),
('lobortis. Class aptent', '89.83', '9.93', '2002-06-17', 'mauris sagittis placerat. Cras dictum', 'velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus', '85.00', 15, 0, 35, 'R5O97UX', NULL, 1, 49, 1),
('convallis ligula.', '47.33', '4.49', '2003-09-10', 'a feugiat tellus lorem eu metus.', 'malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec', '75.00', 4, 0, 29, 'L8H00HR', NULL, 4, 50, 1),
('lectus,', '29.45', '6.15', '2014-06-09', 'Donec non justo. Proin non massa non ante', 'feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas,', '85.00', 3, 0, 18, 'F9B79GM', NULL, 4, 51, 1),
('ipsum nunc id', '23.69', '8.49', '2002-10-08', 'lorem ac risus.', 'dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut', '87.00', 1, 0, 32, 'D0U20DZ', NULL, 1, 52, 1),
('dolor. Fusce', '23.85', '1.25', '2003-07-23', 'ridiculus mus. Proin vel arcu eu odio tristique pharetra.', 'vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit.', '32.00', 12, 0, 18, 'T4Z04IK', NULL, 1, 53, 1),
('laoreet,', '35.73', '2.16', '2009-02-05', 'mauris, rhoncus id,', 'ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices', '29.00', 7, 0, 3, 'P3Q36YB', NULL, 4, 54, 1),
('Morbi', '27.99', '5.60', '2014-08-30', 'faucibus', 'pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae,', '78.00', 2, 0, 39, 'Y9C43FY', NULL, 3, 55, 1),
('mauris erat', '7.60', '5.62', '2003-12-17', 'Nam ligula elit, pretium et, rutrum non, hendrerit id, ante.', 'cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus', '37.00', 8, 0, 4, 'X5H52ZP', NULL, 2, 56, 1),
('enim.', '54.76', '5.37', '2015-03-19', 'tellus. Aenean egestas', 'Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin', '4.00', 6, 0, 33, 'D4F19PV', NULL, 4, 57, 1),
('quam a felis', '44.46', '2.96', '2011-02-16', 'lacus. Mauris non dui', 'erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum', '87.00', 5, 0, 45, 'S0Y57ZO', NULL, 4, 58, 1),
('dui. Fusce aliquam,', '90.77', '5.12', '2004-09-11', 'eget ipsum. Suspendisse sagittis. Nullam', 'Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed', '41.00', 14, 0, 2, 'R0G71EM', NULL, 1, 59, 1),
('accumsan', '36.98', '4.78', '2007-06-20', 'neque. Nullam ut nisi a odio semper cursus. Integer', 'ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim', '62.00', 20, 0, 24, 'B2J07TR', NULL, 1, 60, 1),
('sed, facilisis', '0.98', '6.15', '2001-08-07', 'vulputate', 'faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit', '42.00', 11, 0, 11, 'W1H52ZY', NULL, 3, 61, 1),
('sociis natoque', '91.04', '0.60', '2011-07-27', 'laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend,', 'dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,', '78.00', 12, 0, 34, 'B6T54LT', NULL, 3, 62, 1),
('lectus.', '10.73', '9.32', '2012-10-11', 'adipiscing elit. Curabitur sed tortor.', 'amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed', '74.00', 18, 0, 18, 'C7G00KP', NULL, 4, 63, 1),
('dolor. Nulla semper', '63.68', '8.56', '2011-10-29', 'lorem ac risus. Morbi', 'Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy', '42.00', 9, 0, 20, 'S5K84TT', NULL, 3, 64, 1),
('velit eget laoreet', '91.54', '3.76', '2011-08-24', 'sapien, cursus in, hendrerit consectetuer, cursus et,', 'nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit', '82.00', 18, 0, 33, 'O3G59YN', NULL, 1, 65, 1),
('mattis. Cras', '1.67', '3.26', '2013-01-14', 'Donec tempor,', 'ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi', '71.00', 2, 0, 44, 'X1Z53SR', NULL, 3, 66, 1),
('nunc', '79.69', '7.63', '2008-07-17', 'iaculis', 'massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae', '20.00', 12, 0, 13, 'N7F57NA', NULL, 4, 67, 1),
('velit.', '14.65', '7.63', '2003-12-27', 'Nunc', 'at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed', '69.00', 3, 0, 14, 'G3C08LC', NULL, 2, 68, 1),
('ante.', '26.32', '5.16', '2014-08-27', 'a', 'porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean', '63.00', 4, 0, 13, 'U7T58JQ', NULL, 2, 69, 1),
('accumsan', '56.04', '2.07', '2000-09-22', 'Nulla eu neque pellentesque massa', 'dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec', '83.00', 17, 0, 26, 'O2E96JT', NULL, 1, 70, 1),
('Nam porttitor scelerisque', '35.86', '8.72', '2000-02-09', 'est,', 'risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat', '10.00', 12, 0, 13, 'C6K11VN', NULL, 2, 71, 1),
('dolor dolor,', '99.98', '5.35', '2009-03-27', 'Sed nulla ante, iaculis', 'tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum', '35.00', 1, 0, 16, 'S8O76NU', NULL, 4, 72, 1),
('Duis', '80.99', '9.67', '2001-04-03', 'consequat dolor', 'a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi.', '37.00', 12, 0, 28, 'H1N61TJ', NULL, 2, 73, 1),
('vitae aliquam eros', '55.29', '0.93', '2011-12-09', 'turpis non enim. Mauris quis', 'netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat.', '49.00', 4, 0, 14, 'B5O61NE', NULL, 3, 74, 1),
('augue ac', '15.58', '1.25', '2011-12-29', 'Donec fringilla. Donec', 'Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque', '52.00', 5, 0, 43, 'V2V51CK', NULL, 4, 75, 1),
('eget,', '75.96', '3.82', '2009-01-24', 'nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque,', 'sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc', '37.00', 5, 0, 17, 'J6A07UJ', NULL, 4, 76, 1),
('ultrices posuere cubilia gvsgseg', '63.56', '6.93', '2002-11-12', 'Duis sit amet diam', 'Gera kamera gerai filmuoja gerus klipus jusu atostogu metu. Su preke kartu duodamas neperslampantis maiselis, kad kamera veiktu po vandeniu ir nesuslaptu xd. Filmuoja 4k rezoliucija be bėdų ir turi nakties rėžimą kuris Gera kamera gerai filmuoja gerus klipus jusu atostogu metu. Su preke kartu duodamas neperslampantis maiselis, kad kamera veiktu po vandeniu ir nesuslaptu xd. Filmuoja 4k rezoliucija be bėdų ir turi nakties rėžimą, kuris asdasdasd  vandeniu ir nesuslaptu xd. Filmuoja 4k rezoliucija be bėdų ir tGera kamera gerai filmuoja gerus klipus jusu atostogu metu. Su preke kartu duodamas neperslampantis maiselis, kad kamera veiktu po vandeniu ir nesuslaptu xd. Filmuoja 4k rezoliucija be bėdų ir turi nakties rėžimą kuris Gera kamera gerai filmuoja gerus klipus jusu atostogu metu. Su preke kartu duodamas neperslampantis maiselis, kad kamera veiktu po vandeniu ir nesuslaptu xd. Filmuoja 4k rezoliucija be bėdų ir turi nakties rėžimą kuris asdasdasd  vandeniu ir nesuslaptu xd. Filmuoja 4k rezoliucija be bėdų ir t', '30.00', 17, 0, 50, 'Y8J89KK', 1, 3, 77, 1),
('facilisis non,', '72.20', '8.17', '2008-01-01', 'Aenean sed pede nec ante blandit viverra. Donec tempus,', 'pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra.', '64.00', 6, 0, 37, 'M6D34JS', NULL, 4, 78, 1),
('Nullam', '43.66', '8.86', '2016-12-21', 'eget tincidunt dui augue eu tellus. Phasellus', 'libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue', '77.00', 15, 0, 12, 'B8M83JH', NULL, 1, 79, 1),
('nunc est, mollis', '0.61', '5.14', '2008-10-17', 'purus. Duis', 'eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient', '27.00', 1, 0, 23, 'G5S05OJ', NULL, 2, 80, 1),
('Phasellus', '9.63', '2.20', '2016-04-02', 'euismod est arcu ac orci.', 'aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius', '49.00', 13, 0, 25, 'N7G06HS', NULL, 1, 81, 1),
('tristique pellentesque,', '61.11', '4.56', '2007-09-24', 'velit egestas lacinia. Sed congue, elit', 'eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum', '1.00', 19, 0, 6, 'X9R72IC', NULL, 4, 82, 1),
('mi tempor lorem,', '90.89', '8.36', '2002-03-07', 'nibh. Aliquam ornare, libero', 'eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem.', '17.00', 15, 0, 48, 'G7E89WF', NULL, 2, 83, 1),
('metus. In', '1.17', '8.32', '2004-08-20', 'lacus vestibulum lorem, sit amet ultricies sem magna', 'consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas', '14.00', 15, 0, 45, 'O4V07KB', NULL, 4, 84, 1),
('non', '82.39', '6.01', '2016-09-05', 'Nulla dignissim. Maecenas ornare', 'Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula', '89.00', 8, 0, 30, 'N5G27ST', NULL, 1, 85, 1),
('ante. Maecenas mi', '79.60', '0.57', '2002-08-19', 'cursus et, eros. Proin', 'Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan', '83.00', 1, 0, 31, 'O3T07AE', NULL, 4, 86, 1),
('est.', '54.84', '4.30', '2015-10-16', 'ante blandit', 'adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu.', '12.00', 17, 0, 41, 'M0W79GF', NULL, 1, 87, 1),
('dignissim pharetra.', '14.10', '4.84', '2014-09-30', 'a tortor.', 'Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl', '52.00', 3, 0, 43, 'Z5W23CR', NULL, 2, 88, 1),
('Integer', '27.94', '5.39', '2008-01-08', 'condimentum. Donec', 'sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum', '28.00', 20, 0, 31, 'O1W02UO', NULL, 4, 89, 1),
('interdum.', '31.61', '0.21', '2014-11-13', 'Praesent eu dui. Cum', 'cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida.', '66.00', 8, 0, 46, 'L0K56GF', NULL, 4, 90, 1),
('Cras eu tellus', '89.10', '2.93', '2005-07-20', 'urna. Ut tincidunt vehicula risus. Nulla eget metus eu', 'orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla.', '30.00', 5, 0, 39, 'E5B44HX', NULL, 2, 91, 1),
('litora', '59.62', '2.70', '2005-04-05', 'feugiat. Sed nec metus facilisis', 'Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus', '21.00', 19, 0, 9, 'D8A39UH', NULL, 1, 92, 1),
('Curabitur ut odio', '46.23', '7.45', '2008-03-03', 'netus et malesuada fames', 'mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut', '26.00', 14, 0, 8, 'G6T96MN', NULL, 2, 93, 1),
('id,', '72.08', '0.67', '2016-01-18', 'iaculis nec, eleifend', 'augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non', '38.00', 9, 0, 15, 'K5R41AC', NULL, 3, 94, 1),
('eget massa.', '5.69', '6.33', '2007-07-03', 'eu eros. Nam consequat dolor vitae', 'euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada', '85.00', 14, 0, 34, 'W0S24FL', NULL, 3, 95, 1),
('Nunc ac', '15.33', '1.32', '2000-09-17', 'sit', 'elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit', '45.00', 17, 0, 17, 'Q5X32WD', NULL, 1, 96, 1),
('gravida', '76.94', '4.33', '2009-11-13', 'eu metus. In lorem. Donec elementum,', 'ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor', '15.00', 6, 0, 19, 'D3W72YJ', NULL, 2, 97, 1),
('sit', '97.09', '4.02', '2000-12-04', 'ullamcorper. Duis cursus, diam at', 'quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis', '37.00', 4, 0, 5, 'D6F82DR', NULL, 3, 98, 1),
('quis massa.', '35.27', '7.01', '2013-10-08', 'in, tempus eu, ligula. Aenean euismod mauris', 'eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In', '15.00', 8, 0, 27, 'N8V61CI', NULL, 3, 99, 1),
('nec enim.', '13.00', '1.81', '2007-09-10', 'id, blandit at,', 'fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis', '86.00', 14, 0, 3, 'Q7Y91TM', NULL, 2, 100, 1),
('qef', '0.00', '0.00', '2017-03-31', '', '', '0.00', 0, 0, 0, 'efq', NULL, 1, 101, 0);

-- --------------------------------------------------------

--
-- Table structure for table `daikto_parametrai`
--

CREATE TABLE `daikto_parametrai` (
  `id` int(11) NOT NULL,
  `fk_daiktas` int(11) NOT NULL,
  `fk_parametras` int(11) NOT NULL,
  `reiksme` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `daikto_parametrai`
--

INSERT INTO `daikto_parametrai` (`id`, `fk_daiktas`, `fk_parametras`, `reiksme`) VALUES
(1, 1, 1, 'Yra'),
(2, 1, 3, '654321'),
(3, 1, 4, '0,2'),
(4, 1, 6, 'Yra'),
(5, 1, 5, '789'),
(6, 1, 2, '123456');

-- --------------------------------------------------------

--
-- Table structure for table `daikto_priedas`
--

CREATE TABLE `daikto_priedas` (
  `fk_priedas` int(11) NOT NULL,
  `fk_daiktas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategorijos`
--

CREATE TABLE `kategorijos` (
  `id` int(11) NOT NULL,
  `kategorija` char(16) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `kategorijos`
--

INSERT INTO `kategorijos` (`id`, `kategorija`) VALUES
(1, 'gopro'),
(2, 'zaidimu_konsoles'),
(3, 'fotoaparatai'),
(4, 'dronai');

-- --------------------------------------------------------

--
-- Table structure for table `kategorijos_parametrai`
--

CREATE TABLE `kategorijos_parametrai` (
  `id` int(11) NOT NULL,
  `fk_kategorija` int(11) NOT NULL,
  `pavadinimas` varchar(100) COLLATE utf8_lithuanian_ci NOT NULL,
  `aprasymas` text COLLATE utf8_lithuanian_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `kategorijos_parametrai`
--

INSERT INTO `kategorijos_parametrai` (`id`, `fk_kategorija`, `pavadinimas`, `aprasymas`) VALUES
(1, 3, 'blykste', '4142'),
(2, 3, 'rezoliucija_x', NULL),
(3, 3, 'rezoliucija_y', NULL),
(4, 3, 'baterijos_laikas_h', NULL),
(5, 3, 'atminties_dydis_gb', NULL),
(6, 3, 'deklas', '');

-- --------------------------------------------------------

--
-- Table structure for table `krepselis`
--

CREATE TABLE `krepselis` (
  `id` int(11) NOT NULL,
  `fk_daiktas` int(11) NOT NULL,
  `fk_vartotojas` varchar(30) COLLATE utf8_lithuanian_ci NOT NULL,
  `kiekis` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `krepselis`
--

INSERT INTO `krepselis` (`id`, `fk_daiktas`, `fk_vartotojas`, `kiekis`) VALUES
(1, 36, 'herkus.dauksas@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nuotrauka`
--

CREATE TABLE `nuotrauka` (
  `pavadinimas` text COLLATE utf8_lithuanian_ci,
  `id` int(11) NOT NULL,
  `fk_daiktas` int(11) NOT NULL,
  `failo_pavadinimas` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `nuotrauka`
--

INSERT INTO `nuotrauka` (`pavadinimas`, `id`, `fk_daiktas`, `failo_pavadinimas`) VALUES
('Pagrindine nuotrauka 77 id.', 1, 77, 'ID1.png');

-- --------------------------------------------------------

--
-- Table structure for table `papildomas_mokestis`
--

CREATE TABLE `papildomas_mokestis` (
  `pavadinimas` varchar(40) COLLATE utf8_lithuanian_ci NOT NULL,
  `suma` decimal(5,2) NOT NULL,
  `aprasymas` text COLLATE utf8_lithuanian_ci,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `papildomi_uzsakymo_meksciai`
--

CREATE TABLE `papildomi_uzsakymo_meksciai` (
  `fk_uzsakymas` int(11) NOT NULL,
  `fk_papildomas_mokestis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `priedas`
--

CREATE TABLE `priedas` (
  `pavadinimas` varchar(40) COLLATE utf8_lithuanian_ci NOT NULL,
  `kodas` char(6) COLLATE utf8_lithuanian_ci NOT NULL,
  `verte` decimal(6,2) NOT NULL,
  `kiekis_turimas_viso` int(11) NOT NULL,
  `kiekis_isnuomota_dabar` int(11) NOT NULL,
  `paros_kaina` decimal(5,2) NOT NULL,
  `aprasas` text COLLATE utf8_lithuanian_ci,
  `pagrindine_nuotrauka` text COLLATE utf8_lithuanian_ci,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `priedu_grupe`
--

CREATE TABLE `priedu_grupe` (
  `priedo_kiekis` int(11) NOT NULL,
  `fk_priedas` int(11) NOT NULL,
  `fk_uzsakymas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schema_version`
--

CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_lithuanian_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_lithuanian_ci NOT NULL,
  `script` varchar(1000) COLLATE utf8_lithuanian_ci NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) COLLATE utf8_lithuanian_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `schema_version`
--

INSERT INTO `schema_version` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2017-04-02 07:16:47', 0, 1),
(2, '2', 'daiktai', 'SQL', 'V2__daiktai.sql', -896076581, 'root', '2017-04-02 07:16:48', 521, 1),
(3, '3', 'update', 'SQL', 'V3__update.sql', -246314570, 'root', '2017-04-07 21:18:49', 1903, 1),
(4, '4', 'update', 'SQL', 'V4__update.sql', -1360532350, 'root', '2017-04-12 16:40:58', 895, 1),
(5, '6', 'krepselis', 'SQL', 'V6__krepselis.sql', 1087759060, 'root', '2017-04-19 10:31:56', 240, 1),
(6, '7', 'update', 'SQL', 'V7__update.sql', 1398606509, 'root', '2017-04-19 11:41:31', 56, 1),
(7, '8', 'update', 'SQL', 'V8__update.sql', 628663652, 'root', '2017-04-20 13:49:40', 1526, 1),
(8, '9', 'order', 'SQL', 'V9__order.sql', -823523576, 'root', '2017-05-18 08:50:25', 1731, 1),
(9, '10', 'order', 'SQL', 'V10__order.sql', -752047669, 'root', '2017-05-18 08:50:25', 715, 1),
(10, '11', 'order', 'SQL', 'V11__order.sql', 347006929, 'root', '2017-05-23 11:11:43', 328, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uzsakovas`
--

CREATE TABLE `uzsakovas` (
  `uzsakymo_id` int(11) NOT NULL,
  `el_pastas` varchar(30) COLLATE utf8_lithuanian_ci NOT NULL,
  `vardas` varchar(30) COLLATE utf8_lithuanian_ci NOT NULL,
  `pavarde` varchar(30) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uzsakymas`
--

CREATE TABLE `uzsakymas` (
  `nr` int(11) NOT NULL,
  `nuomos_pradzia` date NOT NULL,
  `nuomos_pabaiga` date NOT NULL,
  `pagrindine_kaina` decimal(6,2) NOT NULL,
  `busena` int(11) NOT NULL,
  `fk_uzsakovas` varchar(30) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `fk_adminas` varchar(30) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `adresas` text COLLATE utf8_lithuanian_ci NOT NULL,
  `telefonas` varchar(20) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uzsakymo_busenos`
--

CREATE TABLE `uzsakymo_busenos` (
  `id` int(11) NOT NULL,
  `busena` char(11) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `uzsakymo_busenos`
--

INSERT INTO `uzsakymo_busenos` (`id`, `busena`) VALUES
(1, 'nepateiktas'),
(2, 'pateiktas'),
(3, 'paruosiama'),
(4, 'patvirtinta'),
(5, 'isnuomota'),
(6, 'pasibaiges');

-- --------------------------------------------------------

--
-- Table structure for table `uzsakymo_daiktas`
--

CREATE TABLE `uzsakymo_daiktas` (
  `id` int(11) NOT NULL,
  `fk_daiktas` int(11) NOT NULL,
  `fk_uzsakymas` int(11) NOT NULL,
  `kiekis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vartotojas`
--

CREATE TABLE `vartotojas` (
  `vardas` varchar(30) COLLATE utf8_lithuanian_ci NOT NULL,
  `pavarde` varchar(30) COLLATE utf8_lithuanian_ci NOT NULL,
  `adresas` text COLLATE utf8_lithuanian_ci,
  `el_pastas` varchar(30) COLLATE utf8_lithuanian_ci NOT NULL,
  `slaptazodis` text COLLATE utf8_lithuanian_ci NOT NULL,
  `telefono_nr` varchar(20) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `tipas` int(11) NOT NULL,
  `aktyvuotas` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `vartotojas`
--

INSERT INTO `vartotojas` (`vardas`, `pavarde`, `adresas`, `el_pastas`, `slaptazodis`, `telefono_nr`, `tipas`, `aktyvuotas`) VALUES
('Jonas', 'Jonas', 'slaptazodis: "admin"', 'admin@admin.com', '$2a$10$MmWDqnBMuiqHLgmrkcntVer/nt6ZdFSnqSKLnHq/7U61LbFmJ3ODy', '', 2, 1),
('ee', 'e', NULL, 'e@e.ee', '$2a$10$6LugDkNDrWGzx6OLoY./P.tnwe3Z/9xoxOdNhW9lfqmChskaSvzh6', NULL, 1, 0),
('ferw', 'grwwgr', NULL, 'efw@wergw.ewg', '$2a$10$UekoELQywyRwzKdujNhuK.TlF.glS4XnHLIEso8IcyGedyeZCuXBy', NULL, 1, 0),
('testuotojas', 'testuotojas', NULL, 'herkus.dauksas@gmail.com', '$2a$10$2lWnHUavpOn99XS5GSIRpeGjYf737BuRP2MXykMIGl4usMTWHUkfq', NULL, 1, 1),
('e', 'e', NULL, 'ret@rrr.lep', '$2a$10$0UjqFbWxHXOL.0UP.NZuge7OoNHz0RXzddNyeyoJeVOUdUTpfh8vu', NULL, 1, 0),
('Petras', 'Jonas', '', 'user@user.com', '$2a$10$Ipll565ERDZFr1gFPM.zHOsUIScawAhK5wY0IPQzu7NCY/VgFuHnm', '+37068783214', 1, 1),
('Petras', 'Petras', 'slaptazodis: "labas"', 'user2@user.com', '$2a$10$BalPV7hQlD0rYiCFwD2rY.g9DJ/JdPIJlLLYBjiJqf9thUrHxPaG2', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vartotojo_tipai`
--

CREATE TABLE `vartotojo_tipai` (
  `id` int(11) NOT NULL,
  `tipas` char(14) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `vartotojo_tipai`
--

INSERT INTO `vartotojo_tipai` (`id`, `tipas`) VALUES
(1, 'vartotojas'),
(2, 'adminas'),
(3, 'neregistruotas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktyvavimo_kodai`
--
ALTER TABLE `aktyvavimo_kodai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vartotojai_ibfk_4` (`fk_vartotojas`);

--
-- Indexes for table `daiktas`
--
ALTER TABLE `daiktas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkc_Kategorija` (`kategorija`),
  ADD KEY `fkc_pagrindine_nuotrauka` (`pagrindine_nuotrauka`);

--
-- Indexes for table `daikto_parametrai`
--
ALTER TABLE `daikto_parametrai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daiktas` (`fk_daiktas`),
  ADD KEY `fk_parametras` (`fk_parametras`);

--
-- Indexes for table `daikto_priedas`
--
ALTER TABLE `daikto_priedas`
  ADD PRIMARY KEY (`fk_daiktas`,`fk_priedas`),
  ADD KEY `fkc_Priedo_Daiktas` (`fk_priedas`),
  ADD KEY `fk_daiktas` (`fk_daiktas`);

--
-- Indexes for table `kategorijos`
--
ALTER TABLE `kategorijos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategorijos_parametrai`
--
ALTER TABLE `kategorijos_parametrai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kategorija` (`fk_kategorija`);

--
-- Indexes for table `krepselis`
--
ALTER TABLE `krepselis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkc_vartotojas` (`fk_vartotojas`),
  ADD KEY `fkc_daiktas` (`fk_daiktas`);

--
-- Indexes for table `nuotrauka`
--
ALTER TABLE `nuotrauka`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkc_Nuotrauka_Daiktas` (`fk_daiktas`);

--
-- Indexes for table `papildomas_mokestis`
--
ALTER TABLE `papildomas_mokestis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `papildomi_uzsakymo_meksciai`
--
ALTER TABLE `papildomi_uzsakymo_meksciai`
  ADD PRIMARY KEY (`fk_uzsakymas`,`fk_papildomas_mokestis`),
  ADD KEY `fk_uzsakymas` (`fk_uzsakymas`),
  ADD KEY `fkc_Papildomas_Mokestis` (`fk_papildomas_mokestis`);

--
-- Indexes for table `priedas`
--
ALTER TABLE `priedas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priedu_grupe`
--
ALTER TABLE `priedu_grupe`
  ADD PRIMARY KEY (`fk_priedas`,`fk_uzsakymas`),
  ADD KEY `fk_priedas` (`fk_priedas`),
  ADD KEY `fkc_Uzsakymas_Priedui` (`fk_uzsakymas`);

--
-- Indexes for table `schema_version`
--
ALTER TABLE `schema_version`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `schema_version_s_idx` (`success`);

--
-- Indexes for table `uzsakovas`
--
ALTER TABLE `uzsakovas`
  ADD PRIMARY KEY (`uzsakymo_id`);

--
-- Indexes for table `uzsakymas`
--
ALTER TABLE `uzsakymas`
  ADD PRIMARY KEY (`nr`),
  ADD KEY `fkc_Adminas` (`fk_adminas`),
  ADD KEY `fkc_Uzsakovas` (`fk_uzsakovas`),
  ADD KEY `fkc_Busena` (`busena`);

--
-- Indexes for table `uzsakymo_busenos`
--
ALTER TABLE `uzsakymo_busenos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzsakymo_daiktas`
--
ALTER TABLE `uzsakymo_daiktas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uzsakymo_id` (`fk_uzsakymas`),
  ADD KEY `daikto_id` (`fk_daiktas`);

--
-- Indexes for table `vartotojas`
--
ALTER TABLE `vartotojas`
  ADD PRIMARY KEY (`el_pastas`),
  ADD KEY `fkc_Tipas` (`tipas`);

--
-- Indexes for table `vartotojo_tipai`
--
ALTER TABLE `vartotojo_tipai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktyvavimo_kodai`
--
ALTER TABLE `aktyvavimo_kodai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `daiktas`
--
ALTER TABLE `daiktas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `daikto_parametrai`
--
ALTER TABLE `daikto_parametrai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `kategorijos`
--
ALTER TABLE `kategorijos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kategorijos_parametrai`
--
ALTER TABLE `kategorijos_parametrai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `krepselis`
--
ALTER TABLE `krepselis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `nuotrauka`
--
ALTER TABLE `nuotrauka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `papildomas_mokestis`
--
ALTER TABLE `papildomas_mokestis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `priedas`
--
ALTER TABLE `priedas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uzsakovas`
--
ALTER TABLE `uzsakovas`
  MODIFY `uzsakymo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uzsakymas`
--
ALTER TABLE `uzsakymas`
  MODIFY `nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uzsakymo_daiktas`
--
ALTER TABLE `uzsakymo_daiktas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktyvavimo_kodai`
--
ALTER TABLE `aktyvavimo_kodai`
  ADD CONSTRAINT `vartotojai_ibfk_4` FOREIGN KEY (`fk_vartotojas`) REFERENCES `vartotojas` (`el_pastas`);

--
-- Constraints for table `daiktas`
--
ALTER TABLE `daiktas`
  ADD CONSTRAINT `fkc_Kategorija` FOREIGN KEY (`kategorija`) REFERENCES `kategorijos` (`id`),
  ADD CONSTRAINT `fkc_pagrindine_nuotrauka` FOREIGN KEY (`pagrindine_nuotrauka`) REFERENCES `nuotrauka` (`id`);

--
-- Constraints for table `daikto_parametrai`
--
ALTER TABLE `daikto_parametrai`
  ADD CONSTRAINT `daikto_parametrai_ibfk_1` FOREIGN KEY (`fk_daiktas`) REFERENCES `daiktas` (`id`),
  ADD CONSTRAINT `daikto_parametrai_ibfk_2` FOREIGN KEY (`fk_parametras`) REFERENCES `kategorijos_parametrai` (`id`);

--
-- Constraints for table `daikto_priedas`
--
ALTER TABLE `daikto_priedas`
  ADD CONSTRAINT `fkc_Daikto_Priedas` FOREIGN KEY (`fk_daiktas`) REFERENCES `daiktas` (`id`),
  ADD CONSTRAINT `fkc_Priedo_Daiktas` FOREIGN KEY (`fk_priedas`) REFERENCES `priedas` (`id`);

--
-- Constraints for table `kategorijos_parametrai`
--
ALTER TABLE `kategorijos_parametrai`
  ADD CONSTRAINT `kategorijos_parametrai_ibfk_1` FOREIGN KEY (`fk_kategorija`) REFERENCES `kategorijos` (`id`);

--
-- Constraints for table `krepselis`
--
ALTER TABLE `krepselis`
  ADD CONSTRAINT `fkc_daiktas` FOREIGN KEY (`fk_daiktas`) REFERENCES `daiktas` (`id`),
  ADD CONSTRAINT `fkc_vartotojas` FOREIGN KEY (`fk_vartotojas`) REFERENCES `vartotojas` (`el_pastas`);

--
-- Constraints for table `nuotrauka`
--
ALTER TABLE `nuotrauka`
  ADD CONSTRAINT `fkc_Nuotrauka_Daiktas` FOREIGN KEY (`fk_daiktas`) REFERENCES `daiktas` (`id`);

--
-- Constraints for table `papildomi_uzsakymo_meksciai`
--
ALTER TABLE `papildomi_uzsakymo_meksciai`
  ADD CONSTRAINT `fkc_Papildomas_Mokestis` FOREIGN KEY (`fk_papildomas_mokestis`) REFERENCES `papildomas_mokestis` (`id`),
  ADD CONSTRAINT `fkc_Uzsakymas_Papild` FOREIGN KEY (`fk_uzsakymas`) REFERENCES `uzsakymas` (`nr`);

--
-- Constraints for table `priedu_grupe`
--
ALTER TABLE `priedu_grupe`
  ADD CONSTRAINT `fkc_Priedas` FOREIGN KEY (`fk_priedas`) REFERENCES `priedas` (`id`),
  ADD CONSTRAINT `fkc_Uzsakymas_Priedui` FOREIGN KEY (`fk_uzsakymas`) REFERENCES `uzsakymas` (`nr`);

--
-- Constraints for table `uzsakovas`
--
ALTER TABLE `uzsakovas`
  ADD CONSTRAINT `fkc_uzsakymas` FOREIGN KEY (`uzsakymo_id`) REFERENCES `uzsakymas` (`nr`);

--
-- Constraints for table `uzsakymas`
--
ALTER TABLE `uzsakymas`
  ADD CONSTRAINT `fkc_Adminas` FOREIGN KEY (`fk_adminas`) REFERENCES `vartotojas` (`el_pastas`),
  ADD CONSTRAINT `fkc_Busena` FOREIGN KEY (`busena`) REFERENCES `uzsakymo_busenos` (`id`),
  ADD CONSTRAINT `fkc_Uzsakovas` FOREIGN KEY (`fk_uzsakovas`) REFERENCES `vartotojas` (`el_pastas`);

--
-- Constraints for table `uzsakymo_daiktas`
--
ALTER TABLE `uzsakymo_daiktas`
  ADD CONSTRAINT `daikto_id` FOREIGN KEY (`fk_daiktas`) REFERENCES `daiktas` (`id`),
  ADD CONSTRAINT `uzsakymo_id` FOREIGN KEY (`fk_uzsakymas`) REFERENCES `uzsakymas` (`nr`);

--
-- Constraints for table `vartotojas`
--
ALTER TABLE `vartotojas`
  ADD CONSTRAINT `fkc_Tipas` FOREIGN KEY (`tipas`) REFERENCES `vartotojo_tipai` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
