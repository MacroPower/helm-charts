# Servarr

Helm chart that can deploy [Radarr][radarr], [Prowlarr][prowlarr], and
eventually also [Sonarr][sonarr] (after [Sonarr/Sonarr#4999][sonarr#4999] is
merged).

I made this chart because others I found did not have the same goals in mind.
This chart attempts to be as cloud-native as possible. It only uses a Postgres
database, there is no other state in this configuration.

Includes optional sidecar to export metrics (via [exportarr][exportarr]). Also
includes corresponding ServiceMonitors if you choose to enable them.

## Requirements

> NOTE: All examples and defaults are for radarr, but you can replace the name
> with any other apps.

Set the following values depending on the app you're deploying:

```yaml
nameOverride: 'radarr'

image:
  repository: linuxserver/radarr
  tag: '4.2.4'

configSecretName: radarr-config

service:
  type: ClusterIP
  port: 7878
```

You'll need a Postgres server somewhere in your cluster. Manually create a user
and databases for each app, or create a job or extraInitContainer to do it for
you. For example:

```sql
CREATE ROLE radarr LOGIN PASSWORD 'changeme';
CREATE DATABASE radarrmain OWNER radarr;
CREATE DATABASE radarrlogs OWNER radarr;
```

Create a secret for your config:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: radarr-config # matched by Values.configSecretName
data:
  config.xml: |
    <Config>
      <UrlBase></UrlBase>
      <LogLevel>info</LogLevel>
      <UpdateMechanism>Docker</UpdateMechanism>
      <BindAddress>*</BindAddress>
      <Port>7878</Port>
      <SslPort>9898</SslPort>
      <EnableSsl>False</EnableSsl>
      <LaunchBrowser>True</LaunchBrowser>
      <ApiKey>changeme</ApiKey>
      <AuthenticationMethod>None</AuthenticationMethod>
      <Branch>master</Branch>
      <SslCertPath></SslCertPath>
      <SslCertPassword></SslCertPassword>
      <InstanceName>Radarr</InstanceName>
      <PostgresUser>radarr</PostgresUser> 
      <PostgresPassword>changeme</PostgresPassword>
      <PostgresPort>5432</PostgresPort>
      <PostgresHost>yourdb.yourns.svc.cluster.local</PostgresHost>
      <PostgresMainDb>radarrmain</PostgresMainDb>
      <PostgresLogDb>radarrlogs</PostgresLogDb>
    </Config>
```

You will need to edit this config XML to suit you. For most users, you should
change:

- Port: Port of the service. This should match `Values.service.port`.
- SslPort: SSL port of the service. (Has no effect right now.)
- ApiKey: Set to a random 32 character string, lowercase a-z and 0-9.
- InstanceName: The app name the config is for.
- Postgres\*: Change to values for your database.

## Requirements (Metrics)

To enable metrics:

```yaml
metrics:
  enabled: true

  secretName: radarr-credentials
  secretKey: RADARR_API_KEY

# If you are using Prometheus
serviceMonitor:
  enabled: true
```

Create a secret for your API key:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: radarr-credentials # matched by Values.metrics.secretName
data:
  RADARR_API_KEY: <base64> # matched by Values.metrics.secretKey
```

Note that the API key should be the same as what you set in your config file,
just encoded as Base64.

[sonarr]: https://github.com/Sonarr/Sonarr
[radarr]: https://github.com/Radarr/Radarr
[prowlarr]: https://github.com/Prowlarr/Prowlarr
[sonarr#4999]: https://github.com/Sonarr/Sonarr/pull/4999
[exportarr]: https://github.com/onedr0p/exportarr
