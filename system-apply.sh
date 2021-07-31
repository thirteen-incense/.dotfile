#!/bin/sh
pushd ~/.dotfile
sudo nixos-rebuild switch --flake .# 
popd
