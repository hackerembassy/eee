# https://nixos.wiki/wiki/Home_Manager

{ config, lib, pkgs, home-manager, ... }: {
  imports = [ home-manager.nixosModules.default ];

  home-manager.users."hacker-chan" = {
    home.file.".config/nixpkgs/config.nix".text = "{ allowUnfree = true; }";
    home.file."Desktop/README.txt".text = "Use flatpak or `nix-shell -p <package>` if you need software from search.nixos.org";
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = "HackEm EeePC";
          email = "hacker.embassy@proton.me";
        };
      };
    };
    home.stateVersion = "26.05";
  };

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
            please = "push --force-with-lease";
            ff = "!git fetch origin \${1-main}:\${1-main} && echo";
        };
        help = { autocorrect = 20; };
      };
      lfs.enable = true;
    };
    home.file.".config/nixpkgs/config.nix".text = "{ allowUnfree = true; }";
    home.stateVersion = "26.05";
  };
}
