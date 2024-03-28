USE UserDB;
GO
-- Erstellen 3 Rolle mit ID in Rollen
INSERT INTO Rollen (ID, Rolle)
VALUES 
(1, 'Benutzer'),
(2, 'Administrator'),
(3, 'Superadmin');
GO
-- Erstellen 10 Benutzer mit ID, Kennword, Datum, RollenID, Aktive 0/1
INSERT INTO Mitarbeiter (ID, RollenID, Benutzer, Vorname, Nachname, EMail, Passwort, Aktiv, Erstelldatum)
VALUES
(1, 1, 'user1', 'Max', 'Mustermann','max.mustermann@test.de', 'passwort1', 1, '2024-03-10'),
(2, 1, 'user2', 'Maria', 'Musterfrau', 'maria.musterfrau@test.de', 'passwort2', 1, '2024-03-11'),
(3, 2, 'admin31', 'Admin', 'Administrator', 'admin31@test.de', 'adminpass3', 1, '2024-03-12'),
(4, 3, 'superadmin41', 'Super', 'Admin', 'superadmin41@test.de', 'superadminpass4', 1, '2024-03-13'),
(5, 1, 'user5', 'John', 'Cena', 'john.cena@test.de', 'password5', 1, '2024-03-14'),
(6, 1, 'user6', 'Jane', 'Doe', 'jane.doe@test.de', 'password6', 1, '2024-03-15'),
(7, 2, 'admin72', 'Just', 'Admin', 'just.admin@test.de', 'adminpass7', 1, '2024-03-16'),
(8, 1, 'user8', 'Chris', 'Williams', 'chris.williams@test.de', 'password8', 1, '2024-03-17'),
(9, 1, 'user9', 'Emily', 'Watson', 'emily.watson@test.de', 'password9', 1, '2024-03-18'),
(10, 1, 'user10', 'Michael', 'Williams', 'michael.williams@test.de', 'password10', 1, '2024-03-19');
GO