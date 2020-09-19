#!/bin/bash
# Generic contains function declaration
function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}

# Main body of code starts here
arg=$1

function showHelp {
    echo "Options:"
    echo " Choosing any of the valid options below will automatically install prerequesite software: curl, wget, and ctags"
    echo "  -s, --config            To setup config files (bash, vim)"
    echo "  -h, --help              Show this help section"
    echo "  -b, --bash              To setup Bash config files (BashRC and Bash_Logout) WARNING: This will overwrite your current Bash config"
    echo "  -v, --vim               To setup Vim config file (VimRC) WARNING: This will overwrite your current VimRC"
    echo "  -i, --i3                To setup my i3 config (only use this if you use i3 window manager)"
    echo "  -h, --help              Show this help section"
    echo ""
    echo " Choosing any of the options below will automatically install prerequesite software: snap package manager"
    echo "  -c, --code              To install coding languages, IDE's, and helpful coding Software like git"
    echo "  -a, --all               To execute all of the above except for i3"
}

if [[ "$arg" == "" ]]
then
    showHelp
    exit 1
fi

if [[ "$2" != "" ]]
then
    echo "Too many args..."
    printf "Please enter 1 argument only!\n\n"
    showHelp
    exit 1
fi

valid_args=("-b" "--bash" "-v" "--vim" "-i" "--i3" "-c" "--code" "-a" "--all" "-h" "--help" "-s" "--config")
if [ $(contains "${valid_args[@]}" == "$arg") != "y" ];
then
    printf "Not a valid arg...\n\n"
    showHelp
    exit 1
fi

if [[ "$arg" == "--help" || "$arg" == "-h" ]]
then 
    showHelp
    exit 0
fi

echo "Configuring machine for Jasio's setup:"

# install prerequesites ctags, snapd, curl and wget
sudo apt update
sudo apt install ctags
sudo apt install -y curl
sudo apt install -y wget

if [[ "$arg" == "-i" || "$arg" == "--i3" ]]
then
    ### print out a message to tell user what is being added
    sudo apt install i3
    echo "  Configuring i3"
    ### configure general i3
    if [ -d ~/.i3 ]
        then
            sudo cp ./config_files/config ~/.i3/config
    elif [ -d ~/.config/i3 ]
        then
            sudo cp ./config_files/config ~/.config/i3/config
    else
        echo "  Can't find i3 config folder. Something went wrong..."
        exit 1
    fi
    ### configure i3 bar
    echo "  Installing pavucontrol for i3bar volume display"
    sudo apt install pavucontrol -y
    echo "  Installing i3blocks for i3bar"
    sudo apt install i3blocks -y
    sudo cp ./config_files/i3blocks.conf /etc/i3blocks.conf
    echo "    -Done!"
fi

if [[ "$arg" == "-b" || "$arg" == "-a" || "$arg" == "-s" || "$arg" == "--config" || "$arg" == "--bash" || "$arg" == "--all" ]]
then
    ### print out a message to tell user what is being added
    echo "  Configuring BashRC (~/.bashrc)"

    if [ ! -d ./config_files ]
        then
            mkdir config_files
    fi
    if [ ! -f ./config_files/.bash_logout ]
        then
            wget "https://raw.githubusercontent.com/Jasioski/dev-config-files/master/config_files/.bash_logout"
            mv ./.bash_logout ./config_files/.bash_logout
    fi
    if [ ! -f ./config_files/.bashrc ]
        then
            wget "https://raw.githubusercontent.com/Jasioski/dev-config-files/master/config_files/.bashrc"
            mv ./.bashrc ./config_files/.bashrc
    fi
    ## bash config
    cp ./config_files/.bashrc ~/.bashrc
    echo "  Configuring Bash_Logout (~/.bash_logout)"
    ## bash config
    cp ./config_files/.bash_logout ~/.bash_logout
    ## finished
    ### print final message informing the user process finished
    echo "    -Done!"
fi

if [[ "$arg" == "-v" || "$arg" == "-a" || "$arg" == "-s" || "$arg" == "--config" || "$arg" == "--vim" || "$arg" == "--all" ]]
then
    ### print out a message to tell user what is being added
    echo "  Configuring VimRC (~/.vimrc)"
    if [ ! -f ./config_files/.vimrc ]
        then
        if [ ! -d ./config_files ]
            then
                mkdir config_files
        fi
        wget "https://raw.githubusercontent.com/Jasioski/dev-config-files/master/config_files/.vimrc"
        mv ./.vimrc ./config_files/.vimrc
    fi
    cp ./config_files/.vimrc ~/.vimrc
    ## vim config
    ## finished
    ### print final message informing the user process finished
    echo "    -Done!"
fi

if [[ "$arg" == "-c" || "$arg" == "-a" || "$arg" == "--code" || "$arg" == "--all" ]]
then
    echo "  Installing Software used for Programming"
    sudo apt-get install git  # git for source control
    sudo apt-get install python3  # python3 for python development
    sudo apt-get install default-jdk  # java jdk for java development
    sudo apt install -y snapd # install snap package manager when necessary
    sudo snap install pycharm-community --classic  # my main python IDE
    sudo snap install intellij-idea-community --classic  # my main Java IDE
    echo "  Still need to pick a decent C IDE"
    echo "  Since I primarily develop Firmware I just use vim, build, then deploy and test on physical hardware like Arduino."
    ## finished
    ### print final message informing the user process finished
    echo "    -Done!"
fi
