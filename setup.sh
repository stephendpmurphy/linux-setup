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

echo "######## Begining Linux Setup ########"

# Add needed repositories
# KICAD

echo "######## Updating repositories ########"
sudo apt update

# Install all of my packages and programs I commonly use
# Node
# VScode
## apt-get install code
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

# Dot files
# .bashrc (git branch info on end of line

# Update all of our packages
sudo apt-get -y upgrade

# Clean up
git clean -f -xd

echo "######## Setup complete. Enjoy! ########"
exit

