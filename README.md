# Dev Config Files

Here are the config files I use for setting up my machine when developing Software. These include my Vim and bash config, as well as scripts I use to download all the necessary programming languages, and IDE's I generally use for development.

# Warning
Most of this will work on any system, 
however the `jasios_config.sh` script was developed with Debian based Linux distributions in mind.

The part of the script responsible for installing programs makes use of the apt package manager and snap.
If your system does not have the apt package manager or snap installed, feel free to install the development programs manually.

Configuring vim and bash **should work** on any system.

## To Install Configuration and Development programs
1. Download this repository in any directory of your choice.
2. Once downloaded, enter into this project: `cd dev-config-files`
3. Run the shell script `./jasios_config.sh`.
  - This script has multiple options that can be set using args `--`
    - To install everything (configurations, programming languages, and corresponding IDE's), run `./jasios_config.sh --all`.
    - To just install the vim configuration run `./jasios_config.sh --vim` in your terminal.
    - To just install the bash configuration run `./jasios_config.sh --bash` in your terminal.
    - To just install the development programs (languages, and corresponding IDE's), run `./jasios_config.sh --code.

## To Install configuration files manually
### To install Vim configuration (VimRC)
1. Download the .vimrc file found in this repo's `config_files` directory.
2. Copy and paste that file into your home directory.
  - If you're in the same directory as the downloaded .vimrc file you can open a terminal and `cp .vimrc ~/.vimrc`.
    - Keep in mind this will completely overwrite your current vimrc so make sure you save important configurations you added earlier.

### To install Bash configuration (BashRC)
1. Download the .bashrc file found in this repo's `config_files` directory.
2. Copy and paste that file into your home directory.
  - If you're in the same directory as the downloaded .bashrc file you can open a terminal and `cp .bashrc ~/.bashrc`.
    - Keep in mind this will completely overwrite your current bashrc so make sure you save important configurations you added earlier.


