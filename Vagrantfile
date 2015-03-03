# -*- mode: ruby -*-
# vi: set ft=ruby :

# My simple setup of an ubuntu trusty 64bit dev environment with the following
# extra packages installed:
#
# build-essential python python-dev python-setuptools git tmux vim zsh irssi
# ack-grep sqlite nodejs 
#
# Also installs vim with my .vimrc, plugins and such, a .tmux.conf with one line
# to fix screen buffer bugs. Also installs ZSH with OhMyZsh.
#
# Connect with:
# ssh vagrant@192.168.33.10

Vagrant.configure(2) do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "codeland"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  # Provisioning! This is where the magic happens ^_^
  # Removed after curl -sL https://raw.gi...
  # sudo chsh -s $(which zsh) vagrant
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt-get update -y
    sudo apt-get install -y build-essential python python-dev python-setuptools git tmux vim zsh irssi ack-grep sqlite
    
    curl -sL https://deb.nodesource.com/setup | sudo bash -
    sudo apt-get install -y nodejs

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
    curl -sL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sudo sh
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
    zsh

    curl -o ~/.vimrc https://raw.githubusercontent.com/kozie/dotfiles/master/.vimrc
    curl -o ~/.tmux.conf https://raw.githubusercontent.com/kozie/dotfiles/master/.tmux.conf
    
    vim -e +PluginInstall +qa
  SHELL
end
