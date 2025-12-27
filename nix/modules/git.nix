# Git, SSH, and GPG configuration
{ pkgs, ... }:

{
  # Git configuration (using new settings format)
  programs.git = {
    enable = true;
    
    signing = {
      key = "04FC1408A98FA287";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "Aimless";
        email = "65621195+aimlesx@users.noreply.github.com";
      };
      
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editor = "nvim";
      tag.gpgsign = true;

      alias = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        st = "status";
        lg = "log --oneline --graph --decorate";
        last = "log -1 HEAD";
        unstage = "reset HEAD --";
      };
    };
  };

  # Delta (git pager) - separate module in new HM
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      side-by-side = true;
      line-numbers = true;
    };
  };

  # SSH configuration
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/aimlesx-github";
        extraOptions = {
          PreferredAuthentications = "publickey";
        };
      };
      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/gitlab-ccs";
        extraOptions = {
          PreferredAuthentications = "publickey";
        };
      };
    };
  };

  # GPG configuration
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = false; # Using SSH keys directly
    pinentry.package = pkgs.pinentry-gnome3;
    defaultCacheTtl = 3600;
    maxCacheTtl = 86400;
  };
}
