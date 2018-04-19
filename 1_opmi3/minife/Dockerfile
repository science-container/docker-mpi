FROM sciencecontainer/ompi3:base
USER root
RUN ldconfig

USER mpi
WORKDIR /home/mpi
RUN wget https://github.com/mantevo/minife/archive/c34d8a2.tar.gz -O - | tar xz && \
    mv miniFE* minife && \
    cd minife/ref/src && \
    make &&\
    sudo mv miniFE.x /usr/bin/


EXPOSE 9100
CMD ["sh", "-c", "sudo /usr/sbin/sshd -p 9100 ; export OMP_NUM_THREADS=4 ; /bin/bash"]

