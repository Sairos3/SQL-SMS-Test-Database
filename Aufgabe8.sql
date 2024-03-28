USE UserDB
GO
-- Add Views with aliases and true1 false0 showing as Aktiv, Inaktiv
CREATE VIEW UserView AS
SELECT 
    ID AS Nummer,
    Benutzer AS Anmeldename,
    CONCAT(Vorname, ' ', Nachname) AS Anwender,
	CONCAT('E-Mailadresse: ', EMail) AS Mail,
    CASE 
        WHEN Aktiv = 1 THEN 'Aktiv'
        ELSE 'Inaktiv'
    END AS Anmeldung
FROM Mitarbeiter;
GO