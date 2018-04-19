#/bin/bash

if [ -z "$1" ]
then
    echo "No argument supplied"
    exit
fi


echo "Pulling Docker image"
docker pull sciencecontainer/ompi3-infiniband:base &
wait


START=$1
END=$2
NETWORK=$3
IMAGE=$4

for i in $(seq $START $END);
do
    echo "::Container:rank:$i::"
    docker run --privileged -itd \
        --name rank$i \
        --device=/dev/infiniband/rdma_cm \
        --device=/dev/infiniband/uverbs0 \
        --device=/dev/infiniband/ucm0 \
        --device=/dev/infiniband/umad0 \
        --cpus=2.0 \
        --ulimit memlock=-1  \
        --network=$NETWORK \
        $IMAGE &
    wait
done


