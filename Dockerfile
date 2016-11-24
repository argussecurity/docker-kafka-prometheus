FROM wurstmeister/kafka:0.10.1.0

# prometheus
ADD prometheus-config.yml /usr/app/prometheus-config.yml
ADD http://central.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.7/jmx_prometheus_javaagent-0.7.jar /usr/app/jmx_prometheus_javaagent.jar
RUN chmod +r /usr/app/jmx_prometheus_javaagent.jar

# unset KAFKA_OPTS and KAFKA_JMX_OPTS in create-topics.sh scripts to eliminate "address already in use" error because of the javaagent
RUN sed -i 's#while netstat#export KAFKA_OPTS=\nexport KAFKA_JMX_OPTS=\nwhile netstat#g' /usr/bin/create-topics.sh
