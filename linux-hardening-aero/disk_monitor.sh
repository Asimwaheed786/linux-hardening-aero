#!/bin/bash
THRESHOLD=80
LOGFILE="/var/log/disk_monitor.log"

usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$usage" -ge "$THRESHOLD" ]; then
    echo "$(date): WARNING - Disk usage is at ${usage}%" >> "$LOGFILE"
else
    echo "$(date): Disk usage is normal at ${usage}%" >> "$LOGFILE"
fi
