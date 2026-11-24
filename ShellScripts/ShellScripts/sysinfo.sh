#!/bin/bash
# Author: Aanya Sharma
# Description: System Information Report for CSE103 Capstone

echo "=================================================="
echo "SYSTEM INFORMATION REPORT"
echo "Name: Aanya Sharma | Roll No: 2601730310"
echo "Date: $(date)"
echo "=================================================="

echo ""
echo "--- CPU Details ---"
CPU_MODEL=$(lscpu | awk -F':' '/Model name:/ {print $2}' | xargs)
CPU_CORES=$(lscpu | awk -F':' '/^Core\(s\) per socket:/ {print $2}' | xargs)
LOGICAL_CPUS=$(lscpu | awk -F':' '/^CPU\(s\):/ {print $2}' | xargs)
echo "CPU Model: $CPU_MODEL"
echo "CPU Cores: $CPU_CORES cores ($LOGICAL_CPUS logical CPUs)"

echo ""
echo "--- Memory Usage ---"
free -h | awk '/^Mem:/ {print "Total Memory: " $2 " | Used Memory: " $3}'

echo ""
echo "--- Top 3 Processes by CPU Usage ---"
echo "PID      COMMAND          %CPU"
ps -eo pid,comm,%cpu --no-headers | sort -k3 -rn | head -n 3

echo ""
echo "=================================================="
echo "Report generated successfully."
echo "=================================================="