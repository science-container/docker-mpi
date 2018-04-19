ITERATION=$1


cd ~/minife/
for ((i=1;i<=ITERATION;i++));
do
echo "MiniFE:iteration $i"
echo "MiniFE:iteration $i" >> ~/progress.out
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 miniFE.x -nx=1000 -ny=1000 -nz=1000 
done
cat miniFE* | grep 'Total CG Mflops' >> ~/minife.results
echo "MiniFE execution is over" 
echo "################################MiniFE execution is over" >> ~/progress.out


cd ~/hpcg-apex/myhpcg/bin
for ((i=1;i<=ITERATION;i++));
do
echo "HPCG:iteration $i"
echo "HPCG:iteration $i" >> ~/progress.out
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 72 -hostfile hostfile  ./xhpcg
done
cat HPCG* | grep 'Final Summary::HPCG result is VALID with a GFLOP/s' >> ~/hpcg.results
echo "HPCG execution is over" 
echo "################################HPCG execution is over" >> ~/progress.out



cd ~/kmi_hash/tests/
for ((i=1;i<=ITERATION;i++));
do
echo "KMI Hash:iteration $i"
echo "KMI Hash:iteration $i" >> ~/progress.out
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node --hostfile ~/hostfile -np 72 ./BENCH_QUERY -n 5000000 -m 5000000 >> ~/kmi_hash_full.temp.results
done
cat ~/kmi_hash_full.temp.results | grep 'Query throughput' >>~/kmi_hash.results
echo "KMI Hash execution is over" 
echo "################################KMI Hash execution is over" >> ~/progress.out



cd ~/osu-micro-benchmarks-3.8-July12/mpi/collective
for ((i=1;i<=ITERATION;i++));
do
echo "OSU alltoall:iteration $i"
echo "OSU alltoall:iteration $i" >> ~/progress.out
mpirun --mca plm_rsh_no_tree_spawn 1 --map-by node -hostfile ~/hostfile -np 96 ./osu_alltoallv >> ~/osu_alltoallv_full.temp.results
done
cat ~/osu_alltoallv_full.temp.results | grep '65536' >> ~/osu_alltoallv.results
echo "OSU altoallv execution is over" 
echo "################################OSU altoallv execution is over" >> ~/progress.out

echo "-----------------FINISH----------------------------" >> ~/progress.out
