FROM ubuntu:20.04

LABEL maintainer="Shivam Singh <shivm.0701@gmail.com>"

RUN apt-get update -y && \
    apt-get install apt-transport-https ca-certificates wget gnupg -y && \
    wget -q -O - "https://repos.ripple.com/repos/api/gpg/key/public" | apt-key add - && \
    echo "deb https://repos.ripple.com/repos/rippled-deb focal stable" | tee -a /etc/apt/sources.list.d/ripple.list && \
    apt-get update -y && \
    apt-get install rippled -y && \
    ln -s /opt/ripple/bin/rippled /usr/bin/rippled

COPY ./rippled.cfg /etc/opt/ripple/

EXPOSE 80 5005 51235

ENTRYPOINT [ "rippled", "--net", "--conf", "/etc/opt/ripple/rippled.cfg" ]
