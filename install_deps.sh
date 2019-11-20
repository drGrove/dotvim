#!/bin/bash

SCRIPT_FOLDER=$(dirname -- "$0")
OS=$(cat /etc/os-release | grep ^NAME | cut -d "=" -f2)
which ctags-exuberant 2>&1> /dev/null || {
  if [[ "$OS" -eq "Arch Linux" ]]; then
    pacman -S ctags
  elif [[ "$OS" -eq "Ubuntu" ]]; then
    sudo apt-get install exuberant-ctags
  fi
}

python3 -m pip install --user jedi
cd bundle/completor.vim/
npm install -g typescript
make js
cd ../../
echo "" > completor.vimrc
echo "let g:completor_tsserver_binary = '$(which tsserver)'" >> completor.vimrc
echo "let g:completor_node_binary = \"$SCRIPT_FOLDER/bundle/completor.vim/pythonxcompleters/javascript/node_modules/.bin/tern\"" >> completor.vimrc
echo "let g:completor_python_binary = \"$(which python)\"" >> completor.vimrc
