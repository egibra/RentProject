  CREATE TABLE rental_platform.krepselis (
  	id INT NOT NULL AUTO_INCREMENT,
      fk_daiktas INT NOT NULL REFERENCES daiktas(id),
      fk_vartotojas VARCHAR(30) NOT NULL REFERENCES vartotojas(id),
      kiekis INT NOT NULL DEFAULT 1,
      PRIMARY KEY(id),
      CONSTRAINT fkc_vartotojas FOREIGN KEY (fk_vartotojas) REFERENCES vartotojas(el_pastas),
      CONSTRAINT fkc_daiktas FOREIGN KEY (fk_daiktas) REFERENCES daiktas(id)
  ) ENGINE = InnoDB COLLATE=utf8_lithuanian_ci;