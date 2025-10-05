CREATE TABLE Evenement(
    id_evenement SERIAL NOT NULL,
    titre VARCHAR(255) NOT NULL,
    impacte VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_evenement)
);

CREATE TABLE Ennemi(
    id_ennemi SERIAL NOT NULL,
    nom VARCHAR(255) NOT NULL,
    niveau INT NOT NULL,
    PRIMARY KEY (id_ennemi)
);

CREATE TABLE Competence(
    id_competence SERIAL NOT NULL,
    nom VARCHAR(255) NOT NULL,
    capacite VARCHAR(255) NOT NULL,
    rarete VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_competence)
);

CREATE TABLE Region(
    id_region SERIAL NOT NULL,
    nom VARCHAR(255) NOT NULL,
    climat VARCHAR(255) NOT NULL,
    relief VARCHAR(255) NOT NULL,
    nature VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_region)
);

CREATE TABLE Qute(
    id_qute SERIAL NOT NULL,
    titre VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    niveau_diff INT NOT NULL,
    id_region INT NOT NULL,
    PRIMARY KEY (id_qute),
    FOREIGN KEY (id_region) REFERENCES Region (id_region)
);

CREATE TABLE Personnage(
    id_personnage SERIAL NOT NULL,
    nom VARCHAR(255) NOT NULL,
    niveau INT NOT NULL,
    id_region INT NOT NULL,
    PRIMARY KEY (id_personnage),
    FOREIGN KEY (id_region) REFERENCES Region (id_region)
);

CREATE TABLE Objet(
    id_objet SERIAL NOT NULL,
    nom VARCHAR(255) NOT NULL,
    capacite VARCHAR(255) NOT NULL,
    rarete VARCHAR(255) NOT NULL,
    id_personnage INT NOT NULL,
    id_qute INT NOT NULL,
    PRIMARY KEY (id_objet),
    FOREIGN KEY (id_personnage) REFERENCES Personnage (id_personnage),
    FOREIGN KEY (id_qute) REFERENCES Qute (id_qute)
);

CREATE TABLE Pouvoir(
    id_pouvoir SERIAL NOT NULL,
    nom VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    id_personnage INT NOT NULL,
    PRIMARY KEY (id_pouvoir),
    FOREIGN KEY (id_personnage) REFERENCES Personnage (id_personnage)
);

CREATE TABLE Participer(
    id_qute INT NOT NULL,
    id_personnage INT NOT NULL,
    statue VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_personnage) REFERENCES Personnage (id_personnage),
    FOREIGN KEY (id_qute) REFERENCES Qute (id_qute)
);

CREATE TABLE Avoir(
    id_competence INT NOT NULL,
    id_personnage INT NOT NULL,
    FOREIGN KEY (id_personnage) REFERENCES Personnage (id_personnage),
    FOREIGN KEY (id_competence) REFERENCES Competence (id_competence)
);

CREATE TABLE Modifier(
    id_region INTEGER NOT NULL,
    id_evenement INTEGER NOT NULL,
    CONSTRAINT modifier_region_fkey FOREIGN KEY (id_region) REFERENCES Region (id_region),
    CONSTRAINT modifier_evenement_fkey FOREIGN KEY (id_evenement) REFERENCES Evenement (id_evenement)
);

CREATE TABLE Roder(
    id_region INTEGER NOT NULL,
    id_ennemi INTEGER NOT NULL,
    CONSTRAINT roder_region_fkey FOREIGN KEY (id_region) REFERENCES Region (id_region),
    CONSTRAINT roder_ennemi_fkey FOREIGN KEY (id_ennemi) REFERENCES Ennemi (id_ennemi)
);
