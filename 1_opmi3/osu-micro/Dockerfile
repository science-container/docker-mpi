FROM sciencecontainer/ompi3:base
USER root
RUN ldconfig

USER mpi
WORKDIR /home/mpi/
RUN wget http://www.nersc.gov/assets/Trinity--NERSC-8-RFP/Benchmarks/July12/osu-micro-benchmarks-3.8-July12.tar
RUN tar -xvf osu-micro-benchmarks-3.8-July12.tar
WORKDIR osu-micro-benchmarks-3.8-July12
RUN ./configure
RUN make
WORKDIR mpi/collective

EXPOSE 9100
CMD ["sh", "-c", "sudo /usr/sbin/sshd -p 9100 ; export OMP_NUM_THREADS=4 ; /bin/bash"]


