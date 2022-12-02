# Rclone

Runs [rclone rcd][rcd] so that you/Jobs/CronJobs can make requests. For example,
to periodically sync a volume with some remote.

This is a deployment. If you're using local storage, it should be run on the
same node as whatever relevant storage is mounted. If there are multiple, you
could run a deployment for each one.

You could also consider [csi-rclone][csi], it is a DaemonSet that can mount
remotes as volumes, so it may be more appropriate depending on your use case.

[rcd]: https://rclone.org/commands/rclone_rcd/
[csi]: https://github.com/wunderio/csi-rclone
