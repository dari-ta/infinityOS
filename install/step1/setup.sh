## in step 1, we'll do post-install jobs, and install our choosen software

echo "Step 1 - Core install"
echo "======================"

echo " >> install sudo"
pacman -S sudo
echo " we'll display you the sudoers file."
echo " find the %wheel ALL=(ALL) ALL"
echo " and remove the # hashtag before"
echo " exit with Ctrl+x or :wq"
read -p " ANY KEY to continue > " _answer
EDITOR=nano visudo

echo " >> install main services"
pacman -S acpid ntp dbus avahi cronie
systemctl enable cronie
systemctl enable acpid
systemctl enable ntpd
systemctl enable avahi-daemon

echo " >> install the X Window system"
echo " you'll may be promted to choose your display driver"
read -p " ANY KEY to continue > " _answer

pacman -S xorg-server xorg-xinit xorg-utils xorg-server-utils

read -P " are we on VirtualBox? (y/N) > " _answer
if [[ $_answer = "y" ]]; then
	pacman -S virtualbox-guest-utils
fi

echo " >> install window manager"
pacman -S openbox
mkdir -p ~/.config/openbox
cp /etc/xdg/openbox/rc.xml ~/.config/openbox/
cp /etc/xdg/openbox/menu.xml ~/.config/openbox/
echo "exec openbox-session" >> ~/.xinitrc

pacman -S obconf obmenu

echo " >> install panel"
pacman -S tint2
