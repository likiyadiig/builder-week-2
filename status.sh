#!/bin/bash
echo "=== Server Status: $(hostname) ==="
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo "Public IP: $(curl -s ifconfig.me)"
echo ""
echo "Disk usage:"
df -h / | tail -1
echo ""
echo "Memory usage:"
free -h | grep Mem
echo""
echo "Top 5 processes by memory"
ps aux --sort=-%mem | head -6
