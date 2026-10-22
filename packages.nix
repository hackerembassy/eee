{ config, lib, pkgs, ... }:
{
  programs = {
    firefox.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
  };
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    featherpad
    telegram-desktop
    inter
    libreoffice
    gimp
  ];
}
