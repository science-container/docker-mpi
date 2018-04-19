echo "iteration 1"
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.result

echo "iteration 2"
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.result

echo "iteration 3"
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.result

echo "iteration 4"
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.result

echo "iteration 5"
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.result


echo "iteration 1"
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.result

echo "iteration 2"
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.result

echo "iteration 3"
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.result

echo "iteration 4"
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.result

echo "iteration 5"
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.result

echo $(cat osu.result | grep '65536')
