#!/bin/sh

# ShinyServer: Make sure the directory for individual app logs exists
sudo mkdir -p /var/log/shiny-server
sudo mkdir -p /srv/shiny-server
sudo chown -R shiny.shiny /srv/shiny-server # should have the writing access by default
sudo chown -R shiny.shiny /var/log/shiny-server

# RUN ShinyServer
exec shiny-server 2>&1
