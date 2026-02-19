{
  pkgs,
}:

let
  pname = "maa";
  version = "6.3.2";
  src = pkgs.fetchurl {
    url = "https://github.com/MaaAssistantArknights/MaaAssistantArknights/releases/download/v${version}/MAA-v${version}-linux-x86_64.AppImage";
    hash = "sha256-WL/JKegThJQg4vn+gPPgcK8FVRBo7XDEu7T442+RCOw=";
  };

  # Extract contents to get the icon and .desktop file
  appimageContents = pkgs.appimageTools.extract {
    inherit pname version src;
  };

in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  # Runtime dependencies
  extraPkgs =
    pkgs: with pkgs; [
      android-tools
      icu
      openssl
    ];
}
