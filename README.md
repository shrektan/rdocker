# rdocker

The R docker images that I use:

- r-production: Contains most of the packages that I use, including database related packages like odbc.

## For Local Testing

There're two building arguments that are useful:

1. `in_china`: By default is 0. If set to 1, it will use the domestic mirrors thus significantly boost the building speed.
1. `ncpus`: By default is 1, the number of cores that are used to build the packages.

The recommended building command for users to test in China:

```bash
image=r-production
docker build ${image} -t shrektan/${image}:latest --build-arg in_china=1 --build-arg ncpus=8
```

## TODO

- [ ] Add the oracle db driver so that I don't need to install it mannually afterwards
- [ ] The odbc driver currently can't use the identifier, needs to be enabled.
- [ ] Find a workflow to use the container based VSCode

## STATUS

image | size | metrics
----------|----------------|--------------
r-production | [![](https://images.microbadger.com/badges/image/shrektan/r-production.svg)](https://microbadger.com/images/shrektan/r-production "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/version/shrektan/r-production.svg)](https://microbadger.com/images/shrektan/r-production "Get your own version badge on microbadger.com")
