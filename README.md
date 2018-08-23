# rdocker

The R docker that I use. The plan is to have three different images:

- rdocker4ci: for continous integration, containing the core packages
- rdocker4working: for working and with some additional packages like ROracle, RSQLServer, etc.
- rdocker4server: for shiny server deploying with shiny-server built-in.

## TODO

- [x] Build the image from rocker/r-ver directly. I don't think I need the RStudio bundle in the docker image and I need a smaller image for CI.
- [x] Fix the pandoc installing issue.I bet I will encounter issues in the end because pandoc will not be installed if the image built from rocker/r-ver instead of rocker/rstudio
- [x] Add the rdocker4shiny
- [x] Add the mssqlserver odbc driver and ensure it works
- [ ] Add the oracle db driver

## STATUS

image | size | metrics
----------|----------------|--------------
rdocker4ci | [![](https://images.microbadger.com/badges/image/shrektan/rdocker4ci.svg)](https://microbadger.com/images/shrektan/rdocker4ci "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/version/shrektan/rdocker4ci.svg)](https://microbadger.com/images/shrektan/rdocker4ci "Get your own version badge on microbadger.com")
rdocker4working | [![](https://images.microbadger.com/badges/image/shrektan/rdocker4working.svg)](https://microbadger.com/images/shrektan/rdocker4working "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/version/shrektan/rdocker4working.svg)](https://microbadger.com/images/shrektan/rdocker4working "Get your own version badge on microbadger.com")
rdocker4shinyserver | [![](https://images.microbadger.com/badges/image/shrektan/rdocker4shinyserver.svg)](https://microbadger.com/images/shrektan/rdocker4shinyserver "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/version/shrektan/rdocker4shinyserver.svg)](https://microbadger.com/images/shrektan/rdocker4shinyserver "Get your own version badge on microbadger.com")
