# rdocker

The R docker that I use. The plan is to have three different images:

- rdocker4ci: for continous integration, containing the core packages
- rdocker4working: for production and with some additional packages like ROracle, RSQLServer, etc.

## For Local Testing

There're two building arguments that are useful:

1. `in_china`: By default is 0. If set to 1, it will use the domestic mirrors thus significantly boost the building speed.
1. `ncpus`: By default is 1, the number of cores that are used to build the packages.

The recommended building command for users to test in China:

```bash
image=rdocker4ci
docker build ${image} -t shrektan/${image}:latest --build-arg in_china=1 --build-arg ncpus=8
```

## TODO

- [x] Build the image from rocker/r-ver directly. I don't think I need the RStudio bundle in the docker image and I need a smaller image for CI.
- [x] Fix the pandoc installing issue.I bet I will encounter issues in the end because pandoc will not be installed if the image built from rocker/r-ver instead of rocker/rstudio
- [x] Add the rdocker4shiny
- [x] Add the mssqlserver odbc driver and ensure it works
- [x] Add more latex packages especially those relate to CTEX.
- [ ] Add the oracle db driver

## STATUS

image | size | metrics
----------|----------------|--------------
rdocker4ci | [![](https://images.microbadger.com/badges/image/shrektan/rdocker4ci.svg)](https://microbadger.com/images/shrektan/rdocker4ci "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/version/shrektan/rdocker4ci.svg)](https://microbadger.com/images/shrektan/rdocker4ci "Get your own version badge on microbadger.com")
rdocker4working | [![](https://images.microbadger.com/badges/image/shrektan/rdocker4working.svg)](https://microbadger.com/images/shrektan/rdocker4working "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/version/shrektan/rdocker4working.svg)](https://microbadger.com/images/shrektan/rdocker4working "Get your own version badge on microbadger.com")
