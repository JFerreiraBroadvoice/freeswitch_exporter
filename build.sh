#!/bin/bash

# Build the Docker image
docker build -t freeswitch_exporter .

# Run a temporary container based on the image
docker run -d --name temp_container freeswitch_exporter

# Copy the binary out of the container
docker cp temp_container:/freeswitch_exporter ./freeswitch_exporter

# Stop and remove the temporary container
docker rm -f temp_container

# Create a tar.gz archive of the freeswitch_exporter
tar -czvf freeswitch_exporter.tar.gz freeswitch_exporter

# Optional: Remove the copied binary to clean up
rm ./freeswitch_exporter

echo "freeswitch_exporter.tar.gz has been created successfully."
