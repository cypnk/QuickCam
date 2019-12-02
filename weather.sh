#!/bin/sh

# This is a small helper script to grab the current weather from wttr.in
# This can be added to cron to run once an hour, which should be enough

# Pick your city and format (wttr currently supports 1 - 4)
URL=https://wttr.in/~New+York?format=1

# Store file. This should be the same as in webcam.sh if you're using it there
OUT=/tmp/weather.report

# Create temp file to store weather
TMP=`mktemp -t weather.XXXXXXX` || exit 1

# This syntax is for OpenBSD
ftp -o $TMP $URL || rm $TMP && exit
# On linux:
#  wget -O $TMP $URL || rm $TMP && exit

mv $TMP $OUT

exit

