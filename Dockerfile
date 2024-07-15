# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables
ENV SERVER_PORT 8050

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
COPY tagged-server.x86_64 tagged-server.pck tagged-server.sh /app/

# Make the server script executable
RUN chmod +x tagged-server.x86_64 tagged-server.sh

# Expose the port the server will run on
EXPOSE $SERVER_PORT

# Run the server
CMD ["./tagged-server.sh"]
