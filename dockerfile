FROM tomcat:8.0
#LABEL Name=repo Homework_6=0.0.1
RUN apt update
#WORKDIR /opt/
#RUN wget https://archive.apache.org/dist/maven/maven-3/3.0.4/binaries/apache-maven-3.0.4-bin.tar.gz && tar xzvf apache-maven-*-bin.tar.gz && cp apache-maven-3.0.4/bin /bin/mvn
RUN apt install maven default-jdk git --force-yes
#RUN apt install default-jdk --force-yes
#RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR ./boxfuse-sample-java-war-hello/
RUN mvn package
#RUN ls /usr/local/tomcat
RUN cp /usr/local/tomcat/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps