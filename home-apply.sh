#!/bin/sh
pushd ~/.dotfile
nix build .#homeManagerConfigurations.Octo.activationPackage
./result/activate
popd
