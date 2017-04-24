FROM alpine:3.3

RUN apk add --no-cache sudo

RUN apk add --no-cache curl

RUN apk add --no-cache build-essential 
RUN apk add --no-cache checkinstall
RUN apk add --no-cache libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN apk add install -y nodejs
RUN apk update 

RUN apk add python python-dev python-pip python-virtualenv
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
