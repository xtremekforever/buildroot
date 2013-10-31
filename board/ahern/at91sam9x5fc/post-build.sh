#!/bin/bash

FC_DIR="board/ahern/at91sam9x5fc"
LINUX_DIR="output/build/linux-custom"

echo -n "Copying Ahern Pump driver..."
cp $LINUX_DIR/drivers/misc/ahern_pump.ko $1/root
if [ $? = 0 ]; then
	echo "Done."
else
  echo "Failed."
fi

echo -n "Copying Ahern FC initialization script..."
cp $FC_DIR/S60ahern $1/etc/init.d/
chmod 755 $1/etc/init.d/S60ahern
if [ $? = 0 ]; then
	echo "Done."
else
  echo "Failed."
fi

echo -n "Copying default interfaces file..."
cp -f $FC_DIR/interfaces $1/etc/network
if [ $? = 0 ]; then
	echo "Done."
else
  echo "Failed."
fi

