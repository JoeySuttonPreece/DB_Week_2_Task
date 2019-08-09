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

