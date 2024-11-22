# Executed only in the login shell

if [[ $(uname) != "Darwin" ]]; then
	# Set gnome workspace settings
	for i in {1..9}; do gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Alt>$i']" ; done
	for i in {1..9}; do gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Shift><Alt>$i']" ; done
	gsettings set "org.gnome.desktop.interface" "enable-animations" "false"
	gsettings set "org.gnome.mutter" "dynamic-workspaces" "false"
fi

