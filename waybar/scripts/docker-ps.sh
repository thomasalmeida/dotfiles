#!/bin/bash

docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}"
echo
echo "Press Enter to close..."
read
