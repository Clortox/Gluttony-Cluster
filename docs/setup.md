# Setup Cluster

## Configure Bare Metal (Ansible)

To bootstrap the Cluster

1) Update the `inventory.yml` in the ansible directory to reflect the cluster

2) Ensure all ansible secrets are up to date

3) Run the playbooks in the following order

```
ping.yaml
bootstrap-systemd-debian.yaml
update-cluster.yaml
bootstrap-debian-nvidia-cuda.yaml
bootstrap-kubeseal.yaml
bootstrap-longhorn-drive.yaml
```


> Tip
>
> You can run an ansible script with,
>
> ```
> ansible-playbook -i inventory.yaml --ask-vault-pass ./playbooks/ping.yaml
> ```

## Setup Cluster (Flux)

To install K3S into the cluster, just run the ansible playbook `bootstrap-k3s.yaml`. 
Thats it!

Its important to note that this playbook will bootstrap flux, which will push a commit
to your git repo that you configured. Therefore, do a `git pull` before 
continuing past this step.

## Local machine `kubectl` (Optional)

If you want `kubectl` on your local machine, just copy over `/etc/rancher/k3s/k3s.yaml`
from any master node to your local machine at `~/.kube/config`.
Just be sure to adjust the server url in the config file to point to an actual server.

