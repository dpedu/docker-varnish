FROM ubuntu:trusty

ADD start /start

RUN chmod +x /start ;\
    locale-gen en_US en_US.UTF-8 ;\
    apt-get update ;\
    apt-get install -y apt-transport-https curl supervisor inotify-tools ;\
    curl https://repo.varnish-cache.org/ubuntu/GPG-key.txt | apt-key add - ;\
    echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list ;\
    apt-get update ;\
    DEBIAN_FRONTEND=noninteractive apt-get install -y varnish ;\
    rm /etc/varnish/secret

ADD varnish.conf /etc/supervisor/conf.d/varnish.conf
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf

WORKDIR /etc/varnish
CMD ["/start"]

EXPOSE 80 6082
