FROM mysql:8

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=molina_delacruz

VOLUME ["/var/lib/mysql"]

COPY schema.sql /docker-entrypoint-initdb.d/
COPY schema2.sql /docker-entrypoint-initdb.d/
COPY schema3.sql /docker-entrypoint-initdb.d/
COPY schema4.sql /docker-entrypoint-initdb.d/
EXPOSE 3306