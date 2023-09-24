# Twitch Channel Points Miner

A helm chart for [Twitch Channel Points Miner](https://github.com/rdavydov/Twitch-Channel-Points-Miner-v2).

## Configuration

You can configure the application by editing the `run.py` file, which is mounted
as a ConfigMap, by default created via the `configMaps.config` value. You can
overwrite with your own configuration, or disable creation in the chart with
`configMaps.config.enabled=false`.

Important notes regarding configuration, several parameters are required for the
application to function correctly:

```python
TwitchChannelPointsMiner(
    # ...
    username="Cookie", # Username must always be "Cookie", see below.
    enable_analytics=True, # Must be set to True for probes to work.
    logger_settings=LoggerSettings(
        save=False, # If True, you'll have to add another volume at /usr/src/app/logs
        # ...
    )
    # ...
)

# You should also call the analytics function, and ensure that the port is set
# to the same value as the service.main.ports.http.port value (5000 by default).
twitch_miner.analytics(host="0.0.0.0", port=5000, refresh=5, days_ago=7)

# ...

twitch_miner.mine([
    # ...
])
```

## Cookies

This container uses a pickled cookie to login to Twitch on your behalf.
Interactive login does not work for obvious reasons.

To use this, run the application on your local computer and login interactively.
This will save a cookie for you under `cookies/${USER}.pkl`.

You can encode this as Base64 and upload it to your secret vault, e.g.:

```bash
base64 -i cookies/${USER}.pkl | vault secrets set TWITCH_COOKIE
```

This cookie is added to the container as `Cookie.pkl`. Which means you must set
your username as `Cookie` in your `run.py` file, which will match that cookie.

## Source code

The source code for the application can be found
[here](https://github.com/rdavydov/Twitch-Channel-Points-Miner-v2).

The original source code for the app template chart developed by bjw-s / K8s@Home can be found
[here](https://github.com/bjw-s/helm-charts/tree/main/charts/other/app-template).
