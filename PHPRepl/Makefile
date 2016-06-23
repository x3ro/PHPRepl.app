APP_NAME=PHPRepl.app
APP_TARGET=/Applications/$(APP_NAME)
PHP_TARGET=$(APP_TARGET)/Contents/Resources/php
PHP_OPTS=--prefix=$(PHP_TARGET) --enable-static --enable-pcntl --with-libedit
PHP_DOWNLOAD_URL=http://de1.php.net/get/php-7.0.8.tar.gz/from/this/mirror
PHP_SRC_DIR=php-7.0.8
BUILD_APP=$(TARGET_BUILD_DIR)/$(APP_NAME)
BUILD_APP_RESOURCES=$(BUILD_APP)/Contents/Resources/



all: $(PHP_TARGET)/bin/php psysh psysh/vendor copy-to-app

copy-to-app: $(BUILD_APP_RESOURCES)
	cp -rf $(PHP_TARGET) $(BUILD_APP_RESOURCES)
	cp -rf psysh $(BUILD_APP_RESOURCES)

$(PHP_TARGET)/bin/php: php
	cd php && ./configure $(PHP_OPTS) && make && make install

php:
	/usr/local/bin/wget --output-document=php.tar.gz "$(PHP_DOWNLOAD_URL)"
	tar -xzf php.tar.gz
	mv $(PHP_SRC_DIR) php

psysh:
	git clone https://github.com/bobthecow/psysh.git
	rm -rf psysh/.git

psysh/vendor:
	cd psysh && composer install

clean:
	rm -f php.tar.gz
	rm -rf php
	rm -rf psysh




