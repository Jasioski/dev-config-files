# Dev Config Files

Here are the config files I use for setting up my machine when developing Software. These include my Vim and Bash config, as well as scripts I use to download all the necessary programming languages, and IDE's I generally use for development.

# Warning
`jasio_setup.sh` script was developed with Debian based Linux distributions in mind.

The part of the script responsible for installing programs makes use of the apt package manager and snap.
If your system does not have the apt package manager, feel free to install the development programs manually.

Configuring vim and bash **should work** on any system.

## To Install Configuration and Development programs
1. Save the setup script from this repository `jasio_setup.sh` into any directory of your choice.
2. Once saved, open a terminal and navigate to the directory the setup file is saved in
  - For example, if you downloaded the file into a temp directory in your home folder `~/temp/jasio_setup.sh`, in a terminal use cd to navigate to that folder `cd ~/temp`
3. Run the shell script `bash jasio_setup.sh` or `./jasio_setup.sh`.
  - **If this script failed to run, it's most likely due to your permission settings**
    - Running `chmod u+x jasio_setup.sh` in your terminal should solve the issue.
  - This script has multiple options that can be set using args `- or --`
    - To install everything (configurations, programming languages, and corresponding IDE's), run `./jasio_setup.sh -a or --all`.
    - To just install the vim configuration run `./jasio_setup.sh -v or --vim` in your terminal.
    - To just install the bash configuration run `./jasio_setup.sh -b or --bash` in your terminal.
    - To just install the development programs (languages, and corresponding IDE's), run `./jasio_setup.sh -c or --code.

## To Install configuration files manually
### To install Vim configuration (VimRC)
1. Download the .vimrc file found in this repo's `config_files` directory.
2. Copy and paste that file into your home directory.
  - If you're in the same directory as the downloaded .vimrc file you can open a terminal and `cp .vimrc ~/.vimrc`.
    - Keep in mind this will completely overwrite your current vimrc so make sure you save important configurations you added earlier.

### To install Bash configuration (BashRC and Bash_Logout)
1. Download the .bashrc file found in this repo's `config_files` directory.
2. Copy and paste that file into your home directory.
  - If you're in the same directory as the downloaded .bashrc file you can open a terminal and `cp .bashrc ~/.bashrc`.
    - Keep in mind this will completely overwrite your current bashrc so make sure you save important configurations you added earlier.


3. Download the .bash_logout file found in this repo's `config_files` directory.
4. Copy and paste that file into your home directory.
  - If you're in the same directory as the downloaded .bash_logout file you can open a terminal and `cp .bash_logout ~/.bash_logout`.
    - Keep in mind this will completely overwrite your current bash_logout so make sure you save important configurations you added earlier.

## Notes
### Config Files
VimRC
  - The .vimrc script makes use of ctags and in the .vimrc file on line 75, it looks at projects in the ~/Documents/git directory.
    - Change this path to whatever directory you have as the root directory of your projects.
