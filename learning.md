
# Pull "postgres" docker image

  > We can find all "postgres" images from https://hub.docker.com/_/postgres  
  > We can find the "postgres" images in https://github.com/docker-library/postgres
  > We can pull the "postgres" image as below, replace the tag by a real tag name.

    docker pull postgres:tag

# Start "postgres" image

  > + start the image

      docker run --name postgres-db --publish 5432:5432 -v C:\repository\github\docker\try_alpine_postgres\data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=mypass -d postgres:13.3-alpine
      docker run --name postgres-db --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -d postgres:13.3-alpine

  > + connect the container by sehll 

      docker exec -it postgres-db sh

  > + Show information

      / # hostname  
      8c91ffb16dd6
      / # which psql
      /usr/local/bin/psql
      / # whoami
      root
      / # env | grep VERSION
      PG_VERSION=13.3
      / # psql --version
      psql (PostgreSQL) 13.3

  > + Connect database  

      / # psql -U postgres
      psql (13.3)
      Type "help" for help.

      postgres=#

  > + Show current database and user

      postgres=# select current_database();
      current_database
      ------------------
      postgres
      (1 row)

      postgres=# select * from current_user;
      current_user
      --------------
      postgres
      (1 row)


  > + Show all databases

      postgres=# \l
                                    List of databases
      Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
    -----------+----------+----------+------------+------------+-----------------------
    postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
    template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
              |          |          |            |            | postgres=CTc/postgres
    template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
              |          |          |            |            | postgres=CTc/postgres
    (3 rows)


  > + Create database and show all databases

    postgres=# create database test;
    CREATE DATABASE
    postgres=# \list
                                    List of databases
      Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
    -----------+----------+----------+------------+------------+-----------------------
    postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
    template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
              |          |          |            |            | postgres=CTc/postgres
    template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
              |          |          |            |            | postgres=CTc/postgres
    test      | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
    (4 rows)

    postgres=# SELECT * FROM pg_database;


# Build our own "postgres" image
  
    docker build -t my-alpine-postgres .

# Start our image

    docker run --name my-postgres --publish 5432:5432 -d my-alpine-postgres

> + connect the container by sehll 

      docker exec -it postgres-db sh

 > + Connect database  

      / # psql -U postgres
      psql (13.3)
      Type "help" for help.

 > + Show all databases

      postgres=# \l
                                      List of databases
        Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
      -----------+----------+----------+------------+------------+-----------------------
      main      | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
      postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
      template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
                |          |          |            |            | postgres=CTc/postgres
      template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
                |          |          |            |            | postgres=CTc/postgres
      (4 rows)
 > + Create tables

    postgres=# CREATE TABLE userdeatail
    postgres-# (
    postgres(#     uid integer,
    postgres(#     intro character varying(100),
    postgres(#     profile character varying(100)
    postgres(# )
    postgres-# WITH(OIDS=FALSE);
    CREATE TABLE

    postgres=# CREATE TABLE userinfo
    postgres-# (
    postgres(#     uid serial NOT NULL,
    postgres(#     username character varying(100) NOT NULL,
    postgres(#     departname character varying(500) NOT NULL,
    postgres(#     Created date,
    postgres(#     CONSTRAINT userinfo_pkey PRIMARY KEY (uid)
    postgres(# )
    postgres-# WITH (OIDS=FALSE);
    CREATE TABLE

 > + Show tables
    postgres=# \dt
              List of relations
    Schema |    Name     | Type  |  Owner
    --------+-------------+-------+----------
    public | userdeatail | table | postgres
    public | userinfo    | table | postgres
    (2 rows)

 > + Change to database 'main' and show its tables

    postgres=# \c main
    You are now connected to database "main" as user "postgres".
    main=# \dt
    Did not find any relations.

 > + Change back to database 'postgres' and show its tables

    main=# \c postgres
    You are now connected to database "postgres" as user "postgres".
    postgres=# \dt
                List of relations
    Schema |    Name     | Type  |  Owner
    --------+-------------+-------+----------
    public | userdeatail | table | postgres
    public | userinfo    | table | postgres
    (2 rows)

# How to push to github
  > + git init
  > + git add .
  > + git commit -m "Initial commit"
  > + create a github repository to hold this project
  > + git remote add origin <project url>
  > + git push -f origin master


  



 

 

