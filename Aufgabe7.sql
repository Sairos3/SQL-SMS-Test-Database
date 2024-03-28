USE UserDB;
GO
-- Sichern Datenbank als UserDB_backup.bak
BACKUP DATABASE UserDB TO DISK = 'C:\Backup\UserDB_backup.bak';
GO