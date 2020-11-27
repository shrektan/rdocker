# rdocker

The R docker images that I use:

- rdocker4ci: for continous integration, containing the core packages
- rdocker4working: for production with more packages like database (ROracle, odbc).

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

- [x] Add some tests - I need to ensure the LaTaX engine works, sometimes it fails due to missing texlive packags ...
    - Despite they can only be run manually...
- [ ] rm rdocker4ci as I'm too lazy to reduce the image size and now it's useless to me
- [ ] rename rdocker4working to r-production
- [ ] add a new image r-rstudio which is based on rdocker-prod but with rstudio server community version installed
- [ ] Add the oracle db driver
- [ ] The odbc driver currently can't use the identifier, needs to be enabled...
- [ ] Fix the issue that mailR fails to send email (miss org.apache.commons.mail.HtmlEmail)

## STATUS

image | size | metrics
----------|----------------|--------------
rdocker4ci | [![](https://images.microbadger.com/badges/image/shrektan/rdocker4ci.svg)](https://microbadger.com/images/shrektan/rdocker4ci "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/version/shrektan/rdocker4ci.svg)](https://microbadger.com/images/shrektan/rdocker4ci "Get your own version badge on microbadger.com")
rdocker4working | [![](https://images.microbadger.com/badges/image/shrektan/rdocker4working.svg)](https://microbadger.com/images/shrektan/rdocker4working "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/version/shrektan/rdocker4working.svg)](https://microbadger.com/images/shrektan/rdocker4working "Get your own version badge on microbadger.com")
