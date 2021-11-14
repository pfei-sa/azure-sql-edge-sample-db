FROM mcr.microsoft.com/mssql-tools
COPY setup.sh /setup.sh
COPY setup.sql /setup.sql
RUN chmod +x setup.sh
RUN curl https://raw.githubusercontent.com/microsoft/sql-server-samples/master/samples/databases/northwind-pubs/instnwnd.sql > /instnwnd.sql
ENTRYPOINT [ "./setup.sh" ]