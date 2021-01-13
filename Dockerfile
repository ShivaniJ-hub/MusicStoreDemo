FROM tomcat:latest
COPY /musicstore/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
ENTRYPOINT [ "sh /usr/local/tomcat/bin/startup.sh", "run" ]
