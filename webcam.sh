#!/bin/sh

# Webcam capture
# This is a small script I use to capture a webcam photo from my OpenBSD desktop
# This requires ffmpeg to be installed

# Helpful resources:
# https://hhsprings.bitbucket.io/docs/programming/examples/ffmpeg/drawing_texts/drawtext.html
# https://stackoverflow.com/questions/6704170/ffmpeg-command-to-add-text-to-a-image

#### Text settings:

# Date string
PUB=`date "+%a, %d %b %Y %H\:%M\:%S"`

# Optional weather report file
WEA="/tmp/weather.report"

# If weather report exists, add it
if [ -f $WEA ]; then
	# Clean text (ffmpeg doesn't handle things like emoji well) and trim spaces
	RPT="$(head -n 1 $WEA | tr -cd '\000-\177' | awk '{$1=$1};1') | "
else
	RPT=""
fi

# Titles and other stuff
STR="Rustic Cyberpunk | $PUB | ${RPT}kpz62k4pnyh5g5t2efecabkywt2aiwcnqylthqyywilqgxeiipen5xid.onion"

# Weather can be generated from some place like wttr.in
# E.G. On OpenBSD :
# ftp -o /tmp/weather.report https://wttr.in/?format=3
# Please don't abuse the wttr service. Limit updates to maybe once an hour or longer

#### Capture settings:

# Temp capture file
CAP="/tmp/capture.jpg"

# Webcam output
OUT="/path/to/web/capture.jpg"

#Thumbnail
THB="/path/to/web/capture-tn.jpg"

# Thumbnail x-axis size (the y-axis will be scaled automatically)
TNX=640

# Font file
FNT="/path/to/your-font.ttf"

# On OpenBSD there's a bunch to choose from in: /usr/X11R6/lib/X11/fonts/

#### Text settings:

# Font size
FSZ=12

# Font color
FCL="orange"

# X-Position (from the left)
XTX=30

# Y-Position (from the top)
YTX=680

# Alpha transparency (between 0 and 1)
ALP=0.7


#### Text background settings:

# Background color
BG="black"

# Text border color
BC="black"

# Text border size
BR=8

# Font border size (text stroke)
FB=3

# Line spacing (vertical)
LS=40


#### Putting it all together

# Parameters used from above
BOX="box=1:boxcolor=$BG:boxborderw=$BR:borderw=$FB:bordercolor=$BC:line_spacing=$LS"
PAR="fontfile=$FNT:fontcolor=$FCL:fontsize=$FSZ:x=$XTX:y=$YXT:alpha=$ALP:$BOX"


# Take a photo at full default size
ffmpeg -v quiet -f video4linux2 -i /dev/video0 -vframes:v 1 -y $CAP

# Apply text
ffmpeg -v quiet -i $CAP -y -vf "drawtext=expansion=none:$PARtext='$STR'" $OUT

# Create thumbnail
ffmpeg -v quiet -i $OUT -y -vf scale=$TNX:-1 $THB

# Done
exit



