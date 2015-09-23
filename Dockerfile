FROM docker.sendgrid.net/sendgrid/dev

ADD master.cf /etc/postfix/master.cf
ADD main.cf /etc/postfix/main.cf

RUN yum update -y && yum install -y rsyslog postfix

ADD startpostfix.sh /startpostfix.sh


ADD sg_mail /etc/logrotate.d/sg_mail
ADD mailname /etc/mailname
ADD aliases /etc/aliases

VOLUME ["/var/log","/var/spool/postfix"]

ENTRYPOINT ["./startpostfix.sh"]
