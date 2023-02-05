FROM tomcat:9.0
LABEL Name=repo Homework_6=0.0.1
RUN apt-get update
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/efsavage/hello-world-war.git
WORKDIR ./hello-world-war/
RUN mvn package
RUN cp /usr/local/tomcat/hello-world-war/target/hello-world-war-1.0.0.war /usr/local/tomcat/
RUN ls /usr/local/tomcat/
EXPOSE 8080
CMD ["catalina.sh", "run"]
