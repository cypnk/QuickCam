#!/bin/sh

# This is a small helper script to grab the current weather from wttr.in
# This can be added to cron to run once an hour, which should be enough

# Pick your city and format (wttr currently supports 1 - 4)
URL=https://wttr.in/~New+York?format=1

# Optionally, you can use ?format=%C+%t to get the weather condtion and temps
# E.G. "Sunny +39F"
# Read more about formats on the wttr project: https://github.com/chubin/wttr.in

# Store file. This should be the same as in webcam.sh if you're using it there
OUT=/tmp/weather.report

# Create temp file to store weather
TMP=`mktemp -t weather.XXXXXXX` || exit 1

# This syntax is for OpenBSD
ftp -o $TMP $URL || rm $TMP
# On linux:
#  wget -O $TMP $URL || rm $TMP

if [ -f $TMP ]; then
	# Check for gateway timeout and other errors
	if grep -q -i "504\|format\|location\|error\|found" $TMP; then
		rm $TMP && exit
	fi
	
	# If downloaded report isn't empty
	if [ -s $TMP ]; then
		mv $TMP $OUT
	else
		rm $TMP
	fi
fi

exit 0

