
start=`date +%s`
echo "iteration 1"
mpirun  --mca mtl_mxm_np 0 --mca btl self,openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 miniFE.x -nx=1000 -ny=1000 -nz=1000

echo "iteration 2"
mpirun  --mca mtl_mxm_np 0 --mca btl self,openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 miniFE.x -nx=1000 -ny=1000 -nz=1000

echo "iteration 3"
mpirun  --mca mtl_mxm_np 0 --mca btl self,openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 miniFE.x -nx=1000 -ny=1000 -nz=1000

echo "iteration 4"
mpirun  --mca mtl_mxm_np 0 --mca btl self,openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 miniFE.x -nx=1000 -ny=1000 -nz=1000

echo "iteration 5"
mpirun  --mca mtl_mxm_np 0 --mca btl self,openib --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 miniFE.x -nx=1000 -ny=1000 -nz=1000

cat miniFE* | grep 'Total CG Mflops' >> minifeFinal.results

end=`date +%s`
runtime=$((end-start))
echo "Required time: $runtime" >> minifeFinal.results

