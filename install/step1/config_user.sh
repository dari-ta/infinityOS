## All the configs for the user or skel
## configs_user.sh homepath
## homepath may be /etc/skel/ or /home/user or /root

if [[ $1 = "" ]]; then
	echo "ERR: no homepath specified"
	echo "configs_user.sh homepath"
	exit 1
fi

HPATH=$1
IPATH="/opt/infinity-install/"

echo " >> config tint2"
cp $IPATH/configs/user/tint2rc $HPATH/.config/tint2/tint2rc
