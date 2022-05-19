#!/bin/bash

groupmod -g $VIDEO_GID video
groupmod -g $AUDIO_GID audio

usermod -a -G video  wine
usermod -a -G audio  wine
usermod wine -u $USER_ID

## skip MONO install on init
#su wine -c "WINEDLLOVERRIDES=\"mscoree=\" wineboot"

su wine -c "wineboot"

# winetricks section
if [ "$WINETRICKS" != "" ] ; then
  su wine -c "winetricks $WINETRICKS"
fi

CMD="$@"
su wine -c "$CMD"
#exec "$@"
