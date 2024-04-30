#!/usr/bin/env bash

FILE_TO_MONITOR="/root/king.txt"
TEXT_TO_INSERT="CageyDinosaur"

sudo apt update
sudo apt install inotify-tools -y

touch $FILE_TO_MONITOR

echo -e $TEXT_TO_INSERT > $FILE_TO_MONITOR
while inotifywait -e modify $FILE_TO_MONITOR; do
    echo -e $TEXT_TO_INSERT > $FILE_TO_MONITOR
done
