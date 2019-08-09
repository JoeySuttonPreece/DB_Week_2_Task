DROP TABLE IF EXISTS PlayerRegistration;
DROP TABLE IF EXISTS TeamEntry;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Season;
DROP TABLE IF EXISTS Club;

CREATE TABLE Club (
    ClubName        NVARCHAR(100)
,   ContactName     NVARCHAR(100)
,   PRIMARY KEY     (ClubName)
);

CREATE TABLE Season (
    SeasonYear      INT
,   SeasonName      NVARCHAR(6) CHECK (SeasonName = 'Winter' OR SeasonName = 'Summer')
,   PRIMARY KEY     (SeasonYear, SeasonName)
);

CREATE TABLE Player (
    PlayerId        INT IDENTITY(1000, 1)
,   Fname           NVARCHAR(100) NOT NULL
,   Lname           NVARCHAR(100) NOT NULL
,   Phone           NVARCHAR(50)
,   PRIMARY KEY     (PlayerId)
);

CREATE TABLE TeamEntry (
    ClubName        NVARCHAR(100)
,   SeasonYear      INT
,   SeasonName      NVARCHAR(6)
,   AgeGroup        NVARCHAR(3)
,   TeamNumber      INT
,   PRIMARY KEY     (ClubName, SeasonYear, SeasonName, AgeGroup, TeamNumber)
,   FOREIGN KEY     (ClubName) REFERENCES Club
,   FOREIGN KEY     (SeasonYear, SeasonName) REFERENCES Season
);

CREATE TABLE PlayerRegistration (
    PlayerId        INT
,   ClubName        NVARCHAR(100)
,   SeasonYear      INT
,   SeasonName      NVARCHAR(6)
,   AgeGroup        NVARCHAR(3)
,   TeamNumber      INT
,   DateRegistered  DATE NOT NULL
,   PRIMARY KEY     (PlayerId, ClubName, SeasonYear, SeasonName, AgeGroup, TeamNumber)
,   FOREIGN KEY     (PlayerId) REFERENCES Player
,   FOREIGN KEY     (ClubName, SeasonYear, SeasonName, AgeGroup, TeamNumber) REFERENCES TeamEntry
);

INSERT INTO Club (ClubName, ContactName) VALUES
('Mt Martha Basketball Club', 'Bob Jane'),
('Club For Cool Kids', 'Jane Bob'),
('Very Lame Club For Losers', 'Anon'),
('Scream Time AAAAAAAAAA', 'Brent ''aaaaaaaaaaaaaaaaaaa'' Anderson');

INSERT INTO Season (SeasonYear, SeasonName) VALUES
(2018, 'Winter'),
(2018, 'Summer'),
(2019, 'Winter'),
(2019, 'Summer');

INSERT INTO TeamEntry (ClubName, SeasonYear, SeasonName, AgeGroup, TeamNumber) VALUES
('Mt Martha Basketball Club', 2018, 'Summer', 'U14', 1),
('Mt Martha Basketball Club', 2018, 'Summer', 'U14', 2),
('Club For Cool Kids', 2019, 'Winter', 'O18', 1),
('Scream Time AAAAAAAAAA', 2019, 'Winter', 'U14', 1);

INSERT INTO Player (Fname, Lname, Phone) VALUES
('John', 'Howard', '5552345'),
('Julia', 'Gillard', '5553456'),
('Frank', 'Sonnatii', '0000142'),
('Little', 'Mac', '342444');

INSERT INTO PlayerRegistration (PlayerId, ClubName, SeasonYear, SeasonName, AgeGroup, TeamNumber, DateRegistered) VALUES
(1003, 'Mt Martha Basketball Club', 2018, 'Summer', 'U14', 2, '2019-1-1'),
(1000, 'Club For Cool Kids', 2019, 'Winter', 'O18', 1, '2019-5-5'),
(1001, 'Club For Cool Kids', 2019, 'Winter', 'O18', 1, '2019-2-2'),
(1002, 'Club For Cool Kids', 2019, 'Winter', 'O18', 1, '2019-3-3'),
(1003, 'Club For Cool Kids', 2019, 'Winter', 'O18', 1, '2019-4-4');