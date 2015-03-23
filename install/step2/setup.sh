if ! [[ $1 = '--install' ]]; then
	terminator --title='infinity Install Step 2' --command="/opt/infinity-install/step2/setup.sh --install"
	exit 1
fi

echo "Welcome to the second step"


## Remove the autologin stuff
cp /opt/infinity-install/configs/global/lightdm.conf /etc/lightdm/lightdm.conf
gpasswd -d root autologin

## Ask for the browser
_BROWSER=`zenity --list --title='Browser' --text="Please select your preferred Browser" --column Name Firefox "Google Chrome" Chromium Vivaldi Opera`
inf-browser-install "$_BROWSER"



read -srn1
