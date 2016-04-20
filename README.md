# docker-kafka

Based on [wurstmeister/kafka-docker](https://github.com/wurstmeister/kafka-docker), 

with [Prometheus.io](http://prometheus.io)'s [JMX Exporter](https://github.com/prometheus/jmx_exporter) added,

so you can use it as a javaagent, to export metrics to Prometheus.


## Notes

Tag from `wurstmeister/kafka` is missing? Send a pull request and we'll trigger a build.


## Usage

To use the Prometheus JMX Exporter as a java agent and export the metrics, you should export environment variable

`KAFKA_OPTS=-javaagent:/usr/app/jmx_prometheus_javaagent.jar=<LISTEN_PORT>:<PATH_TO_CONFIG_FILE>` (see [JMX Exporter's doc](https://github.com/prometheus/jmx_exporter#building-and-running))

`PATH_TO_CONFIG_FILE` can be set to `/usr/app/prometheus-config.yml` to use JMX Exporter's suggested default configurations.


### Example

`docker run -p 9092:9092 -p 8080:8080 -e "KAFKA_OPTS=-javaagent:/usr/app/jmx_prometheus_javaagent.jar=8080:/usr/app/prometheus-config.yml" argussecurity/kafka:0.9.0.1`
