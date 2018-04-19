FROM sciencecontainer/ompi3-infiniband:base
USER root
RUN ldconfig

USER mpi
WORKDIR /home/mpi
RUN wget http://www.netlib.org/benchmark/hpl/hpl-2.2.tar.gz
RUN tar -zxvf hpl-2.2.tar.gz

WORKDIR hpcg-apex
RUN mkdir  my_hpcg_apex
WORKDIR my_hpcg_apex
RUN mv ../bin/hpcg-small.dat ../bin/hpcg.dat

RUN ../configure MPI_GCC_OMP
RUN make
#--------- exposing port for ssh
EXPOSE 9100

CMD ["sh", "-c", "/usr/sbin/sshd -p 9100; export OMP_NUM_THREADS=4 ; /bin/bash"]

