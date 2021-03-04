FROM debian:latest


LABEL maintainer="Ayush Pandey <pandeyayush333@gmail.com>" version="0.0.1"

WORKDIR /app

SHELL ["/bin/bash", "-c"]
USER root
RUN apt-get update -y
# RUN apt upgrade - y
RUN apt install openjdk-11-jdk -y
# RUN apt install openjdk-11-jdk    
RUN java -version
RUN apt install wget -y
RUN apt install gnupg2 -y
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
RUN sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install jenkins -y
RUN systemctl start jenkins
# configure Jenkins to start when the system boots:
RUN systemctl enable jenkins 
RUN systemctl status jenkins
# To view the password
RUN cat /var/lib/jenkins/secrets/initialAdminPassword

# Run if face problem with firewall 
# RUN YOURPORT=8080
# RUN PERM="--permanent"
# RUN SERV="$PERM --service=jenkins"
# RUN firewall-cmd $PERM --new-service=jenkins
# RUN firewall-cmd $SERV --set-short="Jenkins ports"
# RUN firewall-cmd $SERV --set-description="Jenkins port exceptions"
# RUN firewall-cmd $SERV --add-port=$YOURPORT/tcp
# RUN firewall-cmd $PERM --add-service=jenkins
# RUN firewall-cmd --zone=public --add-service=http --permanent
# RUN firewall-cmd --reload


