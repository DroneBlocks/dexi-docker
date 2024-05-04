FROM nginx:latest

RUN apt update

RUN apt install git -y

RUN git clone https://github.com/DroneBlocks/DEXI-Web-Tools && cd DEXI-Web-Tools/src && cp -r ./* /usr/share/nginx/html