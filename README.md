# KitClient-Codespace

A KitClient that runs in GitHub Codespaces.

## Starting or Restarting a KitClient

1. Log into GitHub
2. Click the button below to start a new KitClient or restart an existing KitClient.
   <br><a href='https://codespaces.new/HFOSSedu/KitClient-Codespace?quickstart=1'><img src='https://github.com/codespaces/badge.svg' alt='Open in GitHub Codespaces' style='max-width: 100%;'></a>
   <br>Then:
   1. Create a new or open an existing KitClient.
      - If this is the first KitClient you have created from HFOSSedu/KitClient-Codespace, click the green "Create new Codespace" button.
      - If you have an existing KitClient created from HFOSSedu/KitClient-Codespace, click the green "Resume this Codespace" button to open it.
      - If you have multiple KitClients created from HFOSSedu/KitClient-Codespace, and want to pick one of them, visit your [Codespaces page](https://github.com/codespaces).
   2. A new browser window or tab will open where the KitClient will load.
   3. Wait for the KitClient to become ready for use.
      - Creating a new KitClient can take several minutes. 
        - You will see the screen contents change several times.
        - Eventually a prompt asking you to "Paste you GitHub Personal Access Token (PAT) here:" will appear.
        - [Create a new PAT](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-personal-access-token-classic) or use an existing one with the `Repo` option for "scopes and permissions".
        - Paste the PAT at the prompt and press enter.  Note that your PAT will not be displayed when you paste it.
        - Your new KitClient is ready for use when you see the prompt with your GitHub username in the terminal.
      - Restarting an existing KitClient requires much less time.
        - An existing KitClient is ready when it returns to the state that it was in when you last stopped it.

## Stopping the KitClient

To stop a KitClient you can 
1. Click "Codespaces" in the lower left corner of the browser window.
2. Choose the "Stop Current Codespace" from the pop-up menu.
3. Close the browser tab.

Alternatively you can:
1. Visit your [Codespaces page](https://github.com/codespaces).
2. Click the "..." to the right of the Codespace you want to stop.
3. Choose "Stop codespace".

## Recommended Configuration

GitHub provides 120 core-hours of free Codespace use per month. This translates into 60 clock-hours of use with a default 2-core Codespace. To avoid accidentally using this free time when not working, GitHub allows you to configure an automatic timeout for Codespaces.  The default value for this 30 minutes.

You can configure a shorter timeout:
1. Visit your [Codespace settings page](https://github.com/settings/codespaces). 
2. Scroll down and adjust the "Default Idle Timeout" setting. This is the amount of time the codespace will continue running if you are not interacting with the development environment.
3. Set the time out to your preferred value.  
   - 15 minutes is a good balance that ensures the KitClient is not shutdown too soon, but also does not waste your free time.

## Author Snippets to Start the KitClient

The snippets below can be used when authoring text or pages where the KitClient is to be opened. 

These snippets will:
- Start a new Codespace if the user does not currently have a Codespace on HFOSSedu/KitClient-Codespaces.
- Restart a user's current Codespace if they already have one on HFOSSedu/KitClient-Codespaces.

### Plain URL

- `https://codespaces.new/HFOSSedu/KitClient-Codespace?quickstart=1`

### HTML w/ "Open in GitHUB Codespaces" Button

- `<a href='https://codespaces.new/HFOSSedu/KitClient-Codespace?quickstart=1'><img src='https://github.com/codespaces/badge.svg' alt='Open in GitHub Codespaces' style='max-width: 100%;'></a>
`
### Markdown w/ "Open in GitHub Codespaces" Button

- `[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/HFOSSedu/KitClient-Codespace?quickstart=1)`