# Rclone

By default, runs [rclone rcd][rcd] so that you/Jobs/CronJobs can make requests.
For example, to periodically sync a volume with some remote.

You can also run a CronJob directly with `values-cron.yaml`.

Serve additional content, perform operations, etc., via web requests to rcd, or
by modifying the `init` script in the values. For example:

```diff
init: |
  rclone rcd \
    --rc-web-gui \
    --rc-web-gui-no-open-browser \
    --rc-no-auth \
    --rc-addr=:5572 &

+  rclone serve restic remote:backup \
+    --addr=:9001 &

  wait -n
  exit $?
```

You could also consider [csi-rclone][csi], it is a DaemonSet that can mount
remotes as volumes, so it may be more appropriate depending on your use case.

[rcd]: https://rclone.org/commands/rclone_rcd/
[csi]: https://github.com/wunderio/csi-rclone

## Source code

The original source code for the app template chart developed by bjw-s / K8s@Home can be found
[here](https://github.com/bjw-s/helm-charts/tree/main/charts/other/app-template).
