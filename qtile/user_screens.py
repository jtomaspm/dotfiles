import subprocess
from libqtile import qtile, bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen,KeyChord
from libqtile.lazy import lazy
from user_vars import *


def open_std_menu():
    @lazy.function
    def __inner(qtile):
        home = '/home/jtomaspm/.config/rofi/powermenu/powermenu.sh'
        subprocess.call([home])
    return __inner

def open_launcher_menu():
    @lazy.function
    def __inner(qtile):
        home = '/home/jtomaspm/.config/rofi/launchers/misc/launcher.sh'
        subprocess.call([home])
    return __inner

def lower_left_triangle(bg, fg):
    return widget.TextBox(
            text='\u25e2',
            padding=0,
            fontsize=50,
            background=bg,
            foreground=fg
            )

def left_arrow(bg, fg):
    return widget.TextBox(
            text='\uE0B2',
            padding=0,
            fontsize=26,
            background=bg,
            foreground=fg
            )

def right_arrow(bg, fg):
    return widget.TextBox(
            text='\uE0B0',
            padding=0,
            fontsize=26,
            background=bg,
            foreground=fg
            )

def left_circle(bg, fg):
    return widget.TextBox(
            text='\u2592',
            padding=0,
            fontsize=26,
            background=bg,
            foreground=fg
            )

def search_btn(bg, fg):
    return widget.Image(
            filename='~/.config/qtile/icons/arch.png',
            mouse_callbacks={
                'Button1': open_launcher_menu()
            },
            )

def std_btn():
    return widget.Image(
            filename='~/.config/qtile/icons/std.png',
            mouse_callbacks={
                'Button1': open_std_menu()
            },
            )

def sound_img():
    return widget.Image(
            filename='~/.config/qtile/icons/sound.png',
            )

def generate_screen(systray = False):
    widgets = [
            # Workspaces
#                left_arrow(nord["background"], nord['polar_night'][0]),
                search_btn(nord["background"], nord['polar_night'][0]),
                right_arrow(fg=nord["polar_night"][0], bg=nord["background"]),
                left_arrow(nord["background"], nord['polar_night'][0]),
                widget.GroupBox(
                    active=nord["frost"][0], 
                    background=nord["polar_night"][0], 
                    block_highlight_text_color=nord["snow_storm"][2],
                    disable_drag=True,
                    highlight_method='line',
                    highlight_color=[nord['polar_night'][0], nord['polar_night'][0]],
                    inactive=nord["polar_night"][3],
                    center_aligned=True,
                    margin=0,
                    margin_y=3,
                    hide_unused=False,
                    other_current_screen_border=nord["polar_night"][0],
                    other_screen_border=nord["polar_night"][0],
                    this_current_screen_border=nord["frost"][0],
                    this_screen_border=nord["polar_night"][3]
                    ),
                right_arrow(fg=nord["polar_night"][0], bg=nord["background"]),
                widget.TaskList(
                    max_title_width=225,
                    highlight_method='block',
                    border=nord["frost"][3],
                    unfocused_border=nord["polar_night"][3],
                    padding=2,
                    ),
                left_arrow(nord["background"], nord['polar_night'][3]),
                widget.DF(
                    background=nord["polar_night"][3],
                    partition='/home/',
                    format=' {uf}{m}',
                    visible_on_warn=False,

                ),
                left_arrow(nord["polar_night"][3], nord['aurora'][1]),
                widget.CPU(background=nord["aurora"][1], format=' {load_percent}%'),
                widget.Memory(background=nord["aurora"][1], measure_mem='G', format='  {MemUsed: .2f}{mm}'),
                widget.NvidiaSensors(background=nord['aurora'][1], format='  {temp}ºC'),
                left_arrow(nord['aurora'][1], nord['polar_night'][0]),
                widget.Notify(),]
    if systray:
        widgets += [widget.Systray(background=nord["polar_night"][0]),]
    widgets += [
                sound_img(),
                widget.PulseVolume(background=nord["polar_night"][0]),
                left_arrow(nord["polar_night"][0], nord['frost'][3]),
                widget.Clock(format="%d/%m/%y %H:%M",background=nord["frost"][3]),
                left_arrow(nord["frost"][3], nord['aurora'][0]),
                std_btn(),
            ]
    return Screen(
        top=bar.Bar(widgets
            ,
            30,
            background=nord["background"],
            foreground=nord["frost"][2],
        ),
    )

