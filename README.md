# rdocker

The R docker that I use. The plan is to have three different images:

- docker4ci: for continous integration, containing the core packages
- docker4working: for working and with some additional packages like ROracle, RSQLServer, etc.
- docker4server: for shiny server deploying with shiny-server built-in.
