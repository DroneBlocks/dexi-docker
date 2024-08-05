FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade -y && apt install -y \ 
software-properties-common \
curl \
git \
python3 \
python3-pip \
cmake

WORKDIR /opt

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

COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x entrypoint.sh

# Entrypoint
ENTRYPOINT ["/bin/bash", "-l", "-c", "./entrypoint.sh"]