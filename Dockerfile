FROM docker.sendgrid.net/sendgrid/dev

ADD master.cf /etc/postfix/master.cf
ADD main.cf /etc/postfix/main.cf

ADD sg_mail /etc/logrotate.d/sg_mail
ADD mailname /etc/mailname
ADD aliases /etc/aliases

ADD ca-bundle.crt /etc/ssl/certs/ca-bundle.crt
ADD wildcard.sendgrid.net.key /etc/ssl/certs/wildcard.sendgrid.net.key
ADD wildcard.sendgrid.net.pem /etc/ssl/certs/wildcard.sendgrid.net.pem

ADD startpostfix.sh /startpostfix.sh

RUN yum update -y
RUN yum install -y rsyslog postfix memcached cyrus-sasl
RUN yum install -y cyrus-sasl-devel openssl openssl-devel pcre pcre-devel
RUN yum install -y openldap openldap-devel mysql-devel
RUN yum install -y gcc gcc-c++ kernel-devel make db4-devel

ADD upgrade_postfix.sh /upgrade_postfix.sh

#RUN ./upgrade_postfix.sh

VOLUME ["/var/log","/var/spool/postfix"]

#ENTRYPOINT ["./startpostfix.sh"]
