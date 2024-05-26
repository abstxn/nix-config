{ config, pkgs, ... }: {

  imports = [
  ];

  home.username = "abstxn";
  home.homeDirectory = "/home/abstxn";
  home.packages = with pkgs; [
    fzf
    tree
    neofetch
    cowsay
    lolcat
    fortune
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

  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  services.syncthing.enable = true;

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}