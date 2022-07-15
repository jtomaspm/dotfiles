from libqtile import qtile, bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen,KeyChord
from libqtile.lazy import lazy
from user_vars import *
from user_screens import open_std_menu




#FUNCTIONS
#################################################################
def window_to_previous_screen():
    @lazy.function
    def __inner(qtile):
        i = qtile.screens.index(qtile.current_screen)
        if i != 0:
            group = qtile.screens[i - 1].group.name
            qtile.current_window.togroup(group)
            qtile.focus_screen(i-1)
    return __inner
def window_to_next_screen():
    @lazy.function
    def __inner(qtile):
        i = qtile.screens.index(qtile.current_screen)
        if i + 1 != len(qtile.screens):
            group = qtile.screens[i + 1].group.name
            qtile.current_window.togroup(group)
            qtile.focus_screen(i+1)
    return __inner

#################################################################




mod = "mod4"
terminal = 'gnome-terminal'
browser = 'brave'
launcher = 'rofi -show drun'
launcher_windows = 'rofi -show window'
file_manager = 'thunar'



keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.window.toggle_floating(), desc="Move window focus to other window"),
    Key([mod], "m", lazy.window.toggle_fullscreen(), desc="Move focus up"),
    Key([mod], "x", window_to_next_screen(), desc="Move to prev screen"),
    Key([mod], "z", window_to_previous_screen(), desc="Move to next screen"),



    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch terminal"),
    Key([mod], "f", lazy.spawn(file_manager), desc="Launch terminal"),
    Key([mod], "d", lazy.spawn(launcher), desc="Launch terminal"),
    Key(['mod1'], "Tab", lazy.spawn(launcher_windows), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_screen(), desc="Toggle between layouts"),
    Key([mod, 'shift'], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", open_std_menu(), desc="Shutdown Qtile"),
    Key([mod] ,"Print", lazy.spawn('flameshot gui'), desc="Launch terminal"),
    #Key([mod], "d", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    ####
    # Workspaces(groups) and manotors (screens)
    ####
    Key([mod], "a", lazy.screen.prev_group(), desc="Move to previous workspace"),
    Key([mod], "s", lazy.screen.next_group(), desc="Move to next workspace"),

]



workspaces = [
    {"name": "1", "key": "1", "label": "1 : " + icons["web"], "matches": []},
    {"name": "2", "key": "2", "label": "2 : " + icons["web"], "matches": []},
    {"name": "3", "key": "3", "label": "3 : " + icons["terminal"], "matches": []},
    {"name": "4", "key": "4", "label": "4 : " + icons["treetab"], "matches": []},
    {"name": "5", "key": "5", "label": "5 : " + icons["dev"], "matches": []},
    {"name": "6", "key": "6", "label": "6 : " + icons["treetab"], "matches": []},
    {"name": "7", "key": "7", "label": "7 : " + icons["dev"], "matches": []},
    {"name": "8", "key": "8", "label": "8 : " + icons["games"], "matches": [Match(wm_class=["Steam", "steam"])]},
    {"name": "9", "key": "9", "label": "9 : " + icons["games"], "matches": [Match(wm_class=["Lutris", "lutris"])]},
    {"name": "0", "key": "0", "label": "0 : " + icons["chat"], "matches": [Match(wm_class=["Discord", "discord"])]},
]

groups = []
for workspace in workspaces:
    matches = workspace["matches"] if "matches" in workspace else None
    groups.append(Group(workspace["name"], label=workspace["label"], matches=matches, layout="max"))
    keys.append(Key([mod], workspace["key"], lazy.group[workspace["name"]].toscreen(toggle=False)))
    keys.append(Key([mod, sup], workspace["key"], lazy.window.togroup(workspace["name"])))
