{ pkgs, ... }:
{

  console.font = "sun12x22";
  i18n.defaultLocale = "en_US.UTF-8"; # FIXME: move this?

  fonts = {
    enableDefaultPackages = true;
    # why set this
    # enableFontDir = true;
    packages = with pkgs; [
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
