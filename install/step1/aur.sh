## Install packages from AUR

echo " >> install yaourt"
wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar -xzf yaourt.tar.gz
cd yaourt
makepkg --asroot
## we dont't know the package name yet
echo " -------------------"
echo " installing YAOURT"
read -p " ANY KEY to continue > " _answer
pacman -U `ls *.tar.xz`

echo " >> yaourt install fbxkb"
yaourt fbxkb
