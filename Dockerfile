FROM postgres:13-alpine

USER postgres

COPY init_tables.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

# docker run --name postgres-db --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -d postgres:13-alpine
# docker exec -it postgres-db bash
#
#
# docker build -t leiwang008/alpine_postgres .
# docker run --name alpine_postgres --publish 5432:5432 -d leiwang008/alpine_postgres postgres
# docker run --name alpine_postgres --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -d leiwang008/alpine_postgres postgres
# docker run --name alpine_postgres --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -d leiwang008/alpine_postgres -e POSTGRES_DB=rtdb postgres
# docker run --name alpine_postgres --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -e POSTGRES_USER=rttest -d leiwang008/alpine_postgres postgres
# docker run --name alpine_postgres --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -e POSTGRES_USER=rttest -e POSTGRES_DB=rtdb -d leiwang008/alpine_postgres postgres
# docker exec -it alpine_postgres bash
# psql -U postgres
# psql -U postgres -d rtdb
# psql -U rttest
# psql -U rttest -d rtdb