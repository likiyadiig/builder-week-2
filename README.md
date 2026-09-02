# status.sh

**What is this:** A shell script that prints a quick health snapshot of a
Linux server — uptime, disk space, memory, and top memory-consuming
processes — in a single command.

**Who is it for:** Anyone managing a small droplet or VPS who wants a
fast status check without memorizing or chaining together separate
commands like `uptime`, `df`, `free`, and `ps`.

**Why it exists:** I got tired of typing four separate commands every
time I SSH'd in just to see if the server was healthy. This script pulls
the essentials into one readable report.
**Requirements:**
- Ubuntu 22.04 or later
- A user with sudo access (needed for firewall check)

**How do I run it:**
```bash
chmod +x status.sh
./status.sh
```

**What it looks like when it works:**
```
=== Server Status: fuelwithai-server ===
Date: Wed Sep  2 12:00:00 UTC 2026
Uptime: up 3 hours, 12 minutes

Disk usage:
/dev/vda1        25G  2.1G   22G   9% /

Memory usage:
Mem:          2.0Gi       450Mi       1.2Gi

Top 5 processes by memory:
USER   PID %CPU %MEM ...
```


Malik Machaieie, FuelWithAI Server Status, Week 2.
