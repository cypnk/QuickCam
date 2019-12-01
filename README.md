# QuickCam
Quick snippets to capture a webcam image

These are standalone shell scripts which can be added to cron:
* **webcam.sh** Capture an image using ffmpeg and your webcam. Ideally set to run every 3-10 minutes. Can also display the weather, if given.
* **weather.sh** (optional) Gets the current weather/temps for your location from [wttr.in](https://wttr.in). Can be used by *webcam.sh*. Hourly cron interval recommended.

This is an example webcam page:
* **cam.html** Display page for captured webcam image.
* **cam.css** Very basic stylesheet used by *cam.html*.
* **cam.js** Auto-refresh JavaScript used by *cam.html*. Should be adjusted to the same cron interval as *webcam.sh* (in milliseconds).

Extras (in progress)
* **index.html** Capturing an image via the browser
* **main.js** Used by *index.html*

