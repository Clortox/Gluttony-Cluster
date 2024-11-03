# Nvidia Operator

The nvidia operator is responsible for making `gpus` a resource that can be requested 
by pods, and allowing pods to use the nvidia container runtime (You did run the ansible
script to install the nvidia container runtime, right?).

Bring over the helmchart release. Put it into its own namespace.

## Verify it worked

To verify it worked, run a describe on a node that has GPUs, such as,

```bash
kubectl describe node gluttony-gpu
```

Quicker than reading, check that this has the expected output,

```bash
kubectl describe node gluttony-gpu | grep nvidia.com
```
