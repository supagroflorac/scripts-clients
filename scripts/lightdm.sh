#!/bin/bash

echo "[SeatDefaults]
user-session=ubuntu
greeter-session=unity-greeter
greeter-show-manual-login=true
allow-guest=false
greeter-hide-users=true" > /etc/lightdm/lightdm.conf
