setup:
	git submodule update --init --recursive; \
	vim +PluginInstall +qall; \
	./bundle/youcompleteme/install.py --all
