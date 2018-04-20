echo "iteration 1"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.infini.result

echo "iteration 2"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.infini.result

echo "iteration 3"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.infini.result

echo "iteration 4"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.infini.result

echo "iteration 5"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.infini.result


echo "iteration 1"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.infini.result

echo "iteration 2"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.infini.result

echo "iteration 3"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.infini.result

echo "iteration 4"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.infini.result

echo "iteration 5"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> osu.infini.result

echo $(cat osu.infini.result | grep '65536')
