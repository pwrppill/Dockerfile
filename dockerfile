FROM tomcat:latest
#LABEL Name=repo Homework_6=0.0.1
RUN apt update
RUN apt install maven git -y
RUN apt install default-jdk -y
RUN apt install git -y
RUN git clone https://github.com/jetty-project/embedded-jetty-live-war.git
WORKDIR ./embedded-jetty-live-war/
RUN mvn package
#RUN ls /usr/local/tomcat
RUN cp ./thewebapp/target/thewebapp.war /usr/local/tomcat/webapps