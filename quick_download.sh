#!/bin/sh

# Check if the URL argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

url="$1"
shift # Remove the first argument (URL) from the list of arguments

# Ask user for a resolution value with default of 720
read -p "Resolution [default=720]: " resolution
resolution=${resolution:-720}

# Define the format selection expressions we want to use
# Download the best mp4 format with a video resolution equal or lower to $resolution and, if it doesn't already have and audio stream, merge it with the best mp4 audio-only format
format1="bv*[height<=$resolution][ext=mp4]+ba[ext=mp4]"
#  or download the best format with a video resolution equal or lower to $resolution and, if it doesn't already have and audio stream, merge it with the best audio-only format
format2="bv*[height<=$resolution]+ba"
#  or download the best combined mp4 format with a resolution equal or lower to $resolution
format3="b[height<=$resolution][ext=mp4]"
#  or download the best combined format with a resolution equal or lower to $resolution
format4="b[height<=$resolution]"
#  or download the worst mp4 format with video and, if it doesn't already have and audio stream, merge it with the best mp4 audio-only format
format5="wv*[ext=mp4]+ba[ext=mp4]"
#  or download the worst format with video and, if it doesn't already have and audio stream, merge it with the best audio-only format
format6="wv*+ba"
#  or get the worst combined mp4 format
format7="w[ext=mp4]"
#  or get the worst combined format
format8="w"

# Join formats with slashes
formats="$format1/$format2/$format3/$format4/$format5/$format6/$format7/$format8"

# Put the final command together
download_command="yt-dlp -f \"$formats\" $@ $url"

# Execute the download command
echo "Executing: $download_command"
eval $download_command

# Print "Done" message
echo "Done"
