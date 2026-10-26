FROM docker.io/library/alpine:3.24.3@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

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
