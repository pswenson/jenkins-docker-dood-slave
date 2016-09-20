FROM anapsix/alpine-java:jdk8

ENV JENKINS_HOME /home/jenkins

RUN apk --update add \
    busybox \
    curl \
    git \
    bash \
    vim \
    make \
    sudo \
    openssh-client \
    docker \
    tzdata \
    jq

ENV HOME /home/jenkins
ENV TZ America/Denver
RUN adduser -D -h $HOME jenkins jenkins \
    && chmod a+rwx $JENKINS_HOME

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/2.53.1/remoting-2.53.1.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

COPY jenkins-slave /usr/local/bin/jenkins-slave
COPY start /usr/local/bin/start

WORKDIR /home/jenkins
ENTRYPOINT ["start"]


