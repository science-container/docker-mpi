echo "iteration 1"
mpirun -np 72 -hostfile ~/hostfile --mca plm_rsh_no_tree_spawn 1 --map-by node ./xhpcg

echo "iteration 2"
mpirun -np 72 -hostfile ~/hostfile --mca plm_rsh_no_tree_spawn 1 --map-by node ./xhpcg

echo "iteration 3"
mpirun -np 72 -hostfile ~/hostfile --mca plm_rsh_no_tree_spawn 1 --map-by node ./xhpcg

echo "iteration 4"
mpirun -np 72 -hostfile ~/hostfile --mca plm_rsh_no_tree_spawn 1 --map-by node ./xhpcg

echo "iteration 5"
mpirun -np 72 -hostfile ~/hostfile --mca plm_rsh_no_tree_spawn 1 --map-by node ./xhpcg



mpirun -np 72 -hostfile ~/hostfile --mca plm_rsh_no_tree_spawn 1 --map-by node ./xhpcg

echo "iteration 2"
mpirun -np 72 -hostfile ~/hostfile --mca plm_rsh_no_tree_spawn 1 --map-by node ./xhpcg

echo "iteration 3"
mpirun -np 72 -hostfile ~/hostfile --mca plm_rsh_no_tree_spawn 1 --map-by node ./xhpcg

echo "iteration 4"
mpirun -np 72 -hostfile ~/hostfile --mca plm_rsh_no_tree_spawn 1 --map-by node ./xhpcg

echo "iteration 5"
mpirun -np 72 -hostfile ~/hostfile --mca plm_rsh_no_tree_spawn 1 --map-by node ./xhpcg


cat HPCG* | grep 'HPCG result is VALID with a GFLOP' >> hpcgFinal.results

end=`date +%s`
runtime=$((end-start))
echo "Required time: $runtime" >> hpcgFinal.results

