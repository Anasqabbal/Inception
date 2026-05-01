FROM alpine:3.21

	RUN apk add --no-cache \
    php \
    php-fpm \
    php-mysqli \
    php-json \
    php-curl \
    php-mbstring \
    php-openssl \
    php-exif \
    php-fileinfo \
    php-tokenizer \
    php-ctype \
    php-redis \
    php-xml \
    php-zip \
    php-dom \
    php-cli \
	php-phar \
    wget \
	curl \
    unzip \
    redis && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
        /etc/php83/php-fpm.d/www.conf

WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

COPY ./requirements/wordpress/conf/wp-config-create.sh /

RUN chmod +x /wp-config-create.sh

RUN	 chown -R nobody:nobody /var/www/html
RUN  chmod -R 0777 wp-content

ENTRYPOINT ["/bin/sh", "/wp-config-create.sh"]