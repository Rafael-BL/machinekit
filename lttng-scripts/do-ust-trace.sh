#!/bin/bash

#Create the tracing session (trace will be outputed in "lttng-scripts/machinekit-ust")
sudo lttng create ust -o machinekit-ust

#Enable ust events
sudo lttng enable-event -u -a

#List all the events (ust ones should not be figured as the provider is dynamically loaded)
sudo lttng list

#Start the tracing
sudo lttng start

#Start machinekit
linuxcnc

#Stop the tracing
sudo lttng stop

#Clean the tracing session
sudo lttng destroy -a

#Give proper permission to be able to read the trace
sudo chmod -R 755 machinekit-ust
