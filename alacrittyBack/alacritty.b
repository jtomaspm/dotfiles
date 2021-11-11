window:
  # Blank space added around the window in pixels. This padding is scaled
  # by DPI and the specified value is always added at both opposing sides.
  padding:
    x: 0
    y: 0
scrolling:
  # Specifying '0' will disable scrolling.
  history: 100000
  # Number of lines the viewport will move for every line scrolled when
  # scrollback is enabled (history > 0).
  multiplier: 3
font:
  normal:
    family: Menlo
    style: Regular
  bold:
    family: Menlo
    style: Bold
  italic:
    family: Menlo
    style: Italic
  bold_italic:
    family: Menlo
    style: Bold Italic
  size: 12.0
  use_thin_strokes: true
# If `true`, bold text is drawn using the bright color variants.
draw_bold_text_with_bright_colors: true

colors:
  primary:
    background: '0x272a34'
    foreground: '0x00FF20'

  normal:
    black:   '0x1F2229'
    red:     '0xEC0101'
    green:   '0x47D4B9'
    yellow:  '0xFF8A18'
    blue:    '0x277FFF'
    magenta: '0xD71655'
    cyan:    '0x05A1F7'
    white:   '0xFFFFFF'


  bright:
    black:   '0x1F2229'
    red:     '0xD41919'
    green:   '0x5EBDAB'
    yellow:  '0xFEA44C'
    blue:    '0x367bf0'
    magenta: '0xBF2E5D'
    cyan:    '0x49AEE6'
    white:   '0xFFFFFF'

# Specifying a `duration` of `0` will disable the visual bell.
#bell:
  #animation: EaseOutExpo
  #duration: 300
  #  color: '0xffffff'
background_opacity: 0.92
selection:
  # This string contains all characters that are used as separators for
  # "semantic words" in Alacritty.
  semantic_escape_chars: ",│`|:\"' ()[]{}<>\t"
  # When set to `true`, selected text will be copied to the primary clipboard.
  save_to_clipboard: true
# Allow terminal applications to change Alacritty’s window title.
window.dynamic_title: true
cursor:
  style: Block
  unfocused_hollow: true
# Live config reload (changes require restart)
live_config_reload: true

# Enable clickable URLs
mouse:
  hints:
    launcher:
      program: open
    modifiers: Command
