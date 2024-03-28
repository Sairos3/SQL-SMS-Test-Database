USE UserDB
GO
-- Für ID 1 bis 3 = Datum von heute plus 2 tage
UPDATE Mitarbeiter
SET Erstelldatum = DATEADD(DAY, 2, GETDATE())
WHERE ID BETWEEN 1 AND 3;
GO
-- Für restliche ID = Datum von heute minus 2 tage
UPDATE Mitarbeiter
SET Erstelldatum = DATEADD(DAY, -2, GETDATE())
WHERE ID > 3;
GO