FROM tomcat:9.0
LABEL Name=repo Homework_6=0.0.1
RUN apt-get update
RUN apt install maven -y
RUN apt install default-jdk -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR ./boxfuse-sample-java-war-hello/
RUN mvn package
RUN ls /usr/local/tomcat
#RUN cp /usr/local/tomcat/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps