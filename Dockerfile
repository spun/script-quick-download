FROM docker.io/library/alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

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
