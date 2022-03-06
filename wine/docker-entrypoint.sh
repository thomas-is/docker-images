#!/bin/sh

usermod wine -u $USER_ID
CMD="$@"
su wine -c "$CMD"
