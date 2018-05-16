#!/bin/bash

# upscale & convert gifs to use as a wallpaper
# written by vortex !NOiDx.cCl2
# optional dependencies: feh, mpv

## variables {{
TMP="${HOME}/.cache/pixel"
SRC="$1"
EXT="$2"
## }}

## extract the frames {{
extract() {
  convert -coalesce ${SRC} ./extract_%05d.png
}
## }}

## determine ram size {{
getRAM() {
  ram=$(grep MemTotal /proc/meminfo | \
        awk '{$2=$2/1024**2;} 1 {printf("%.0f %.0f""\n"), $1, $2;}')
  ram="${ram/0 }"
  # store this figure so magnify() doesnt starve the system of ram later
  n=$(echo "${ram}*2.8" | bc | cut -d "." -f1)
}

getRAM
## }}

## get monitor dimensions {{
getDimensions() {
  xy="$(xrandr --current | grep '*' | uniq | awk '{print $1}')"
  WIDTH="${xy}"
}

getDimensions
## }}

## magnify the frames {{
magnify() {
while [ "$(find . -maxdepth 1 -name 'extract*' | wc -l)" -ge 1 ]; do
  for f in "$(find . -maxdepth 1 -name 'extract*' | sort -n | head -${n})"; do
    convert -magnify -magnify $f ./magnify_${num}%04d.png
    # increment $num each run to stop overwriting batch of 50 frames
    num="$(expr $num + 1)"
    rm $f
    sleep 2
  done
done
}
## }}

## resize the frames {{
resize() {
  mogrify -resize "${WIDTH}" ./magnify_*.png
}
## }}

## merge the frames {{
merge() {
  if [[ "${EXT,,}" == "gif" ]]; then
    ffmpeg -pattern_type glob -i '*.png' output.gif
  elif [[ "${EXT,,}" =~ ^(mp4|mkv|avi)$ ]]; then
    ffmpeg -framerate 30 -pattern_type glob -i '*.png' -c:v libx264 -r 30 \
    output.${EXT,,}
  elif [[ "${EXT,,}" == "webm" ]]; then
    ffmpeg -framerate 30 -pattern_type glob -i '*.png' -c:v libvpx-vp9 -crf 30 \
    -b:v 0 output.webm
  fi

  cp output.${EXT,,} ${HOME}
}
## }}

## set output as wallpaper {{
changeWallpaper() {
  if [[ "${EXT,,}" == "gif" ]]; then
    feh --bg-scale ${HOME}/output.gif
  elif [[ "${EXT,,}" =~ ^(mp4|mkv|avi|webm)$ ]]; then
    # https://github.com/MitchWeaver/bin/blob/master/mpvbg
    pkill -9 xwinwrap
    xwin="xwinwrap -ni -b -nf -ov -g ${WIDTH} -- "
    mpv="mpv --wid WID --no-config --keepaspect=no --loop \
         --no-border --vd-lavc-fast --x11-bypass-compositor=no \
         --gapless-audio=yes --vo=xv --hwdec=auto --really-quiet \
         --name=mpvbg --geometry=${WIDTH}+0+0"

    $xwin $mpv "${HOME}/output.${EXT,,}" 2>&1 &
    echo -n $! > ${HOME}/.cache/mpvbg.pid
  fi
}
## }}

## show help dialogue if $1 null {{
while [ $# -eq 0 ]; do
  echo -e "  No argument supplied.
  Example: gifUpscale ./image.gif webm
  -s | --set-wallpaper to set output as background."
  exit
done
## }}

## throw an error kill the script if filetype is unsupported {{
if [[ ! "${EXT}" =~ ^(gif|mp4|mkv|avi|webm)$ ]]; then
  echo -e "Unsupported filetype."
  echo -e "Supported filetypes: gif, mp4, mkv, avi, webm."
  exit
fi
## }}

## check if imagemagick is installed {{
if [ ! -x "$(command -v convert)" ]; then
  while true; do
    echo "ImageMagick is not installed, but required."
    read -rp "Do you want to install ImageMagick now?" IM_YN
      case $IM_YN in
      [yY]* ) sudo pacman -S imagemagick; break;;
      [nN]* ) echo "Chose not to install. Terminating."; exit;;
          * ) echo "Please answer yes or no.";;
      esac
  done
fi
## }}

## create $TMP if it doesnt exist, otherwise empty the folder {{
if [ ! -d ${TMP} ]; then
  mkdir -p ${TMP}
fi
## }}

## now run the script {{
cd ${TMP}

echo -e "Extracting frames..." && extract
echo -e "Magnifying frames (this may take a while)..." && magnify
echo -e "Resizing frames to ${WIDTH}..." && resize
echo -e "Merging frames..." && merge >/dev/null 2>&1
echo -e "Merge finished! The output file is in your ${HOME}."

rm -rf ${TMP}
## }}

## prompt user to set output as wallpaper {{
while [ ! $# -eq 0 ]; do
  case $3 in
    -s|--set-wallpaper) changeWallpaper; exit;;
                     *) exit;;
  esac
done
## }}
