FROM java:8
LABEL maintainer="daryl.n.w.k@gmail.com"

# update packages and install maven
RUN  \
  export DEBIAN_FRONTEND=noninteractive && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y git maven jq zip

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py --user
RUN ~/.local/bin/pip --version
RUN ~/.local/bin/pip install awscli --upgrade --user
RUN ~/.local/bin/aws --version