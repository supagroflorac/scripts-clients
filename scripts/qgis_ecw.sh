#/bin/bash

ERDAS="ERDAS-ECW_JPEG_2000_SDK-5.2.1"

# Ajout du support de ECW
cd /tmp
wget --progress=bar http://mirror.cdrflorac.fr/qgis/erdas-ecwjp2sdk-v5.2.1-linux.zip
unzip erdas-ecwjp2sdk-v5.2.1-linux.zip
chmod +x /tmp/ERDAS_ECWJP2_SDK-5.2.1.bin
cd -

echo \
'#!/usr/bin/expect
set timeout 5
spawn /tmp/ERDAS_ECWJP2_SDK-5.2.1.bin
expect -regexp "\[1, 2, 3, 4, 5, or 6\]"
send "1\n"
#interact
expect -regexp ".*Plus.*"
send -- "q"
#interact
expect -regexp "Do you accept this License Agreement? \[yes/no\]"
send "yes\n"
interact' > /tmp/exec.sh
bash /tmp/exec.sh

mv "~/hexagon/ERDAS-ECW_JPEG_2000_SDK-5.2.1" "/usr/local/"

ln -s /usr/local/ERDAS-ECW_JPEG_2000_SDK-5.2.1/Desktop_Read-Only/lib/x64/release/libNCSEcw.so /usr/local/lib/libNCSEcw.so

ldconfig

rm /tmp/erdas-ecwjp2sdk-v5.2.1-linux.zip
rm /tmp/ERDAS_ECWJP2_SDK-5.2.1.bin
rm /tmp/exec.sh

cd /tmp
wget https://launchpad.net/~ubuntugis/+archive/ubuntugis-unstable/+files/libgdal-ecw-src_1.10.0-1~precise4_all.deb
cd -

dpkg -i /tmp/libgdal-ecw-src_1.10.0-1~precise4_all.deb

rm /tmp/libgdal-ecw-src_1.10.0-1~precise4_all.deb

gdal-ecw-build /usr/local/ERDAS-ECW_JPEG_2000_SDK-5.2.1/Desktop_Read-Only

mkdir /usr/lib/gdalplugins/1.11
cp /usr/lib/gdalplugins/1.10/gdal_ECW_JP2ECW.so /usr/lib/gdalplugins/1.11
