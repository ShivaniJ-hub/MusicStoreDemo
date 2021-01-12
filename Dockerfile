FROM ubuntu:18.04
RUN sudo apt-get update -y
RUN sudo apt-get install -y openjdk-8-jdk
RUN sudo apt-get install -y tomcat8
VOLUME /var/lib/tomcat8/webapps
EXPOSE 8080
CMD ["--port 8080"]
ENV CATALINA_BASE /var/lib/tomcat8
ENTRYPOINT [ "/usr/share/tomcat8/bin/catalina.sh", "run" ]
