#/bin/bash
echo "Installing InfiniBand Support"
sudo yum -y groupinstall "Infiniband Support"
sudo yum -y install infiniband-diags perftest gperf
sudo yum install nano -y
sudo yum install wget -y
sudo yum install vim -y 
echo "Starting and enabling rdma"
sudo systemctl start rdma & 
wait 
sudo systemctl enable rdma & 
wait 

echo "Downloading OFED from Mellanox"
MLNX_OFED=MLNX_OFED_LINUX-4.3-1.0.1.0-rhel7.4-x86_64
#MLNX_OFED_PKG=MLNX_OFED_LINUX-4.3-1.0.1.0-rhel7.4-x86_64.tgz
#wget http://www.mellanox.com/downloads/ofed/$MLNX_OFED/$MLNX_OFED_PKG 

echo "Installing required dependencies"
sudo yum install kernel-devel-3.10.0-693.5.2.el7.x86_64 -y
sudo yum install gtk2 atk cairo tcl tk -y
sudo yum install tcsh -y
tar -xvf MLNX_OFED* 
cd MLNX_OFED_LINUX-4.3-1.0.1.0-rhel7.4-x86_64 && sudo ./mlnxofedinstall --add-kernel-support --skip-repo &

wait 

sudo modprobe -rv  ib_isert rpcrdma ib_srpt & 

echo "Starting OpenIB driver"
sudo /etc/init.d/openibd restart & 

wait 

echo "Installing OpenMPI"
OPENMPI_PKG=openmpi-3.0.0

wget https://www.open-mpi.org/software/ompi/v3.0/downloads/$OPENMPI_PKG.tar.gz
tar -xvf openmpi-3.0.0.tar.gz && \
cd /home/cc && cd $OPENMPI_PKG && \
./configure --prefix=/usr/local && \
sudo make -j9 all && sudo make -j9 install & 

wait 


#echo "Installing OSU benchmarks for testing"
#cd /home/cc && \
 #wget http://www.nersc.gov/assets/Trinity--NERSC-8-RFP/Benchmarks/July12/osu-micro-benchmarks-3.8-July12.tar && tar -xvf osu-#micro-benchmarks-3.8-July12.tar  && cd  osu-micro-benchmarks-3.8-July12 &&  ./configure && make & 

#wait 

echo "Installing Docker"
/bin/bash dockerInstall.sh & 
wait 


rm osu-micro-benchmarks-3.8-July12.tar
rm openmpi-3.0.0.tar.gz

cp ssh/* .ssh/
cd .ssh/ && cat id_rsa.pub >> authorized_keys

exit 
