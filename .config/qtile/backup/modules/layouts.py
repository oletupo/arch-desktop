import re

from libqtile.config import Match, MatchAll
from libqtile import layout
from .colors import current_theme

def init_layout_theme():
    return {
		"margin":9,
		"border_width":4,
		"border_focus": current_theme[3], # Unico uso
		"border_normal": current_theme[9]
		}

layout_theme = init_layout_theme()

# LAYOUTS
layouts = [
    layout.RatioTile(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Bsp(**layout_theme),   
    #layout.Max(**layout_theme),
    #layout.Stack(num_stacks=2),
    #layout.Zoomy(),
    #layout.TreeTab(sections=['Tabs:'], panel_width=85, bg_color="#2F343F", fontsize=10, place_right=True),
    #layout.Floating(margin=3, border_width=1, border_focus="#fba922", border_normal="#fba922"),
]

# Floating windows rules
floating_types = ["notification", "toolbar", "splash", "dialog"] # "rename"
# Run the utility of `xprop` to see the wm class and name of an X client.
# It can match by title, wm_class, role, wm_type, wm_instance_class, net_wm_pid, or wid.
floating_layout = layout.Floating(float_rules=[
	Match(wm_class = 'qalculate-gtk'),
    Match(wm_class = 'xfce4-terminal'),
    Match(wm_class = 'pavucontrol'),
    Match(wm_class = 'nitrogen'),
    Match(title = 'P-Dal Capture'),
    Match(title = 'Torrent Options'), # Transmission 
    Match(role = 'GtkFileChooserDialog'), # GTK Save Dialog 
    Match(role = 'PictureInPicture'), # Firefox detached video window 
    Match(title = 'Picture in picture'), # Chrome detached video window 
    MatchAll(Match(wm_class = 'Thunar'), Match(title = re.compile(r'\bRename.'))), # Thunar rename
    MatchAll(Match(wm_class = 'Thunar'), Match(title = 'Error')), # Thunar rename
    MatchAll(Match(wm_class = 'geany'), Match(title = 'Question')), # Geany
    MatchAll(Match(wm_class = 'soffice'), Match(title = 'Save Document?')), # Libreoffice
    ], border_focus = current_theme[3])

# code _NET_WM_WINDOW_TYPE(ATOM) = _NET_WM_WINDOW_TYPE_DIALOG
