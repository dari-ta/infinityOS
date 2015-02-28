## install the main apps
## * Terminator
## * XTerm
## * Thunar (Archive Plugin, Volume Manager, Thumbnails
## * File Roller
## * Viewnior

echo " >> install main apps"
pacman --noconfirm -S terminator xterm thunar thunar-archive-plugin file-roller thunar-volman raw-thumbnailer tumbler viewnior

## Font
echo " >> install fonts"
pacman --noconfirm -S ttf-dejavu

## Desktop Manager
echo " >> install desktop manager"
echo "--------------------------"
echo " change Type=Application"
echo " to Type=XSession"
read -p " ANY KEY to continue > " _answer
$EDITOR /usr/share/xsessions/openbox.desktop

pacman --noconfirm -S lightdm lightdm-gtk2-greeter
systemctl enable lightdm.service

## Design
echo " >> install design packages"
pacman --noconfirm -S lxappearance
pacman --noconfirm -S hicolor-icon-theme elementary-icon-theme gnome-icon-theme
pacman --noconfirm -S gtk-engines gtk-engine-murrine

## Editor
echo " >> install editor"
pacman --noconfirm -S geany

## Networking
echo " >> install networking"
pacman --noconfirm -S networkmanager network-manager-applet
systemctl enable NetworkManager.service

## Notifications, Keyring & Wallpaper
echo " >> install notifications, keyring and wallpaper"
pacman --noconfirm -S xfce4-notifyd gnome-keyring seahorse nitrogen

## Sound
echo " >> install sound system"
pacman --noconfirm -S volwheel
pacman --noconfirm -S pulseaudio paprefs pulseaudio-alsa alsa-utils gstreamer gstreamer0.10-base

## System 
echo " >> install system stuff"
pacman --noconfirm -S lxtask clipit xf86-input-synaptics xfce4-power-manager
pacman --noconfirm -S libconfig asciidoc
pacman --noconfirm -S gksu polkit polkit-gnome

## Node.js
echo " >> install node.js"
pacman --noconfirm -S nodejs
npm -g install nw


