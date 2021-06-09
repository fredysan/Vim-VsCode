#!/bin/bash

# 1. Update the extension inside VsCode as usual.
# 2. Run ./update.sh '[TAG]'


RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"


if [ $# -eq 0 ]
  then
    echo -e "${RED}Missing VscodeVim version: Example: ./update.sh '1.20.3'${ENDCOLOR}"
    exit 1
fi

echo -e "${GREEN}Updating${ENDCOLOR}"
git fetch upstream
git rebase upstream/master
git push origin master --force

npm install

echo -e "${GREEN}Building${ENDCOLOR}"
gulp build

echo "Copying files to: $HOME/.vscode/extensions/vscodevim.vim-$1/out"
cp out/* "${HOME}/.vscode/extensions/vscodevim.vim-$1/out"

echo -e "${GREEN}Enjoy!!${ENDCOLOR}"
