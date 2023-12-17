/* Partie 1 */

/*Exercice 1*/

CREATE TABLE FILM (
    Ident_Film INT PRIMARY KEY,
    Titre VARCHAR(250),
    Genre1 VARCHAR(50),
    Recette DECIMAL(12,2),
    Date_Sortie DATE,
    Pays INT,
    NB_Entree INT,
    Date_Heure_Saisie DATETIME,
    Resume TEXT
);

CREATE UNIQUE INDEX Index_Ident_Film on FILM (Ident_Film);

CREATE INDEX Index_Genre1_Film on FILM (GENRE1, PAYS);

/*Exercice 2 */

ALTER TABLE FILM 
ADD COLUMN Num_Real INT;

ALTER TABLE FILM 
ADD CONSTRAINT Fk_Realisateur 
FOREIGN KEY (Num_Real) REFERENCES Realisateur(Ident_Realisateur);

ALTER TABLE FILM 
ALTER COLUMN Recette SET DEFAULT 0;

ALTER TABLE FILM 
ALTER COLUMN TITRE VARCHAR(250) NOT NULL;

ALTER TABLE FILM 
ALTER COLUMN PAYS INT NOT NULL;

ALTER TABLE FILM 
DROP FOREIGN KEY Fk_Realisateur;

/*Exercice 3 */

