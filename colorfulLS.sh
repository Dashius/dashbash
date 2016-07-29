#!/bin/bash

ls -l | while read LINE; do
	echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m $LINE"
done
echo -e "\e[0;34m\e[m "

