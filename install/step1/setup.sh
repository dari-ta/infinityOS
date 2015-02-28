## in step 1, we'll do post-install jobs, and install our choosen software

echo "Step 1 - Core install"
echo "======================"

echo "Please set your fave editor:"
echo "1. Vi"
echo "2. Vim"
echo "3. Nano"
read -p " Editor(1-3) [1] > " _answer
if [[ $_answer = "1" ]]; then
	EDITOR='vi'
fi
if [[ $_answer = "2" ]]; then
	EDITOR='vim'
fi
if [[ $_answer = "3" ]]; then
	EDITOR='nano'
fi
export EDITOR


echo " >> install sudo"
pacman --noconfirm -q -S sudo
echo "------------------------------------";
echo " we'll display you the sudoers file."
echo " find the %wheel ALL=(ALL) ALL"
echo " and remove the # hashtag before"
echo " exit with Ctrl+x or :wq"
read -p " ANY KEY to continue > " _answer
EDITOR=nano visudo

echo " >> install main services"
pacman --noconfirm -q -S acpid ntp dbus avahi cronie
systemctl enable cronie
systemctl enable acpid
systemctl enable ntpd
systemctl enable avahi-daemon

echo " >> install core system apps"
pacman --noconfirm -q -S wget yajl

echo "---------------------------------";
echo " >> install the X Window system"
echo " you'll may be promted to choose your display driver"
read -p " ANY KEY to continue > " _answer

pacman -S xorg-server xorg-xinit xorg-utils xorg-server-utils

echo "----------------------------------";
read -p " are we on VirtualBox? (y/N) > " _answer
if [[ $_answer = "y" ]]; then
	pacman --noconfirm -q -S virtualbox-guest-utils
fi

echo " >> install window manager"
pacman --noconfirm -q -S openbox
mkdir -p ~/.config/openbox
cp /etc/xdg/openbox/rc.xml ~/.config/openbox/
cp /etc/xdg/openbox/menu.xml ~/.config/openbox/
echo "exec openbox-session" >> ~/.xinitrc

pacman --noconfirm -q -S obconf obmenu

echo " >> install panel"
pacman --noconfirm -q -S tint2

## install the main apps
/opt/infinity-install/step1/apps.sh
## install packages from AUR
/opt/infinity-install/step1/aur.sh


## config the system
/opt/infinity-install/step1/config_global.sh

## config the root user
/opt/infinity-install/step1/config_user.sh /root/

## config the skel user
/opt/infinity-install/step1/config_user.sh /etc/skel/
