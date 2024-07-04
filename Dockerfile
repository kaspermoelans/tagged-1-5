# Use the official Godot headless build as a base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libxcursor1 \
    libxinerama1 \
    libxrandr2 \
    libxi6 \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /app

# Copy your Godot project files into the Docker image
COPY . /app

# Make start script executable
RUN chmod +x /app/linux-server.sh

# Expose the port that your server will run on
EXPOSE 12345

# Run the server
CMD ["./linux-server.sh"]
