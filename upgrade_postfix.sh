set -eux

VERSION="3.0.2"

cd /var/tmp
wget -c http://mirrors-usa.go-parts.com/postfix/source/official/postfix-${VERSION}.tar.gz
tar xvzf postfix-${VERSION}.tar.gz

cd postfix-${VERSION}

make makefiles CCARGS='-fPIC -DUSE_TLS -DSNAPSHOT -DUSE_SSL -DUSE_SASL_AUTH -DUSE_CYRUS_SASL -DPREFIX=\\"/usr\\" -DHAS_LDAP -DLDAP_DEPRECATED=1 -DHAS_PCRE -I/usr/include/openssl -I/usr/include/sasl -DHAS_MYSQL -I/usr/include/mysql -I/usr/include' AUXLIBS='-L/usr/lib64 -L/usr/lib64/mysql -lmysqlclient -L/usr/lib64/openssl -lssl -lcrypto -L/usr/lib64/sasl2 -lsasl2 -lpcre -lz -lm -lldap -llber -Wl,-rpath,/usr/lib64/openssl -pie -Wl,-z,relro' OPT='-O' DEBUG='-g'

make
make upgrade && echo -e "Fin!\n"

postfix upgrade-configuration