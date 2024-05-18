{ config, pkgs, ... }:

{

home.username = "abstxn";
home.homeDirectory = "/home/abstxn";
home.stateVersion = "23.11";
home.packages = with pkgs; [

  # CLI Tools
  neovim
  fzf
  tree

  # Trivial
  neofetch
  cowsay
  lolcat
  fortune

  # Applications
  vscode

  # Fonts
  (nerdfonts.override { fonts = ["JetBrainsMono"]; })

];


programs.home-manager.enable = true;

programs.git = {
  enable = true;
  userName = "abstxn";
  userEmail = "108669111+abstxn@users.noreply.github.com";
};


fonts.fontconfig.enable = true;
nixpkgs.config.allowUnfree = true;

}
