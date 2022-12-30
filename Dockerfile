FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install java
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz .
RUN tar -xvzf apache-tomcat-10.0.27.tar.gz
RUN mv apache-tomcat-10.0.27/* /opt/tomcat
EXPOSE 8080
WORKDIR /var/lib/jenkins/workspace/BuildDocker/
RUN pwd
COPY SpringJPAApp-0.0.1-SNAPSHOT.war /opt/tomcat/webapps
CMD ["/opt/tomcat/bin/catalina.sh","run"]
