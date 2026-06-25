#!/bin/bash
# Script to reproduce ~/.gitconfig settings

# Init settings
git config --global init.defaultBranch "main"

# Color settings
git config --global color.ui "auto"

git config --global color.branch.current "yellow bold"
git config --global color.branch.local "green bold"
git config --global color.branch.remote "cyan bold"

git config --global color.diff.meta "yellow bold"
git config --global color.diff.frag "magenta bold"
git config --global color.diff.old "red bold"
git config --global color.diff.new "green bold"
git config --global color.diff.whitespace "red reverse"

git config --global color.status.added "green bold"
git config --global color.status.changed "yellow bold"
git config --global color.status.untracked "red bold"

# Aliases
git config --global alias.ci "commit"
git config --global alias.glog "log --oneline --graph --decorate"
git config --global alias.stat "status"

# LFS filter
git config --global filter.lfs.smudge "git-lfs smudge -- %f"
git config --global filter.lfs.process "git-lfs filter-process"
git config --global filter.lfs.required "true"
git config --global filter.lfs.clean "git-lfs clean -- %f"

# Push settings
git config --global push.autoSetupRemote "true"
