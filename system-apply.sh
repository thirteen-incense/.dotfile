#!/bin/sh
pushd ~/.dotfile
export https_proxy=http://127.0.0.1:7890 
sudo nixos-rebuild switch --flake .# 
#--option substitute false
popd
