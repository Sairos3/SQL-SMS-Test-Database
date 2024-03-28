USE UserDB;
GO
-- Update des Benutzernamens
UPDATE Mitarbeiter
SET Vorname = 'Michael', Nachname = 'Jordan'
WHERE ID = 10;
GO