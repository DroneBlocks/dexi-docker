#! /bin/bash
cd /app/PX4-Autopilot
# PX4_UXRCE_DDS_AG_IP=127.0.0.1

/app/mavp2p udps:127.0.0.1:14540 tcps:0.0.0.0:5760 tcps:0.0.0.0:5761 udps:0.0.0.0:14541 --print-errors &

HEADLESS=1 PX4_GZ_SIM_RENDER_ENGINE=ogre make px4_sitl gazebo_iris_opt_flow #px4_sitl_default gz_x500 