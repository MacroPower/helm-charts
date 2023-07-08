# helm-charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/jacobcolvin)](https://artifacthub.io/packages/search?repo=jacobcolvin)

Helm charts for applications developed by me. Also includes other miscellaneous charts that I use in my [homelab](https://github.com/MacroPower/homelab).

## Contributing

```sh
helm dep build

helm unittest -f 'tests/**/*.yaml' .

helm template .
```

## Credits

Repo based on [helm/charts-repo-actions-demo](https://github.com/helm/charts-repo-actions-demo).

Most of the charts use modified versions of the [common library](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common) and [template](https://github.com/bjw-s/helm-charts/tree/main/charts/other/app-template) charts developed by bjw-s / K8s@Home.
