FROM rclone/rclone

# Configure data directories
VOLUME ["/config/rclone"]              # Persistent config folder
VOLUME ["/data"]                       # Mount data to backup here

# Configure entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["rclone", "copy", "/data", "remote:$REMOTE_PATH"]
