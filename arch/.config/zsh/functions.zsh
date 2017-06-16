## WIKIPEDIA SEARCH FUNCTION ##
wikiSearch() {
echo -n -e "\n============================================\n\tWelcome to WikiPedia Search"; echo ""; i=1 ; for line in $(lynx --dump "http://en.wikipedia.org/w/index.php?title=Special%3ASearch&profile=default&search=$1&fulltext=Search" | grep http://en.wikipedia.org/wiki | cut -c7-); do echo $i $line; lines[$i]=$line ;  i=$(($i+1)); done ; echo -n -e "\n============================================\n\tPlease select the link to open - "; read answer; w3m ${lines[$answer]}
}

## ARCHWIKI SEARCH FUNCTION ##
archSearch() {
echo -n -e "\n============================================\n\tWelcome to Arch Wiki Search"; echo ""; i=1 ; for line in $(lynx --dump "https://wiki.archlinux.org/index.php?title=Special%3ASearch&profile=default&search=$1" | grep https://wiki.archlinux.org/ | cut -c7-); do echo $i $line; lines[$i]=$line ; i=$(($i+1)); done ; echo -n -e "\n============================================\n\tPlease select the link to open - "; read answer; w3m ${lines[$answer]}
}

## EXTRACT FUNCTION ## | Usage: extract <file>
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# mkdir & cd into it | Usage: mkcd
mkcd() {
  if [ ! -n "$1" ]; then
    echo "Enter a name for this folder"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

# Google images search bash function  | Usage: images <foo>
images() {
    search=""
    for term in $*; do
        search="$search%20$term"
    done
    xdg-open "http://www.google.co.uk/search?tbm=isch&hl=en&source=hp&biw=1366&bih=679&q=$search"
}

# YouTube search bash function  | Usage: videos <foo>
videos() {
    search=""
    for term in $*; do
        search="$search%20$term"
    done
    xdg-open "http://www.youtube.com/results?search_query=$search"
}

# DuckDuckGo search bash function  | Usage: ddg <foo>
ddg() {
    search=""
    for term in $*; do
        search="$search%20$term"
    done
    xdg-open "http://duckduckgo.com/?q=$search"
}

# Soundcloud music bash search function  | Usage: soundcloud <foo>
soundcloud() {
    search=""
    for term in $*; do
        search="$search%20$term"
    done
    xdg-open "https://soundcloud.com/search?q=$search"
}

# Dictionary | Usage define <foo>
define() {
    curl -s dict://dict.org/d:$1 | grep -v '^[0-9]'
}

#Upload-file | Usage : share /path/to/file.foo
share() {
  curl -F"file=@$*" https://0x0.st
}

# Pastebin upload
pst() {
	curl -F c=@- https://ptpb.pw < $1
}
