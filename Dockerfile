FROM nextcloud:14-beta-fpm
COPY storage.config.php /usr/src/nextcloud/config/storage.config.php
COPY configuration-entrypoint.sh /
RUN chmod +x /configuration-entrypoint.sh
CMD ["php-fpm"]
ENTRYPOINT ["/configuration-entrypoint.sh"]
