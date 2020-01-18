#!/bin/bash
sudo apt update && sudo apt-get upgrade --yes
sudo apt install htop \
		 screen \
		 tmux \
		 vim \
		 screen \
		 gpg \
		 pass \
		 git

git config --global user.name ""
git config --global user.email ""
git config core.fileMode false
git config --global "cache --timeout=10000"

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Debian Buster and above only
#sudo apt install ripgrep fzf

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
rm ripgrep_11.2_amd64.deb

# generate keys
ssh-keygen 
# sudo cat /root/.ssh/authorized_keys > ~/.ssh/authorized_keys

# docker-compose
export DOCKER_COMPOSE_VERSION=1.24.1
sudo apt install --yes apt-transport-https ca-certificates curl software-properties-common

# docker itself
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y

# run as non-root
sudo usermod -aG docker root
sudo usermod -aG docker ${USER}
sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "\t testing docker installation..."
docker --version 
docker-compose --version

sudo apt clean

## ALIASES FILE

#!/bin/bash
cat << 'EOF' > ~/.bash_aliases
# show users logged into the hub who have open sessions.
alias dpsu='docker ps --format "table {{.ID}} | {{.Names}} | {{.Status}} | {{.Ports}}" -f "name=r*user*"'
# both of these show/filter docker processes with prettier formatting. 
alias dps='docker ps --format "table {{.ID}} | {{.Names}} | {{.Status}} | {{.Ports}}"'

alias ..='cd ../'                         # Move up 1 directory
alias ...='cd ../../'                     # Move up 2 directories
alias ....='cd ../../../'                 # Move up 3 directories
alias clc='clear'
alias ll='ls -ltr' ## see list of files in reverse chronological order.
alias la='ls -A' ## show hidden files (can add a/A to the above too... preference)

# completion from history. VERY USEFUL
alias cic='set completion-ignore-case On'
alias cico='set completion-ignore-case Off'
alias rr='source ~/.bashrc' # refresh environment
alias erc='vim ~/.bash_aliases' # shortcut to edit my shortcuts.

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=5000
# the following bind up/down to history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
if ! shopt -oq posix; then
	  if [ -f /usr/share/bash-completion/bash_completion ]; then
		      . /usr/share/bash-completion/bash_completion
		        elif [ -f /etc/bash_completion ]; then
				    . /etc/bash_completion
				      fi
			      fi
EOF

export GPG_TTY=$(tty)
