FROM sciencecontainer/ompi3:base
USER root
RUN ldconfig

USER mpi
WORKDIR /home/mpi
RUN wget http://portal.nersc.gov/project/m888/apex/hpcg-apex_160525.tgz
RUN tar -zxvf hpcg-apex_160525.tgz
WORKDIR hpcg-apex
RUN mkdir  myhpcg
WORKDIR myhpcg
RUN mv ../bin/hpcg-small.dat ../bin/hpcg.dat
RUN ../configure MPI_GCC_OMP
RUN make

EXPOSE 9100
CMD ["sh", "-c", "sudo /usr/sbin/sshd -p 9100 ; export OMP_NUM_THREADS=4 ; /bin/bash"]

