#!/bin/sh


cat << EOF > /home/root
set username "thomas.alexandre"
set hostname "no.invalid"
set realname "Thomas Alexandre"
visible_headers "From:,Newsgroups:,Followup-To:,Date:,Subject:"
set sorting_method 9
EOF

exec "$@"
