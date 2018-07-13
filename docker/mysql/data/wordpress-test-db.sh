#!/usr/bin/env bash
mysql -uroot -p${MYSQL_ROOT_PASSWORD:-secret} -e "CREATE DATABASE IF NOT EXISTS ${WP_TEST_DB_NAME:-wordpress_test};"