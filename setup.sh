echo "#######################################################################"
echo "#################### FIRST TIME LINUX SETUP ###########################"
echo "#######################################################################"

######## ASK FOR PASSWORD ONLY ONCE DURING 1 HOUR
bypass() {
	sudo -v
	while true;
	do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &
}

bypass

######## ADDING NEW APT REPOS ########
# VScode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# KiCAD

sudo apt-get update

######## PACKAGES AND APPLICATIONS ########

# Update our current repos
sudo apt-get -y upgrade

# Node

# VScode
sudo apt-get install apt-transport-https
sudo apt-get install code

# Spotify

# Slack

# Chrome

# GNOME Tweaks
sudo apt-get install gnome-tweaks

# GNOME Tweaks Extension - Dash to Panel
sudo apt-get install gnome-shell-extension-dash-to-panel

# KiCad

# Segger Tools

# AVR Tools
sudo apt-get install gcc-avr avr-libc avrdude

# ARM Compiler

# Ruby
sudo apt-get install ruby

# XZ-Utils
sudo apt-get install xz-utils

# Ceedling unit test framework
sudo gem install ceedling

# Install bat util
wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_amd64.deb
sudo dpkg -i bat_0.15.4_amd64.deb

# Download & Apply the Nordic Theme
wget https://github.com/EliverLara/Nordic/releases/download/v1.9.0/Nordic-darker.tar.xz
tar -xf ./Nordic-darker.tar.xz
sudo mv ./Nordic-darker /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme "Nordic-darker"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic-darker"

# Download & Apply Transparent GNOME Extension
git clone https://github.com/rockon999/dynamic-panel-transparency.git
sudo mv ./dynamic-panel-transparency/dynamic-panel-transparency@rockon999.github.io ~/.local/share/gnome-shell/extensions/
gnome-shell-extension-tool -e dynamic-panel-transparency

######## CONFIG ########
# Load our dconf DB
dconf load / < gnome_settings.dconf
# .bashrc (git branch info on end of line

######## CLEANUP ########
git clean -f -xd
rm -r dynamic-panel-transparency

echo "#######################################################################"
echo "######## Setup complete. Please log out for settings to apply  ########"
echo "#######################################################################"

exit
