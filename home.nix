# https://nixos.wiki/wiki/Home_Manager

{ config, lib, pkgs, home-manager, ... }: {
  imports = [ home-manager.nixosModules.default ];
  home-manager.users.himura = {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = "Himura Kazuto";
          email = "glagol15@gmail.com";
        };
        alias = {
            it = "!git init && git commit -m 'root' --allow-empty";
            st = "status --short --branch";
            lg = "log --graph --author-date-order --abbrev-commit --decorate --all --format=format:'%C(bold yellow)%d%C(reset) %s - %C(bold cyan)%ad%C(reset) - %an %C(bold blue)[%h]%C(reset)' --date=format:'%d %b %Y %H:%M'";
            ds = "!git diff --staged && echo Diffs OK? && read _";
            dcp = "!git ds && git commit && git push";
            c = "!git pull && git add . && git dcp";
            mr = "!git pull && git add . && git ds && git switch -c \${1?} && git commit && git push --set-upstream origin $1 && echo";
            pull-force = "!git stash && git pull && git stash pop";
            please = "push --force-with-lease";
            ff = "!git fetch origin \${1-main}:\${1-main} && echo";
        };
        help = { autocorrect = 20; };
      };
      lfs.enable = true;
    };

    home.file.".toprc".source = ./env/.toprc;
    home.file.".config/nixpkgs/config.nix".text = "{ allowUnfree = true; }";

    xdg.desktopEntries.vim = {
      name = "Vim";
      noDisplay = true;
    };
    xdg.desktopEntries.gvim = {
      name = "GVim";
      noDisplay = true;
    };
    xdg.desktopEntries.calf = {
      name = "Calf Plugin Pack for JACK";
      noDisplay = true;
    };
    xdg.desktopEntries.carla-control = {
      name = "Carla Control";
      noDisplay = true;
    };

    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = map (drv: drv.extensionUuid) config.my.gnome.extensions;
        };
      };
    };

    home.stateVersion = "23.11";
  };
}
