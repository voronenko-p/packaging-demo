# packaging-demo

## Introduction

So you are software developer, who was given task to build deb or rpm package. May be this is for the first time in your career,
and may be even for the last.  So where to start.

This demo was prepared on a debian based system, so all further steps are the best reproducible on a similar systems.

Useful tools you might need or benefit from:

1) rpm - package manager for RPM, which will help you to prepare your rpm package on debian system.

Installation: `sudo apt-get install rpm`

2) `fpm`  - that's a helper written in ruby, that helps you to build packages for multiple systems and formats, including, but not limited to deb, rpm, solaris, freebsd, Mac OS X .pkg files (osxpkg), pacman (ArchLinux) packages. Project home:  https://github.com/jordansissel/fpm

Installation: `gem install --no-ri --no-rdoc fpm`

3) `deb-s3` - is a simple utility to make creating and managing APT repositories on S3. Taking into consideration, that s3 protocol is supported by multiple tools, you are not limited to AWS generally. Project home:  https://github.com/krobertson/deb-s3
Generally, procedure is a way more simplier than with classic tools like `reprepro`

Installation: `gem install --no-ri --no-rdoc deb-s3`

## Building deb

To build deb file you do not even need tools above.
For full featured example, or deeper knowledge - please make sure you've read  https://www.debian.org/doc/manuals/debian-faq/ch-pkg_basics.en.html

You need to recall following topic: purpose of the  preinst, postinst, prerm, and postrm scripts.

These files are executable scripts which are automatically run before or after a package is installed or removed. Along with a file named control, all of these files are part of the "control" section of a Debian archive file.

The individual files are:

`preinst`
This script is executed before the package it belongs to is unpacked from its Debian archive (".deb") file. Many 'preinst' scripts stop services for packages which are being upgraded until their installation or upgrade is completed (following the successful execution of the 'postinst' script).

`postinst`
This script typically completes any required configuration of the package foo once foo has been unpacked from its Debian archive (".deb") file. Often, 'postinst' scripts ask users for input, and/or warn them that if they accept default values, they should remember to go back and re-configure that package as needed. Many 'postinst' scripts then execute any commands necessary to start or restart a service once a new package has been installed or upgraded.

`prerm`
This script typically stops any daemons which are associated with a package. It is executed before the removal of files associated with the package.

`postrm`
This script typically modifies links or other files associated with foo, and/or removes files created by the package. 


In simpler case, when you need only install your tool without specific dependencies, following simple example will work:

and, of course, `control` - that's high level information about the package, which might be as simple as 

```
Package: app
Architecture: all
Maintainer: YOURNAME
Priority: optional
Version: 0.1
Description: some desc
```

Next step is to generate file structure to build package.
So: <package name>/<target>/  (app/DEBIAN) contains mentioned control files.
Rest of the directories contain files you would like to place into system, starting from root.
i.e. if you want to place file into /opt/app/bin/app-binary - you create appropriate sub directory.

If everything is ok, `dpkg-deb --build` command will build you that package.

## Building deb with fpm



