#!/bin/bash
docker images | rg "<none>.*<none>" | awk '{print $3 }'
