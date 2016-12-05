FROM debian:stretch

# install stuff for gzweb
RUN apt-get update && apt-get install -y libjansson-dev nodejs npm libboost-dev imagemagick libtinyxml-dev mercurial cmake build-essential
RUN apt-get install -y cmake pkg-config apt-utils
RUN apt-get install -y gazebo7
RUN apt-get install -y libgazebo7 libgazebo7-dev

# install gzweb
# fix the bad /usr/bin/nodejs nonsense
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN node -v

# install it all
RUN cd ~ && hg clone https://bitbucket.org/osrf/gzweb 
RUN cd ~/gzweb && hg up gzweb_2.0.0 && sh /usr/share/gazebo/setup.sh && ./deploy.sh -m

# install supervisord so we can run both gzserver and gzweb in the same place
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY etc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir /robot

EXPOSE 8080
EXPOSE 7681
EXPOSE 11345

# place here your application's setup specifics
CMD [ "/usr/bin/supervisord" ]
MAINTAINER mfkahn@gmail.com
