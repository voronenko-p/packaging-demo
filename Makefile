build-dummy-deb:
	echo $(PWD)
	cd dummy-deb && dpkg-deb --build $(PWD)/dummy-deb/out/app

build-fpm-deb:
	cd fpm-deb && ./build.sh

build-fpm-rpm:
	cd fpm-rpm && ./build.sh
