#!/bin/bash
echo "=== Server Status: $(hostname) ==="
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo "Public IP: $(curl -s --max-time 3 ifconfig.me)"
echo ""
echo "Firewall status:"
sudo ufw status
echo "Disk usage:"
df -h / | tail -1
echo ""
echo "Memory usage:"
free -h | grep Mem
echo""
echo "Network reachability check:"
if ping -c 1 -W 2 8.8.8.8 > /dev/null 2>&1; then
echo "Internet: reachable"
else
echo "Internet: unreachable"
fi
echo ""
echo "Top 5 processes by memory"
ps aux --sort=-%mem | head -6
