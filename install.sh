#!/bin/bash

blue='\e[1;38;5;27m'
red='\e[1;38;5;160m'
green='\e[1;38;5;46m'
NC='\e[0m'

clear;
FILE="/tmp/out.$$"
GREP="/bin/grep"
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
	echo -e "${red}Inicia el Script como root para que funcione${NC}";
	sleep 3s;
	clear;
	exit 1;
else

        echo -e "${blue}Vamos a comprobar si tienes conexion para poder instalar todos los modulos:${NC}";
        sleep 5s;
        if netcat -z google.com 80 &>/dev/null; then
                    echo -e "${green}Tienes conexión, iniciando la instalación...${NC}";
                    sleep 3s;

                        echo -e "${blue}Actualizando el sistema...${NC}";
                        apt update
                        apt upgrade -y

                    echo -e "${blue}Instalando theme Arc en el sistema...${NC}";
                    sleep 3s;
                        cd /root
                            apt install autoconf automake pkg-config libgtk-3-dev git gnome-themes-standard gtk2-engines-murrine -y
                            git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme
                            ./autogen.sh --prefix=/usr
                            make install

                    echo -e "${blue}Instalando Iconos Papirus y Paper en el sistema...${NC}";
                    sleep 3s;
                            add-apt-repository ppa:papirus/papirus -y
                            add-apt-repository ppa:snwh/pulp -y
                            apt update
                            apt install papirus-icon-theme paper-icon-theme paper-cursor-theme paper-gtk-theme -y

                    echo -e "${blue}Instalando Theme y Extensiones...${NC}";
                    sleep 3s;
                        cd /root
                            git clone https://github.com/paulvilla/ubugod
                        cd /root/ubugod/modulos/extensions/ && cp * /usr/share/gnome-shell/extensions -R
                        cd /root/ubugod/modulos/theme/ && cp * /usr/share/themes -R
                        cd /root/ubugod/modulos/images/ && cp * /usr/share/backgrounds -R
                        rm /usr/share/gnome-background-properties/gnome-backgrounds.xml
                        cp /root/ubugod/modulos/files/gnome-backgrounds.xml /usr/share/gnome-background-properties -R
                            chmod 755 /usr/share/themes/* -R
                            chmod 755 /usr/share/gnome-shell/extensions/* -R
                            chmod 755 /usr/share/backgrounds/* -R
                            chmod 644 /usr/share/gnome-background-properties/gnome-backgrounds.xml -R

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

                    echo -e "${blue}Instalando Gimp en el sistema...${NC}";
                    sleep 3s;
                            apt install gimp -y

                    echo -e "${blue}Instalando Brackets en el sistema...${NC}";
                    sleep 3s;
                            add-apt-repository ppa:webupd8team/brackets -y
                            apt update
                            apt install brackets -y

                    echo -e "${blue}Instalando Sublime Text 3 en el sistema...${NC}";
                    sleep 3s;
                            apt install sublime-text-installer -y

                    echo -e "${blue}Instalando Calibre eBook en el sistema...${NC}";
                    sleep 3s;
                            sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

                    echo "${blue}Instalando herramientas de Pentesting...${NC}";
                    sleep 3s;
                            apt install subversion -y
                            apt install build-essential libssl-dev libnl-3-dev sqlite3 libsqlite3-dev libnl-genl-3-dev libpcap-dev g++ dpkg-config -y
                            #apt install aircrack-ng reaver -y
                        #cd /root/ubugod/modulos/pentesting/aircrack-ng-1.2-rc4/
                            #make sqlite=true experimental=true ext_scripts=true
                            #make sqlite=true experimental=true ext_scripts=true install
                            #airodump-ng-oui-update
                        #cd scripts/airoscript-ng
                            #make
                        #cd ../airgraph-ng
                            #make install
                        #cd ../airdrop-ng
                            #make install        
                        #cd /root/ubugod/modulos/pentesting/reaver-1.4
                            #make
                            #make install
                        #cd /root/ubugod
                            #git clone https://github.com/t6x/reaver-wps-fork-t6x && cd reaver-wps-fork-t6x/src/
                            #./configure
                            #make
                            #make install    

                    echo -e "${blue}Instalando Steam en el sistema...${NC}";
                    sleep 3s;
                        cd /root/ubugod
                            wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
                            dpkg -i steam.deb -y
                            apt install -f
                            dpkg -i steam.deb -y

                    echo -e "${blue}Instalando Playonlinux en el sistema...${NC}";
                    sleep 3s;
                            apt install playonlinux -y


                    echo -e "${blue}Actualizando el sistema...${NC}";
                    sleep 3s;
                            apt update
                            apt upgrade -y
                            apt autoremove -y
                            cd /root
                            rm ubugod -R && rm arc-theme -R && rm linux-installer.py
        else
            echo -e "${red}No tienes conexión para instalar correctamente los modulos${NC}";
            sleep 3s;

            echo -e "${blue}Cerrando Script automaticamante${NC}";
            sleep 3s;
        clear;
        fi
fi
