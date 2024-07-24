FROM nginx:latest

RUN apt update

RUN apt install git -y

RUN git clone -b develop https://github.com/droneblocks/dexi && cd dexi/droneblocks/www && cp -r ./* /usr/share/nginx/html