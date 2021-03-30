import os
import re
import gi
import json
import socket
import subprocess

from typing import List  # noqa: F401
from libqtile import qtile, bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "urxvt"
home = os.path.expanduser('~')

with open(home + '/.cache/wal/colors.json') as json_file:
    data = json.load(json_file)
    colorsarray = data['colors']
    val_list = list(colorsarray.values())
    def getList(val_list):
        return [*val_list]

def init_colors():
    return [*val_list]

colors = init_colors()

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # Launcher
    # Key([mod], "d", lazy.spawn("dmenu_run -p ' '"), desc="Spawn dmenu"),
    Key([mod], "d",
        lazy.spawn("rofi -theme '~/.config/rofi/launcher.rasi' -show drun"),
        desc="Spawn rofi"
       ),

    # Flameshot
    Key([mod],"Print", lazy.spawn('flameshot gui')),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),

    # Volume
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),

    # Media Control
    Key([], "XF86AudioPlay", lazy.spawn("playerctl -p ncspot play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl -p ncspot next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl -p ncspot previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl -p ncspot stop")),
]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
        #     desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            desc="move focused window to group {}".format(i.name)),
    ])

layout_theme = {
    "border_width": 2,
    "margin": 8,
    "border_focus": "8fab4a",
    "border_normal": "1f1f1c"
    }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.TreeTab(
        sections=["Tabs"],
        section_fontsize=15,
        bg_color=colors[0],
        active_bg=colors[7],
        active_fg=colors[0],
        inactive_bg=colors[0],
        inactive_fg=colors[7],
        padding_y=5,
        panel_width=100,
        **layout_theme
    ),
    # layout.Columns(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(font="TerminessTTF Nerd Font Mono Medium",fontsize=13,padding=2,background=colors[0])
extension_defaults = widget_defaults.copy()

# prompt = "{0}@{1}:".format(os.environ["USER"], socket.gethostname())
prompt = " "

def init_widget_list():
    widget_list = [
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[7]
                ),
                widget.Image(
                    filename = "~/.config/qtile/icons/linux.png",
                    scale = "False",
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('rofi -theme "~/.config/rofi/launcher.rasi" -show drun')},
                ),
                #### Shortcuts ####
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[7]
                ),
                widget.TextBox(
                    font='Font Awesome 5 Free',
                    fontsize=15,
                    foreground=colors[7],
                    text="",
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn('thunar')},
                    fontshadow=colors[3]
                    ),
                # widget.Sep(
                #     linewidth = 0,
                #     padding = 6,
                #     foreground = colors[7]
                # ),
                widget.TextBox(
                    foreground=colors[1],
                    text="◢",
                    fontsize=45,
                    padding=-2
                    ),
                #### Groups ####
                widget.GroupBox(
                    # font='Font Awesome 5 Free',
                    font='TerminessTTF Nerd Font Mono',
                    fontsize=15,
                    disable_drag=True,
                    hide_unused=False,
                    fontshadow=colors[0],
                    margin_y=1,
                    padding_x=5,
                    borderwidth=0,
                    active=colors[7],
                    inactive=colors[1], 
                    rounded=False,
                    highlight_method="text",
                    this_current_screen_border=colors[0],
                    this_screen_border=colors[3],
                    other_current_screen_border=colors[0],
                    other_screen_border=colors[0],
                    foreground=colors[2],
                    background=colors[1]
                    ),
                widget.TextBox(
                    background=colors[0],
                    foreground=colors[1],
                    text="◤",
                    fontsize=45,
                    padding=-2
                    ),
                #### Notification ####
                widget.Prompt(
                    prompt = prompt,
                    foreground=colors[2],
                    background = colors[0]
                    ),
                #### Window Name ####
                widget.TextBox(
                    font='Font Awesome 5 Free',
                    fontsize=12,
                    foreground=colors[7],
                    fontshadow=colors[4],
                    text=""
                    ),
                widget.WindowName(
                    foreground=colors[7],
                    background=colors[0],
                    padding=5,
                    format='{name}',
                    empty_group_string='cocatrip',
                    max_chars=45
                    ),
                widget.Notify(
                    default_timeout=15,
                    foreground_urgent=colors[7],
                    foreground=colors[7],
                    background=colors[0]
                    ),
                ### Layouts ####
                widget.TextBox(
                    text="◢",
                    background=colors[0],
                    foreground=colors[2],
                    padding=-2,
                    fontsize=45
                    ),
                widget.TextBox(
                    font='Font Awesome 5 Free',
                    fontsize=15,
                    background=colors[2],
                    foreground=colors[0],
                    fontshadow=colors[7],
                    text=" " 
                    ),
                widget.CurrentLayout(
                    background=colors[2],
                    foreground=colors[0]
                    ),
                #### Updates ####
                widget.TextBox(
                    text='◢',
                    background=colors[2],
                    foreground=colors[3],
                    padding=-2,
                    fontsize=45
                    ),
                widget.TextBox(
                    font='Font Awesome 5 Free',
                    fontsize=15,
                    background=colors[3],
                    foreground=colors[0],
                    fontshadow=colors[7],
                    text=" ",
                    ),
                widget.CheckUpdates(
                    update_interval=1800,
                    # distro='Void_checkupdates',
                    custom_command="void-updates",
                    foreground=colors[0],
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(terminal + ' -e doas xbps-install -Suv')},
                    display_format="{updates} updates",
                    background=colors[3],
                    colour_have_updates=colors[0],
                    colour_no_updates=colors[0]
                    ),
                #### Sound Control ####
                widget.TextBox(
                    text='◢',
                    background=colors[3],
                    foreground=colors[7],
                    padding=-2,
                    fontsize=45
                    ),
                widget.TextBox(
                    font='Font Awesome 5 Free',
                    text=" ",
                    foreground=colors[0],
                    background=colors[7],
                    padding=0,
                    fontsize=15,
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn('pavucontrol')},
                    fontshadow=colors[3]
                    ),
                widget.Volume(
                    channel='Master',
                    background=colors[7],
                    foreground=colors[0],
                    fontshadow=colors[7]
                    ),
                #### Date Clock Session Control ####
                widget.TextBox(
                    text='◢',
                    background=colors[7],
                    foreground=colors[0],
                    padding=-2,
                    fontsize=45
                    ),
                widget.TextBox(
                    font='Font Awesome 5 Free',
                    padding=1,
                    text=" ",
                    fontsize=15,
                    foreground=colors[7],
                    background=colors[0],
                    fontshadow=colors[3]
                    ),
                widget.Clock(
                    foreground=colors[7],
                    background=colors[0],
                    format="%b %a %d -> %H:%M",
                    update_interval=1
                    ),
    ]
    return widget_list

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

def init_widgets_top():
    widgets_screen_top = init_widget_list()
    return widgets_screen_top
def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_top(), size=20, background=colors[0]))]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False

colors = init_colors()
screens = init_screens()

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once 
def start_once():     
    home = os.path.expanduser('~')     
    subprocess.call([home + '/.config/qtile/autostart.sh'])

wmname = "qtile"
