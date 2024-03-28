USE UserDB;
GO
-- Erstellen Rollen-Tabelle
CREATE TABLE Rollen (
    ID INT PRIMARY KEY,
    Rolle VARCHAR(50) NOT NULL
);
GO
-- Erstellen Mitarbeiter-Tabelle
CREATE TABLE Mitarbeiter (
    ID INT PRIMARY KEY,
    RollenID INT,
    Benutzer VARCHAR(50) NOT NULL,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
	EMail VARCHAR(255) NOT NULL,
    Passwort VARCHAR(255) NOT NULL,
    Aktiv BIT,
    Erstelldatum DATE,
    FOREIGN KEY (RollenID) REFERENCES Rollen(ID)
);
GO