FROM debian:stable-slim

# BUG: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
 RUN mkdir -p /usr/share/man/man1 \
  && apt-get update \
  && apt-get install -y apt-utils \
  && apt-get install -y wget \
  && wget https://d2znqt9b1bc64u.cloudfront.net/java-1.8.0-amazon-corretto-jdk_8.202.08-2_amd64.deb \
  && apt-get update \
  && apt-get install java-common \
  && dpkg --install java-1.8.0-amazon-corretto-jdk_8.202.08-2_amd64.deb \
  && rm -rf /var/lib/apt/lists/* \
  && java -version
  
ENV LANG C.utf8