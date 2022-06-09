FROM ubuntu:20.04
WORKDIR /var/www/html/
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt -y  install supervisor
RUN apt -y  install nginx
RUN apt -y  install git gcc g++ make python3-dev python3-pip libxml2-dev libxslt1-dev zlib1g-dev gettext curl redis-server
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt -y  install nodejs
RUN apt -y install mariadb-server libmysqlclient-dev
RUN npm install -g sass postcss-cli postcss autoprefixer
RUN apt -y install python3-venv
RUN apt -y install build-essential libseccomp-dev
RUN pip3 install dmoj
RUN apt -y install software-properties-common

RUN curl https://dmoj.ca/dmoj-apt.key | apt-key add -
RUN echo "deb [arch=amd64] https://apt.dmoj.ca/ bullseye main non-free" | tee /etc/apt/sources.list
RUN apt update
RUN apt install v8dmoj
RUN useradd dmoj

COPY . .
COPY ./docker/supervisor/site.conf /etc/supervisor/conf.d/site.conf
COPY ./docker/supervisor/bridged.conf /etc/supervisor/conf.d/bridged.conf
COPY ./docker/supervisor/celery.conf /etc/supervisor/conf.d/celery.conf
COPY ./docker/supervisor/wsevent.conf /etc/supervisor/conf.d/wsevent.conf
COPY ./docker/nginx/default.conf /etc/nginx/sites-available/default

ENTRYPOINT ["tail", "-f", "/dev/null"]
EXPOSE 80
