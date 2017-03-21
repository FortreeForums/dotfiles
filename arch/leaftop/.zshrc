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
# End of lines added by compinstall

## environment && sources {{{
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pure"
plugins=(git)
export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG="en_IE.UTF-8"
export LC_CTYPE="en_IE.UTF-8"
export XENVIRONMENT="${HOME}/.Xresources"
export DISABLE_AUTO_TITLE="true"

autoload -Uz promptinit
promptinit

typeset -ga sources
source ${HOME}/.config/zsh/prompt.zsh

alias clone="git clone"
alias gz="tar -xzvf"
alias bz="tar jxf"
alias video="mpv --force-window=immediate --keep-open --really-quiet --geometry=664x400+3167-7 --no-keepaspect"
alias dump="journalctl --since=today"
alias lock="~/scripts/lock"
alias cl="tty-clock -c -C 1"
alias vortex="~/scripts/vortex"
alias clean="sudo pacman -Rns $(pacman -Qqtd)"

while true; do
	~/scripts/reddit_mail
	sleep 120
done &

source /home/shane/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
