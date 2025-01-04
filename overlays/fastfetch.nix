self: super: {
  fastfetch = super.fastfetch.overrideAttrs (oldAttrs: {
    src = super.fetchFromGitHub {
      owner = "fastfetch-cli";
      repo = "fastfetch";
      rev = "dev";
      sha256 = "sha256-xXyZZrDbQo/KekRTHOKPoN/EgUPG/rKsNrqCAZxdI7s=";
    };
  });
}
