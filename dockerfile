FROM tomcat:9.0
LABEL Name=repo Homework_6=0.0.1
RUN apt-get update
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/koddas/war-web-project.git
WORKDIR ./war-web-project/
RUN mvn package
RUN cp /usr/local/tomcat/war-web-project/target/wwp-1.0.0.war /usr/local/tomcat/webapps
RUN ls /usr/local/tomcat/
EXPOSE 8080
CMD ["catalina.sh", "run"]
