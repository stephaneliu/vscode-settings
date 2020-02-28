# VS Code Settings

User settings added to VS Code workspace context. Since global settings is not easily acceptable in
~/Library/Application\ Support/..., the next best option is to create a workspace setting for each
project.

The bash script will create the proper .vscode directory in the current directory and copy settings.json folder into project workspace. It will also append `.vscode/*` to the .gitignore file.

Extensions:

- Font: Fira Code (https://github.com/tonsky/FiraCode). Install font with Brew.

Installing:

`./install.sh [installation directory]`
