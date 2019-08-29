{ pkgs, ... }:
{ i18n = {
    consoleFont = "sun12x22";
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
      noto-fonts-cjk
      # free alternative to pragmata pro with glyphs :0
      iosevka
    ];
  };
}
