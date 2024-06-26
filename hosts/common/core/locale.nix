{ lib, ... }: {

  time.timeZone = lib.mkDefault "Asia/Singapore";

  i18n.defaultLocale = lib.mkDefault "en_SG.UTF-8";

  i18n.extraLocaleSettings = lib.mkDefault {
    LC_ADDRESS = "en_SG.UTF-8";
    LC_IDENTIFICATION = "en_SG.UTF-8";
    LC_MEASUREMENT = "en_SG.UTF-8";
    LC_MONETARY = "en_SG.UTF-8";
    LC_NAME = "en_SG.UTF-8";
    LC_NUMERIC = "en_SG.UTF-8";
    LC_PAPER = "en_SG.UTF-8";
    LC_TELEPHONE = "en_SG.UTF-8";
    LC_TIME = "en_SG.UTF-8";
  };
}