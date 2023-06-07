#!/bin/bash

set -xe

URL=$(xsel -b)
[ $URL =="" ] && URL=$(xsel)

grep -qE "^https?://(www\.)?(m\.|music\.)?youtube\.com/" <<< "$URL" && SITE="youtube"
grep -q 'yewtu\.be' <<< "$URL" &&  SITE="yewtu"
grep -q 'youtu\.be' <<< "$URL" &&  SITE="youtube"
grep -q 'rumble' <<<    "$URL" &&  SITE="rumble"

[[ $SITE == 'yewtu' ]] && URL=$(xsel | sed 's/yewtu\.be/youtube\.com/')


notify-send "$SITE"
# notify-send "$URL"
# grep -q 'latest_version?id=' <<< "$URL" && URL=$(sed 's/latest_version/v\/1QOiU-zOTc8/' <<< "$URL") 

case "$SITE" in 
  "youtube"|"yewtu")
    QUALITY=$(printf "1080p\n720p\n2k\n4k\n" | dmenu  -fn 'mono-16' -p "Select Quality: ")
      case "$QUALITY" in
            1080p)

              mpv --ytdl-format="bestvideo[height<=1080]+bestaudio"    "$URL" ;;

            720p)

              mpv --ytdl-format="bestvideo[height<=720]+bestaudio"     "$URL" ;;

            2k)

              mpv --ytdl-format="bestvideo[height<=1440p]+bestaudio"   "$URL" ;;

            4k)

              mpv --ytdl-format="bestvideo[height<=720]+bestaudio"     "$URL" ;;

      esac
      ;;
"rumble")

  mpv "$URL" ;;

*)
  notify-send "The URL is not Youtube: "
  ;;
esac
