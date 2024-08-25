# Run from Docker Hub
docker run -p 6080:80 --name=dexi-sitl --security-opt seccomp=unconfined --shm-size=512m droneblocks/dexi-px4-sitl:latest

# Login

1. http://localhost:6080

2. Double click Terminator icon

3. cd PX4-Autopilot

4. ./Tools/setup/ubuntu.sh (this will take a few minutes)

5. make px4_sitl gz_x500 (this will launch Gazebo sim)

6. In same terminal run: commander takeoff

7. You should see the simulated drone takeoff in Gazebo

8. For uxrce dds you should open a new terminal and run: MicroXRCEAgent udp4 --port 8888




# Build Locally

docker build -t droneblocks/dexi-px4-sitl:latest .

