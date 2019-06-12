{ pkgs, ... }:
{ i18n = {
    consoleFont = "Lat2-Terminus16";
    defaultLocale = "en_US.UTF-8";
  };

  fonts = {
    enableDefaultFonts = true;
    # why set this
    # enableFontDir = true;
    fonts = with pkgs; [
      source-code-pro
      source-sans-pro
      source-serif-pro
      noto-fonts-emoji
      # free alternative to pragmata pro with glyphs :0
      iosevka
    ];
  };
}
