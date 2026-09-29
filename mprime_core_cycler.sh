#!/bin/bash

# Configuration
TEST_DURATION="120" # 2 minutes per thread (in seconds)
NUM_CORES=$(nproc)  # Automatically detects 12 threads on Ryzen 5 5600

echo "=================================================="
echo " Starting mprime Core Cycler ($TEST_DURATION sec per core)"
echo " Total Cores/Threads to test: $NUM_CORES"
echo " Monitoring for Machine Check Exceptions (MCE)..."
echo "=================================================="

# Ensure prime.log exists or create it
touch prime.log

for (( core=0; core<$NUM_CORES; core++ )); do
    echo ""
    echo "[$(date +'%H:%M:%S')] ---> Testing Thread $core of $((NUM_CORES-1)) <---"
    
    # Record starting log line count to check for new errors specifically during this run
    LOG_START=$(wc -l < prime.log 2>/dev/null || echo 0)

    # Launch mprime bound to the current thread in the background
    # Note: Requires mprime to be in your PATH or current directory
    taskset -c $core mprime -t > /dev/null 2>&1 &
    MPRIME_PID=$!

    # Wait for the specified test duration
    sleep $TEST_DURATION

    # Gracefully terminate mprime
    kill $MPRIME_PID 2>/dev/null
    wait $MPRIME_PID 2>/dev/null

    # Check prime.log for fatal rounding errors during this run
    LOG_END=$(wc -l < prime.log 2>/dev/null || echo 0)
    if [ "$LOG_END" -gt "$LOG_START" ]; then
        NEW_ERRORS=$(sed -n "$((LOG_START+1)),${LOG_END}p" prime.log | grep -iE "FATAL|ERROR|Hardware failure")
        if [ -n "$NEW_ERRORS" ]; then
            echo " [!] ERROR DETECTED ON THREAD $core:"
            echo "$NEW_ERRORS"
            echo " [!] Thread $core failed Curve Optimizer stability. Exiting..."
            exit 1
        fi
    fi

    # Check system kernel log for hardware errors (MCE)
    MCE_CHECK=$(dmesg | tail -n 20 | grep -iE "mce|hardware error")
    if [ -n "$MCE_CHECK" ]; then
        echo " [!] MCE/Hardware Error detected in dmesg on Thread $core!"
        echo "$MCE_CHECK"
        exit 1
    fi

    echo " [✓] Thread $core passed $TEST_DURATION seconds without errors."
done

echo ""
echo "=================================================="
echo " All $NUM_CORES threads successfully passed mprime testing!"
echo "=================================================="
