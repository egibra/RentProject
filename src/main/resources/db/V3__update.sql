ALTER TABLE `daiktas` DROP FOREIGN KEY `fkc_Kategorija`;
ALTER TABLE `kategorijos_parametrai` DROP FOREIGN KEY `kategorijos_parametrai_ibfk_1`;
ALTER TABLE `kategorijos` CHANGE `id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT;
ALTER TABLE `daiktas` ADD CONSTRAINT `fkc_Kategorija` FOREIGN KEY (`kategorija`) REFERENCES `kategorijos` (`id`);
ALTER TABLE `kategorijos_parametrai` ADD CONSTRAINT `kategorijos_parametrai_ibfk_1` FOREIGN KEY (`fk_kategorija`) REFERENCES `kategorijos` (`id`);
ALTER TABLE `kategorijos_parametrai` ADD `aprasymas` TEXT COLLATE utf8_lithuanian_ci;