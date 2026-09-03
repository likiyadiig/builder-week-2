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
if ping -c 1 -W 2 1.1.1.1 > /dev/null 2>&1; then
echo "reachable"
else
echo "UNREACHABLE"
fi
echo ""
echo "Top 5 processes by memory"
ps aux --sort=-%mem | head -6
