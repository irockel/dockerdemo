#!/bin/sh

echo "Creating database $DBUSER"
psql -v ON_ERROR_STOP=0 --username postgres <<-EOSQL
    CREATE USER $DBUSER WITH LOGIN REPLICATION;
    ALTER USER $DBUSER PASSWORD '$DBPASSWORD';
    CREATE DATABASE $DATABASE WITH OWNER $DBUSER ENCODING 'UTF-8';
EOSQL
