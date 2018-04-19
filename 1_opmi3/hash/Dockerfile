FROM sciencecontainer/ompi3:base
USER root
RUN ldconfig

USER mpi
WORKDIR /home/mpi
RUN wget https://asc.llnl.gov/CORAL-benchmarks/Datacentric/KMI_HASH_CORAL.tar.gz
RUN tar -zxvf KMI_HASH_CORAL.tar.gz
RUN cd kmi_hash/src && make
RUN cd kmi_hash/tests && make

EXPOSE 9100
CMD ["sh", "-c", "sudo /usr/sbin/sshd -p 9100 ; export OMP_NUM_THREADS=4 ; /bin/bash"]

