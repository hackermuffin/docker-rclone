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
    time=10
    sleep $time
    sh -c "$(echo $@)"
done
