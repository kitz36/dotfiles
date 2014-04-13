#!/bin/bash

#############################################################################
# This script creates symlinks from the home directory to any desired
# dotfiles in ~/dotfiles.
#############################################################################

DOTDIR="${HOME}/dotfiles"
DOTDIR_OLD="${DOTDIR}_old"
DOTFILES="bashrc vimrc"

if [ ! -d ${DOTDIR_OLD} ]; then
    echo -n "creating ${DOTDIR_OLD} for backup... "
    mkdir -p ${DOTDIR_OLD}
    echo "done"
fi

for DOTFILE in ${DOTFILES}; do
    OLDFILE="${HOME}/.${DOTFILE}"
    echo -n "moving ${OLDFILE} to ${DOTDIR_OLD}/${OLDFILE}... "
    mv ${OLDFILE} ${DOTDIR_OLD}
    echo "done"
done

for DOTFILE in ${DOTFILES}; do
    LINKNAME="${HOME}/.${DOTFILE}"
    TARGETNAME="${DOTDIR}/${DOTFILE}"
    echo -n "linking $LINKNAME to $TARGETNAME... "
    ln -s $TARGETNAME $LINKNAME
    echo "done"
done
