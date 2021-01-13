FROM tomcat:latest
COPY /musicstore/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
ENTRYPOINT [ "catalina.sh run", "run" ]
