APP_NAME=PHPRepl.app
APP_TARGET=/Applications/$(APP_NAME)
PHP_TARGET=$(APP_TARGET)/Contents/Resources/php
PHP_OPTS=--prefix=$(PHP_TARGET) --enable-static --enable-pcntl --with-readline=/usr/local/Cellar/readline/6.2.4
PHP_DOWNLOAD_URL=http://de3.php.net/get/php-5.4.15.tar.gz/from/de1.php.net/mirror
PHP_SRC_DIR=php-5.4.15
BUILD_APP=$(BUILD_DIR)/$(APP_NAME)
BUILD_APP_RESOURCES=$(BUILD_APP)/Contents/Resources/



all: $(PHP_TARGET)/bin/php boris copy-to-app

copy-to-app: $(BUILD_APP_RESOURCES)
	cp -rf $(PHP_TARGET) $(BUILD_APP_RESOURCES)
	cp -rf boris $(BUILD_APP_RESOURCES)

$(PHP_TARGET)/bin/php: php
	cd php && make install

php:
	/usr/local/bin/wget --output-document=php.tar.gz "$(PHP_DOWNLOAD_URL)"
	tar -xzf php.tar.gz
	mv $(PHP_SRC_DIR) php
	cd php && ./configure $(PHP_OPTS) && make

boris:
	git clone https://github.com/d11wtq/boris.git
	rm -rf boris/.git

clean:
	#rm -f php.tar.gz
	#rm -rf php
	#rm -rf boris




