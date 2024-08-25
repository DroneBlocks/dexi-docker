#!/bin/bash
cd /px4/PX4-Autopilot
DONT_RUN=1 make px4_sitl_default
sleep 5
source /px4/edit_rcS.bash