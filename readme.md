# Modify init_tables.sql

  The file init_tables.sql which contains the tables and data to use during test, user needs to modify it to set them correctly.  

# Build the database image
    
    docker build -t leiwang008/alpine_postgres .

# Run image to start database
  > start with the default user 'postgres' and default database 'postgres'
        
    docker run --name alpine_postgres -p 5432:5432 -e POSTGRES_PASSWORD=mypass -d leiwang008/alpine_postgres postgres

  > start with the default user 'postgres' and default database 'rtdb'
    
    docker run --name alpine_postgres -p 5432:5432 -e POSTGRES_PASSWORD=mypass -e POSTGRES_DB=rtdb -d leiwang008/alpine_postgres postgres

  > start with the default user 'rttest' and default database 'rttest'

    docker run --name alpine_postgres -p 5432:5432 -e POSTGRES_PASSWORD=mypass -ePOSTGRES_USER=rttest -d leiwang008/alpine_postgres postgres    

  > start with the default user 'rttest' and default database 'rtdb'

    docker run --name alpine_postgres --publish 5432:5432 -e POSTGRES_PASSWORD=mypass -e POSTGRES_USER=rttest -e POSTGRES_DB=rtdb -d leiwang008/alpine_postgres postgres

# Test started database container
  > Open a bash terminal against the container

    docker exec -it alpine_postgres bash

  > Open PostgreSQL interactive terminal  
    + with user 'postgres' and database 'postgres': 
        `psql -U postgres`  
    + with user 'postgres' and database 'rtdb': 
        `psql -U postgres -d rtdb`  
    + with user 'rttest' and database 'rttest':
        `psql -U rttest`  
    + with user 'rttest' and database 'rtdb':
        `psql -U -d rtdb`  


  > Check databases and tables in PostgreSQL interactive terminal  
    + check databases: `\l` or `\list`  
    + check tables: `\dt`  
    + change current database: `\c <dbname>`  