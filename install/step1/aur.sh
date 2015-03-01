## Install packages from AUR

## do we run as root?
if [[ $USER = 'root' ]]; then
	## we create the new user `iinstall`, switch to him,
	## and run the aur.sh in his environment
	useradd -m -G wheel -s /bin/bash iinstall
	echo " >> SWITCH to the temporary user"
	#read -p " ANY KEY to continue > " _answer
	su -c /opt/infinity-install/step1/aur.sh iinstall
	echo " >> LEAVED temporary user"
	#read -p " ANY KEY to continue > " _answer
	userdel -r iinstall
	
	exit
fi

cd /home/iinstall/

echo " >> install package-query"
wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar -xzf package-query.tar.gz
cd package-query
makepkg
echo " installing package-query"
# read -p " ANY KEY to continue > " _answer
sudo pacman --noconfirm -U `ls *.tar.xz` >> /opt/infinity-install/install.log
cd ..


echo " >> install yaourt"
wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar -xzf yaourt.tar.gz
cd yaourt
makepkg
## we dont't know the package name yet
echo " -------------------"
echo " installing YAOURT"
#read -p " ANY KEY to continue > " _answer
sudo pacman --noconfirm -U `ls *.tar.xz` >> /opt/infinity-install/install.log
cd ..

echo " >> yaourt install fbxkb"
yaourt --noconfirm -S fbxkb >> /opt/infinity-install/install.log

echo " >> yaourt install kalu"
yaourt --noconfirm -S kalu >> /opt/infinity-install/install.log

echo " >> yaourt install pnmixer"
yaourt --noconfirm -S pnmixer >> /opt/infinity-install/install.log

echo " >> yaourt install xfce4-volumed"
yaourt --noconfirm -S xfce4-volumed >> /opt/infinity-install/install.log

echo " >> yaourt install compton"
yaourt --noconfirm -S compton >> /opt/infinity-install/install.log

exit
