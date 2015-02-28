## install the main apps
## * Terminator
## * XTerm
## * Thunar (Archive Plugin, Volume Manager, Thumbnails
## * File Roller
## * Viewnior

echo " >> install main apps"
pacman --noconfirm -q -S terminator xterm thunar thunar-archive-plugin file-roller thunar-volman raw-thumbnailer tumbler viewnior

## Font
echo " >> install fonts"
pacman --noconfirm -q -S ttf-dejavu

## Desktop Manager
echo " >> install desktop manager"
#echo "--------------------------"
#echo " change Type=Application"
#echo " to Type=XSession"
# read -p " ANY KEY to continue > " _answer
# $EDITOR /usr/share/xsessions/openbox.desktop
sed -e"s/Type=Application/Type=XSession/g" < /usr/share/xsessions/openbox.desktop > /usr/share/xsessions/openbox.desktop2
cp /usr/share/xsessions/openbox.desktop2 /usr/share/xsessions/openbox.desktop
rm /usr/share/xsessions/openbox.desktop2

pacman --noconfirm -q -S lightdm lightdm-gtk2-greeter
systemctl enable lightdm.service

## Design
echo " >> install design packages"
pacman --noconfirm -q -S lxappearance
pacman --noconfirm -q -S hicolor-icon-theme elementary-icon-theme gnome-icon-theme
pacman --noconfirm -q -S gtk-engines gtk-engine-murrine

## Editor
echo " >> install editor"
pacman --noconfirm -q -S geany

## Networking
echo " >> install networking"
pacman --noconfirm -q -S networkmanager network-manager-applet
systemctl enable NetworkManager.service

## Notifications, Keyring & Wallpaper
echo " >> install notifications, keyring and wallpaper"
pacman --noconfirm -q -S xfce4-notifyd gnome-keyring seahorse nitrogen

## Sound
echo " >> install sound system"
pacman --noconfirm -q -S volwheel
pacman --noconfirm -q -S pulseaudio paprefs pulseaudio-alsa alsa-utils gstreamer gstreamer0.10-base

## System 
echo " >> install system stuff"
pacman --noconfirm -q -S lxtask clipit xf86-input-synaptics xfce4-power-manager
pacman --noconfirm -q -S libconfig asciidoc
pacman --noconfirm -q -S gksu polkit polkit-gnome

## Node.js
echo " >> install node.js"
pacman --noconfirm -q -S nodejs
npm -g install nw


