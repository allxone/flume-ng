FROM centos:6.6
MAINTAINER allxone@hotmail.com
RUN yum -y install tar && yum clean all
RUN curl http://apache.panu.it/flume/1.5.2/apache-flume-1.5.2-bin.tar.gz | tar xz
ENV $FLUME_AGENT=agent $FLUME_CONF_FILE=conf/flume-conf.properties.template
WORKDIR apache-flume-1.5.2-bin
ENTRYPOINT bin/flume-ng agent -n $FLUME_AGENT -c conf -f $FLUME_CONF_FILE

