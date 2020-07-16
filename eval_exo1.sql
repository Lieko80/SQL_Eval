DROP DATABASE IF EXISTS TB_exo1;
CREATE DATABASE TB_exo1;

CREATE TABLE est_compse (
    com_num INT NOT NULL AUTO_INCREMENT, 
    pro_num INT NOT NULL AUTO_INCREMENT,
    est_qte INT,
    PRIMARY KEY (com_num,pro_num)
    FOREIGN KEY (pro_num) REFERENCES Produit(pro_num)
    FOREIGN KEY (com_num) REFERENCES Commande(com_num)
);

CREATE TABLE Pdroduit(
    pro_num INT NOT NULL AUTO_INCREMENT,
    pro_libelle VARCHAR(50),
    pro_description VARCHAR(50),
    PRIMARY KEY (pro_num),
);

CREATE TABLE Commande(
    com_num INT NOT NULL AUTO_INCREMENT,
    cli_num INT,
    com_date DATETIME,
    com_obs VARCHAR (50),
    PRIMARY KEY (com_num),
);

CREATE TABLE Client(
    cli_num INT NOT NULL AUTO_INCREMENT,
    cli_nom VARCHAR(50),
    cli_adresse VARCHAR(50),
    cli_tel VARCHAR(30),
    PRIMARY KEY (cli_num),
    FOREIGN KEY (cli_num) REFERENCES Commande(cli_num)
);

/* index
CREATE INDEX nom ON CLIENT(cli_nom)
*/