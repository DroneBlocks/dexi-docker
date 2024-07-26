# Build individual image
docker build . -t dexi_droneblocks:latest -f Dockerfile_droneblocks

# Run the image
docker run --rm -it -p 7777:80  dennis_test:droneblocks

# Run all
docker compose up

# Run this on Ubuntu and connect to agent on Pi
docker run --rm -it --network=host -e PX4_UXRCE_DDS_AG_IP=192.168.6.43 dexi-docker:px4