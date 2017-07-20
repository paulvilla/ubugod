#!/bin/bash

blue='\e[1;38;5;27m'
red='\e[1;38;5;160m'
green='\e[1;38;5;46m'
NC='\e[0m'

clear;

if [[ $UID != 0 ]];
then
	echo -e "${red}Inicia el Script como root (sudo ...) para que funcione correctamente${NC}";
	sleep 3s;
	clear;
	exit 1;
fi

echo -e "${blue}Vamos a comprobar si tienes conexion para poder instalar todos los modulos:${NC}";
sleep 5s;

if netcat -z google.com 80 &>/dev/null;
then
	echo -e "${green}Tienes conexión, iniciando la instalación...${NC}";
	sleep 3s;
  
        echo -e "${blue}Actualizando el sistema...${NC}";
        apt update
        apt upgrade -y

        echo -e "${blue}Instalando theme Arc en el sistema...${NC}";
	sleep 3s;
        cd /root
        mkdir ubugod
        cd ubugod
            apt install autoconf automake pkg-config libgtk-3-dev git gnome-themes-standard gtk2-engines-murrine -y
            git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme
            ./autogen.sh --prefix=/usr
            make install
        cd ..

        echo -e "${blue}Instalando Iconos Papirus y Paper en el sistema...${NC}";
	sleep 3s;
            add-apt-repository ppa:papirus/papirus -y
            add-apt-repository ppa:snwh/pulp -y
            apt update
            apt install papirus-icon-theme paper-icon-theme paper-cursor-theme paper-gtk-theme -y

        echo -e "${blue}Instalando Theme y Extensiones...${NC}";
	sleep 3s;
        cd /root
            git clone https://github.com/paulvilla/ubugod && cd ubugod/
        cd modulos/extensions/
        cp * /usr/share/gnome-shell/extensions/ -R
        cd ../theme/ -R
        cp Ubugod /usr/share/themes/
            chmod 755 /usr/share/themes/ -R
            chmod 755 /usr/share/gnome-shell/extensions/ -R

        echo -e "${blue}Actualizando el sistema...${NC}";
	sleep 3s;
            apt update
            apt upgrade -y

        echo -e "${blue}Instalando Chromium en el sistema...${NC}";
	sleep 3s;
            apt install chromium-browser -y

        echo -e "${blue}Instalando Vlc en el sistema...${NC}";
	sleep 3s;
            add-apt-repository ppa:videolan/master-daily -y
            apt update
            apt install vlc -y
	
        echo "${blue}Instalando herramientas de Pentesting...${NC}";
    sleep 3s;
            apt install subversion
            apt install build-essential libssl-dev libnl-3-dev sqlite3 libsqlite3-dev libnl-genl-3-dev libpcap-dev -y
        cd /root/ubugod/modulos/pentesting/aircrack-ng-1.2-rc4/
            make
            make install
            make sqlite=true
            make sqlite=true install
            airodump-ng-oui-update
        cd scripts/airoscript-ng
            make
        cd ../airgraph-ng
            make install
        cd ../airdrop-ng
            make install        
        cd /root/ubugod/modulos/pentesting/reaver-1.4
            make
            make install
        cd /root/ubugod
            git clone https://github.com/t6x/reaver-wps-fork-t6x && cd reaver-wps-fork-t6x/src/
            ./configure
            make
            make install    
	
        echo -e "${blue}Instalando Steam en el sistema...${NC}";
	sleep 3s;
        cd /root/ubugod
            wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
            dpkg -i steam.deb -y
            apt install -f
            dpkg -i steam.deb -y

        echo -e "${blue}Instalando Gimp en el sistema...${NC}";
	sleep 3s;
            apt install gimp -y
            
        echo -e "${blue}Instalando Brackets en el sistema...${NC}";
	sleep 3s;
        cd /root/ubugod/modulos/librerias/
            dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb -y
            wget https://github.com/adobe/brackets/releases/download/release-1.10/Brackets.Release.1.10.64-bit.deb
            dpkg -i Brackets.Release*.deb -y
            
        echo -e "${blue}Instalando Playonlinux en el sistema...${NC}";
	sleep 3s;
            apt install playonlinux -y


        echo -e "${blue}Actualizando el sistema...${NC}";
	sleep 3s;
            apt update
            apt upgrade -y
            apt autoremove -y
            #cd /root
            #rm ubugod -R
else
        echo -e "${red}No tienes conexión para instalar correctamente los modulos${NC}";
	sleep 3s;

        echo -e "${blue}Cerrando Script automaticamante${NC}";
    sleep 3s;
clear;
fi
