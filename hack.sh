#!/bin/bash


# If the user is using ntp, and not timedatectl, we fail, I guess?
which ntp
# TODO

# Set the NTP server in the conf
# Simply prepend it to the top of the file, so ours gets read first.
ntp_server="192.168.75.1"
sudo sed -i "s/\[Time\]/\[Time\]\nNTP=${ntp_server}/g"

# Disable, then enable the Gnome built-in NTP/automatic time sync.
# This should probably already be enabled. Restarting will reload the config.
timedatectl set-ntp 0
timedatectl set-ntp 1
