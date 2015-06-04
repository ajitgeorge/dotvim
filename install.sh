#!/bin/bash

make_symbolic_link () {
    local linkfrom=$2
    local linkto=$1

    if [[ -e $linkfrom ]] ; then
        if [[ $(readlink $linkfrom) == "$linkto" ]] ; then
            echo $linkto already installed at $linkfrom
            return
        else
            echo $linkfrom exists but does not point to $linkto.  Aborting.
            exit 1
        fi
    fi

    echo ln -s $linkto $linkfrom
    ln -s $linkto $linkfrom
}

here=$(ruby -e 'puts File.absolute_path(".")') # hack around OS X not having have realpath

make_symbolic_link $here ~/.vim
make_symbolic_link $here/vimrc ~/.vimrc

