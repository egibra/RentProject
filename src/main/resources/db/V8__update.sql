ALTER TABLE `nuotrauka` ADD failo_pavadinimas VARCHAR(100) NULL DEFAULT NULL;
ALTER TABLE `nuotrauka` CHANGE `pavadinimas` `pavadinimas` TEXT CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NULL DEFAULT NULL;
ALTER TABLE `daiktas` CHANGE `pagrindine_nuotrauka` `pagrindine_nuotrauka` INT(11) NULL DEFAULT NULL;
ALTER TABLE `daiktas` ADD CONSTRAINT `fkc_pagrindine_nuotrauka` FOREIGN KEY (`pagrindine_nuotrauka`) REFERENCES `nuotrauka` (`id`);