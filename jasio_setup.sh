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
    echo "  -s --config            To setup config files (bash, vim)"
    echo "  -h --help              Show this help section"
    echo "  -b --bash              To setup Bash config file (BashRC) WARNING: This will overwrite your current BashRC"
    echo "  -v --vim               To setup Vim config file (VimRC) WARNING: This will overwrite your current VimRC"
    echo "  -c --code              To install coding languages, IDE's, and helpful coding Software like git"
    echo "  -a --all               To execute all of the above at once"
}

if [[ "$arg" == "" ]]
then
    echo "Are you sure you want to install all? [y/n]"
    echo "For more details use -h or --help"
    read resp
    echo "You have selected $resp"
    if [[ "$resp" == "y" || "$resp" == "yes" ]]
    then
        arg="--all"
    elif [[ "$resp" == "-h" || "$resp" == "--help" || "$resp" == "help" ]]
    then
        showHelp
        exit 0
    elif [[ "$resp" == "n" || "$resp" == "no" ]]
    then
        echo "Ok, not installing anything..."
        exit 0
    else
        printf "Not a valid response...\n\n"
        showHelp
        exit 1
    fi
fi

if [[ "$2" != "" ]]
then
    echo "Too many args..."
    printf "Please enter 1 argument only!\n\n"
    showHelp
    exit 1
fi

valid_args=("-b" "--bash" "-v" "--vim" "-c" "--code" "-a" "--all" "-h" "--help" "-s" "--config")
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
if [[ "$arg" == "-b" || "$arg" == "-a" || "$arg" == "-s" || "$arg" == "--config" || "$arg" == "--bash" || "$arg" == "--all" ]]
then
    ### print out a message to tell user what is being added
    echo "  Configuring BashRC (~/.bashrc)"
    ## bash config
    cp ./config_files/.bashrc ~/.bashrc
    ## finished
    ### print final message informing the user process finished
    echo "    -Done!"
fi

if [[ "$arg" == "-v" || "$arg" == "-a" || "$arg" == "-s" || "$arg" == "--config" || "$arg" == "--vim" || "$arg" == "--all" ]]
then
    ### print out a message to tell user what is being added
    echo "  Configuring VimRC (~/.vimrc)"
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
    sudo snap install pycharm-community --classic  # my main python IDE
    sudo snap install intellij-idea-community --classic  # my main Java IDE
    echo "  Still need to pick a decent C IDE"
    echo "  Since I primarily develop Firmware I just use vim, build, then deploy and test on physical hardware like Arduino."
    ## finished
    ### print final message informing the user process finished
    echo "    -Done!"
fi
