Numix is a modern flat theme with a combination of light and dark elements. It
supports Gnome, Unity, XFCE and Openbox.

Numix is a part of the [Numix Project](http://numixproject.org).

### Manual installation

Extract the zip file (or clone the Git repository) to the themes directory.

 * To install it system-wide (for all users), use `/usr/share/themes/`.
 * To install it for your user only:
	 * From Gnome 3.10 onwards, Gnome uses `~/.local/share/themes`.
	 * Previously (and for GTK2), `~/.themes` is used.
	 * You can use a symlink from `~/.themes/Numix` to
	   `~/.local/share/themes/Numix`.

To activate the theme in Gnome, run the following commands in a terminal (or
use something like gnome-teak-tool):

```
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
gsettings set org.gnome.desktop.wm.preferences theme "Numix"
```

To set the theme in Xfce, run the following commands in Terminal:

```
xfconf-query -c xsettings -p /Net/ThemeName -s "Numix"
xfconf-query -c xfwm4 -p /general/theme -s "Numix"
```

### Requirements

 * GTK+ 3.6 or above
 * Murrine theme engine

### Code and license

Report bugs or contribute at [GitHub](https://github.com/shimmerproject/Numix).

License: GPL-3.0+
