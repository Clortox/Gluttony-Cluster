# MetalLB

To setup MetalLB, add a helm release for the application.
By convention, place it in its own namespace.

> NOTE
>
> Be sure to not install the `IPAddressPool` and `L2Advertisement` CRDs untill after the
> MetalLB controllers are installed.
