echo 'TERM=xterm mysql -u root -proot -e "CREATE DATABASE wordpress_dev"' | docker exec -i db bash
echo "TERM=xterm mysql -u root -proot -e \"CREATE USER wordpress_dev identified by 'wordpress_dev'\"" | docker exec -i db bash
echo 'TERM=xterm mysql -u root -proot -e "GRANT ALL ON wordpress_dev.* TO wordpress_dev"' | docker exec -i db bash
