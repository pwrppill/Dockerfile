FROM tomcat:9.0
LABEL Name=repo Homework_6=0.0.1
RUN apt-get update
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/tongueroo/demo-java.git
WORKDIR ./demo-java/
RUN mvn package
RUN cp /usr/local/tomcat/demo-java/target/demo.war /usr/local/tomcat/
RUN ls /usr/local/tomcat/
EXPOSE 8080
CMD ["catalina.sh", "run"]
