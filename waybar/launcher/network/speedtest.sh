#!/bin/bash

# Run speedtest-cli and store the results
# SPEED will hold the download and upload speeds extracted from the speedtest-cli output
SPEED=$(speedtest-cli --simple | grep -Eo '[0-9]*\.[0-9]*')
# Extract upload and download speeds using awk
UPLOAD=$(echo $SPEED | awk '{print $1}')
DOWNLOAD=$(echo $SPEED | awk '{print $2}')
# Get the current timestamp in MM/DD/YYYY HH:MM:SS format
TIMESTAMP=$(date +"%m/%d/%Y %H:%M:%S")

# Send a notification with the results and timestamp
notify-send "Speedtest Results" "Download: $DOWNLOAD Mbps\nUpload: $UPLOAD Mbps\n$TIMESTAMP"

# Define the directory where the results will be stored
RESULT_DIR=~/dotfiles/waybar/launcher/network/.speedtest_results
# Ensure the result directory exists
mkdir -p "$RESULT_DIR"
# Append the current result to a file named with the current date (YYYYMMDD.txt format)
# Each line in the file represents a speed test result, with the timestamp and speeds
echo "$TIMESTAMP - Download: $DOWNLOAD Mbps, Upload: $UPLOAD Mbps" >> "$RESULT_DIR/$(date +"%Y%m%d").txt"

# Find and remove result files in the result directory that are older than 7 days
# This keeps the result directory from growing indefinitely over time
find "$RESULT_DIR" -type f -mtime +7 -exec rm {} \;
