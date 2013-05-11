#!/bin/bash

#TMP_TARGET="/tmp/phprepl/"
#PHP_PREFIX="/Applications/PHPRepl.app/Contents/Resources/php"
#CONFIG_OPTS="--prefix=$PHP_PREFIX --enable-static --enable-pcntl --with-readline=/usr/local/Cellar/readline/6.2.4"

PHP_PREFIX=$1
shift

CONFIG_OPTS=$1
shift

abort() {
	echo "Aborting after error: Couldn't $1"
	exit 1
}

/usr/local/bin/wget --output-document=php.tar.gz "http://de3.php.net/get/php-5.4.15.tar.gz/from/de1.php.net/mirror" ||
    abort "download packed php source"

tar -xzf php.tar.gz || abort "untar php sources"
rm php.tar.gz || "delete packed php sources"
cd "php-5.4.15" || abort "switch to php sources directory"

echo "Configuring with $CONFIG_OPTS"
./configure $CONFIG_OPTS ||
	abort "configure php"

make || abort "compile php"
make install || "install php to $PHP_PREFIX"

