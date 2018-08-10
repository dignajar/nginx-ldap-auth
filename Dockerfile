FROM centos:centos7
ENV nginx_version 1.14.0

RUN yum -y update && \
    yum -y install pcre pcre-devel openssl openssl-devel openldap openldap-devel perl gcc make wget unzip && \
    yum clean all

RUN wget https://github.com/kvspb/nginx-auth-ldap/archive/master.zip && unzip master.zip && \
    wget http://nginx.org/download/nginx-${nginx_version}.tar.gz && tar zxvf nginx-${nginx_version}.tar.gz

RUN cd nginx-${nginx_version} && \
    ./configure \
        --prefix=/etc/nginx \
        --sbin-path=/usr/sbin/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/dev/stderr \
        --http-log-path=/dev/stdout \
        --pid-path=/var/run/nginx.pid \
        --lock-path=/var/run/nginx.lock \
        --with-http_ssl_module \
        --with-http_realip_module \
        --with-http_secure_link_module \
        --with-http_stub_status_module \
        --with-http_auth_request_module \
        --add-module=../nginx-auth-ldap-master && \
        make && \
        make install

EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]