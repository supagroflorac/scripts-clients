#!/bin/bash

apt-get update &&
apt-get -y dist-upgrade &&
apt-get -y autoremove
