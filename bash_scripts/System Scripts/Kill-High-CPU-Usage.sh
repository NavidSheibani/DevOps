#!/bin/bash
echo "Top CPU-consuming processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -10

read -p "Enter PID to kill: " PID
kill -9 "$PID"
echo "Process $PID killed!"


######
#This script lists the top CPU-consuming processes and allows you to kill them.
#NavidSheibani
######
