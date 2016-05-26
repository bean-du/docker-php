Use `run.sh` to fetch Drupal 8.1-dev and start containers.

  After run console on web container:

  drush site-install standard --db-url=mysql://d8:d8@mysql/d8 --db-su=root --db-su-pw=d8root

  drush en components

  drush en zen

  drush zen "Amazing name"

  drush pm-enable amazing_name

  drush config-set system.theme default amazing_name

  cd themes/amazing_name
  npm install

  modify options.drupalURL to yours web container url(DOCKER_URL)


  1) gulp, gulp watch
  2) styleguide http://DOCKER_URL:8081/themes/amazing_name/styleguide/



Use `docker-compose stop` to stop containers and `docker-compose rm` to clean-up.

Local `db` directory stores mysql database files and `drupal` hold core.
