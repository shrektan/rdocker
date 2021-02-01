# rdocker

The R docker images that I use:

- r-production: Contains most of the packages that I use, including database related packages like odbc.

## For Local Testing

There're two building arguments that are useful:

1. `in_china`: By default is 0. If set to 1, it will use the domestic mirrors thus significantly boost the building speed.
2. `ncpus`: By default is 1, the number of cores that are used to build the packages. Note, a value larger than 1 may cause the compiling process of certain packages fail. The reason is unknown for now so I recommend to keep the value to its default.
3. `npkgs`: By default is 1, the number of R packages installed at one time. There're many R packages need to be installed. Sometimes error happens and it's difficult to track back. In addition, we may need to pass special building arguments for certain packages. So our solution is to define the packages in the yaml file and install the packages in several times. Moreover, we check if the packages are installed successfully and would throw clear error message if some failed.

The recommended building command for users to test in China:

```bash
image=r-production
docker build ${image} -t shrektan/${image}:latest --build-arg in_china=1 --build-arg ncpus=1 --build-arg npkgs=5
```

## TODO

- [ ] Add the oracle db driver so that I don't need to install it manually afterwards
- [ ] The odbc driver currently can't use the identifier, needs to be enabled.
- [ ] Find a workflow to use the container based VSCode

## STATUS

image | size | metrics
----------|----------------|--------------
r-production | [![](https://images.microbadger.com/badges/image/shrektan/r-production.svg)](https://microbadger.com/images/shrektan/r-production "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/version/shrektan/r-production.svg)](https://microbadger.com/images/shrektan/r-production "Get your own version badge on microbadger.com")
