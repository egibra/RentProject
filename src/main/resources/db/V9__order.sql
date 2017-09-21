ALTER TABLE uzsakymas DROP FOREIGN KEY fkc_Uzsakytas_Daiktas;
ALTER TABLE `uzsakymas` DROP `fk_daiktas`;
ALTER TABLE `uzsakymas` ADD `adresas` TEXT NOT NULL;
ALTER TABLE `uzsakymas` ADD `telefonas` VARCHAR(20) NOT NULL;
CREATE TABLE rental_platform.uzsakymo_daiktas (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fk_daiktas INT NOT NULL REFERENCES daiktas(id),
  fk_uzsakymas INT NOT NULL REFERENCES uzsakymas(nr),
  CONSTRAINT uzsakymo_id FOREIGN KEY (fk_uzsakymas) REFERENCES uzsakymas(nr),
  CONSTRAINT daikto_id FOREIGN KEY (fk_daiktas) REFERENCES daiktas(id)
) ENGINE = InnoDB COLLATE=utf8_lithuanian_ci;
CREATE TABLE rental_platform.uzsakovas (
  uzsakymo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY REFERENCES uzsakymas(nr),
  el_pastas VARCHAR(30) NOT NULL,
  vardas VARCHAR(30) NOT NULL,
  pavarde VARCHAR(30) NOT NULL,
  CONSTRAINT fkc_uzsakymas FOREIGN KEY (uzsakymo_id) REFERENCES uzsakymas(nr)
) ENGINE = InnoDB COLLATE=utf8_lithuanian_ci;