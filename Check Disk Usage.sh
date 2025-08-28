#!/bin/bash

usage=$(df -h | grep '/$' | awk '{print $5}' | sed 's/%//')

if [ $usage -ge 80 ]
then
    echo "⚠️ Disk usage is above 80%: $usage%"
else
    echo "✅ Disk usage is normal: $usage%"
fi
