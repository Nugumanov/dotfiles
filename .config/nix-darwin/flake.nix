{
  description = "Advena nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    
    # Optional: Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, ... }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
	  # CLI
          pkgs.neovim
	  pkgs.eza
	  pkgs.tldr
	  pkgs.stow
	  pkgs.zoxide
	  pkgs.pass
	  pkgs.gnupg
	  pkgs.zsh
	  pkgs.mas
	  pkgs.yazi
	  pkgs.mkalias
	  pkgs.atuin
	  pkgs.oh-my-zsh
	  pkgs.lazydocker
          pkgs.nodejs_22
          pkgs.pyright
          pkgs.cargo

          # ALL
	  pkgs.firefox
	  pkgs.spotify
          pkgs.discord
          pkgs.disk-inventory-x
          pkgs.kitty
          pkgs.obsidian
          #pkgs.transmission_4-qt
          pkgs.transmission_4-qt6
          #pkgs.transmission_4

          #pkgs.yandex-disk
          #pkgs.obs-studio
          #pkgs.openconnect
          #pkgs.puredata
          #pkgs.slack
          #pkgs.wireguard-ui
          #pkgs.wireshark
          #pkgs.arduino-ide
          #pkgs.calibre
          #pkgs.zoom-us

          # CRYPTO
          #pkgs.electrum
          #pkgs.exodus
          #pkgs.terra-station
          #pkgs.wasabiwallet

          # SOUND
          #pkgs.supercollider

          # WASN'T FOUND:

          # Causality
          # Explorer (sound library for samples)
          # Google Chrome
          # Google Drive
          # Grammarly
          # LuLu
          # Microsoft Remote Desktop
          # Night Eye
          # Remote Mouse
          # Save to Reader
          # Splice
          # TouchDesigner
          # Vimari
          # VimMotion
          # AllMyBatteries

        ];

        homebrew = {
          enable = true;
	  brews = [
	    #"mas"
	  ];
          casks = [
            "hammerspoon"
            "karabiner-elements"
	    "vlc"
	    #"orbstack"
            #"vimmotion"
          ];
	  masApps = {
            "Telegram" = 747648890;
	    "Remote Mouse" = 403195710;
	    "Vimlike" = 1584519802;
	    "Todoist" = 585829637;
	  };
	  onActivation.cleanup = "zap";
        };

        fonts.packages = [
          #(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        ];

	system.activationScripts.applications.text = let
	  env = pkgs.buildEnv {
	    name = "system-applications";
	    paths = config.environment.systemPackages;
	    pathsToLink = "/Applications";
	  };
	in
	  pkgs.lib.mkForce ''
	    # Set up applications.
	    echo "setting up /Applications..." >&2
	    rm -rf /Applications/Nix\ Apps
	    mkdir -p /Applications/Nix\ Apps
	    find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
	    while read -r src; do
	      app_name=$(basename "$src")
	      echo "copying $src" >&2
	      ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
	    done
	  '';

      system.defaults = {

        # Dock
        dock.autohide = true;
	dock.orientation = "right";
	dock.tilesize = 24;
	dock.largesize = 64;
	dock.magnification = true;
	dock.show-recents = false;
	dock.persistent-apps = [
	  "/System/Applications/Mail.app"
	  "/Applications/Safari.app"
	  "${pkgs.kitty}/Applications/kitty.app"
	  "${pkgs.discord}/Applications/Discord.app"
	  "${pkgs.obsidian}/Applications/Obsidian.app"
	];

	# Finder
        finder.ShowStatusBar = true;
	finder.ShowPathbar = true;
	finder.FXPreferredViewStyle = "clmv";
	finder.FXEnableExtensionChangeWarning = false;
	finder.AppleShowAllFiles = true;
	finder.AppleShowAllExtensions = true;
	finder._FXShowPosixPathInTitle = false;

	# Trackpad
	trackpad.Clicking = true;
	#trackpad.FirstClickThreshold = 0;

      };

      power.sleep = {
        allowSleepByPowerButton = true;
        display = 20;
	computer = 120;
	harddisk = 60;
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";
    };

  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."Advena-MBP" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            #enableRosetta = true;

            # User owning the Homebrew prefix
            user = "advena";

            # Optional: Declarative tap management
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
            };

            # Optional: Enable fully-declarative tap management
            #
            # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
            mutableTaps = false;

          };
        }
      ];
    };

    darwinPackages = self.darwinConfigurations."Advena-MBP".pkgs;
  };

}
