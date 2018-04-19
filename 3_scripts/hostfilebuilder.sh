#/bin/bash

if [ -z "$1" ]
then
    echo "No argument supplied"
    exit
fi

START=$1
END=$2
CONTAINER_NAME=$3

for i in $(seq $START $END);
do
    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_NAME$i >> hostfile
done


