{
  pkgs,
  config,
  ...
}:
# processing audio/video
{
  home.packages = with pkgs; [
    ffmpeg-full

    # images
    # TODO: if images don't work on ghostty, look at this
    # Ghostty uses kitty protocol so I'm assuming this just works.
    viu # Terminal image viewer with native support for iTerm and Kitty
    imagemagick
    graphviz
  ];
}
