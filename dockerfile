FROM tomcat:latest
#LABEL Name=repo Homework_6=0.0.1
RUN apt update
#WORKDIR /opt/
#RUN wget https://archive.apache.org/dist/maven/maven-3/3.0.4/binaries/apache-maven-3.0.4-bin.tar.gz && tar xzvf apache-maven-*-bin.tar.gz && cp apache-maven-3.0.4/bin /bin/mvn
RUN apt install maven git -y
RUN apt install -y libc6-x32 libc6-i386
RUN wget https://download.oracle.com/java/18/latest/jdk-18_linux-x64_bin.deb
RUN sudo dpkg -i jdk-18_linux-x64_bin.deb
RUN sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-18/bin/java 1
RUN java -version
#RUN apt install default-jdk -y
#RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR ./boxfuse-sample-java-war-hello/
RUN mvn package
#RUN ls /usr/local/tomcat
RUN cp /usr/local/tomcat/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps