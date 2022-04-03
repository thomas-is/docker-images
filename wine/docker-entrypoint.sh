#!/bin/sh

usermod wine -u $USER_ID

# skip MONO install on init
su wine -c "WINEDLLOVERRIDES=\"mscoree=\" wineboot"

# winetricks section
if [ "$WINETRICKS" != "" ] ; then
  su wine -c "winetricks $WINETRICKS"
fi

CMD="$@"
su wine -c "$CMD"
