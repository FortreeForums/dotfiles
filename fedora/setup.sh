#!/bin/bash

## TODO
## 
## dock and activity config extensions wont install (no make target 'install')
##

## variables {{
getOS="$(cat /etc/*-release | grep 'PRETTY_NAME' | cut -d '=' -f2)"
getUser="$(ls /home)"
icons="https://transfer.sh/g2a4A/Icons.tar.xz"
gnomeTheme="https://github.com/paullinuxthemer/Mc-OS-themes.git"
## }}

## functions {{
installGnome() {
while [[ ! -f "/usr/share/gnome/gnome-version.xml" ]]; do
  case $getOS in
    *Fedora*                   ) dnf groupinstall gnome; break;;
    *Arch*|*Manjaro*|*Antergos*) pacman -S gnome gnome-extra; break;;
    *Debian*|*Ubuntu*          ) apt-get install gnome-session gdm3; break;;
  esac
done

if [[ -d ${HOME}/gnomeBuild ]]; then
  rm -rf "${HOME}/gnomeBuild"
fi

mkdir ${HOME}/gnomeBuild && cd ${HOME}/gnomeBuild

# install blur
git clone https://github.com/yozoon/gnome-shell-extension-blyr.git
cd gnome-shell-extension-blyr/
sudo chown ${getUser} ./*;sudo chmod +x ./*
make local-install
cd ${HOME}/gnomeBuild

# install activity config
git clone https://github.com/mattdm/activities-config.git
cd activities-config
sudo chown ${getUser} ./*;sudo chmod +x ./*
make install
cd ${HOME}/gnomeBuild

wget https://transfer.sh/eyHLz/MacOS.tar.xz
tar xf ./MacOS.tar.xz && cd MacOS
mkdir Dash.to.DOCK && cd Dash.to.DOCK
tar xf ../OSX.for.Dash.to.DOCK.tar.xz
cd ${HOME}/gnomeBuild

# install dock
git clone https://github.com/passingthru67/workspaces-to-dock.git
cd workspaces-to-dock
sudo chown ${getUser} ./*;sudo chmod +x ./*
make install

gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style DEFAULT
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode DEFAULT
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
cd ${HOME}/gnomeBuild

# install font
rm ./"FONT/INSTALL!"
cp ./FONT/* /usr/share/fonts
cp -r ./"3.30/Majove" ${HOME}/.themes/
}

installIcons() {
if [[ ! -d "${HOME}/.icons" ]]; then
  mkdir ${HOME}/.icons
fi

if [[ ! -d "${HOME}/.icons/MacOS" ]]; then
  cd ${HOME}/.icons
  mkdir MacOS && cd MacOS
  wget ${icons}
  tar xf ./Icons.tar.xz
fi
}

## check if user is root {{
if [[ "$EUID" -ne 0 ]]; then
  echo "You must run as root."
  exit
fi
## }}

## execute functions and perform the setup {{
installIcons || exit 1
installGnome || exit 1
exit
## }}
