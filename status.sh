#!/bin/bash
echo "=== Server Status: $(hostname) ==="
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo ""
echo "Disk usage:"
df -h / | tail -1
echo ""
echo "Memory usage:"
free -h | grep mem
echo""
echo "Top 5 processes by memory"
ps aux --sort=-%mem | head -6
