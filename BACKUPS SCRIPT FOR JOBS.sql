BACKUP DATABASE [Banking_DB] TO  DISK = N'D:\bankingDatabasebackupFile.BAK' WITH  RETAINDAYS = 14, NOFORMAT, INIT,  NAME = N'Banking_DB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10, CHECKSUM, CONTINUE_AFTER_ERROR
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'Banking_DB' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'Banking_DB' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''Banking_DB'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'D:\bankingDatabasebackupFile.BAK' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
