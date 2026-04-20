FROM docker.io/library/alpine:3.23.4@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11

# Update system and install yt-dlp
RUN apk upgrade --no-cache \
 && apk add --no-cache yt-dlp

# Copy the "quick download" script
COPY quick_download.sh /scripts/

# Make the script available from everywhere with a symbolic link
RUN ln -s /scripts/quick_download.sh /usr/local/bin/quick_download

# Modify history to include quick access to script
RUN echo -e "exit\nquick_download " >> ~/.ash_history

WORKDIR /downloads
