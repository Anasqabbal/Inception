#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
        mkdir -p ~/data
        mkdir -p ~/data/mariadb
        mkdir -p ~/data/wordpress
		chmod 777 ~/data/mariadb
		chmod 777 ~/data/wordpress
fi
