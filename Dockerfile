FROM postgres:13-alpine

USER postgres

RUN chmod 0700 /var/lib/postgresql/data &&\
    initdb /var/lib/postgresql/data &&\
    echo "host all  all    0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf &&\
    echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf &&\
    pg_ctl start &&\
    psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'main'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE main" &&\
    psql --command "ALTER USER postgres WITH ENCRYPTED PASSWORD 'mypass';" &&\
    # psql -U postgres -c "SELECT * FROM pg_database;"&&\
    psql --list

EXPOSE 5432

# docker build -t my-alpine-postgres .
# docker run --name my-postgres --publish 5432:5432 -d my-alpine-postgres
# docker exec -it my-postgres sh
# psql -U postgres