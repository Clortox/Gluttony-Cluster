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

Flux is the tool that will pull from the git repository and update the cluster state.
If you ran the ansible scripts, all hosts will have `flux` installed.
To bootstrap the cluster, run the following,

```bash
flux bootstrap gitea --owner=Infrastructure --repository=Gluttony-Cluster --private=false --path=cluster/ --branch=main
```
