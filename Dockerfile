FROM  centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page286/dropbeat.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip dropbeat.zip
RUN cp -rvf html/* .
RUN rm -rf html dropbeat.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80