Use `run.sh` to fetch Drupal 8.1-dev and start containers.

After run console on web container:
drush site-install standard --db-url=mysql://d8:d8@192.168.99.100/d8 --db-su=root --db-su-pw=d8root
drush en components
drush en zen
drush zen "Amazing name"
drush vset theme_default amazing_name

cd themes/amazing_name
npm install





Use `docker-compose stop` to stop containers and `docker-compose rm` to clean-up.

Local `db` directory stores mysql database files and `drupal` hold core.
