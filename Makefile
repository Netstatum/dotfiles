install: install-zshrc install-vimrc install-xmonad

remove: remove-zshrc remove-vimrc remove-xmonad



#Instalaciones
install-zshrc:
	ln -s $(CURDIR)/zshrc $(HOME)/.zshrc

install-vimrc:
	ln -s $(CURDIR)/vimrc $(HOME)/.vimrc

install-xmonad:
	ln -s $(CURDIR)/xmonad.hs $(HOME)/.xmonad/xmonad.hs
	xmonad --recompile 

#Remover
remove-zshrc:
	rm $(HOME)/.zshrc

remove-vimrc:
	rm $(HOME)/.vimrc

remove-xmonad:
	rm $(HOME)/.xmonad/xmonad.hs
