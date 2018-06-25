#!/bin/bash

which ctags-exuberant 2>&1> /dev/null || {
    sudo apt-get install exuberant-ctags  
}

pip install --user jedi
cd bundle/completor.vim/
make js
npm install -g typescript
cd ../../
echo "let g:completor_tsserver_binary = '$(which tsserver)'" >> completor.vimrc
echo "let g:completor_node_binary = \"$PWD/bundle/completor.vim/pythonxcompleters/javascript/node_modules/.bin/tern\""
>> completor.vimrc
echo "let g:completor_python_binary = \"$(which python)\"" >> completor.vimrc
