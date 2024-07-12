FROM nginx:latest

RUN apt update

RUN apt install git -y

RUN git clone https://github.com/dbaldwin/simple-dash && cd simple-dash && git pull && cp -r ./* /usr/share/nginx/html

