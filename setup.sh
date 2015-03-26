copyFiles(){
	# Copy all infinity installer files to /opt/infinity-install
	mkdir -p /opt/infinity-install
	cp -R install/* /opt/infinity-install
	mkdir -p /opt/infinity-install/configs
	cp -R configs/* /opt/infinity-install/configs
	mkdir -p /opt/infinity-install/themes
	cp -R themes/* /opt/infinity-install/themes

	# Create the log files and make them available
	touch /opt/infinity-install/install.log
	chmod a+rw /opt/infinity-install/install.log
}
startInstall(){
	# invoke the first install step
	/opt/infinity-install/step1/setup.sh
}

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
echo ' Type `i` to install infinity'
echo ' Type `c` to copy install files'
echo ' Press only ENTER to abort'
echo ''

read -p " > " _answer

if [[ $_answer = 'c' ]]; then
	# Only copy the install files
	copyFiles
elif [[ $_answer = 'i' ]]; then
	# Copy the files and install
	copyFiles
	startInstall
fi

if ! [[ $_answer = 'c' ]]; then
	exit 1
fi



