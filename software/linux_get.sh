#!/bin/bash
VERSION="1.8.5"
cat << "EOF"
" .--.             .-.    .--.  .--. 
: .; :           .' `.  : .; :: .; :
:    :,-.,-. .--.`. .'  :    :`.  .'
: :: :: ,. :' '_.': :   : :: :: .; :
:_;:_;:_;:_;`.__.':_;   :_;:_;`.__.'
EOF

read -p "Enter Your Device's Architecture (32/64): "  ARCHITECTURE

LINK="https://downloads.arduino.cc/arduino-"$VERSION"-linux"$ARCHITECTURE".tar.xz"

echo "Downloading Arduino IDE..."
wget "$LINK"

echo "Downloading Anet Hardware Support..."
wget https://github.com/SkyNet3D/anet-board/archive/master.zip;

NAME=arduino-$VERSION-linux$ARCHITECTURE

echo "Extracting files..."
tar xf $NAME.tar.xz
unzip master.zip

echo "Install Anet Support on Arduino IDE..."
cp -rf anet-board-master/hardware/anet/ arduino-$VERSION/hardware/anet/

echo "Cleaning..."
rm $NAME.tar.xz
rm -rf anet-board-master
rm master.zip

echo "Starting Arduino IDE..."
./arduino-$VERSION/arduino

echo -e "\033[1m./arduino-$VERSION/arduino in terminal to start Arduino IDE"

cat << "EOF"

.-----..-.                .-.                         .-.
`-. .-': :                : :.-.                      : :
  : :  : `-.  .--.  ,-.,-.: `'.'  .-..-. .--. .-..-.  : :
  : :  : .. :' .; ; : ,. :: . `.  : :; :' .; :: :; :  :_;
  :_;  :_;:_;`.__,_;:_;:_;:_;:_;  `._. ;`.__.'`.__.'  :_;
                                   .-. :                 
                                   `._.'    
EOF