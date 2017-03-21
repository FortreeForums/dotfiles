## eviornment & sources {{{
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pure"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export DISPLAY=:0
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export XENVIRONMENT="${HOME}/.Xresources"
export DISABLE_AUTO_TITLE="true"
PATH="/home/Shane/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/Shane/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/Shane/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/Shane/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/Shane/perl5"; export PERL_MM_OPT;
#PYTHONPATH="/usr/lib/python3.4"; export PYTHONPATH;

typeset -ga sources
source ${HOME}/.config/zsh/prompt.zsh
source ${HOME}/.config/zsh/functions.zsh
## }}}

## startup {{{
echo -e "${white}";toilet -f pagga --metal "welcome to amala";
mpd ${HOME}/.mpd/mpd.conf && mpdscribble && mpdnotify
${HOME}/scripts/wthr&
while true; do
	${HOME}/scripts/reddit_mail
	sleep 120
done &
## }}}

## nofetch alias {{{
alias ubuntu="neofetch --ascii_distro ubuntu"
alias osx="neofetch --ascii_distro mac"
alias gentoo="neofetch --ascii_distro gentoo"
alias arch="neofetch --ascii_distro arch"
alias windows="neofetch --disk_display bar --ascii_colors 6 1 2 4"
alias fetch="neofetch --color_blocks off --ascii_colors 6 1 2 4"
alias cmdfetch='lua /bin/cmdfetch.lua -c 9,10,11,14 -1'
## }}}

## toilet alias {{{
alias tripcode="toilet --metal -f mono9 !NOiDx.cCl2 --termwidth"
alias tcrust="toilet --metal -f rusto !NOiDx.cCl2 --termwidth"
alias future="toilet -f future"
alias mono9="toilet -f mono9"
alias emboss="toilet -f emboss"
alias pagga="toilet -f pagga"
alias 3D="toilet -f 3d"
## }}}

## music alias {{{
alias deep07="mpsyt play deep07"
alias dive="https://www.youtube.com/watch?v=Z6ih1aKeETk"
alias favorites="mpsyt pl PLmeGKK6zQAAukha1uuaCfq5CUPDNmgeq2"
alias rmflac="rm -rf ./*.flac"
## }}}

## extract {{{
alias gz="tar -xvzf"
alias xz="tar -xJf"
##}}}

## misc {{{
alias clone="git clone"
alias make="make -j4"
alias 2spooky="lua /usr/bin/2spooky.lua"
alias watch="mpv --really-quiet --border=no --force-window=immediate --keep-open --geometry=653x400+3187+680 --no-keepaspect --video-sync=display-resample --vo=opengl --profile=opengl-hq --scale=ewa_lanczossharp --cscale=ewa_lanczossharp"
alias cyg-update="${HOME}/setup.exe --no-desktop --no-shortcuts --no-startmenu --quiet-mode --upgrade-also"
alias screenshot="${HOME}/scripts/shot"
alias re="${HOME}/scripts/vidSort -d"
alias del="rm -rf"
alias cl="tty-clock -c -t -C 1"
alias tkill="taskkill /IM"
## }}}

## syntax highlight {{{
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## }}}
