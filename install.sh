#!/bin/bash

RED="\033[01;31m"
YELLOW="\033[01;33m"
GREEN="\033[01;32m"
BLUE="\033[01;34m"
WHITE="\033[00m"

for name in *; do
    
    # ignore ourself
    if [ "$name" = "install.sh" ]; then
        continue
    fi

    # ignore update script
    if [ "$name" = "update_submodules.sh" ]; then
        continue
    fi

    target="$HOME/.$name"

    # check if target already exists
    if [ -e $target ]; then
        if [ -L $target ]; then
            echo -e "${YELLOW}Updating${WHITE} $target --> $PWD/$name"
            rm $target
            ln -s "$PWD/$name" "$target"
        else
            # we don't want to clobber existing files
            echo -e "${RED}WARNING:${WHITE} $target exists but is not a symlink. Skipping.."
        fi
    else
        # target doesn't exist, just make it
        echo -e "${GREEN}Creating${WHITE} $target --> $PWD/$name"
        ln -s "$PWD/$name" "$target"
    fi
done
