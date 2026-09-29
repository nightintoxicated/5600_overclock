#!/bin/bash

# Configuration
SPIKES_PER_CORE=5
WORKLOAD_TIME="2s"
IDLE_GAP="0.5"
NUM_CORES=$(nproc)

echo "=================================================="
echo " Starting Transient Idle-to-Boost Stress Test"
echo " Cores: 0 to $((NUM_CORES-1)) | $SPIKES_PER_CORE spikes per core"
echo " Burst: $WORKLOAD_TIME | Idle gap: ${IDLE_GAP}s"
echo "=================================================="

for (( core=0; core<$NUM_CORES; core++ )); do
    echo ""
    echo "Testing Thread $core with rapid power spikes..."
    
    for (( i=1; i<=$SPIKES_PER_CORE; i++ )); do
        printf "  Spike %d/%d... " "$i" "$SPIKES_PER_CORE"
        
        # Fire stress-ng on matrix multiplication for 2s bound to specific core
        taskset -c $core stress-ng --cpu 1 --cpu-method matrixprod -t $WORKLOAD_TIME > /dev/null 2>&1
        EXIT_CODE=$?

        if [ $EXIT_CODE -ne 0 ]; then
            echo -e "\n [!] stress-ng reported a calculation error on Thread $core!"
            echo " [!] Curve Optimizer -25 is unstable on Thread $core during transient loads."
            exit 1
        fi

        # Immediate state transition back to idle state
        sleep $IDLE_GAP
        echo "OK"
    done
done

echo ""
echo "=================================================="
echo " Transient test complete! No worker errors detected."
echo "=================================================="
