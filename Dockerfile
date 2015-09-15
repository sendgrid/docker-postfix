FROM docker.sendgrid.net/sendgrid/dev_pl

RUN yum install postfix

ADD master.cf /etc/postfix/master.cf
ADD aliases.erb /etc/aliases
ADD main.cf.erb /etc/postfix/main.cf
ADD sg_mail.erb /etc/logrotate.d/sg_mail
ADD mailname.erb /etc/mailname

RUN service postfix restart 
