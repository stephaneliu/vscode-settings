install_source=$PWD

if [[ $# -eq 0 ]]; then
  echo "Usage: ./install.sh [install directory]"
  exit 1
fi

install_dest=$1

if [ ! -d $install_dest/.vscode ]; then
  mkdir $install_dest/.vscode
fi

cp -f $install_source/.vscode/settings.json $install_dest/.vscode/settings.json

if [ -f $install_dest/.gitignore ]; then
  echo ".vscode/settings.json" >> $install_dest/.gitignore
fi

echo "Installed!"
exit 0