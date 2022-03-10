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

curl --location --request POST 'http://localhost:9003/service-c/queue-job' \
--header 'Content-Type: application/json' \
--header 'Cookie: XSRF-TOKEN=2728c2bd-7c23-4e6d-bd55-d376b192f134' \
--data-raw '{
    "jobType": "Job X",
    "jobData": [
        {
            "key": "param1",
            "value": "value1"
        }
    ]
}'
done

