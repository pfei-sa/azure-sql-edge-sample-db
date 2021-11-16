FROM mcr.microsoft.com/mssql-tools
RUN curl https://raw.githubusercontent.com/microsoft/sql-server-samples/master/samples/databases/northwind-pubs/instnwnd.sql > /instnwnd.sql
COPY setup.sh /setup.sh
COPY setup.sql /setup.sql
RUN chmod +x setup.sh
ENTRYPOINT [ "./setup.sh" ]