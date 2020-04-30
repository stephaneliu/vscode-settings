install_source=$PWD

if [[ $# -eq 0 ]]; then
  echo "Usage: ./install.sh -[ec] [install directory]"
  echo "e - Install (e)xtension only"
  echo "c - Install (c)onfiguration only"
  exit 1
fi

install_dest=$1
install_extension=1
install_configuration=1

while getopts "ce" opt
do
  case $opt in
  (c) install_extension=0; install_dest=$2;;
  (e) install_configuration=0; install_dest=$2;;
  esac
done

if [ ! -d $install_dest ]; then
  echo "Directory $install_dest does not exist. Spelling?"
  exit 1
fi

if (( install_extension )); then
  # If install is slow, make sure telemetry is turned off
  # settings.json disables this as well
  code --force --install-extension alexdima.copy-relative-path
  code --force --install-extension aaron-bond.better-comments
  code --force --install-extension austenc.tailwind-docs
  code --force --install-extension coenraads.bracket-pair-colorizer-2
  code --force --install-extension christian-kohler.path-intellisense
  code --force --install-extension DavidAnson.vscode-markdownlint
  code --force --install-extension dbaeumer.vscode-eslint
  code --force --install-extension eamodio.gitlens
  code --force --install-extension esbenp.prettier-vscode
  code --force --install-extension extr0py.vscode-relative-line-numbers
  code --force --install-extension ginfuru.ginfuru-better-solarized-dark-theme
  code --force --install-extension lucaslpsan.vuetify-pug-snippet
  code --force --install-extension mechatroner.rainbow-csv
  code --force --install-extension ms-azuretools.vscode-docker
  code --force --install-extension msjsdiag.debugger-for-chrome
  code --force --install-extension octref.vetur
  code --force --install-extension pkief.material-icon-theme
  code --force --install-extension rebornix.ruby
  code --force --install-extension sdras.night-owl
  code --force --install-extension sdras.vue-vscode-snippets
  code --force --install-extension vscodevim.vim
  code --force --install-extension WallabyJs.quokka-vscode
  code --force --install-extension wingrunr21.vscode-ruby
fi

if (( install_configuration )); then
  if [ ! -d $install_dest/.vscode ]; then
    mkdir $install_dest/.vscode
  fi

  cp -f $install_source/.vscode/settings.json $install_dest/.vscode/settings.json

  if [ -f $install_dest/.gitignore ]; then
    echo ".vscode/settings.json" >> $install_dest/.gitignore
  fi
fi

echo "Done!"
exit 0
