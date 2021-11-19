FROM mcr.microsoft.com/mssql-tools
USER root
RUN curl https://raw.githubusercontent.com/microsoft/sql-server-samples/master/samples/databases/northwind-pubs/instnwnd.sql > /instnwnd.sql
RUN curl https://raw.githubusercontent.com/microsoft/sql-server-samples/master/samples/databases/northwind-pubs/instpubs.sql > /instpubs.sql
COPY setup.sh /setup.sh
COPY setup.sql /setup.sql
RUN chmod +x setup.sh
ENTRYPOINT [ "./setup.sh" ]