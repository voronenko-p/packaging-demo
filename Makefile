build-dummy-deb:
	echo $(PWD)
	cd dummy-deb && dpkg-deb --build $(PWD)/dummy-deb/out/app

build-fpm-deb:
	cd fpm-deb && ./build.sh
