#!/bin/bash
echo "=== Server Status: $(hostname) ==="
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo "Public IP: $(curl -s --max-time 3 ifconfig.me)"
echo ""
echo "Firewall status:"
if ufw_out=$(timeout 5 sudo -n ufw status 2>/dev/null); then
echo "$ufw_out"
else
echo "unavailable (needs sudo)"
fi
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
if apt_sim=$(timeout 10 apt-get -s -o Debug::NoLocking=true upgrade 2>/dev/null); then
security_count=$(printf '%s\n' "$apt_sim" | grep -c -- '^Inst .*-security')
else
security_count="unknown"
fi
echo "Pending security updates:"
echo "$security_count"
echo ""
echo "Top 5 processes by memory"
ps aux --sort=-%mem | head -6
