DROP DATABASE IF EXISTS opdracht_7;

CREATE DATABASE opdracht_7;

USE opdracht_7;

CREATE TABLE TypeVoertuig (
     Id                 INTEGER      NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,TypeVoertuig       VARCHAR(50)  NOT NULL
    ,Rijbewijscategorie CHAR(3)      NOT NULL
    ,IsActief           BOOLEAN      NOT NULL DEFAULT 1
    ,Opmerking          VARCHAR(255)
    ,DatumAangemaakt    DATETIME(6)  NOT NULL DEFAULT NOW(6)
    ,DatumGewijzigd     DATETIME(6)  NOT NULL DEFAULT NOW(6)
    );

    CREATE TABLE Voertuig (
      Id               INTEGER      NOT NULL PRIMARY KEY AUTO_INCREMENT
     ,Kenteken         VARCHAR(10)  NOT NULL UNIQUE
     ,Type             VARCHAR(50)  NOT NULL
     ,Bouwjaar         DATE         NOT NULL
     ,Brandstof        VARCHAR(20)  NOT NULL 
     ,TypeVoertuigId   INTEGER      NOT NULL
     ,IsActief         BOOLEAN      NOT NULL DEFAULT 1
     ,Opmerking        VARCHAR(255)
     ,DatumAangemaakt  DATETIME(6)  NOT NULL DEFAULT NOW(6)
     ,DatumGewijzigd   DATETIME(6)  NOT NULL DEFAULT NOW(6)
     ,CONSTRAINT fk_voertuig_typevoertuig FOREIGN KEY (TypeVoertuigId) REFERENCES TypeVoertuig(Id)
);

CREATE TABLE Instructeur (
     Id              INTEGER      NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,Voornaam        VARCHAR(50)  NOT NULL
    ,Tussenvoegsel   VARCHAR(20)
    ,Achternaam      VARCHAR(100) NOT NULL
    ,Mobiel          VARCHAR(15)  NOT NULL UNIQUE
    ,DatumInDienst   DATE         NOT NULL
    ,AantalSterren   INTEGER      NOT NULL DEFAULT 1 CHECK (AantalSterren BETWEEN 1 AND 5)
    ,IsActief        BOOLEAN      NOT NULL DEFAULT 1
    ,Opmerking       VARCHAR(255)
    ,DatumAangemaakt DATETIME(6)  NOT NULL DEFAULT NOW(6)
    ,DatumGewijzigd  DATETIME(6)  NOT NULL DEFAULT NOW(6)
);

CREATE TABLE VoertuigInstructeur (
     Id              INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,VoertuigId      INTEGER NOT NULL
    ,InstructeurId   INTEGER NOT NULL
    ,DatumToekenning DATE    NOT NULL
    ,IsActief        BOOLEAN NOT NULL DEFAULT 1
    ,Opmerking       VARCHAR(255)
    ,DatumAangemaakt DATETIME(6)  NOT NULL DEFAULT NOW(6)
    ,DatumGewijzigd  DATETIME(6)  NOT NULL DEFAULT NOW(6)
    ,CONSTRAINT fk_vi_voertuig FOREIGN KEY (VoertuigId) REFERENCES Voertuig(Id)
    ,CONSTRAINT fk_vi_instructeur FOREIGN KEY (InstructeurId) REFERENCES Instructeur(Id)
    ,CONSTRAINT uq_voertuig_instructeur_datum UNIQUE (VoertuigId, InstructeurId, DatumToekenning)
);

INSERT INTO TypeVoertuig (Id, TypeVoertuig, Rijbewijscategorie, DatumAangemaakt, DatumGewijzigd)
VALUES
     (1, 'Personenauto', 'B', NOW(6), NOW(6))
    ,(2, 'Vrachtwagen', 'C', NOW(6), NOW(6))
    ,(3, 'Bus', 'D', NOW(6), NOW(6))
    ,(4, 'Bromfiets', 'AM', NOW(6), NOW(6));

INSERT INTO Voertuig (Id, Kenteken, Type, Bouwjaar, Brandstof, TypeVoertuigId, DatumAangemaakt, DatumGewijzigd)
VALUES
     (1, 'AU-67-IO', 'Golf', '2017-06-12', 'Diesel', 1, NOW(6), NOW(6))
    ,(2, 'TR-24-OP', 'DAF', '2019-05-23', 'Diesel', 2, NOW(6), NOW(6))
    ,(3, 'TH-78-KL', 'Mercedes', '2023-01-01', 'Benzine', 1, NOW(6), NOW(6))
    ,(4, '90-KL-TR', 'Fiat 500', '2021-09-12', 'Benzine', 1, NOW(6), NOW(6))
    ,(5, '34-TK-LP', 'Scania', '2015-03-13', 'Diesel', 2, NOW(6), NOW(6))
    ,(6, 'YY-OP-78', 'BMW M5', '2022-05-13', 'Diesel', 1, NOW(6), NOW(6))
    ,(7, 'UU-HH-JK', 'M.A.N', '2017-12-03', 'Diesel', 2, NOW(6), NOW(6))
    ,(8, 'ST-FZ-28', 'Citroën', '2018-01-20', 'Elektrisch', 1, NOW(6), NOW(6))
    ,(9, '123-FR-T', 'Piaggio ZIP', '2021-02-01', 'Benzine', 4, NOW(6), NOW(6))
    ,(10, 'DRS-52-P', 'Vespa', '2022-03-21', 'Benzine', 4, NOW(6), NOW(6))
    ,(11, 'STP-12-U', 'Kymco', '2022-07-02', 'Benzine', 4, NOW(6), NOW(6))
    ,(12, '45-SD-23', 'Renault', '2023-01-01', 'Diesel', 3, NOW(6), NOW(6));

INSERT INTO Instructeur (Id, Voornaam, Tussenvoegsel, Achternaam, Mobiel, DatumInDienst, AantalSterren, DatumAangemaakt, DatumGewijzigd)
VALUES
     (1, 'Li', NULL, 'Zhan', '06-28493827', '2015-04-17', 3, NOW(6), NOW(6))
    ,(2, 'Leroy', NULL, 'Boerhaven', '06-39398734', '2018-06-25', 1, NOW(6), NOW(6))
    ,(3, 'Yoeri', 'Van', 'Veen', '06-24383291', '2010-05-12', 3, NOW(6), NOW(6))
    ,(4, 'Bert', 'Van', 'Sali', '06-48293823', '2023-01-10', 4, NOW(6), NOW(6))
    ,(5, 'Mohammed', 'El', 'Yassidi', '06-34291234', '2010-06-14', 5, NOW(6), NOW(6));

INSERT INTO VoertuigInstructeur (Id, VoertuigId, InstructeurId, DatumToekenning, DatumAangemaakt, DatumGewijzigd)
VALUES
     (1, 1, 5, '2017-06-18', NOW(6), NOW(6))
    ,(2, 3, 1, '2021-09-26', NOW(6), NOW(6))
    ,(3, 9, 1, '2021-09-27', NOW(6), NOW(6))
    ,(4, 4, 4, '2022-08-01', NOW(6), NOW(6))
    ,(5, 5, 1, '2019-08-30', NOW(6), NOW(6))
    ,(6, 10, 5, '2020-02-02', NOW(6), NOW(6));
