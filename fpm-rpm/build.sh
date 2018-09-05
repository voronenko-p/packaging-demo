#!/bin/sh

APP_PACKAGE_DIR=$PWD/package

APP_VERSION=0.0.0
APP_NAME=app
APP_LICENSE=MIT
APP_MAINTAINER="Maintainer, inc"
APP_VENDOR="Vendor"
APP_URL="http://some.url.local"
APP_DESC="Some app desc"
APP_ARCH="amd64"

fpm -s dir -t rpm -v "$APP_VERSION" -n $APP_NAME --license="$APP_LICENSE" --maintainer="$APP_MAINTAINER" --vendor "$APP_VENDOR" \
--url="$APP_URL" --category Network --description "$APP_DESC" \
 -a "$APP_ARCH" --before-remove prerm --after-install postinst --after-upgrade postup \
 --before-upgrade preup -C $APP_PACKAGE_DIR .
