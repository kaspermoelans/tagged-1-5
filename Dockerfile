# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables
ENV SERVER_PORT 2504

# Install necessary packages
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libpng16-16 \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy the server files to the container
COPY linux-server.x86_64 linux-server.pck linux-server.sh /app/

# Make the server script executable
RUN chmod +x linux-server.x86_64 linux-server.sh

# Expose the port the server will run on
EXPOSE $SERVER_PORT

# Run the server
CMD ["./linux-server.sh"]
