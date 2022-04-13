#!/bin/sh

#addgroup -g $VIDEO_GID video
groupmod -g $VIDEO_GID video
addgroup -g $RENDER_GID render

usermod -a -G video  wine
usermod -a -G render wine
usermod wine -u $USER_ID

# skip MONO install on init
su wine -c "WINEDLLOVERRIDES=\"mscoree=\" wineboot"

# winetricks section
if [ "$WINETRICKS" != "" ] ; then
  su wine -c "winetricks $WINETRICKS"
fi

CMD="$@"
su wine -c "$CMD"
#exec "$@"
