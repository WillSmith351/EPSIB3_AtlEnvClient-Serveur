/* Partie 3 */

/* Exercice 1 */

CREATE TABLE Film (
    Ident_Film INT PRIMARY KEY AUTO_INCREMENT,
    Titre VARCHAR(100) NOT NULL,
    Genre1 VARCHAR(50) NOT NULL,
    Genre2 VARCHAR(50),
    Date_Sortie DATE NOT NULL,
    Pays INT NOT NULL,
    Ident_Realisateur INT NOT NULL,
    Distributeur VARCHAR(50) NOT NULL, 
    Resume TEXT NOT NULL,
    FOREIGN KEY (Pays) REFERENCES Pays(Ident_Pays),
    FOREIGN KEY (Ident_Realisateur) REFERENCES Realisateur (Ident_Realisateur)
);

CREATE TABLE Acteur (
    Ident_Acteur INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NOT NULL,
    Date_Naissance DATE NOT NULL,
    Nb_Film INT NOT NULL,
    Nationalite INT NOT NULL,
    FOREIGN KEY (Nationalite) REFERENCES Pays(Ident_Film)
);

CREATE TABLE Statistique (
    Ident_Film INT PRIMARY KEY NOT NULL,
    Duree INT NOT NULL,
    Nb_Entree_France INT NOT NULL,
    Recette_USA INT NOT NULL,
    Recette_Monde INT NOT NULL,
    Budget DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (Ident_Film) REFERENCES Film(Ident_Film)
);

INSERT INTO Film (Titre, Genre1, Genre2, Date_Sortie, Pays, Ident_Realisateur, Distributeur, Resume)
VALUES
('SUBWAY', 'POLICIER', 'DRAME', '1985-04-10', 1, 1, 'GAUMONT', 'Conte les aventures de la population souterraine dans les couloirs du métro parisien'),
('NIKITA', 'DRAME', 'ROMANTIQUE', '1990-02-21', 1, 1, 'GAUMONT', 'Nikita condamnée à la prison à perpétuité est contrainte de travailler secrètement pour le gouvernement en tant que agent hautement qualifié des services secrets.'),
('STAR WARS 6- LE RETOUR DU JEDI', 'ACTION', 'SF', '1983-10-19', 2, 2, '20th Century Fox', 'L''Empire galactique est plus puissant que jamais: la construction de la nouvelle arme, l''Etoile de la Mort, menace l''univers tout entier.'),
('AVATAR', 'ACTION', 'SF', '2009-10-16', 2, 3, '20th Century Fox', 'Malgré sa paralysie, Jake Sully, un ancien marine immobilisé dans un fauteuil roulant, est resté un combattant au plus profond'),
('BIENVENUE CHEZ LES CH''TIS', 'COMEDIE', NULL, '2008-02-27', 1, 4, 'PATHE', 'Philippe Abrams est directeur de la poste de Salon-de-Provence est muté dans le Nord.');

INSERT INTO Acteur (Nom, Prenom, Date_Naissance, Nb_Film, Nationalite)
VALUES
('ADJANI', 'ISABELLE', '1955-06-27', 42, 1),
('LAMBERT', 'CHRISTOPHE', '1957-03-29', 64, 1),
('BOHRINGER', 'RICHARD', '1942-06-16', 132, 1),
('GALABRU', 'MICHEL', '1922-10-27', 277, 1),
('PARILLAUD', 'ANNE', '1960-05-06', 35, 1),
('FORD', 'HARRISON', '1942-06-13', 64, 2),
('FISHER', 'CARRIE', '1956-10-21', 74, 2),
('SALDANA', 'ZOE', '1978-06-19', 31, 2),
('WEAVER', 'SIGOURNEY', '1949-10-08', 66, 2),
('RENO', 'JEAN', '1948-06-30', 75, 1),
('BOON', 'DANY', '1966-06-26', 23, 1),
('MERAD', 'KAD', '1964-03-27', 55, 3);

INSERT INTO Statistique (Ident_Film, Duree, Nb_Entree_France, Recette_USA, Recette_Monde, Budget)
VALUES
(1, 104, 2917562, 390659, 1272637, 2.6),
(2, 118, 3787845, 5017971, 0, 7.6),
(3, 133, 4263000, 191648000, 472000000, 32),
(4, 170, 12018251, 760505847, 2946271769, 237),
(5, 100, 21000000, 0, 245000000, 11);

/* Exercice 2 */

CREATE TABLE Realisateur (
    Ident_Realisateur INT PRIMARY KEY AUTO_INCREMENT, 
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Date_Naissance DATE NOT NULL,
    Nb_Film_Ecrit INT,
    Nb_Film_Produit INT, 
    Nationalite INT NOT NULL,
    FOREIGN KEY (Nationalite) REFERENCES pays(Ident_Pays)
);

CREATE TABLE Casting (
    Ident_Film INT NOT NULL,
    Ident_Acteur INT NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Nb_Jour_Tournage INT,
    FOREIGN KEY (Ident_Film) REFERENCES Film(Ident_Film),
    FOREIGN KEY (Ident_Acteur) REFERENCES Acteur(Ident_Acteur)
);

CREATE TABLE Pays (
    Ident_Pays INT PRIMARY KEY NOT NULL,
    Libelle VARCHAR(100)
);

INSERT INTO Realisateur (Nom, Prenom, Date_Naissance, Nb_Film_Ecrit, Nb_Film_Produit, Nationalite)
VALUES
('BESSON', 'LUC', '1959-03-18', 40, 99, 1),
('LUCAS', 'GEORGES', '1944-05-14', 79, 64, 2),
('CAMERON', 'JAMES', '1954-08-16', 22, 23, 2),
('BOON', 'DANY', '1966-06-26', 5, 1, 1);

