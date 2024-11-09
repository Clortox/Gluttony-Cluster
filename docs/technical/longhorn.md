# Longhorn

In cluster storage management. Good for small amounts of data that needs to be
physically close to the host system, or data that needs to be available regardless
of the state of the NFS server.

> NOTE
> 
> Longhorn is really cool, but I hate using it. It causes so many headaches trying
> to set it up. Really thankful it exists, but just use an NFS share if you can.

## Configuration

So once you have the helm release installed and you have run the ansible 
script to bootstrap the nodes with a drive that is formatted and mounted
(probably to `/media/longhorn`) you need to configure each node to use that.

First disable all scheduling on all nodes. Delete all volumes (if there are any).
Set each default disk to scheduling false and eviction request true. Then delete it.

Next add a drive with root path at whatever you configured (probably `/media/longhorn`).
Just wait, it will take it some time to show the full space. Your goal is 
to have the same amount of space on all nodes (its like RAID 0 in that way).

After that turn back on scheduling and you are good to go.

