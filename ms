#!/bin/bash
wget -nc https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-i386.tar.xz &> /dev/null
tar --skip-old-files -xvf tmate-2.4.0-static-linux-i386.tar.xz &> /dev/null
SOCKET="/tmp/tmate.sock"
if [ -e "$SOCKET" ]; then
  rm -f "$SOCKET"
fi
rm -f nohup.out; bash -ic 'nohup ./tmate-2.4.0-static-linux-i386/tmate -S "$SOCKET" new-session -d & disown -a' >/dev/null 2>&1
./tmate-2.4.0-static-linux-i386/tmate -S "$SOCKET" wait tmate-ready
./tmate-2.4.0-static-linux-i386/tmate -S "$SOCKET" display -p "#{tmate_ssh}"
sleep infinity
