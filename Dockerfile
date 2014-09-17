# sshd
#
# VERSION               0.0.1

FROM     ubuntu:14.04
MAINTAINER Alber Sanchez 

RUN apt-get -qq update && apt-get install --fix-missing -y --force-yes \
	openssh-server \
	sudo \ 
	postgresql-9.3-postgis-2.1 \ 
	postgresql-9.3-postgis-2.1-scripts \
	nano 


# Set environment
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN env


# Configure users
RUN echo 'root:xxxx.xxxx.xxxx' | chpasswd
RUN echo 'postgres:xxxx.xxxx.xxxx' | chpasswd


# Configure SSH
RUN mkdir /var/run/sshd
RUN sed -i 's/22/48901/g' /etc/ssh/sshd_config
RUN echo 'StrictHostKeyChecking no' >> /etc/ssh/ssh_config
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config





# Configure Postgres
RUN echo 'host all all 0.0.0.0/0 md5' >> /etc/postgresql/9.3/main/pg_hba.conf
RUN sed -i 's/5432/48902/g' /etc/postgresql/9.3/main/postgresql.conf
RUN sed -i 's/localhost/*/g' /etc/postgresql/9.3/main/postgresql.conf
RUN sed -i 's/#listen_addresses/listen_addresses/g' /etc/postgresql/9.3/main/postgresql.conf
ADD containerSetup.sh /containerSetup.sh
RUN chown root:root /containerSetup.sh
RUN chmod +x /containerSetup.sh


# Restarting services
RUN stop ssh
RUN start ssh
RUN /etc/init.d/postgresql restart


EXPOSE 48901
EXPOSE 48902


CMD ["/usr/sbin/sshd", "-D"]

