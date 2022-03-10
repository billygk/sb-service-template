FROM openjdk:17
ADD build/libs/service-*.jar /opt/service-q.jar
VOLUME /tmp
WORKDIR /opt
EXPOSE 9101
ENTRYPOINT ["java","-jar","/opt/service-q.jar"]
