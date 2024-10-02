# Gluttony-Cluster

[![Build Status](https://drone.clortox.com/api/badges/Infrastructure/Gluttony-Cluster/status.svg)](https://drone.clortox.com/Infrastructure/Gluttony-Cluster)

A [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) repo describing my current at home kubernetes cluster.

## Hardware

- Nodes
  - 3 x86_64
  - 2 ARM nodes
  - 1 Dedicated reverse proxy
- Storage
  - 64TB ZFS pool (Media)
  - 6TB of replicated storage (Configuration)
  - 2TB of NVME ZFS Cache
- Compute
  - Ryzen 5 5500
  - i7-13700K
  - Core 2 Duo
- Memory
  - 136 GB of DDR5 across 3 nodes
- GPU
  - RTX 3090 (Machine Learning)
  - RTX 3080 (Machine Learning)
  - RTX 2060 (Machine Learning)
  - GTX 1060 (Stream Transcoding)
- Networking
  - 1Gbps Inter-node Networking
  - TL-SG3428 Switch
  - R7000 Nighthawk running DDWRT
- Power
  - Dedicated 1500W ciruit breaker
  - 1100VA UPS

![server rack](./img/rack.jpg)
![network switch](./img/switch.jpg)
![zfs pool](./img/drives.jpg)

## Hosted Version

Find the actual, in production version of this repo on my [Gitea Repository](https://git.clortox.com/Infrastructure/Gluttony-Cluster). Here you will also find in use issues denoting things I plan to add to this repository.

Find the mirror of this repository on [Github](https://github.com/Clortox/Gluttony-Cluster).
