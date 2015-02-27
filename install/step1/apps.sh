## install the main apps
## * Terminator
## * Thunar (Archive Plugin, Volume Manager, Thumbnails
## * File Roller
## * Viewnior

echo " >> install main apps"
pacman -S terminator thunar thunar-archive-plugin file-roller thunar-volman raw-thumbnailer tumbler viewnior

## Font
echo " >> install fonts"
pacman -S ttf-dejavu

## Desktop Manager
echo " >> install desktop manager"
echo "--------------------------"
echo " change Type=Application"
echo " to Type=XSession"
EDITOR /usr/share/xsessions/openbox.desktop

pacman -S lightdm lightdm-gtk2-greeter
systemctl enable lightdm.service

## Design
echo " >> install design packages"
pacman -S lxappearance
pacman -S hicolor-icon-theme elementary-icon-theme gnome-icon-theme
pacman -S gtk-engines gtk-engine-murrine
