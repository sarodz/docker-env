#!/bin/bash

payload=$1
content=${2:-text/csv}

curl --data-binary @${payload} -H "Content-Type: ${content}" -v http://localhost:8080/invocations
#curl --data-binary @${payload} -H "Content-Type: ${content}" -v https://runtime.sagemaker.us-west-2.amazonaws.com/endpoints/decision-trees-example-small/invocations
