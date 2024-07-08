FROM px4io/px4-dev-simulation-jammy:latest

RUN git clone -b v1.14.3 --single-branch https://github.com/PX4/PX4-Autopilot.git /app/PX4-Autopilot --recurse-submodules -j$(nproc) && cd /app/PX4-Autopilot && git checkout 

WORKDIR /app/PX4-Autopilot

COPY ./rcs.patch ./rcs.patch

RUN git apply rcs.patch

WORKDIR /app/PX4-Autopilot

RUN HEADLESS=1 DONT_RUN=1 make -j$(nproc) px4_sitl_default

COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x entrypoint.sh

# Entrypoint
ENTRYPOINT ["/bin/bash", "-l", "-c", "./entrypoint.sh"]
