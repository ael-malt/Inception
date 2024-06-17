service mariadb start

sleep 5

mysql -u root -p"$SQL_ROOT_PASSWORD"  << EOF
CREATE DATABASE IF NOT EXISTS \`${SQL_NAME}\`;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_NAME}\`.* TO '${SQL_USER}'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
EOF

if [ $? -eq 0 ]; then
    echo "Database operations were successful"
else
    echo "Database operations failed"
    exit 1
fi

pkill -9 mariadb

mysqld_safe 