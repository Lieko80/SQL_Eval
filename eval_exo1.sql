DROP DATABASE IF EXISTS TB_exo1;
CREATE DATABASE TB_exo1;

DROP TABLE IF EXISTS est_compose;
CREATE TABLE est_compse (
    com_num INT, 
    pro_num INT,
    est_qte INT,
    PRIMARY KEY (com_num,pro_num)
);

DROP TABLE IF EXISTS Produit;
CREATE TABLE Pdroduit(
    pro_num INT,
    pro_libelle VARCHAR(50),
    pro_description VARCHAR(50),
    PRIMARY KEY (pro_num),
    FOREIGN KEY (pro_num) REFERENCES est_compose(pro_num)
);

DROP TABLE IF EXISTS Commande;
CREATE TABLE Commande(
    com_num INT,
    cli_num INT,
    com_date DATETIME,
    com_obs VARCHAR (50),
    PRIMARY KEY (com_num),
    FOREIGN KEY (com_num) REFERENCES est_compose(com_num)
);

DROP TABLE IF EXISTS Client;
CREATE TABLE Client(
    cli_num INT,
    cli_nom VARCHAR(50),
    cli_adresse VARCHAR(50),
    cli_tel VARCHAR(30),
    PRIMARY KEY (cli_num),
    FOREIGN KEY (cli_num) REFERENCES Commande(cli_num)
);

/* index
CREATE INDEX nom ON CLIENT(cli_nom)
*/