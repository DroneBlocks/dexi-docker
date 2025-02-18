FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade && apt install -y \
software-properties-common \
curl \
git \
python3 \
python3-pip

RUN pip3 install pyros-genmsg setuptools

RUN add-apt-repository universe \
&& curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" |  tee /etc/apt/sources.list.d/ros2.list > /dev/null \
&& apt update \
&& DEBIAN_FRONTEND=noninteractive apt install -y \
ros-humble-ros-base \
ros-dev-tools \
ros-humble-rosbridge-server \
python3-colcon-common-extensions \
python3-argcomplete \
&& rosdep init \
&& rosdep update

WORKDIR /opt

# install MicroDDS Agent
# RUN git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git \
# && cd Micro-XRCE-DDS-Agent \
# && mkdir build \
# && cd build \
# && cmake .. \
# && make -j$(nproc)\
# && make install \
# && ldconfig /usr/local/lib/ \
# && rm -rf Micro-XRCE-DDS-Agent

WORKDIR /ros2_ws/src

RUN git clone https://github.com/PX4/px4_msgs
RUN cd .. && . /opt/ros/humble/setup.bash && colcon build

RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
RUN echo "source /ros2_ws/install/setup.bash" >> /root/.bashrc
RUN echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> /root/.bashrc

#####################################################################

COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x entrypoint.sh

# Entrypoint
ENTRYPOINT ["/bin/bash", "-l", "-c", "./entrypoint.sh"]