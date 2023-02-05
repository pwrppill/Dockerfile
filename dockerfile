FROM tomcat9
LABEL Name=repo Homework_6=0.0.1
RUN apt-get update
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR ./boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 8080
CMD CMD ["catalina.sh", "run"]
