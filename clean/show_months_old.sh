#!/bin/bash
docker ps -a | rg "Exited .* months ago" | awk '{print $1 }'
