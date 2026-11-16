FROM docker.io/library/alpine:3.24.4@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf

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
