/* Partie 2 */

/*Exercice 1*/

CREATE TABLE Clients (
    NoCli INT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Adresse VARCHAR(300),
    Cpo INT,
    Ville VARCHAR(100)
);

INSERT INTO Clients (noCli, nom, prenom, adresse, cpo, ville)
VALUES
(1, 'Albert', 'Anatole', 'Rue des acacias', 61000, 'Amiens'),
(2, 'Bernard', 'Barnabé', 'Rue du bar', 01000, 'Bourg en Bresse'),
(3, 'Dupond', 'Camille', 'Rue Crébillon', 44000, 'Nantes'),
(4, 'Desmoulins', 'Daniel', 'Rue descendante', 21000, 'Dijon'),
(5, 'Ernest', 'Etienne', 'Rue de l''échafaud', 42000, 'Saint Étienne'),
(6, 'Ferdinand', 'François', 'Rue de la convention', 44100, 'Nantes'),
(9, 'Dupond', 'Jean', 'Rue des mimosas', 75018, 'Paris'),
(14, 'Boutaud', 'Sabine', 'Rue des platanes', 75002, 'Paris');

CREATE TABLE Gammes (
    CodeGam VARCHAR(10) PRIMARY KEY, 
    Libelle Varchar(100)
);

INSERT INTO Gammes (CodeGam, Libelle)
VALUES 
('PR', 'Matériel Professionnel'),
('HG', 'Haut de gamme'),
('MG', 'Moyenne gamme'),
('EG', 'Entrée de gamme');

CREATE TABLE Tarifs (
    CodeTarif VARCHAR(10) PRIMARY KEY,
    Libelle VARCHAR(100),
    PrixJour INT
);

INSERT INTO Tarifs (CodeTarif, Libelle, PrixJour)
VALUES  
('T1', 'Base', 10),
('T2', 'Chocolat', 15),
('T3', 'Bronze', 20),
('T4', 'Argent', 30),
('T5', 'Or', 50),
('T6', 'Platine', 90);

CREATE TABLE Categories (
    CodeCate VARCHAR(10) PRIMARY KEY,
    Libelle VARCHAR(100)
);

INSERT INTO Categories (CodeCate, Libelle)
VALUES
('Mono', 'Monoski'),
('SURF', 'Surf'),
('PA', 'Patinette'),
('FOA', 'Ski de fond alternatif'),
('FOP', 'Ski de fond patineur'),
('SA', 'Ski alpin');

CREATE TABLE GrilleTarifs (
    CodeGam VARCHAR(10),
    CodeCate VARCHAR(10), 
    CodeTarif VARCHAR(10)
);

INSERT INTO GrilleTarifs (CodeGam, CodeCate, CodeTarif)
VALUES
('EG', 'MONO', 'T1'),
('MG', 'MONO', 'T2'),
('EG', 'SURF', 'T1'),
('MG', 'SURF', 'T2'),
('HG', 'SURF', 'T3'),
('PR', 'SURF', 'T5'),
('EG', 'PA', 'T1'),
('MG', 'PA', 'T2'),
('EG', 'FOA', 'T1'),
('MG', 'FOA', 'T2'),
('HG', 'FOA', 'T4'),
('PR', 'FOA', 'T6'),
('EG', 'FOP', 'T2'),
('MG', 'FOP', 'T3'),
('HG', 'FOP', 'T4'),
('PR', 'FOP', 'T6'),
('EG', 'SA', 'T1'),
('MG', 'SA', 'T2'),
('HG', 'SA', 'T4'),
('PR', 'SA', 'T6');

CREATE TABLE Articles (
    RefArt VARCHAR(10) PRIMARY KEY, 
    Designation VARCHAR(100),
    CodeGam VARCHAR(10),
    CodeCate VARCHAR(10),
    FOREIGN KEY (CodeGam) REFERENCES Gammes(CodeGam),
    FOREIGN KEY (CodeCate) REFERENCES Categories(CodeCate)
);

