FROM docker.io/library/alpine:3.23.2@sha256:865b95f46d98cf867a156fe4a135ad3fe50d2056aa3f25ed31662dff6da4eb62

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
