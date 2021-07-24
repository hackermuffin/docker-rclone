#!/bin/sh

# Check if remote is already configured
if rclone about remote: > /dev/null 2&>1; then
    echo "Remote already configured"
# Check if tty is allocated
elif [ ! -t 0 ]; then
    echo "Container not configured. Run with -it flags to configure interactively"
# Still need to check if interactive
# Run interactive configuration
else
    echo "Starting interactive config. Please configure a remote called 'remote:'"
    rclone config
fi

while true; do
    curr_time=$(date -d "now" +%s)
    tomm_time=$(date -d "next day 1 am" +%s)
    wait_time=$(echo "$tomm_time - $curr_time" | bc)
    echo "Sleeping until 1am"
    sleep $wait_time
    sh -c "$(echo $@)"
done
