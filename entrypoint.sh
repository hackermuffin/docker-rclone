#!/bin/sh
sh
# Check if remote is already configured
if rclone about remote: > /dev/null 2&>1; then
    echo "Remote already configured"
# Check if tty is allocated
elif [ ! -t 0 ]; then
    echo "Container not configured. Run with -it flags to configure interactively"
    exit
# Still need to check if interactive
# Run interactive configuration
else
    while [[ -eq $(rclone about remote:) ]]; do
	echo ""
        echo "Starting interactive config. Please configure a remote called 'remote:'"
        rclone config
    done
fi

while true; do
    curr_time=$(date +%s)
    tomm_time=$(date -d '25:00' +%s)
    wait_time=$(echo "$tomm_time - $curr_time" | bc)
    echo "Sleeping until 1am"
    sleep $wait_time
    sh -c "$(echo $@)"
done
