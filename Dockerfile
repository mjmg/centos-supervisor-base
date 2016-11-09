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
ADD supervisord.conf /etc/supervisor/supervisord.conf

# Run bash
# default command
CMD ["/bin/bash"]
