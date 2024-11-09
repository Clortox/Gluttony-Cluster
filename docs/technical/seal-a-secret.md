# Seal a secret

How to seal a secret with [Sealed Secrets](./sealed-secrets.md).

## Create generic secret

First just create the normal secret. Follow something of this format

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: postgresql-default-credentials
  namespace: postgresql
type: Opaque
data:
  password: ""
  postgres-password: ""
  username: ""
```

## Seal the secret

Make sure you have kubseal installed. This is working with kubseal `0.23.0`.

```bash
kubeseal --controller-namespace sealed-secret \
  --controller-name sealed-secrets \
  --format yaml < secret.yaml > sealed-secret.yaml
```

## ERROR cannot get sealed secret service

The `controller-name` and `controller-namespace` paramaters are misleading, they are
the name and namespace of the sealed-secrets service. Check the service with,

```bash
kubectl get services -n sealed-secrets
```
