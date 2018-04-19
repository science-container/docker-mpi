

start=`date +%s`

echo "iteration 1"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> hashFinal.results

echo "iteration 2"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> hashFinal.results

echo "iteration 3"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> hashFinal.results

echo "iteration 4"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> hashFinal.results

echo "iteration 5"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> hashFinal.results

echo "iteration 1"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> hashFinal.results

echo "iteration 2"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> hashFinal.results

echo "iteration 3"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> hashFinal.results

echo "iteration 4"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> hashFinal.results

echo "iteration 5"
mpirun -mca mtl_mxm_np 0 --mca btl openib --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> hashFinal.results


end=`date +%s`
runtime=$((end-start))
echo "Required time: $runtime" >> hashFinal.results
