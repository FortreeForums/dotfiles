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

## environment && sources {{{
export ZSH=$HOME/.oh-my-zsh
plugins=(git)
export PATH=$HOME/bin:/usr/local/bin:$PATH
export XENVIRONMENT="${HOME}/.Xresources"
export PULSE_LATENCY_MSEC=60
#export __GL_NextGenCompiler=0
export __GL_THREADED_OPTIMIZATIONS=1
export __GL_SHADER_DISK_CACHE_PATH=$HOME/.local/share/cache
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
source /usr/share/doc/pkgfile/command-not-found.zsh
## }}}

## alias {{{
alias clone="git clone"
alias video="mpv --force-window=immediate --really-quiet --geometry=860x434+4260-0 --no-keepaspect"
alias cl="~/scripts/clock"
alias vortex="~/scripts/vortex"
alias wifipass="echo Your WIFI password is XXX"
alias routerpass="echo Your router login is YYY"
alias eircode="echo Your eircode is ZZZ"
alias :q="exit"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias rm="rm -i"
alias lock="~/scripts/lock"
alias btlb="sudo /etc/init.d/bitlbee restart"
alias imgur="~/scripts/imgur"
alias coverart="sacad_r /mnt/musik/ 600 front.jpg"
alias sshot="notify-send -u critical 'screenshot taken' && scrot -d 3 -c '%Y-%m-%d--%s_$wx$h_scrot.png'"
alias xrdbrld="sudo xrdb -merge ~/.Xresources;xrdb -load ~/.Xresources"
function cheat(){ curl "cheat.sh/$1"; }
alias myip='curl ipinfo.io/ip'
alias plybr="polybar vortex >/dev/null 2>&1"
alias collage="~/scripts/collage"
alias hex="~/scripts/hex"
alias wslcd="cd /mnt/win/Users/Shane/AppData/Local/Packages/CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc/LocalState/rootfs"
## }}}
