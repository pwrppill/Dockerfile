FROM ubuntu:20.04
LABEL Name=repo Homework_6=0.0.1
RUN apt-get update
RUN apt install default-jdk -y
RUN apt install tomcat9 -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /home/cbrkd/boxfuse-sample-java-war-hello/
RUN pwd
RUN mvn package
RUN cp ./target/hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
