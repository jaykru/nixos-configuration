{ pkgs, ... }:
{ i18n = {
    consoleFont = "Lat2-Terminus16";
    defaultLocale = "en_US.UTF-8";
  };

  fonts = {
    enableDefaultFonts = true;
    # why set this
    # enableFontDir = true;
    fonts = [
      pkgs.source-code-pro
      pkgs.source-sans-pro
      pkgs.source-serif-pro
      # free alternative to pragmata pro with glyphs :0
      pkgs.iosevka
    ];
  };
}
