FROM ubuntu:14.04

MAINTAINER Larry Cai <larry.caiyu@gmail.com>

ENV REFRESHED_AT 2014-08-08

RUN apt-get update -qq && apt-get install -qqy curl openjdk-6-jdk

ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p $JENKINS_HOME/plugins $JENKINS_HOME/jobs/craft
RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war-stable/latest/jenkins.war

RUN for plugin in chucknorris greenballs scm-api git-client ansicolor description-setter \
    envinject job-exporter git ws-cleanup ;\
    do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

# out2html

RUN curl -sf -o /usr/local/bin/out2html https://drone.io/github.com/larrycai/out2html/files/out2html && chmod +x /usr/local/bin/out2html

# ADD sample proj
ADD craft-config.xml $JENKINS_HOME/jobs/craft/

# start script
ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 8080

CMD [ "/usr/local/bin/start.sh" ]