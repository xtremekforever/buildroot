#!/bin/bash

FC_DIR="board/ahern/at91sam9x5fc"
BIN_DIR="../ahern-fc/build-arm"
LINUX_DIR="../linux"

echo "Copying Ahern FC files..."

echo -n "/etc/init.d/S30network_pre: " 
cp $FC_DIR/S30network_pre $1/etc/init.d/
chmod 755 $1/etc/init.d/S30network_pre
if [ $? = 0 ]; then
	echo "Done."
else
  echo "Failed."
fi

echo -n "/etc/init.d/S60ahern: "
cp $FC_DIR/S60ahern $1/etc/init.d/
chmod 755 $1/etc/init.d/S60ahern
if [ $? = 0 ]; then
	echo "Done."
else
  echo "Failed."
fi

echo -n "/root/network-setup: " 
cp $FC_DIR/network-setup $1/root
chmod 755 $1/root/network-setup
if [ $? = 0 ]; then
	echo "Done."
else
  echo "Failed."
fi

echo -n "/root/ahern_pump.ko: "
cp $LINUX_DIR/drivers/misc/ahern_pump.ko $1/root
if [ $? = 0 ]; then
	echo "Done."
else
  echo "Failed."
fi

echo -n "/root/ahern-fc: "
cp $BIN_DIR/ahern-fc $1/root
chmod 755 $1/root/ahern-fc
if [ $? = 0 ]; then
	echo "Done."
else
  echo "Failed."
fi
