FROM docker.sendgrid.net/sendgrid/dev

RUN yum install -y postfix

WORKDIR /opt/sendgrid/postfix

ADD master.cf /etc/postfix/master.cf
ADD aliases /etc/aliases
ADD main.cf /etc/postfix/main.cf
ADD sg_mail /etc/logrotate.d/sg_mail
ADD mailname /etc/mailname

RUN ["service" "postfix" "start"]
