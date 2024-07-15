#!/bin/bash
echo "Server IP:"
echo $(hostname -I)
# Start the server and redirect stdout and stderr to the console
./tagged-server.x86_64
