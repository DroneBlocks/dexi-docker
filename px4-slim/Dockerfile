FROM px4io/px4-dev-simulation-jammy:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

########## install mavp2p ########
ENV MAVP2P_VERSION=1.2.1
WORKDIR /app

RUN wget --no-check-certificate https://github.com/bluenviron/mavp2p/releases/download/v${MAVP2P_VERSION}/mavp2p_v${MAVP2P_VERSION}_linux_$(dpkg --print-architecture).tar.gz \
 && tar -xvzf mavp2p*.tar.gz \
 && rm mavp2p*.tar.gz

########### clone PX4 ###########
RUN git clone -b v1.15.0 --single-branch https://github.com/PX4/PX4-Autopilot.git /app/PX4-Autopilot --recurse-submodules -j$(nproc) \
 && cd /app/PX4-Autopilot

WORKDIR /app/PX4-Autopilot

########### patch px4 ###########
COPY ./rcs.patch ./rcs.patch

RUN git apply rcs.patch

WORKDIR /app/PX4-Autopilot

######### compile sitl ##########

RUN pip3 install symforce
RUN curl -sSL http://get.gazebosim.org | sh
RUN HEADLESS=1 DONT_RUN=1 make -j$(nproc) px4_sitl gazebo_iris_opt_flow
#px4_sitl_default

COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x entrypoint.sh

# Entrypoint
ENTRYPOINT ["/bin/bash", "-l", "-c", "./entrypoint.sh"]
