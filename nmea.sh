#!/bin/bash
# Use this as a xinetd service to stream nmea data 
gps_stat=$(ps aux | grep test_gps|grep -v grep)
if [ -z $gps_stat ];then
  test_gps|grep nmea|awk '{print $3}'|grep GP >> /dev/gps
  tail -f /dev/gps
else
  tail -f /dev/gps
fi
