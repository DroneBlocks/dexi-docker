FROM tiryoh/ros2-desktop-vnc:humble-20240804T0415

RUN useradd -ms /bin/bash ubuntu

WORKDIR /px4

# This branch has some basic tweaks for this to work on Mac M3
RUN git clone -b feature/docker-sitl-vnc-mac-m3 https://github.com/DroneBlocks/PX4-Autopilot --recursive

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

WORKDIR /px4

COPY edit_rcS.bash .

COPY setup.bash .

RUN mkdir -p dexi_ws/src

RUN cd dexi_ws/src && git clone -b release/1.14 https://github.com/PX4/px4_msgs

RUN cd dexi_ws && . /opt/ros/humble/setup.bash && colcon build

# Change ownership to ubuntu user
RUN chown -R 1000:1000 /px4