#!/bin/bash



# CPU Usage

CPU_PERCENT=$(mpstat 1 1 | awk '/Average:/ {printf "%.0f", 100 - $NF}')



# Memory Usage

MEM_PERCENT=$(free -m | awk 'NR==2 {printf "%.0f", ($3/$2) * 100}')



# Disk Usage (Root Partition)

DISK_PERCENT=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')



# Network Usage (RX/TX in MB)

RX=$(ifconfig | grep "RX bytes" | awk '{sum += $5} END {print sum/1048576}')

TX=$(ifconfig | grep "TX bytes" | awk '{sum += $5} END {print sum/1048576}')



# Process Count

PROCESSES=$(ps aux | wc -l | awk '{print $1 - 1}')



# User Count

USERS=$(who | wc -l)



# Load Average

LOAD=$(uptime | awk -F 'load average: ' '{print $2}' | sed 's/, / /g')



# Running Processes (Top 5)

RUNNING_PROCESSES=$(ps aux --sort=-%cpu | head -n 6 | tail -n 5 | awk '{print $11, $3, $4}')



# Process Start Times (First 3 Processes)

START_TIMES=$(ps aux | head -n 4 | tail -n 3 | awk '{print $11, $9}')



# Free Disk Space (Root Partition)

FREE_DISK=$(df -h / | awk 'NR==2 {print $4}')



# Free RAM

FREE_RAM=$(free -m | awk 'NR==2 {print $4}')



# CPU Model

CPU_MODEL=$(cat /proc/cpuinfo | grep "model name" | head -n 1 | cut -d ":" -f 2 | sed 's/^ *//')



# Total Memory

TOTAL_MEM=$(free -m | awk 'NR==2 {print $2}')



# Total Disk Space (Root Partition)

TOTAL_DISK=$(df -h / | awk 'NR==2 {print $2}')



# Total CPUs

TOTAL_CPUS=$(nproc)



# GPU Usage (NVIDIA, if available)

GPU_PERCENT=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader 2>/dev/null | awk '{sum+=$1} END {if (NR > 0) print sum/NR; else print "N/A"}')



# GPU Name (NVIDIA, if available)

GPU_NAME=$(nvidia-smi --query-gpu=name --format=csv,noheader 2>/dev/null)



# IP Address and MAC Address

IP_ADDRESS=$(ip addr show | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -d '/' -f 1)

MAC_ADDRESS=$(ip link show | grep "link/ether" | awk '{print $2}')



# Output

echo "IP Address: ${IP_ADDRESS}"

echo "MAC Address: ${MAC_ADDRESS}"​

echo "CPU: ${CPU_PERCENT}%"

echo "Total CPUs: ${TOTAL_CPUS}"

echo "CPU Model: ${CPU_MODEL}"

echo "Mem: ${MEM_PERCENT}%"

echo "Free RAM: ${FREE_RAM} MB"

echo "Total RAM: ${TOTAL_MEM} MB"

echo "Disk: ${DISK_PERCENT}%"

echo "Free Disk: ${FREE_DISK}"

echo "Total Disk: ${TOTAL_DISK}"

echo "GPU: ${GPU_PERCENT}%"

echo "GPU Name: ${GPU_NAME}"

echo "Net: ${RX%.0f}/${TX%.0f} MB"

echo "Proc: ${PROCESSES}"

echo "Users: ${USERS}"

echo "Load: ${LOAD}"

echo "Running Processes (Command, %CPU, %MEM):"

echo "$RUNNING_PROCESSES"

echo "Process Start Times (Command, Start Time):"

echo "$START_TIMES"
