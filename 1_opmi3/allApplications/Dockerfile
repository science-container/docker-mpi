FROM sciencecontainer/ompi3:base
USER root
RUN ldconfig

USER mpi
WORKDIR /home/mpi

######### installing MiniFE
RUN wget https://github.com/mantevo/minife/archive/c34d8a2.tar.gz -O - | tar xz && \
    mv miniFE* minife && \
    cd minife/ref/src && \
    make &&\
    sudo mv miniFE.x /usr/bin/

######### installing HPCG
WORKDIR /home/mpi
RUN wget http://portal.nersc.gov/project/m888/apex/hpcg-apex_160525.tgz
RUN tar -zxvf hpcg-apex_160525.tgz
WORKDIR hpcg-apex
RUN mkdir  myhpcg
WORKDIR myhpcg
RUN mv ../bin/hpcg-small.dat ../bin/hpcg.dat
RUN ../configure MPI_GCC_OMP
RUN make

######### installing KMI Hash
WORKDIR /home/mpi
RUN wget https://asc.llnl.gov/CORAL-benchmarks/Datacentric/KMI_HASH_CORAL.tar.gz
RUN tar -zxvf KMI_HASH_CORAL.tar.gz
RUN cd kmi_hash/src && make
RUN cd kmi_hash/tests && make

######### installing OSU micro
WORKDIR /home/mpi/
RUN wget http://www.nersc.gov/assets/Trinity--NERSC-8-RFP/Benchmarks/July12/osu-micro-benchmarks-3.8-July12.tar
RUN tar -xvf osu-micro-benchmarks-3.8-July12.tar
WORKDIR osu-micro-benchmarks-3.8-July12
RUN ./configure
RUN make

WORKDIR /home/mpi/
EXPOSE 9100
CMD ["sh", "-c", "sudo /usr/sbin/sshd -p 9100 ; export OMP_NUM_THREADS=4 ; /bin/bash"]

