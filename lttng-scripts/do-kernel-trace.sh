#!/bin/bash

#Create the tracing session (trace will be outputed in "lttng-scripts/machinekit-kernel")
sudo lttng create kernel -o machinekit-kernel

#Enable kernel events
sudo lttng enable-event -k sched_switch
sudo lttng enable-event -k sched_wakeup
sudo lttng enable-event -k sched_process_fork
sudo lttng enable-event -k sched_process_exec
sudo lttng enable-event -k sched_process_wait
sudo lttng enable-event -k sched_process_exit
sudo lttng enable-event -k --syscall --all

#List all the events
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
sudo chmod -R 755 machinekit-kernel

