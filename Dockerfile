# DOCKER IMG FOR MICROSERVICES BASE LAYER
# > docker build -t microsvc_sanic .
# > docker login
# > docker tag microsvc_sanic user_name/microsvc_sanic:tag
# > docker push user_name/microsvc_sanic:tag

# Use from docker cloud as microsvc_sanic:tag
FROM ubuntu:zesty

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y curl vim net-tools gcc

RUN apt-get install -y python3.6-dev \
    && curl https://bootstrap.pypa.io/get-pip.py >> get-pip.py \
    && python3.6 get-pip.py

RUN pip3.6 install --upgrade pip

ADD . /tmp/
WORKDIR /tmp

RUN pip3.6 install -r requirements.txt

RUN apt-get autoremove -y gcc