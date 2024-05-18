{ config, pkgs, ... }:

{

home.username = "abstxn";
home.homeDirectory = "/home/abstxn";
home.packages = with pkgs; [

  # CLI Tools
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


programs.git = {
  enable = true;
  userName = "abstxn";
  userEmail = "108669111+abstxn@users.noreply.github.com";
};

programs.neovim = {
  enable = true;
  viAlias = true;
  vimAlias = true;
};


gtk = {
  enable = true;
  cursorTheme = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
  };
};


fonts.fontconfig.enable = true;

home.stateVersion = "23.11";
programs.home-manager.enable = true;

}
