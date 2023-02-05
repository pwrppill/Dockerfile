FROM tomcat
LABEL Name=repo Homework_6=0.0.1
RUN apt-get update
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/goodrain/java-war-demo
WORKDIR ./java-war-demo/
RUN mvn package
RUN cp /java-war-demo/target/java-war-demo.war /var/lib/tomcat9/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
