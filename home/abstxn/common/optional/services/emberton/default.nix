{ pkgs, ... }: {

  systemd.user.services."emberton" = {
    Service.ExecStart = "${pkgs.pipewire}/bin/pw-play --target EMBERTON ${./inaudible.mp3}";
  };

  systemd.user.timers."emberton" = {
    Install.WantedBy = [ "timers.target" ];
    Timer = {
      OnCalendar = "*:0/1";
      Persistent = true;
    };
  };

  systemd.user.startServices = true;
}