INSERT INTO Casting (Ident_Film, Ident_Acteur, Role, Nb_Jour_Tournage)
VALUES
(1, 1, 'HELENA', 100),
(1, 2, 'FRED', 100),
(1, 3, 'INSPECTEUR GESBERG', NULL),
(1, 4, 'LE FLEURISTE', 35),
(1, 10, 'LE BATTEUR', 20),
(2, 5, 'NIKITA', 68),
(2, 10, 'VICTOR LE NETTOYEUR', 9),
(3, 6, 'HAN SOLO', 201),
(3, 7, 'PRINCESSE LEIA', 203),
(4, 8, 'NEYTIRI', 50),
(4, 9, 'Dr. Grace Augustine', 45),
(5, 11, 'ANTOINE BAILLEUL', 125),
(5, 12, 'PHILIPPE ABRAMS', 126);

INSERT INTO Pays (Ident_Pays, Libelle)
VALUES
(1, 'FRANCE'),
(2, 'USA'),
(3, 'ALGERIE');

/* Exerice 3 */

SELECT F.Titre, F.Genre1, F.Genre2, F.Date_Sortie, F.Distributeur, F.Resume, R.Nom AS Nom_Realisateur, R.Prenom AS Prenom_Realisateur, P.Libelle AS Nationalite_Realisateur
FROM Film AS F
INNER JOIN Realisateur AS R ON F.Ident_Realisateur = R.Ident_Realisateur
INNER JOIN Pays AS P ON R.Nationalite = P.Ident_Pays
WHERE P.Libelle = 'FRANCE'
ORDER BY F.Titre;

SELECT F.Titre AS Nom_film, F.Date_Sortie, R.Nom AS Nom_Realisateur, A.Nom AS Nom_Acteur, A.Date_Naissance, S.Budget
FROM Film AS F
INNER JOIN Realisateur AS R ON F.Ident_Realisateur = R.Ident_Realisateur
INNER JOIN Casting AS C ON F.Ident_Film = C.Ident_Film
INNER JOIN Acteur AS A ON C.Ident_Acteur = A.Ident_Acteur
INNER JOIN Statistique AS S ON F.Ident_Film = S.Ident_Film
ORDER BY F.Titre DESC, A.Nom DESC;

SELECT F.Titre AS Nom_film, F.Date_Sortie, R.Nom AS Nom_Realisateur, F.Distributeur, COUNT(C.Ident_Acteur) AS Nombre_Acteurs
FROM Film AS F
INNER JOIN Realisateur AS R ON F.Ident_Realisateur = R.Ident_Realisateur
INNER JOIN Casting AS C ON F.Ident_Film = C.Ident_Film
GROUP BY F.Titre, F.Date_Sortie, R.Nom, F.Distributeur
ORDER BY F.Titre;

SELECT F.Titre AS Nom_film, F.Date_Sortie, R.Nom AS Nom_Realisateur, R.Prenom AS Prenom_Realisateur, A.Nom AS Nom_Acteur, A.Prenom AS Prenom_Acteur, A.Date_Naissance, S.Budget, S.Nb_Entree_France
FROM Film AS F
INNER JOIN Realisateur AS R ON F.Ident_Realisateur = R.Ident_Realisateur
INNER JOIN Casting AS C ON F.Ident_Film = C.Ident_Film
INNER JOIN Acteur AS A ON C.Ident_Acteur = A.Ident_Acteur
INNER JOIN Statistique AS S ON F.Ident_Film = S.Ident_Film
INNER JOIN Pays AS P ON A.Nationalite = P.Ident_Pays
WHERE P.Libelle = 'ALGERIE'
ORDER BY F.Titre;

SELECT F.Titre AS Nom_film, S.Recette_Monde
FROM Film AS F
INNER JOIN Statistique AS S ON F.Ident_Film = S.Ident_Film
ORDER BY S.Recette_Monde DESC
LIMIT 1;

SELECT A.Nom AS Nom_Acteur, A.Prenom AS Prenom_Acteur, COUNT(C.Ident_Film) AS Nombre_Films
FROM Acteur AS A
INNER JOIN Casting AS C ON A.Ident_Acteur = C.Ident_Acteur
GROUP BY A.Ident_Acteur, A.Nom, A.Prenom
HAVING COUNT(C.Ident_Film) >= 2;

SELECT R.Nom AS Nom_Realisateur, R.Prenom AS Prenom_Realisateur
FROM Realisateur AS R
INNER JOIN Acteur AS A ON R.Nom = A.Nom AND R.Prenom = A.Prenom;

SELECT A.Nom AS Nom_Acteur, A.Prenom AS Prenom_Acteur, F.Titre AS Titre_Film, C.Role, P.Libelle AS Nationalite
FROM Acteur AS A
INNER JOIN Casting AS C ON A.Ident_Acteur = C.Ident_Acteur
INNER JOIN Film AS F ON C.Ident_Film = F.Ident_Film
INNER JOIN Pays AS P ON A.Nationalite = P.Ident_Pays
WHERE F.Titre LIKE 'S%'
ORDER BY F.Titre;

SELECT A.Nom AS Nom_Acteur, A.Prenom AS Prenom_Acteur, A.Date_Naissance, SUM(C.Nb_Jour_Tournage) AS Total_Jours_Tournage
FROM Acteur AS A
INNER JOIN Casting AS C ON A.Ident_Acteur = C.Ident_Acteur
WHERE A.Date_Naissance BETWEEN '1948-01-01' AND '1978-05-31'
GROUP BY A.Nom, A.Prenom, A.Date_Naissance
ORDER BY Total_Jours_Tournage DESC;

