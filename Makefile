setup:
	git submodule update --init --recursive; \
	vim +PluginInstall +qall; \
		./install_deps.sh
