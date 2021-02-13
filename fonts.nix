{ pkgs, ... }:
{ i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  console = {
    font = "sun12x22";
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