INSERT INTO Articles (RefArt, Designation, CodeGam, CodeCate)
VALUES
('F01', 'Fischer Cruiser', 'EG', 'FOA'),
('F02', 'Fischer Cruiser', 'EG', 'FOA'),
('F03', 'Fischer Cruiser', 'EG', 'FOA'),
('F04', 'Fischer Cruiser', 'EG', 'FOA'),
('F05', 'Fischer Cruiser', 'EG', 'FOA'),
('F10', 'Fischer Sporty Crown', 'MG', 'FOA'),
('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F50', 'Fischer SOSSkating VASA', 'PR', 'FOA'),
('F60', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOA'),
('F61', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F62', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F63', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('P01', 'Décathlon Allegre junior 150', 'EG', 'PA'),
('P10', 'Fischer mini ski patinette', 'MG', 'PA'),
('P11', 'Fischer mini ski patinette', 'MG', 'PA'),
('S01', 'Décathlon Apparition', 'EG', 'SURF'),
('S02', 'Décathlon Apparition', 'EG', 'SURF'),
('S03', 'Décathlon Apparition', 'EG', 'SURF'),
('A01', 'Salomon 24X+Z12', 'EG', 'SA'),
('A02', 'Salomon 24X+Z12', 'EG', 'SA'),
('A03', 'Salomon 24X+Z12', 'EG', 'SA'),
('A04', 'Salomon 24X+Z12', 'EG', 'SA'),
('A05', 'Salomon 24X+Z12', 'EG', 'SA'),
('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA');

CREATE TABLE Fiches (
    NoFic INT, 
    NoCli INT,
    DateCrea VARCHAR(100),
    DatePaye VARCHAR(100),
    Etat VARCHAR(100),
    NoLig INT, 
    RefArt VARCHAR(100), 
    Depart VARCHAR(100),
    Retour VARCHAR(100),
    FOREIGN KEY (NoCli) REFERENCES Clients(Nocli),
    FOREIGN KEY (RefArt) REFERENCES Articles(RefArt)
);

INSERT INTO Fiches (NoFic, NoCli, DateCrea, DatePaye, Etat, NoLig, RefArt, Depart, Retour)
VALUES
(1001, 14, 'DDJ-15', 'DDJ-13', 'SO', 1, 'F05', 'DDJ-15', 'DDJ-13'),
(1001, 14, 'DDJ-15', 'DDJ-13', 'SO', 2, 'F50', 'DDJ-15', 'DDJ-14'),
(1001, 14, 'DDJ-15', 'DDJ-13', 'SO', 3, 'F60', 'DDJ-13', 'DDJ-13'),
(1002, 4, 'DDJ-13', NULL, 'EC', 1, 'A03', 'DDJ-13', 'DDJ-9'),
(1002, 4, 'DDJ-13', NULL, 'EC', 2, 'A04', 'DDJ-12', 'DDJ-7'),
(1002, 4, 'DDJ-13',  NULL, 'EC', 3, 'S03', 'DDJ-8', NULL),
(1003, 1, 'DDJ-12', 'DDJ-10', 'SO', 1, 'F50', 'DDJ-12', 'DDJ-10'),
(1003, 1, 'DDJ-12', 'DDJ-10', 'SO', 2, 'F05', 'DDJ-12', 'DDJ-10'),
(1004, 6, 'DDJ-11', NULL, 'EC', 1,  'P01', 'DDJ-6', NULL),
(1005, 3, 'DDJ-10', NULL, 'EC', 1,  'F05', 'DDJ-9', 'DDJ-5'),
(1005, 3, 'DDJ-10', NULL, 'EC', 2,  'F10', 'DDJ-4', NULL),
(1006, 9, 'DDJ-10', NULL, 'RE', 1,  'S01', 'DDJ-10', 'DDJ-9'),
(1006, 9, 'DDJ-10', NULL, 'RE', 2,  'S02', 'DDJ-10', 'DDJ-9'),
(1006, 9, 'DDJ-10', NULL, 'RE', 3,  '$03', 'DDJ-10', 'DDJ-9'),
(1007, 1, 'DDJ-3', NULL, 'EC', 1, 'F50', 'DDJ-3', 'DDJ-2'),
(1007, 1, 'DDJ-3', NULL, 'EC', 2, 'F60', 'DDJ-1', NULL),
(1007, 1, 'DDJ-3', NULL, 'EC', 3, 'F05', 'DDJ-3', NULL),
(1007, 1, 'DDJ-3', NULL, 'EC', 4, 'S02', 'DDJ', NULL),
(1008, 2, 'DDJ', NULL, 'EC', 1, 'S01', 'DDJ', NULL);


/* Exercice 5 */

SELECT *
FROM Clients
WHERE nom LIKE 'D%';

SELECT nom, prenom
FROM Clients;

SELECT C.nom, C.prenom, F.NoFic, F.Etat
FROM Clients AS C
INNER JOIN Fiches AS F ON C.NoCli = F.NoCli
WHERE C.Cpo = 44000;

SELECT *
FROM Fiches
WHERE NoFic = 1002;

SELECT G.Libelle AS Gamme, AVG(T.PrixJour) AS TarifMoyen
FROM GrilleTarifs AS GT
INNER JOIN Tarifs AS T ON GT.CodeTarif = T.CodeTarif
INNER JOIN Gammes AS G ON GT.CodeGam = G.CodeGam
GROUP BY G.Libelle;

SELECT F.RefArt, A.Designation, COUNT(F.RefArt) AS NombreDeLocations
FROM Fiches AS F
INNER JOIN Articles AS A ON F.RefArt = A.RefArt
GROUP BY F.RefArt, A.Designation
HAVING COUNT(F.RefArt) >= 3;

SELECT C.nom, C.prenom, F.RefArt, A.Designation, F.Depart, F.Retour, T.PrixJour, SUM(T.PrixJour) OVER() AS Total
FROM Fiches AS F
INNER JOIN Clients AS C ON F.NoCli = C.noCli
INNER JOIN Articles AS A ON F.RefArt = A.RefArt
INNER JOIN GrilleTarifs AS GT ON A.CodeGam = GT.CodeGam AND A.CodeCate = GT.CodeCate
INNER JOIN Tarifs AS T ON GT.CodeTarif = T.CodeTarif
WHERE F.NoFic = 1002;



