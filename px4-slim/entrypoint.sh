#! /bin/bash
cd /app/PX4-Autopilot
# PX4_UXRCE_DDS_AG_IP=127.0.0.1
HEADLESS=1 PX4_GZ_SIM_RENDER_ENGINE=ogre make px4_sitl_default gz_x500 