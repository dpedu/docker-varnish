FROM ubuntu:trusty

RUN locale-gen en_US en_US.UTF-8 ;\
    apt-get update ;\
    apt-get install -y apt-transport-https curl ;\
    curl https://repo.varnish-cache.org/ubuntu/GPG-key.txt | apt-key add - ;\
    echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list ;\
    apt-get update ;\
    DEBIAN_FRONTEND=noninteractive apt-get install -y varnish ;\
    echo '00000000-0000-0000-0000-000000000000' > /etc/varnish/secret

WORKDIR /etc/varnish

ENTRYPOINT ["/usr/sbin/varnishd", "-f", "/etc/varnish/default.vcl", "-a", "0.0.0.0:80", "-T", "0.0.0.0:6082", "-S", "/etc/varnish/secret", "-F"]

EXPOSE 80 6082
