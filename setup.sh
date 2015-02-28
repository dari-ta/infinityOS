if ! [[ $1 = '--install' ]]; then
	echo $1
	echo 'Usage: setup.sh --install'
	echo 'You will need root privileges'
	exit 1
fi

echo 'Welcome to'
echo '       __________       ___________         '
echo '      / ________ \     / _________ \        '
echo '     //          \\   //           \\       '
echo '    //            \\ //             \\      '
echo '    ||             |||              ||      '
echo '    \\            // \\             //      '
echo '     \\ _________//   \\ _________ //       '
echo '      \__________/     \___________/        '
echo '                                            '
echo '                 infinity                   '
echo ''
echo ' Press `c` and ENTER to continue            '
echo ' Press only ENTER to abort'
echo ''

read -p " > " _answer

if ! [[ $_answer = 'c' ]]; then
	exit 1
fi

# Copy all infinity installer files to /opt/infinity-install
mkdir -p /opt/infinity-install
cp -R install/* /opt/infinity-install
mkdir -p /opt/infinity-install/configs
cp -R configs/* /opt/infinity-install/configs

# invoke the first install step
/opt/infinity-install/step1/setup.sh
