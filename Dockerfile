FROM alpine:3.3

RUN apt-get update -y 
RUN apt-get install -y sudo
RUN apt-get install -y build-essential checkinstall
RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
RUN apt-get update -y 
RUN sudo apt-get install curl -y

RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN apt-get update -y 

RUN sudo apt-get install -y build-essential
RUN apt-get install -y python python-dev python-pip python-virtualenv
RUN node -v
RUN echo $PATH
RUN npm -v

ENV NODE_PATH /install/node_modules/
ENV PATH /install/node_modules/.bin:$PATH

COPY package.json /install/package.json
WORKDIR /install/
RUN npm install

VOLUME /app
WORKDIR /app

CMD ["wdio"]
