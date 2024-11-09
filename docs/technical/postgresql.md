# Postgresql

Postgresql is the rdbms that I use.

Use the `postgresql` namespace, and add the helm chart.

## Custom container image

One thing that is different from the vanilla install is the use of my custom
[postgresql image](https://git.clortox.com/Infrastructure/Gluttony-Cluster-Postgresql).

It just contains `pgvector`, originally for use with Immich.
