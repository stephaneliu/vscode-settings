install_source=$PWD

if [[ $# -eq 0 ]]; then
  echo "Usage: ./install.sh [install directory]"
  exit 1
fi

# If install is slow, make sure telemetry is turned off
# settings.json disables this as well
code --force --install-extension alexdima.copy-relative-path
code --force --install-extension DavidAnson.vscode-markdownlint
code --force --install-extension dbaeumer.vscode-eslint
code --force --install-extension esbenp.prettier-vscode
code --force --install-extension extr0py.vscode-relative-line-numbers
code --force --install-extension ginfuru.ginfuru-better-solarized-dark-theme
code --force --install-extension lucaslpsan.vuetify-pug-snippet
code --force --install-extension mechatroner.rainbow-csv
code --force --install-extension ms-azuretools.vscode-docker
code --force --install-extension msjsdiag.debugger-for-chrome
code --force --install-extension octref.vetur
code --force --install-extension rebornix.ruby
code --force --install-extension sdras.night-owl
code --force --install-extension sdras.vue-vscode-snippeets
code --force --install-extension vscodevim.vim
code --force --install-extension WallabyJs.quokka-vscode
code --force --install-extension wingrunr21.vscode-ruby
# code --force --install-extension

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
