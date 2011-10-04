#!/bin/bash

for name in *; do
    
    # ignore ourself
    if [ "$name" = "install.sh" ]; then
        continue
    fi

    target="$HOME/.$name"

    # check if target already exists
    if [ -e $target ]; then
        if [ -L $target ]; then
            echo "Updating $target --> $PWD/$name"
            rm $target
            ln -s "$PWD/$name" "$target"
        else
            # we don't want to clobber existing files
            echo "WARNING: $target exists but is not a symlink. Skipping.."
        fi
    else
        # target doesn't exist, just make it
        echo "Creating $target --> $PWD/$name"
        ln -s "$PWD/$name" "$target"
    fi
done
