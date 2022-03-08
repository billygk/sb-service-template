#!/bin/bash

while true; do
sltime=$((1 + $RANDOM % 10))
echo ""
echo "--- service A ---"
curl http://localhost:9001/service-a
#http :9001/service-a
echo ""
echo "--- service B ---"
curl http://localhost:9002/service-b
#http :9002/service-b

if [ $((sltime%2)) -eq 0 ]
then
echo ""
echo "--- service C ---"
curl http://localhost:9003/service-c
#http :9003/service-c
fi
#sleep 1
echo "sleeping ... 0.$sltime"
#sleep "0.$sltime"

done

