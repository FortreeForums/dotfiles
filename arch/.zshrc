#   ·▄▄▄▄•.▄▄ ·  ▄ .▄▄▄▄   ▄▄· 
#   ▪▀·.█▌▐█ ▀. ██▪▐█▀▄ █·▐█ ▌▪
#   ▄█▀▀▀•▄▀▀▀█▄██▀▐█▐▀▀▄ ██ ▄▄
#   █▌▪▄█▀▐█▄▪▐███▌▐▀▐█•█▌▐███▌
# ▀ ·▀▀▀ • ▀▀▀▀ ▀▀▀ ·.▀  ▀·▀▀▀ 

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
autoload -Uz compinit
autoload -Uz add-zsh-hook
compinit
unsetopt BG_NICE

## autostart {{{
cd ~
## }}}

## blur terminal windows {{{
if [[ $(ps --no-header -p $PPID -o comm) =~ urxvt ]]; then
	for wid in $(xdotool search --pid $PPID); do
		xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid
	done
fi
## }}}

## environment && sources {{{
export ZSH=$HOME/.config/oh-my-zsh
plugins=(git)
export PATH=$HOME/bin:/usr/local/bin:$PATH
export XENVIRONMENT="${HOME}/.Xresources"
#export __GL_NextGenCompiler=0
export DISABLE_AUTO_TITLE="true"
export DISPLAY=:0
export EDITOR=vim
export TERM=rxvt-256color
export TERMINAL=urxvt

add-zsh-hook -Uz precmd window_title
add-zsh-hook -Uz precmd prompt_vortex

typeset -ga sources
source ${HOME}/.config/zsh/prompt.zsh
source ${HOME}/.config/zsh/functions.zsh
source ${HOME}/.config/zsh/games.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/doc/pkgfile/command-not-found.zsh
source ${HOME}/scripts/colorgen/colors
## }}}

## alias {{{
alias clone="git clone"
alias video="mpv --force-window=immediate --really-quiet --geometry=903x455+4260-0 --no-keepaspect"
alias cl="~/scripts/clock"
alias vortex="~/scripts/vortex"
alias apathy="~/scripts/apathy"
alias :q="exit"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias rm="rm -i"
alias rmrf="rm -rf -i"
alias lock="~/scripts/lock"
alias imgur="~/scripts/imgur"
alias coverart="sacad_r /mnt/musik/ 600 front.jpg"
alias sshot="notify-send -u critical 'screenshot taken' && scrot -d 3 -c '%Y-%m-%d--%s_$wx$h_scrot.png'"
alias xrdbrld="sudo xrdb -merge ~/.Xresources;xrdb -load ~/.Xresources"
function cheat(){ curl "cheat.sh/$1"; }
alias myip='curl ipinfo.io/ip'
alias collage="~/scripts/collage"
alias hex="~/scripts/hex"
alias uDXVK="~/scripts/uDXVK /home/shane/.config/dxvk $1"
alias dline="/home/shane/.local/bin/dline"
alias pkgcache="sudo pacman -rk 2"
alias OpenRGB="sudo /home/shane/scripts/RGB/OpenRGB/openrgb"
alias make="make -j24"
alias amdgpu-oc="sudo /home/shane/scripts/overclocking/amdgpu-oc"
alias ls="ls --color=always"
alias monitor_oc="/home/shane/scripts/overclocking/monitor_oc"
alias zeninfo="sudo /home/shane/scripts/overclocking/ryzen_smu/userspace/monitor_cpu -f"
alias launch_ns2_server="/home/ns2/server/launch_server"
## }}}
