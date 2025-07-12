{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [ 
	  pkgs.git
	  pkgs.vim
        ];
      
      homebrew = {
	    enable = true;
	    brews = [ 
		"ca-certificates"
		"mpdecimal"
		"openssl@3"
		"python@3.13"
		"sqlite" 
		"readline"
		"xz"
    	    ];
    	    casks = [ ];
    	    onActivation.cleanup = "uninstall";  # Remove packages not in the list
 	  };

      # Enable TouchId for sudo
      security.pam.services.sudo_local.touchIdAuth = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      
      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      # Declare the user that will be running `nix-darwin`.
      system.primaryUser = "hemals";      

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations.hemals-mlt = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ configuration ];
    };
  };
}
