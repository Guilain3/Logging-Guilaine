# Use an official Tomcat runtime as a parent image with JDK 17 on Alpine
FROM tomcat:9.0-jdk17

# Set the working directory in the container
WORKDIR /usr/local/tomcat

# Remove default webapps to avoid conflicts
RUN rm -rf webapps/*

# Copy the WAR file to the webapps directory of Tomcat
COPY build/StudentProject.war webapps/StudentProject.war

# Expose port 8080
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
