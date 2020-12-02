-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-12-02 16:07:05.954

-- tables
-- Table: fight
CREATE TABLE fight (
    id_fight serial NOT NULL,
    id_winner serial NOT NULL,
    id_loser serial NOT NULL,
    id_location serial NOT NULL,
    id_year serial NOT NULL,
    title_bout int NOT NULL,
    id_weight_class serial NOT NULL,
    date date NOT NULL,
    CONSTRAINT fight_pk PRIMARY KEY (id_fight)
);

-- Table: fighters
CREATE TABLE fighters (
    id_fighters serial NOT NULL,
    name varchar(20) NOT NULL,
    gender varchar(2) NOT NULL,
    born_year int NOT NULL,
    title_bout int NOT NULL,
    CONSTRAINT fighters_pk PRIMARY KEY (id_fighters)
);

-- Table: location
CREATE TABLE location (
    id_location serial NOT NULL,
    city varchar(30) NOT NULL,
    state varchar(30) NOT NULL,
    country varchar(30) NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY (id_location)
);

-- Table: weight_class
CREATE TABLE weight_class (
    id_weight_class serial NOT NULL,
    name varchar(30) NOT NULL,
    CONSTRAINT weight_class_pk PRIMARY KEY (id_weight_class)
);

-- Table: year
CREATE TABLE year (
    id_year serial NOT NULL,
    CONSTRAINT year_pk PRIMARY KEY (id_year)
);

-- foreign keys
-- Reference: fight_fighters_loser (table: fight)
ALTER TABLE fight ADD CONSTRAINT fight_fighters_loser FOREIGN KEY fight_fighters_loser (id_loser)
    REFERENCES fighters (id_fighters);

-- Reference: fight_fighters_winner (table: fight)
ALTER TABLE fight ADD CONSTRAINT fight_fighters_winner FOREIGN KEY fight_fighters_winner (id_winner)
    REFERENCES fighters (id_fighters);

-- Reference: fight_location (table: fight)
ALTER TABLE fight ADD CONSTRAINT fight_location FOREIGN KEY fight_location (id_location)
    REFERENCES location (id_location);

-- Reference: fight_weight_class (table: fight)
ALTER TABLE fight ADD CONSTRAINT fight_weight_class FOREIGN KEY fight_weight_class (id_weight_class)
    REFERENCES weight_class (id_weight_class);

-- Reference: fight_year (table: fight)
ALTER TABLE fight ADD CONSTRAINT fight_year FOREIGN KEY fight_year (id_year)
    REFERENCES year (id_year);

-- End of file.

