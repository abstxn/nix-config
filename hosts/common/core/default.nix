{
  imports = [
    ./locale.nix
    ./nix.nix
  ];

  hardware.enableRedistributableFirmware = true;
}