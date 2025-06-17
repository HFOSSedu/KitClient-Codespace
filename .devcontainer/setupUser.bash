#!/bin/bash

# Setup the user if it has not been setup already.
if [ ! -d /workspaces/$USER ]; then
  # Link the users home directory into a subdirectory of workspace.
  # This will allow dirs in the home directory to bind mount into docker containers.
  ln -s /home/$USER /workspaces/$USER

  # Do some basic git configuration
  git config --global merge.conflictstyle diff3 \
   && git config --global mergetool.vscode.cmd 'code --wait $MERGED' \
   && git config --global merge.tool vscode \
   && git config --global mergetool.keepBackup false \
   && git config --global core.editor "nano" \
   && git config --global pull.ff only \
   && git config --global init.defaultBranch main \
   && git config --global safe.directory '*' \
   && git config --global pager.config false \
   && echo "" >> "/home/$USER/.bashrc" \
   && echo "source /usr/share/bash-completion/completions/git" >> "/home/$USER/.bashrc" 

  # Always reopen VSCode without any folder open the first time the 
  # codespace is opened.  This avoids a non-determinisitc issue where
  # the ${CODESPACE_VSCODE_FOLDER} doesn't get sometimes.
  code -r
fi

# If the user's home directory is the open folder, then
# reopen VSCode without any folder open.
if [ "${CODESPACE_VSCODE_FOLDER}" == "/home/vscode" ]; then
  code -r
fi