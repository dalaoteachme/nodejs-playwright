FROM node:20-bookworm

MAINTAINER Windowsed , <onekin0w0@gmail.com>
RUN npx -y playwright@1.48.1 install --with-deps

# Add a non-root user
RUN adduser -D -h /home/container -s /bin/bash container

# Switch to the non-root user
USER container
ENV USER=container HOME=/home/container

# Set working directory
WORKDIR /home/container

# Copy the entrypoint script
COPY ./entrypoint.sh /entrypoint.sh

# Set the entrypoint
CMD ["/bin/bash", "/entrypoint.sh"]