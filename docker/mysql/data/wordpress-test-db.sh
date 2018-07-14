#!/usr/bin/env bash

# This script will run when MYSQL container run for the first time.
# It will create additional database to be used for Wordpress plugins testing.
# We will verify environment variables which should be set in `.evn` file.
# And passed to MYSQL container using `docker-compose.yml`

# The name of the database will be: $WP_TEST_DB_NAME
# And the default user created by docker-composer $MYSQL_USER will be granted privileges on the database.

if [ -z ${MYSQL_ROOT_PASSWORD+x} ]; then
    echo -e "\033[0;31mroot password is not set. abort creating Wordpress test database.\033[0m"
elif [ -z ${WP_TEST_DB_NAME+x} ]; then
    echo -e "\033[0;31mWordpress test database name is not set. abort creating Wordpress test database.\033[0m"
else

mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${WP_TEST_DB_NAME};"
echo -e "\033[0;32m${WP_TEST_DB_NAME} was created.\033[0m"

    if [ -z ${MYSQL_USER+x} ]; then
        echo -e "\033[0;31mWPDOCKER: Wordpress database user is not. abort granting priviliges to the user Wordpress test database.\033[0m"
    else

    mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${WP_TEST_DB_NAME}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;"
    echo -e "\033[0;32mWPDOCKER: Privileges was granted to ${MYSQL_USER} on ${WP_TEST_DB_NAME}.\033[0m"
    fi

fi