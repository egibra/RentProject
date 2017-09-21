ALTER TABLE vartotojas ADD aktyvuotas BOOLEAN NOT NULL DEFAULT FALSE;
CREATE TABLE `rental_platform`.`aktyvavimo_kodai` ( `id` INT NOT NULL AUTO_INCREMENT , `kodas` TEXT NOT NULL ,
`fk_vartotojas` VARCHAR(30) NOT NULL , `pasibaigimo_data` DATETIME NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB COLLATE=utf8_lithuanian_ci;
ALTER TABLE `aktyvavimo_kodai` ADD CONSTRAINT `vartotojai_ibfk_4` FOREIGN KEY (`fk_vartotojas`) REFERENCES `vartotojas`(`el_pastas`);