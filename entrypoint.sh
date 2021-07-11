#!/bin/sh

# Check if remote is already configured
if rclone about remote: > /dev/null 2&>1; then
    echo "Remote already configured"
# Check if tty is allocated
elif [ ! -t 0 ]; then
    echo "Container not configured. Run with -it flags to configure interactively"
# Check if interactive flag is set - not yet functional
#elif [ $(readlink -f /proc/self/fd/0) != /dev/pts/0 ]; then
#    echo "Container not configured. Run with -it flags to configure interactively - 2"
# Run interactive configuration
else
    rclone config create remote $RCLONE_REMOTE_TYPE config_is_local false
fi

exec "$@"
