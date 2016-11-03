FROM centos:latest

# Update System Image
RUN \
  yum update -y && \
  yum upgrade -y
  
#install additional tools 
RUN \
  yum install -y unzip wget
  
# Configure Supervisor
RUN \
  yum install -y python-setuptools && \
  easy_install supervisor && \
  mkdir -p /var/log/supervisor
  
# supervisor base configuration
ADD supervisor.conf /etc/supervisor.conf

# Run bash
ADD bash.conf /etc/supervisor/conf.d/bash.conf

# default command
CMD ["supervisord", "-c", "/etc/supervisor.conf"]
