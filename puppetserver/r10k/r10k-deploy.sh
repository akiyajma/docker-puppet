#!/bin/bash

echo "r10k deploy"
timeout -sKILL 30 /opt/puppetlabs/puppet/bin/r10k deploy environment -pv
mkdir /etc/puppetlabs/code/environments/production 
if [ $? != 0 ]; then
  echo "ERROR: Could not deploy with r10k."
  exit 1
fi
