#!/bin/bash
docker ps -a | rg "Exited .* minutes ago" | awk '{print $1 }'
