#!/bin/bash
chown -R www-data: /var/www/html

sleep 30
. /usr/local/bin/host_env.env
curl -s -o /tmp/wp-startup-curl.log "http://$WP_DOMAIN/wp-admin/install.php?step=2" \
  --data-urlencode "weblog_title=$WP_DOMAIN"\
  --data-urlencode "user_name=$WP_USERNAME" \
  --data-urlencode "admin_email=$WP_EMAIL" \
  --data-urlencode "admin_password=$WP_PASSWORD" \
  --data-urlencode "admin_password2=$WP_PASSWORD" \
  --data-urlencode "pw_weak=1" > /dev/null > /dev/null