#!/bin/bash

# wait for MSSQL server to start
export STATUS=1
i=0

while [[ $STATUS -ne 0 ]] && [[ $i -lt 60 ]]; do
	i=$i+1
	echo "*************************************************************************"
	echo "Waiting for SQL Server to start (it will fail until port is opened)..."
	/opt/mssql-tools/bin/sqlcmd -t 1 -S db -U sa -P "yourStrong(!)Password" -Q "select 1"
	STATUS=$?
	sleep 1	
done

if [ $STATUS -ne 0 ]; then 
	echo "Error: MSSQL SERVER took more than 60 seconds to start up."
	exit 1
fi

echo "======= MSSQL SERVER STARTED ========" | tee -a ./config.log

echo "*********** Loading Northwind database " | tee -a ./config.log
/opt/mssql-tools/bin/sqlcmd -S db -U sa -P "yourStrong(!)Password" -d master -i /instnwnd.sql

echo "*********** Loading AdventureWorks2014 database " | tee -a ./config.log
/opt/mssql-tools/bin/sqlcmd -S db -U sa -P "yourStrong(!)Password" -d master -i /setup.sql