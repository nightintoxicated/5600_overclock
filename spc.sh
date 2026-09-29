echo "fast check begin"
for i in {0..11}; do 
taskset -c $i stress-ng --cpu 1 --cpu-method matrixprod --timeout 1s
done

for i in {0..11}; do 
taskset -c $i stress-ng --cpu 1 --cpu-method matrixprod --timeout 3s
done

for i in {0..11}; do 
taskset -c $i stress-ng --cpu 1 --cpu-method matrixprod --timeout 10s
done

echo "fast check done"
echo "---------------"





echo "2m checks begin"
for i in {0..11}; do 
taskset -c $i stress-ng --cpu 1 --cpu-method matrixprod --timeout 2m
done
echo "2m checks done"
