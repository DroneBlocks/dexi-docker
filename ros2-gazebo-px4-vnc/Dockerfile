FROM tiryoh/ros2-desktop-vnc:humble
RUN useradd -ms /bin/bash ubuntu

WORKDIR /px4

# This branch has some basic tweaks for this to work on Mac M3
RUN git clone -b feature/docker-mac-m3 https://github.com/DroneBlocks/PX4-Autopilot --recursive

# install MicroDDS Agent
RUN git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git \
&& cd Micro-XRCE-DDS-Agent \
&& mkdir build \
&& cd build \
&& cmake .. \
&& make -j$(nproc)\
&& make install \
&& ldconfig /usr/local/lib/ \
&& rm -rf Micro-XRCE-DDS-Agent

RUN cd /px4/PX4-Autopilot && ./Tools/setup/ubuntu.sh

WORKDIR /px4/PX4-Autopilot

# https://discuss.px4.io/t/dont-run-1-with-gz-doesnt-work/32124
RUN make px4_sitl_default

WORKDIR /px4

COPY edit_rcS.bash .

RUN dos2unix edit_rcS.bash

COPY setup.bash .

#RUN mkdir -p dexi_ws/src

# Clone px4_msgs into our workspace
#RUN cd dexi_ws/src && git clone -b release/1.15 https://github.com/PX4/px4_msgs

# Build px4_msgs
# Pre-building is not necessary right now since we're copying from px4-autopilot into our workspace
# RUN cd dexi_ws && . /opt/ros/humble/setup.bash && colcon build

# This is here for mapping the dexi repo on the host into the container and making sure they are in sync
#RUN echo "cp /px4/PX4-Autopilot/msg/*.msg ~/dexi_ws/src/px4_msgs/msg/" >> /home/ubuntu/.bashrc

# Change ownership to ubuntu user
RUN chown -R 1000:1000 /px4