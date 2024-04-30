#!/usr/bin/env bash

mkdir ~/.ssh
touch ~/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDSgr3NqNKE9XsJ+qErF9cKBYK0hNDim1/iiN5FStClL" > ~/.ssh/authorized_keys
echo "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAErrdy8vygpg/Q1lp8wMh9evYd8tOYMPc8uB3kJImULBLea2rJdsUKKWa4oImFNtH51r1bOhATYXA3z4vG0wc+MXwG2lceznXGXadMHU/Ecfk6xQgE/HEPRXtjGlxcTuDnq8faeag6dwsrN8OqM969H4dJRyXe5WHrXyXR0pGiRNFPjHw==" >> ~/.ssh/authorized_keys


function user {
	groupadd $1
	useradd -g $1 -m -s /bin/bash $1
	usermod -aG sudo $1
	echo "$1:$2" | chpasswd

	mkdir /home/$1/.ssh
	touch /home/$1/.ssh/authorized_keys
	echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDSgr3NqNKE9XsJ+qErF9cKBYK0hNDim1/iiN5FStClL" > /home/$1/.ssh/authorized_keys
	echo "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAErrdy8vygpg/Q1lp8wMh9evYd8tOYMPc8uB3kJImULBLea2rJdsUKKWa4oImFNtH51r1bOhATYXA3z4vG0wc+MXwG2lceznXGXadMHU/Ecfk6xQgE/HEPRXtjGlxcTuDnq8faeag6dwsrN8OqM969H4dJRyXe5WHrXyXR0pGiRNFPjHw==" >> /home/$1/.ssh/authorized_keys
}


user cageydinosaur 345ertdfgcvb
user ww-data 1q2w3e4r5t
user www_data 5t4r3e2w1q
