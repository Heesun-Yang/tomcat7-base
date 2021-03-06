FROM rockplace/centos7-base
   
USER root

RUN useradd -u 185 -G root tomcat
  
# Install Java 1.7.0_79
RUN mkdir -p /usr/java
ADD files/jdk-7u79-linux-x64.tar.gz /usr/java/
ENV JAVA_HOME /usr/java/jdk1.7.0_79
  
# Install Tomcat7.0.62
RUN mkdir -p /usr/local/tomcat
ADD files/apache-tomcat-7.0.82.tar.gz /usr/local/tomcat/

RUN chown -R tomcat:root /usr/local/tomcat  \
 && chmod +x /usr/local/tomcat/apache-tomcat-7.0.82/bin/*.sh

ENV CATALINA_HOME /usr/local/tomcat/apache-tomcat-7.0.82
ENV PATH $CATALINA_HOME/bin:$PATH

# Sample App
#COPY simple.war $CATALINA_HOME/webapps
  
  
EXPOSE 8080
CMD ["catalina.sh", "run"]
