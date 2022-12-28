M centos:latest
RUN yum install java -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD <URL>         
RUN tar -xvzf <file>.tar.gz
RUN mv <dir>/* /opt/tomcat
EXPOSE 8080
CMD ["/opt/tomcat/cataina.sh","run"]

