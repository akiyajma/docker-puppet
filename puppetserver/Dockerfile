FROM puppet/puppetserver:7.7.0

RUN apt-get update && \
    apt-get install -y cron

COPY ./puppetserver/r10k/r10k-deploy.sh /usr/local/bin/r10k-deploy.sh
COPY ./puppetserver/docker-entrypoint.sh /

ADD ./puppetserver/r10k/r10k.yaml /etc/puppetlabs/r10k/r10k.yaml
ADD ./puppetserver/r10k/r10k-cron /var/spool/crontab/root

