USE [master]
RESTORE DATABASE [AdventureWorks2014]
FROM DISK = N'/AdventureWorks2014.bak'
WITH MOVE 'AdventureWorks2014_Data' TO '/var/opt/mssql/data/AdventureWorks2014.mdf',
MOVE 'AdventureWorks2014_Log' TO '/var/opt/mssql/data/AdventureWorks2014_log.ldf',
FILE = 1,  NOUNLOAD, STATS = 10;