USE UserDB
GO
-- Deaktivieren des Benutzers mit der ID 5
UPDATE Mitarbeiter
SET Aktiv = 0
WHERE ID = 5;
GO