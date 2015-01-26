FROM mysql:5.7.5
MAINTAINER Romaric Pascal <romaric.pascal@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

ENV PYTHON_VERSION=2.7.3-4+deb7u1
ENV SETUPTOOLS_VERSION=0.6.24-1
ENV SUPERVISOR_VERSION=3.1.3
RUN apt-get install -y python=${PYTHON_VERSION} python-setuptools=${SETUPTOOLS_VERSION} \
    && easy_install supervisor==${SUPERVISOR_VERSION} \
    && mkdir -p /var/log/supervisor \
    && ln -s /etc/supervisor/supervisord.conf /etc/supervisord.conf


ENV APACHE_VERSION=2.2.22-13+deb7u4
ENV PHP_VERSION=5.4.36-0+deb7u3
RUN apt-get install -y apache2=${APACHE_VERSION} php5=${PHP_VERSION} php5-mysql

# Enable some apache modules
RUN a2enmod rewrite

# Remove default content from /var/www as its content is intended to be brought
# mounting volumes or ADDing content to a child image
RUN rm -r /var/www/index.html

ADD supervisor /etc/supervisor
ADD apache2 /etc/apache2

ENV APACHE_DOCROOT=/var/www

EXPOSE 443
EXPOSE 80

# Run services using supervisor with the nodaemon option
# so the container stays up
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]