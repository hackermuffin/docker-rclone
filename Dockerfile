FROM rclone/rclone

# Configure data directories
VOLUME ["/config/rclone"]              # Optional mount point for config files
VOLUME ["/data"]                       # Mount data to backup here
VOLUME ["/backups"]                    # Stores rolling backups here

# Configure rclone settings
ENV RCLONE_REMOTE
ENV RCLONE_REMOTE_FOLDER

# Configure entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sh"]
