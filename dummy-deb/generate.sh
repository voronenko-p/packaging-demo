#!/bin/sh

WORKDIR=${PWD}/out/app
mkdir -p $WORKDIR/DEBIAN

cat <<EOF > $WORKDIR/DEBIAN/control
Package: app
Architecture: all
Maintainer: YOURNAME
Priority: optional
Version: 0.1
Description: some desc
EOF

mkdir -p $WORKDIR/opt/app/bin
cp app-binary $WORKDIR/opt/app/bin

cat <<EOF > $WORKDIR/DEBIAN/preinst
#!/bin/bash
touch $WORKDIR/opt/app/preinst
EOF
chmod 755 $WORKDIR/DEBIAN/preinst

cat <<EOF > $WORKDIR/DEBIAN/prerm
#!/bin/bash
echo that's prerm script
EOF
chmod 755 $WORKDIR/DEBIAN/prerm


cat <<EOF > $WORKDIR/DEBIAN/postinst
#!/bin/bash
touch $WORKDIR/opt/app/postinst
EOF
chmod 755 $WORKDIR/DEBIAN/postinst

cat <<EOF > $WORKDIR/DEBIAN/postrm
#!/bin/bash
echo that's postrm script
EOF
chmod 755 $WORKDIR/DEBIAN/postrm

dpkg-deb --build $WORKDIR
