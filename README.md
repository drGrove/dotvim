# drGroves' .vim setup

<http://github.com/drGrove/dotvim>


## Current Features ##

  * NerdTree - nice tree-view file browsing [F2]
  * CtrlP - For fuzzy searching files
  * Gundo - undo history management [F5]
  * Tagbar - easily browse through a programs structure [F9]
  * Supertab - tab-complete anything you have used in the curent buffer
  * Fugitive - built in Git management
  * Syntastic - syntax checking and correction helpers for most major languages
  * Vim-Indent-Guides - easily see indentions. Customized to match Solarized
  * Vundle - for easily managing plugins
  * Other various helper plugins to aid programming as I find them useful

## Usage / Installation ##

1. Clone .vim directory

    ```bash
    git clone https://github.com/drGrove/dotvim.git ~/.vim
    ```
2. Install Vundle

    ```bash
    cd ~/.vim
    git submodule update --init
    ```

3. Install dummy vimrc file

    ```bash
    echo "runtime vimrc" > ~/.vimrc
    ```

4. Install Rest of Plugins
    ```bash
    vim +PluginInstall +qall
    ```
