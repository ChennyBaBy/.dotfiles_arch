#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# dotfiles dir
dir=~/.dotfiles

# old dotfiles backup dir
olddir=~/.dotfiles_old

# list of files and folders to symlink in homedir
files="config zshrc Xresources xinitrc"

##########

# create dotfiles_old in homedir
echo "Backing up existing dotfiles to $olddir"
mkdir -p $olddir
echo "...done"

Change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"


# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfile .$file from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done


