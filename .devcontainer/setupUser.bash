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
fi

# There is a race condition where sometimes the ${CODESPACE_VSCODE_FOLDER} 
# variable doesn't get set before we get here...
while [ "${CODESPACE_VSCODE_FOLDER}" == "" ];
do
  sleep 1
  echo "CODESPACE_VS_CODE_FOLDER: ${CODESPACE_VSCODE_FOLDER}"
done

# If the user's home directory (or the link to it) is the open folder, then
# reopen VSCode without any folder open.
if [ "${CODESPACE_VSCODE_FOLDER}" == "/home/vscode" ] || [ "${CODESPACE_VSCODE_FOLDER}" == "/workspaces/vscode" ]; then
  code -r
fi