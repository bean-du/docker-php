#!/bin/sh

mkdir -p drupal

docker-compose -f docker-compose.yml stop
yes | docker-compose -f docker-compose.yml rm
docker-compose up -d

cp core.make.yml drupal/
docker exec -it dockerphp_web_1 drush make core.make.yml --prepare-install --overwrite -y
docker exec -it dockerphp_web_1 drush si --db-url=mysql://d8:d8@mysql/d8 --account-pass=admin -y
#drush dl drupal-8.1.x --dev --drupal-project-rename

cp .ht.router.php drupal/
wget https://www.adminer.org/static/download/4.2.4/adminer-4.2.4-en.php -O drupal/adminer.php
