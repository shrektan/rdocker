#!/bin/sh

# ShinyServer: Make sure the directory for individual app logs exists
sudo mkdir -p /var/log/shiny-server
sudo mkdir -p /srv/shiny-server
sudo chown -R shiny.shiny /srv/shiny-server # should have the writing access by default
sudo chown -R shiny.shiny /var/log/shiny-server

# a test app to debug (in case)
sudo Rscript -e "file.copy(test.shiny.app::app_dir(), '/srv/shiny-server', recursive = TRUE)"

# RUN ShinyServer
if [ "$APPLICATION_LOGS_TO_STDOUT" = "false" ];
then
    exec shiny-server 2>&1
else
    # start shiny server in detached mode
    exec shiny-server 2>&1 &

    # push the "real" application logs to stdout with xtail
    exec xtail /var/log/shiny-server/
fi
