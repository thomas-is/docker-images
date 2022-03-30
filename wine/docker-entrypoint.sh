#!/bin/sh

usermod wine -u $USER_ID
su wine -c "/usr/local/bin/winetricks d3dx9"
su wine -c "/usr/local/bin/winetricks d3dx9_41"
CMD="$@"
#su wine -c "$CMD"
exec $CMD
