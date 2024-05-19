#!/bin/sh

set -e
pushd ~/nix-config/

git diff -U0 *.nix
echo "Rebuilding NixOS..."

sudo nixos-rebuild switch --flake . &>nixos-switch.log || (
    cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)

git commit -am "$gen"
popd