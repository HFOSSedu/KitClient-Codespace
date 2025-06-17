#!/bin/bash

# Remove the PAT set by the codespace.
# That PAT is scoped for the repo used to create the codespace.
# It will not work to push a manually cloned repo.
export GITHUB_TOKEN=

NEW_TOKEN=0

# If we don't already have a token stashed, then prompt for one
# and stash it.
if [ ! -f ~/.kit/token ];
then
  NEW_TOKEN=1
  echo "The Kit development environment requires"
  echo "a GitHub Personal Access Token (PAT) with"
  echo "repo permission."
  echo ""

  PAT=$($VSCODE_GIT_ASKPASS_NODE /workspaces/KitClient-Codespace/.devcontainer/readPAT.js)
  echo ""
  mkdir ~/.kit
  echo $PAT > ~/.kit/token
fi

PAT=$(cat ~/.kit/token)
export GITHUB_TOKEN=$PAT

# If the PAT does not work, prompt for a new one until we 
# get one that works.
while ! gh auth status &> /dev/null;
do
  export GITHUB_TOKEN=
  NEW_TOKEN=1

  echo "Your Personal Access Token (PAT) is not valid."
  echo "Possible reasons include:"
  echo "  The PAT you entered may have been incorrect."
  echo "  The PAT you entered previously may have expired."
  echo ""

  PAT=$($VSCODE_GIT_ASKPASS_NODE /workspaces/KitClient-Codespace/.devcontainer/readPAT.js)
  echo ""

  echo "$PAT" > ~/.kit/token
  export GITHUB_TOKEN=$PAT
done

if [ -z "$(grep "GITHUB_TOKEN" ~/.bashrc)" ]; 
then
  echo "" >> ~/.bashrc
  echo "export GITHUB_TOKEN=$GITHUB_TOKEN" >> ~/.bashrc
else 
  sed -i "s/GITHUB_TOKEN=.*/GITHUB_TOKEN=$PAT/" ~/.bashrc
fi

if [ "$NEW_TOKEN" == "1" ]; then
  echo "GitHub PAT has been set successfully."
fi