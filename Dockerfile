FROM registry.access.redhat.com/ubi8/ubi:latest


#Install EPEL
RUN \
  dnf install -y epel-release
  
# Update System Image
RUN \
  dnf update -y && \
  dnf upgrade -y

#install additional tools 
RUN \
  dnf install -y unzip wget mc

# Configure Supervisor
RUN \
  dnf install -y supervisor && \
  mkdir -p /var/log/supervisor

# supervisor base configuration
ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/bin/bash"]
