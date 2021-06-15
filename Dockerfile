FROM postgres:13-alpine

USER postgres

COPY docker-entrypoint.sh /usr/local/bin/
COPY init_tables.sql /docker-entrypoint-initdb.d/

# RUN chmod 0700 /var/lib/postgresql/data &&\
#     initdb /var/lib/postgresql/data &&\
#     echo "host all  all    0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf &&\
#     echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf &&\
#     pg_ctl start &&\
#     psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'main'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE main" &&\
#     psql --command "ALTER USER postgres WITH ENCRYPTED PASSWORD 'mypass';" &&\
#     # psql -U postgres -c "SELECT * FROM pg_database;"&&\
#     psql --list

EXPOSE 5432

# docker run --name postgres-db --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -d postgres:13-alpine
# docker run --name postgres-db --publish 5432:5432  -d postgres:13-alpine
# docker build -t my-alpine-postgres .
# docker run --name my-postgres --publish 5432:5432 -d my-alpine-postgres postgres
# docker run --name my-postgres --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -d my-alpine-postgres postgres
# docker run --name my-postgres -v C:\repository\github\docker\try_alpine_postgres:/try_alpine_postgres --publish 5432:5432 -d my-alpine-postgres postgres
# docker exec -it my-postgres bash
# psql -U postgres