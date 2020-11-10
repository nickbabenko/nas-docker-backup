FROM alpine:3.7

ENV DIR=/code

ADD crontab /etc/cron.d/hello-cron
ADD backup.sh /backup.sh

RUN chmod +x /backup.sh
RUN chmod 0644 /etc/cron.d/hello-cron

RUN touch /var/log/cron.log

RUN apt update
RUN apt -y install cron git

CMD cron && tail -f /var/log/cron.log
