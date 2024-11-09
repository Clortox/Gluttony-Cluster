# Sealed Secrets

Add the normal helm release for sealed secrets. Place into its own namespace.

## Adding an Existing Certificate

### Extracting certs

Store secrets in a json format, something of the form,

```json
{
  "tls.crt": "ABC123...",
  "tls.key": "XYZ987..."
}

```

Both values will be base64 encoded. Something to this effect will get what you want.

```bash
pass my-secret-key | jq -r '.[tls.crt]' | base64 -d | base64 -d | tee pub-cert.pem
pass my-secret-key | jq -r '.[tls.key]' | base64 -d | base64 -d | tee private-key.pem
```

You will know it worked if the outputted keys from `tee` contain the normal headers.


### Apply cert into cluster

To apply the cert into the cluster, just make the secret

```bash
kubectl create secret tls sealed-secrets-key \
  --cert=pub-cert.pem \
  --key=private-key.pem \
  --namespace=sealed-secrets
```

After that just restart the sealed-secrets pod to make sure it takes up the changes.

```bash
kubectl rollout restart deployment sealed-secrets -n sealed-secrets
```

Check the logs of the sealed-secrets pod after restart, and you should 
see `sealed-secrets-key` registered as a private key in the logs. And thats it!


## Explanation of Certificate Rotation

So by default sealed secrets is going to make a tls cert in the `sealed-secrets`
namespace. Its gonna be something like `sealed-secrets-key<nonce>`. It will generate
one every 30 days (configurable value).

*All secrets* are valid for decrypting secrets in the git repo. If you want it to decrypt
older stuff, add the older cert as outlined above.

## Fetch Current Cert

To grab the current cert, run

```bash
kubeseal --fetch-cert \
  --controller-namespace sealed-secrets \
  --controller-name sealed-secrets-865dc66876-74smf
```
