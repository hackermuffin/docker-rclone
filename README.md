# RClone Docker

```This repo is depreciated - I decided it was easier to just run cron on the
host, with the default rclone container```

A repo designed to make the default rclone docker image more useable as a
automatic backup solution

## Configuration

The rclone remote can be configured my mounting a pregenerated rclone config
file with a remote named `remote:`.

Otherwise, the container can be configure interactively by lanuching the
container with -it flags, and using the rclone configuration wizard to
configure the remote

## Usage

The data to be synced should be mounted to the /data folder in the container.
The data contained there is synced to `remote:$REMOTE_PATH` at 1am each day.
