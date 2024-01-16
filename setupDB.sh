#!/bin/bash
echo 'drop database kollegium;' | mariadb
mariadb < schema.sql;
mariadb kollegium < data.sql;