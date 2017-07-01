# DOCKER IMG FOR MICROSERVICES BASE LAYER
# > docker build -t microsvc_sanic .
# > docker login
# > docker tag microsvc_sanic user_name/microsvc_sanic:tag
# > docker push user_name/microsvc_sanic:tag

# Use from docker cloud as microsvc_sanic:tag
FROM ubuntu:zesty

RUN apt-get update \
    && apt-get install -y curl vim net-tools

RUN apt-get install -y python3.6 python3-pip

RUN pip3 install --upgrade pip

ADD . /tmp/
WORKDIR /tmp

RUN pip3 install -r requirements.txt
