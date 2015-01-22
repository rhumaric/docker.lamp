FROM mysql:5.7.5
MAINTAINER Romaric Pascal <romaric.pascal@gmail.com>

RUN apt-get update

ENV SUPERVISOR_VERSION=3.0a8-1.1+deb7u1
RUN apt-get install -y supervisor=${SUPERVISOR_VERSION}

ENV APACHE_VERSION=2.2.22-13+deb7u4
ENV PHP_VERSION=5.4.36-0+deb7u3
RUN apt-get install -y apache2=${APACHE_VERSION} php5=${PHP_VERSION} php5-mysql

ADD supervisor/conf.d /etc/supervisor/conf.d

EXPOSE 443
EXPOSE 80

# Run services using supervisor with the nodaemon option
# so the container stays up
CMD ["supervisord", "-n"]