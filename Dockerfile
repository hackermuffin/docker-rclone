FROM rclone/rclone

# Configure data directories
VOLUME ["/config/rclone"]              # Persistent config folder
VOLUME ["/data"]                       # Mount data to backup here

ENV RCLONE_REMOTE_TYPE=

# Configure entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh", "rclone"]
CMD ["copy", "/data", "remote:", "--dry-run"]
