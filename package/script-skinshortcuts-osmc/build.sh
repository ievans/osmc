# (c) 2014-2015 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

. ../common.sh

REV="efbec8bd7065924c80a80a1216b9ce5320a9ebf9"
VER="1.0.11"
echo -e "Building package script-skinshortcuts-osmc"
echo -e "Downloading add-on"
pull_source "https://github.com/BigNoid/script.skinshortcuts/archive/${REV}.tar.gz" "$(pwd)/src"
if [ $? != 0 ]; then echo -e "Error downloading" && exit 1; fi
# Fix version so it cannot be upgraded outside of OSMC
sed -e 's/version="1.0.11"/version="9.9.999"/' -i src/script.skinshortcuts-${REV}/addon.xml
echo -e "Moving files in to place"
mkdir -p files/usr/share/kodi/addons
cp -ar src/script.skinshortcuts-${REV}/ files/usr/share/kodi/addons/script.skinshortcuts
dpkg_build files/ script-skinshortcuts-osmc.deb
