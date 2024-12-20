FROM ubuntu:latest
RUN apt -y update && apt -y upgrade
RUN apt install -y openjdk-11-jdk
RUN mkdir /opt/tomcat
COPY apache-tomcat-9.0.68.tar.gz /opt/tomcat/
WORKDIR /opt/tomcat/
RUN tar -zxvf apache-tomcat-9.0.68.tar.gz
RUN export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-11.0.10.0.9-8.el8.x86_64"
ENV export PATH=$JAVA_HOME/bin:$PATH
ENV CATALINA_HOME=/opt/tomcat/apache-tomcat-9.0.68
COPY EmpInfoProject/target/EmpInfoProject.war /opt/tomcat/apache-tomcat-9.0.68/webapps/
CMD ["bash"]
EXPOSE 8080
CMD ["/opt/tomcat/apache-tomcat-9.0.68/bin/catalina.sh", "run"]