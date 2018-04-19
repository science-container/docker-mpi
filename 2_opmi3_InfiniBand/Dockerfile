FROM centos:7
USER root
RUN yum update -y
RUN yum install wget -y
RUN yum install gcc gcc-c++ make openssl-devel -y
RUN yum install openssh-server -y
RUN yum install openssh-clients -y
RUN yum install nano -y
RUN yum install vim -y
RUN yum install sudo -y

RUN wget https://www.open-mpi.org/software/ompi/v3.0/downloads/openmpi-3.0.0.tar.gz
RUN gunzip -c openmpi-3.0.0.tar.gz | tar xf -
RUN cd openmpi-3.0.0/  && ./configure --prefix=/usr/local && make all install

#---------- adding default user 
ARG USER=mpi
ENV USER=${USER}
RUN useradd -m ${USER} &&  echo "$USER ALL=(ALL) NOPASSWD:ALL" |  tee -a /etc/sudoers

ENV USER_HOME /home/${USER}
RUN chown -R ${USER}:${USER} ${USER_HOME}  
RUN mkdir /var/run/sshd && chmod -rx /var/run/sshd

#---------- creating directory for default user
ARG WORKDIR=/project
ENV WORKDIR ${WORKDIR}
RUN mkdir ${WORKDIR}
RUN chown -R ${USER}:${USER} ${WORKDIR}

WORKDIR ${WORKDIR}

#---------- setting up SSH Server 
#--Add host keys
RUN cd /etc/ssh/ && ssh-keygen -A -N ''
RUN  sed -i "s/#PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config \
  && sed -i "s/#PermitRootLogin.*/PermitRootLogin no/g" /etc/ssh/sshd_config \
  && sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config

#--Unlock non-password USER to enable SSH login
RUN passwd -f -d ${USER}
RUN passwd -f -u ${USER}

#--Set up user's public and private keys
ENV SSHDIR ${USER_HOME}/.ssh
RUN mkdir -p ${SSHDIR}

#--Default ssh config file that skips (yes/no) question when first login to the host
RUN echo "StrictHostKeyChecking no" > ${SSHDIR}/config
RUN echo "Port 9100" >> ${SSHDIR}/config
#--This file can be overwritten by the following onbuild step if ssh/ directory has config file

#--Switch back to default user
USER ${USER}

CMD ["/bin/bash"]

#-------- ONBUILD (require ssh/ directory in the build context)

ONBUILD USER root
ONBUILD COPY ssh/ ${SSHDIR}/
ONBUILD RUN cat ${SSHDIR}/*.pub >> ${SSHDIR}/authorized_keys
ONBUILD RUN chmod -R 600 ${SSHDIR}/* \
         && chown -R ${USER}:${USER} ${SSHDIR}

#-- Switch back to default user when continue the build process
ONBUILD USER ${USER}

