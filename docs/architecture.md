# Cluster Architecture

The cluster consists of a [`k3s`](https://k3s.io) cluster, a dedicated bastion host 
running an nginx reverse proxy, and a dedicated NAS.

```mermaid
architecture-beta
  service internet(internet)[Internet]

  group home(server)[Home]

  service bastion(server)[Bastion] in home
  service router(server)[OpenWRT] in home
  service nas(disk)[Gluttony NAS] in home

  group cluster(server)[K3S Cluster] in home

  service gluttony(server)[Gluttony] in cluster
  service gluttonygpu(server)[Gluttony GPU] in cluster
  service gluttonym3(server)[Gluttony M3] in cluster

  service metallb(cloud)[MetalLB] in cluster
  service storage(cloud)[K3S Storage] in cluster

  group vps(cloud)[VPS]

  service sloth(server)[Sloth] in vps
  service greed(server)[Greed] in vps
  service alb(cloud)[ALB] in vps

  internet:L -- R:router
  router:L -- R:bastion
  bastion:T -- B:metallb

  metallb:T -- B:gluttony
  metallb:T -- B:gluttonygpu
  metallb:T -- B:gluttonym3

  storage:B -- T:nas

  
  internet:T -- B:alb
  alb:R -- L:sloth
  alb:R -- L:greed


  


```

An interesting thing to note is that all server equipment (all hosts listed above) 
reside in a deticated VLAN to isolate them from other hosts on the network.

Although not exactly like an enterprise network, within my subnetting I have accounted
for multiple physical locations, each with networks of servers, mobile clients, and
normal clients.
