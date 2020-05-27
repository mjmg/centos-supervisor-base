FROM centos:latest


#Install EPEL
RUN \
  yum install -y epel-release
  
# Update System Image
RUN \
  yum update -y && \
  yum upgrade -y

#install additional tools 
RUN \
  yum install -y unzip wget mc

# Configure Supervisor
RUN \
  yum install -y supervisor && \
  mkdir -p /var/log/supervisor

# supervisor base configuration
ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/bin/bash"]
