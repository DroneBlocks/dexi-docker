FROM dexi-docker:ros2

SHELL ["/bin/bash", "-c"]

WORKDIR /ros2_ws/src

RUN git clone https://github.com/PX4/px4_msgs
RUN . /opt/ros/humble/setup.bash && cd .. && colcon build

# RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
# RUN echo "source /ros2_ws/install/setup.bash" >> /root/.bashrc

COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x entrypoint.sh

# Entrypoint
ENTRYPOINT ["/bin/bash", "-l", "-c", "./entrypoint.sh"]