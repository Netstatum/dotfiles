import XMonad

main = xmonad defaultConfig
	{modMask = mod4Mask -- Usamos tecla windows en vez de alt
	,terminal = "gnome-terminal"
	}
