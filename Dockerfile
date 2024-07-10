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

# Ensure files have correct permissions
RUN chmod +x /app/linux-server.x86_64 /app/linux-server.sh

# Expose the port the server will run on
EXPOSE $SERVER_PORT

# Add a debugging step to check file types and permissions
RUN ls -l /app && file /app/linux-server.x86_64 && head -n 10 /app/linux-server.sh

# Run the server
CMD ["sh", "-c", "./linux-server.sh"]
