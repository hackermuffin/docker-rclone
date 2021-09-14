#!/bin/sh

# Check if remote is already configured
if rclone about remote: > /dev/null 2&>1; then
    echo "Remote configured"
# If not, exit
else
    echo "Remote not configured. Run rclone locally, then mount the config file to /config/rclone/
fi

while true; do
    curr_time=$(date +%s)
    tomm_time=$(date -d '25:00' +%s)
    wait_time=$(echo "$tomm_time - $curr_time" | bc)
    echo "Sleeping until 1am"
    sleep $wait_time
    sh -c "$(echo $@)"
done
