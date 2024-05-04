# Build individual image
docker build . -t dexi_droneblocks:latest -f Dockerfile_droneblocks

# Run the image
docker run --rm -it -p 7777:80  dennis_test:droneblocks

# Run all
docker compose up