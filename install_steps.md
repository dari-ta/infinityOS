Just the steps I've done after installing arch


pacman -S sudo
// enable group wheel in sudoers
pacman -S acpid ntp dbus avahi cronie

systemctl enable cronie
systemctl enable acpid
systemctl enable ntpd
systemctl enable avahi-daemon

pacman -S xorg-server xorg-xinit xorg-utils xorg-server-utils
// used mesa

// ONLY on vbox
pacman -S virtualbox-guest-utils

## Window manager
pacman -S openbox
mkdir -p ~/.config/openbox
cp /etc/xdg/openbox/rc.xml ~/.config/openbox/
cp /etc/xdg/openbox/menu.xml ~/.config/openbox/
vim ~/.xinitrc
  exec openbox-session
pacman -S obconf obmenu
// copy rc.xml from infinity Package (14) to ~/.config/openbox/rc.xml
// copy themerc from infinity Package (28) to /usr/share/themes/infinity/openbox-3/themerc

## Panel
pacman -S tint2
// copy tint2rc from infinity Package (13) to ~/.config/tint2/tint2rc

## Main apps
pacman -S terminator thunar thunar-archive-plugin file-roller thunar-volman raw-thumbnailer tumbler viewnior
// add obmenu and terminator to ~/.config/openbox/menu.xml
pacman -S ttf-dejavu
// fbxkb from AUR

## Desktop Manager
// Won't work
//pacman -S xorg-xdm
// systemctl enable xdm.service

// change /usr/share/xsessions/openbox.desktop
  Type=Application
// to
  Type=XSession
pacman -S lightdm lightdm-gtk2-greeter
systemctl enable lightdm.service

## Firefox
pacman -S firefox

## Design
pacman -S lxappearance
pacman -S hicolor-icon-theme elementary-icon-theme gnome-icon-theme
// copy contents from infinity Package (28) excluding themerc to /usr/share/themes/infinity/gtk-3.0/
// copy contents from infinity Package (29) to /usr/share/themes/infinity/gtk-3.0/assets/
// copy contents from infinity Package (30) excluding gtkrc to /usr/share/themes/infinity/gtk-3.0/apps/
// copy gtkrc from infinity Package (30) to /usr/share/themes/infinity/gtk-2.0/gtkrc
// copy contents from infinity Package (31) excluding themerc to /usr/share/themes/infinity/gtk-2.0/images/
pacman -S gtk-engines gtk-engine-murrine

## Geany
pacman -S geany

## Networking
pacman -S networkmanager
systemctl enable NetworkManager.service
pacman -S network-manager-applet

## Notifications
pacman -S xfce4-notifyd

## Gnome Keyring
pacman -S gnome-keyring seahorse

## Nitrogen
pacman -S nitrogen

## Sound
pacman -S volwheel
pacman -S pulseaudio paprefs pulseaudio-alsa alsa-utils gstreamer gstreamer0.10-base
// pnmixer from AUR
// xfce4-volumed from AUR

## System 
pacman -S lxtask
pacman -S clipit
pacman -S xf86-input-synaptics
pacman -S xfce4-power-manager
pacman -S libconfig asciidoc
// compton from AUR
// copy cb-exit and infinity-icon.png from infinity Package (16) to /usr/bin/
// change shebang python to python2 
chmod u+s /usr/bin/cb-exit
pacman -S gksu
pacman -S polkit polkit-gnome

## Node JS
pacman -S nodejs

## CB
// from github.com/corenominal/cb-pipimenus
// copy cb-include cb-compositor > /usr/bin/
// copy cb-* > /usr/bin/
// edit ~/.config/compton.conf

// from github.com/corenominal/cb-configs-master
// copy .config/openbox/menu.xml to ~/.config/openbox/menu.xml

## Package Manager
// kalu from AUR
pacman -S yajl
// package-query from AUR
// yaourt from AUR