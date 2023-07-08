# helm-charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/jacobcolvin)](https://artifacthub.io/packages/search?repo=jacobcolvin)

Helm charts for applications developed by me. Also includes other miscellaneous charts that I use in my [homelab](https://github.com/MacroPower/homelab).

[Helm](https://helm.sh) must be installed to use the charts. Please refer to Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```sh
helm repo add jacobcolvin https://jacobcolvin.com/helm-charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions of the packages. You can then run `helm search repo jacobcolvin` to see the charts. You can also see a list of all charts on [ArtifactHub](https://artifacthub.io/packages/search?repo=jacobcolvin).

To install a chart:

```sh
helm install my-<chart-name> jacobcolvin/<chart-name>
```

To uninstall the release:

```sh
helm delete my-<chart-name>
```

## Credits

Repo based on [helm/charts-repo-actions-demo](https://github.com/helm/charts-repo-actions-demo).

Most of the charts use modified versions of the [common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common) and [template](https://github.com/bjw-s/helm-charts/tree/main/charts/other/app-template) charts developed by bjw-s / K8s@Home.
