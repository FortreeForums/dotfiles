#   ·▄▄▄▄•.▄▄ ·  ▄ .▄▄▄▄   ▄▄· 
#   ▪▀·.█▌▐█ ▀. ██▪▐█▀▄ █·▐█ ▌▪
#   ▄█▀▀▀•▄▀▀▀█▄██▀▐█▐▀▀▄ ██ ▄▄
#   █▌▪▄█▀▐█▄▪▐███▌▐▀▐█•█▌▐███▌
# ▀ ·▀▀▀ • ▀▀▀▀ ▀▀▀ ·.▀  ▀·▀▀▀ 

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/shane/.zshrc'

autoload -Uz compinit
compinit
unsetopt BG_NICE
# End of lines added by compinstall

## autostart {{{
cd ~
## }}}

## environment && sources {{{
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pure"
plugins=(git)
export PATH=$HOME/bin:/usr/local/bin:$PATH
export XENVIRONMENT="${HOME}/.Xresources"
export DISABLE_AUTO_TITLE="true"
export DISPLAY=:0
export PULSE_SERVER=tcp:localhost

autoload -Uz promptinit
promptinit

typeset -ga sources
source ${HOME}/.config/zsh/prompt.zsh
source ${HOME}/.config/zsh/functions.zsh
## }}}

## alias {{{
alias clone="git clone"
alias video="/mnt/c/MPV/mpv.exe --force-window=immediate --really-quiet --geometry=860x434+4260-0 --no-keepaspect"
alias lock="~/scripts/lock"
alias cl="~/scripts/clock"
alias vortex="~/scripts/vortex"
alias eircode="echo Your eircode is D05 F6K3"
alias :q="exit"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias yt_update="/mnt/e/backup/.babun/cygwin/bin/youtube-dl.exe -U"
alias nircmd="sudo /mnt/c/Windows/System32/nircmd.exe"
alias lock="/mnt/c/Windows/System32/nircmd.exe savescreenshotfull 'screen.png';$HOME/scripts/lock"
alias btlb="sudo /etc/init.d/bitlbee restart"
alias imgur="~/scripts/imgur"
alias coverart="sacad_r /mnt/f/ 600 front.jpg"
alias sshot="~/scripts/sshot"
alias xrdbrld="sudo xrdb -merge ~/.Xresources;xrdb -load ~/.Xresources"
alias sptfy="spotify >/dev/null 2>&1"
function cheat(){ curl "cheat.sh/$1"; }
alias myip='curl ipinfo.io/ip'
alias plybr="polybar vortex >/dev/null 2>&1"
alias musik="tizonia"
alias collage="~/scripts/collage"
alias hex="~/scripts/hex"
alias clean="~/scripts/clean"
function nplayer() (nc -kluw 1 127.0.0.1 5555 > /tmp/mpd.fifo & trap "kill $!" EXIT; ncmpcpp)
## }}}

source /home/shane/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
