# Use the official Ubuntu 20.04 as a base image
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

# Download and extract Godot headless version
RUN wget https://downloads.tuxfamily.org/godotengine/4.2/Godot_v4.2-stable_linux_headless.64.zip \
    && unzip Godot_v4.2-stable_linux_headless.64.zip \
    && mv Godot_v4.2-stable_linux_headless.64 /godot \
    && rm Godot_v4.2-stable_linux_headless.64.zip

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
