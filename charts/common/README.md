# Common library

This is my personal version of the common library chart. 

## Source code

The original source code for the common library chart developed by bjw-s / K8s@Home can be found
[here](https://github.com/bjw-s/helm-charts/tree/main/charts/library/common).

## Docs

- [Add-ons](docs/add-ons/index.md)
  - [code-server](docs/add-ons/code-server/index.md)
- [Storage](docs/storage/index.md)
  - [Permissions](docs/storage/permissions.md)
  - [Storage types](docs/storage/types.md)
    - [PersistentVolumeClaim](docs/storage/types/pvc.md)
    - [EmptyDir](docs/storage/types/emptydir.md)
    - [HostPath](docs/storage/types/hostpath.md)
    - [ConfigMap](docs/storage/types/configmap.md)
    - [Secret](docs/storage/types/secret.md)
    - [NFS share](docs/storage/types/nfs-share.md)
    - [Custom](docs/storage/types/custom.md)
- [How to...](docs/howto/index.md)
  - [Multiple subPaths for 1 volume](docs/howto/multiple-subpath.md)
  - [Helm templates](docs/howto/helm-templates.md)
