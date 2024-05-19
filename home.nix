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

programs.bash = {
  enable = true;
  sessionVariables = {
    EDITOR = "nvim";
  };
};

services.syncthing = {
  enable = true;
  extraOptions = [
    "--home=/home/abstxn/syncthing"
  ];
};


gtk = {
  enable = true;
  cursorTheme = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
  };
};

# systemd services
systemd.user.services."heartbeat" = {
  Unit.Description = "Ping EMBERTON";
  Service.ExecStart = "${pkgs.pipewire}/bin/pw-play --target EMBERTON /home/abstxn/nixos/inaudible.mp3";
};
systemd.user.timers."heartbeat" = {
  Unit.Description = "Periodically run heartbeat service.";
  Install.WantedBy = [ "timers.target" ];
  Timer = {
    OnCalendar = "*:0/3";
    Persistent = true;
  };
};
systemd.user.startServices = true;


# Fonts
fonts.fontconfig.enable = true;
fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMonoNL NFM" ];

home.stateVersion = "24.05";
programs.home-manager.enable = true;
}
