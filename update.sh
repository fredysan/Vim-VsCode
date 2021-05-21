#!/bin/bash
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

if [ $# -eq 0 ]
  then
    echo -e "${RED}Missing VscodeVim version: Example: ./update.sh '1.20.3'${ENDCOLOR}"
    exit 1
fi

echo -e "${GREEN}Updating${ENDCOLOR}"
git checkout master
git merge upstream/master

echo -e "${GREEN}Building${ENDCOLOR}"
gulp build

echo "Copying files to: /home/fredy/.vscode/extensions/vscodevim.vim-$1/out"
cp out/* "/home/fredy/.vscode/extensions/vscodevim.vim-$1/out"

echo -e "${GREEN}Enjoy!!${ENDCOLOR}"
