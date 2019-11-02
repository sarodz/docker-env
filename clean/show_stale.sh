#!/bin/bash
docker ps -a | rg "/bin/sh -c" | awk '{print $1 }'
