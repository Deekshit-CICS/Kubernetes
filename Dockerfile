FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install java-17-openjdk
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz .
RUN tar -xvzf apache-tomcat-10.0.27.tar.gz
RUN mv apache-tomcat-10.0.27/* /opt/tomcat
EXPOSE 8080
WORKDIR /var/lib/jenkins/workspace/SpringBoot_CICD_Pipeline/MyWebApp1/target
COPY /var/lib/jenkins/workspace/SpringBoot_CICD_Pipeline/MyWebApp1/target/MyWebApp1-4.0.1-SNAPSHOT.war /opt/tomcat/webapps
CMD ["/opt/tomcat/bin/catalina.sh","run"]
