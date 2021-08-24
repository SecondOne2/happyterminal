#!/usr/bin/env bash

if [[ ! -d  $HOME/.config/animus ]]; then
    mkdir $HOME/.config/animus 
    cp test.txt testError.txt $HOME/.config/animus/
    echo """

animusFriend() {
    if [[ $? -ne 0 ]]; then
        randomText=$(( 1+$RANDOM % 36 ))
        textColor=$(sed -n ${randomText}p $HOME/.config/animus/testError.txt)
        echo -e "\n"
        toilet -F metal -f term "$textColor"
    else
        let odds=$(( $RANDOM % 2 ))
        if [[ $odds -eq 0 ]]; then
            randomText=$(( 1+$RANDOM % 60 ))
            textColor=$(sed -n ${randomText}p $HOME/.config/animus/test.txt)
            echo -e "\n"
            toilet -F gay -f term "$textColor"
        fi
    fi
}

terprompt="\n\[\e[4;9m\] ┌\[\e[0;2;36m\]\[\033[0;1;4;36;45m\]\w \n\[\033[0;4;34m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;1;7;31m\]\342\234\227\342\234\227 \[\e[0;33m\]Error \[\e[1;7;9m\]\$?\[\033[0;1;34m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\e[0;1;34m\]─╼\[\033[0;1;36m\]\u\[\033[0;01;35m\]@\[\033[01;31m\]\h\[\e[0m\]'; fi)\n\[\e[0;1;4;9;35m\]  └─\[\e[0;1;36m\]\$\[\e[0;1;32m\]"


antprompt=$PS1

alias animusenable='export PS1=$terprompt; export PROMPT_COMMAND=animusFriend'
alias animusdisable='export PS1=$antprompt; unset PROMPT_COMMAND'

""" >> $HOME/.bashrc
fi

hash toilet
if [[ $? -ne 0 ]]; then
    echo -e "Looks like toilet isn\'t installed so it will installed\n"
    sudo apt install toilet
fi

clear
source ~/.bashrc; echo -e "\nOk right now all is configure, to enable the prompt animus just type \e[1;32manimusenable\e[0m and for disable just type \e[1;35manimusdisable\e[0m\n"
