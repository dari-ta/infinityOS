## Config the themes

SPATH="/opt/infinity-install/themes/"
TPATH="/usr/share/themes/"

echo " >> copy themes"
mkdir -p $TPATH/
cp -R $SPATH/* $TPATH/

