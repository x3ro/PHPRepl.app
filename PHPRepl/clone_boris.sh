#!/bin/bash

TMP_TARGET="/tmp/phprepl/"
PHP_PREFIX="/Applications/PHPRepl.app/Contents/Resources/php"

exit 0

echo "Number of args: $#"

BUILD_DIR=$1
shift

echo "Build Dir: $BUILD_DIR"

PHP_TARGET_DIR="$BUILD_DIR/PHPRepl.app/Contents/Resources/"

abort() {
	echo "Aborting after error: Couldn't $1"
	exit 1
}

cp -r $PHP_PREFIX $PHP_TARGET_DIR
