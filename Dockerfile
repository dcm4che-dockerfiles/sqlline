FROM openjdk:11.0.9-buster
MAINTAINER Gunter Zeilinger <gunterze@protonmail.com>

RUN apt-get update && \
    LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y sqlline && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd /usr/share/java \
 && curl -o db2jcc.jar https://repo1.maven.org/maven2/com/ibm/db2/jcc/db2jcc/db2jcc4/db2jcc-db2jcc4.jar \
 && curl -o jaybird.jar https://repo1.maven.org/maven2/org/firebirdsql/jdbc/jaybird/4.0.1.java11/jaybird-4.0.1.java11.jar \
 && curl -o mysql-connector-java.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.22/mysql-connector-java-8.0.22.jar \
 && curl -o mariadb-java-client.jar https://repo1.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/2.7.1/mariadb-java-client-2.7.1.jar \
 && curl -o postgresql.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.18/postgresql-42.2.18.jar \
 && curl -o ojdbc10.jar https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc10/19.8.0.0/ojdbc10-19.8.0.0.jar \
 && curl -o mssql-jdbc.jar https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/8.4.1.jre11/mssql-jdbc-8.4.1.jre11.jar \
 && curl -o jtds.jar https://repo1.maven.org/maven2/net/sourceforge/jtds/jtds/1.3.1/jtds-1.3.1.jar \
 && sed -i 's/postgresql-jdbc4 mariadb-java-client hsqldb jtds/jcc jaybird mysql-connector-java mariadb-java-client postgresql ojdbc10 mssql-jdbc jtds/' /usr/bin/sqlline

CMD ["/usr/bin/sqlline"]
