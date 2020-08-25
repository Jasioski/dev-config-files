#!/bin/bash
arg=$1

if [[ "$arg" == "" ]]
then
    echo "Are you sure you want to install all? [y/n]"
    echo "For more details use --help"
    read resp
    echo "You have selected $resp"
    if [[ "$resp" == "y" || "$resp" == "yes" ]]
    then
        arg="--all"
    elif [[ "$resp" == "--help" || "$resp" == "help" ]]
    then
        arg="--help"
    elif [[ "$resp" == "n" || "$resp" == "no" ]]
    then
        echo "Ok, not installing anything..."
        exit 0
    else
        echo "Not a valid response..."
        exit 1
    fi
fi

if [[ "$2" != "" ]]
then
    echo "Too many args..."
    echo "Please enter 1 argument only!"
    echo "Too see a valid list of args please use: --help (./jasios_config.sh --help)"

elif [[ "$arg" == "--help" ]]
then 
    echo "Help section:"
    echo "Run valid args like this: (./jasios_config.sh --arg)"
    echo "To setup BashRC use:                                                          --bash"
    echo "To setup VimRC use:                                                           --vim"
    echo "To install coding languages, IDE's, and helpful coding Software like git use: --code"
    echo "To install all above in 1 go use:                                             --all"

else
    if [[ "$arg" != "--bash" && "$arg" != "--vim" && "$arg" != "--code" && "$arg" != "--all" ]]
    then
        echo "Not a valid arg..."
        echo "Too see a valid list of commands please use: --help (./jasios_config.sh --help)"
    fi

    echo "Configuring machine for Jasio's setup:"
    if [[ "$arg" == "--bash" || "$arg" == "--all" ]]
    then
        ### print out a message to tell user what is being added
        echo "  Configuring BashRC (~/.bashrc)"
        ## bash config
        cp ./config_files/.bashrc ~/.bashrc
        ## finished
        ### print final message informing the user process finished
        echo "    -Done!"
    fi

    if [[ "$arg" == "--vim" || "$arg" == "--all" ]]
    then
        ### print out a message to tell user what is being added
        echo "  Configuring VimRC (~/.vimrc)"
        cp ./config_files/.vimrc ~/.vimrc
        ## vim config
        ## finished
        ### print final message informing the user process finished
        echo "    -Done!"
    fi

    if [[ "$arg" == "--code" || "$arg" == "--all" ]]
    then
        echo "  Installing Software used for Programming"
        sudo apt-get install git  # git for source control
        sudo apt-get install python3  # python3 for python development
        sudo apt-get install default-jdk  # java jdk for java development
        sudo snap install pycharm-community --classic  # my main python IDE
        sudo snap install intellij-idea-community --classic  # my main Java IDE
        echo "  Still need to pick a decent C IDE"
        echo "  Since I primarily develop Firmware I just use vim, build, then deploy and test on physical hardware like Arduino."
        ## finished
        ### print final message informing the user process finished
        echo "    -Done!"
    fi
fi
