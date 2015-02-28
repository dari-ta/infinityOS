## Config the system

IPATH="/opt/infinity-install/configs/global/"

echo " >> config themes"
mkdir -p /usr/share/themes/infinity/openbox-3
cp $IPATH/openbox3-themerc /usr/share/themes/infinity/openbox-3/themerc

mkdir -p /usr/share/themes/infinity/gtk-3.0
cp -R $IPATH/gtk-3.0/* /usr/share/themes/infinity/gtk-3.0/

mkdir -p /usr/share/themes/infinity/gtk-2.0
cp -R $IPATH/gtk-2.0/* /usr/share/themes/infinity/gtk-2.0/

echo " >> config binary files"
cp -R $IPATH/bin/* /usr/bin/

echo " >> config lightdm"
mkdir -p /etc/lightdm
cp $IPATH/lightdm-gtk-greeter.conf /etc/lightdm/
