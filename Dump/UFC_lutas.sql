-- Created by Germano Andrade & João Alcindo
-- A2 - Bando de Dados 2020.2

-- tables
-- Table: fight
DROP DATABASE ufc_schema;
CREATE DATABASE ufc_schema;
USE ufc_schema;

-- Table: fighters
CREATE TABLE fighters (
    id_fighters INT NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    gender varchar(6) NOT NULL,
    born_year int NOT NULL,
    title_bout int NOT NULL,
    CONSTRAINT fighters_pk PRIMARY KEY (id_fighters)
);

-- Table: location
CREATE TABLE location (
    id_location INT NOT NULL AUTO_INCREMENT,
    city varchar(30) NOT NULL,
    state varchar(30),
    country varchar(30) NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY (id_location)
);

-- Table: weight_class
CREATE TABLE weight_class (
    id_weight_class INT NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    CONSTRAINT weight_class_pk PRIMARY KEY (id_weight_class)
);

-- Table: year
CREATE TABLE year (
    id_year INT NOT NULL AUTO_INCREMENT,
    CONSTRAINT year_pk PRIMARY KEY (id_year)
);

CREATE TABLE fight (
    id_fight INT NOT NULL AUTO_INCREMENT,
    id_winner INT NOT NULL,
    id_loser INT NOT NULL,
    id_location INT NOT NULL,
    id_year INT NOT NULL,
    title_bout int NOT NULL,
    id_weight_class INT NOT NULL,
    date datetime NOT NULL,
    CONSTRAINT fight_pk PRIMARY KEY (id_fight),
    CONSTRAINT fight_fighters_fk_loser FOREIGN KEY (id_loser) REFERENCES fighters (id_fighters),
    CONSTRAINT fight_fighters_fk_winner FOREIGN KEY (id_winner) REFERENCES fighters (id_fighters),
    CONSTRAINT fight_location FOREIGN KEY (id_location) REFERENCES location (id_location),
	CONSTRAINT fight_weight_class FOREIGN KEY (id_weight_class) REFERENCES weight_class (id_weight_class),
	CONSTRAINT fight_year FOREIGN KEY (id_year) REFERENCES year (id_year)
);
	
-- End of file.

