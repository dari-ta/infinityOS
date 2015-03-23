## All the configs for the user or skel
## configs_user.sh homepath
## homepath may be /etc/skel/ or /home/user or /root

if [[ $1 = "" ]]; then
	echo "ERR: no homepath specified"
	echo "configs_user.sh homepath"
	exit 1
fi

HPATH=$1
IPATH="/opt/infinity-install/configs/user/"

echo " >> config tint2"
mkdir -p $HPATH/.config/tint2
cp $IPATH/tint2rc $HPATH/.config/tint2/tint2rc

echo " >> config compton"
cp $IPATH/compton.conf $HPATH/.config/compton.conf

echo " >> config openbox"
mkdir -p $HPATH/.config/openbox
cp $IPATH/openbox/* $HPATH/.config/openbox/

echo " >> config gmrun"
cp $IPATH/.gmrunrc $HPATH/.gmrunrc

echo " >> config terminator"
mkdir -p $HPATH/.config/terminator
cp $IPATH/terminator_config $HPATH/.config/terminator/config


# Make all essential directories
mkdir -p $HPATH/Documents
mkdir -p $HPATH/Pictures
mkdir -p $HPATH/Music
mkdir -p $HPATH/Downloads
mkdir -p $HPATH/Videos
mkdir -p $HPATH/Templates
mkdir -p $HPATH/Documents
mkdir -p $HPATH/.config/infinity/autostart
