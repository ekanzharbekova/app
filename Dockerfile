FROM centos:7

# RUN  yum update -y

#Install packages
RUN   yum install telnet -y &&  \
      yum install httpd httpd-tools -y && \
      yum install wget -y && \
      yum install unzip -y


# open port 80
EXPOSE 80

# Copy file into web server
COPY index.html /var/www/html/index.html
RUN   755   /var/www/html/index.html

# Keep application alive
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]