FROM postgres:13-alpine

USER postgres

COPY docker-entrypoint.sh /usr/local/bin/
COPY init_tables.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

# docker run --name postgres-db --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -d postgres:13-alpine
# docker exec -it postgres-db bash
#
#
# docker build -t my-alpine-postgres .
# docker run --name my-postgres --publish 5432:5432 -d my-alpine-postgres postgres
# docker run --name my-postgres --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -d my-alpine-postgres postgres
# docker run --name my-postgres --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -d my-alpine-postgres -e POSTGRES_DB=rtdb postgres
# docker run --name my-postgres --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -e POSTGRES_USER=rttest -d my-alpine-postgres postgres
# docker run --name my-postgres --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -e POSTGRES_USER=rttest -e POSTGRES_DB=rtdb -d my-alpine-postgres postgres
# docker exec -it my-postgres bash
# psql -U postgres
# psql -U postgres -d rtdb
# psql -U rttest
# psql -U rttest -d rtdb