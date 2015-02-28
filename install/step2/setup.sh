if ! [[ $1 = '--install' ]]; then
	terminator --title='infinity Install Step 2' --command="/opt/infinity-install/step2/setup.sh --install"
	exit 1
fi

echo "Welcome to the second step"


read -srn1
