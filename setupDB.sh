#!/bin/bash
echo 'drop database kollegium;' | mariadb
mariadb < schema.sql;
mariadb kollegium < config.sql;
mariadb kollegium < testdata.sql;