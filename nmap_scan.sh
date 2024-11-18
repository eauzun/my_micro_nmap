#!/bin/bash

# Display welcome message
echo -e "Welcome to my Tiny and Sweety Network Mapping Tool \nMade by: https://github.com/eauzun\n"

TARGET=$1
START_PORT=$2
END_PORT=$3
OUTPUT_FILE=$4
SCAN_TYPE=$5
VERBOSE=$6
TIMEOUT=$7

if [ -z "$TARGET" ] || [ -z "$START_PORT" ] || [ -z "$END_PORT" ]; then
  echo "Usage: $0 <Target IP> <Start Port> <End Port> [Output File] [Scan Type] [Verbose] [Timeout]"
  exit 1
fi

if [ -z "$OUTPUT_FILE" ]; then
  OUTPUT_FILE="nmap_scan_results.txt"
fi

SCAN_OPTIONS=""

if [ "$SCAN_TYPE" == "tcp" ]; then
  SCAN_OPTIONS="-sT"
elif [ "$SCAN_TYPE" == "udp" ]; then
  SCAN_OPTIONS="-sU"
else
  echo "Invalid scan type. Use 'tcp' or 'udp'."
  exit 1
fi

if [ "$VERBOSE" == "yes" ]; then
  SCAN_OPTIONS="$SCAN_OPTIONS -v"
fi

if [ ! -z "$TIMEOUT" ]; then
  SCAN_OPTIONS="$SCAN_OPTIONS --host-timeout $TIMEOUT"
fi

echo "Starting Nmap scan on $TARGET ($START_PORT-$END_PORT) with options: $SCAN_OPTIONS"
nmap $SCAN_OPTIONS -p $START_PORT-$END_PORT $TARGET -oN $OUTPUT_FILE

echo "Scan completed. Results saved to $OUTPUT_FILE."

