# github-action-push-to-another-repository

This is a fork of [`cpina`](https://github.com/cpina)'s GitHub action that adds the `rsync` parameter. This lets the user specify what they want copied over and what files to ignore vs. copying the entire directory over and wiping the destination. ["Rsync is a ... file copying tool"](https://linux.die.net/man/1/rsync).

# Rsync

One can learn and test Rsync commands easier with [RsyncOSX](https://rsyncosx.netlify.app/) by [Thomas Evensen](https://rsyncosx.netlify.app/about/). You can duplicate a similar directory structure as your source/destination repos, add some text files, then test your commands until it does what you want to do before adding the rsync command to the GitHub workflow file.

# Example
- The only real difference here in terms of the workflow file is the additional rsync parameter where you can supply an rsync command. The rsync parameter is optional (but also the only reason you would be using this action anyways).
```
name: DEPLOY

on:
  push:
    branches:
    - main

jobs:
  build:
    runs-on: ubuntu-latest
    container: ubuntu
    steps:
      - uses: actions/checkout@v3
      - name: Pushes to another repository
        id: push_directory
        uses: 6notes/push-to-another-repo-with-rsync@main
        env:
          SSH_DEPLOY_KEY: ${{ secrets.SSH_DEPLOY_KEY }}
        with:
          source-directory: 'EXAMPLE/SRC/DIRECTORY'
          destination-github-username: 'USERNAME'
          destination-repository-name: 'REPO_NAME'
          user-email: jlu6.proton@proton.me
          target-branch: main
          rsync: 'rsync --archive --verbose --delete --exclude=.git* --exclude=package*.json --exclude=node_modules --exclude=.next --exclude=README.md --stats'
```

# Documentation for the unchanged parts of this GitHub Action
See the extensive documentation in https://cpina.github.io/push-to-another-repository-docs/ (includes examples, FAQ, troubleshooting, etc.).

GitHub repository of the documentation: https://github.com/cpina/push-to-another-repository-docs
