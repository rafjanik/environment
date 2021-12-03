# !/bin/bash

# Download Wordpress
wp core download --path=. \
  --allow-root

# Create wp-config
wp config create --locale="pl_PL" \
  --dbhost="mysql" \
  --dbname="$MYSQL_DATABASE" \
  --dbuser="$MYSQL_USER" \
  --dbpass="$MYSQL_PASSWORD" \
  --allow-root \
  --path=.

# Install Wordpress
wp core install --url=$APP_HOST \
  --quiet \
  --title="Demo Wordpress" \
  --admin_name=$WP_ADMIN_NAME \
  --admin_email="$WP_ADMIN_EMAIL" \
  --admin_password="$WP_ADMIN_PASSWORD" \
  --allow-root \
  --path=.

# Install language pl
wp core language install pl_PL  --activate \
  --allow-root \
  --path=.

# Install plugins "classic-editor"
wp plugin install --activate "classic-editor" \
  --allow-root \
  --path=.

# Install plugins "regenerate-thumbnails"
wp plugin install --activate "regenerate-thumbnails" \
  --allow-root \
  --path=.

# Activate plugin
wp plugin activate "demo-plugin" \
  --allow-root \
  --path=.

# Activate theme
#wp theme activate "demo-theme" \
#  --allow-root \
#  --path=.

# Change of owner
chown -R www-data:www-data .