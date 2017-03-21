## Functions
function ssh_state {
    if [ -n "$SSh_CONNECTION" ]; then
        echo "%{$fg[red]%}<%{$fg[white]%}SSH%{$fg[red]%}> "
    fi
}

function collapse_pwd {
    if [[ $(pwd) == $HOME ]]; then
        echo $(pwd)
    else    
        echo $(pwd | sed -e "s,^$HOME,~,")
    fi
}

function error_code {
    if [[ $? == 0 ]]; then
        echo ""
    else
        echo "%{$fg[white]%}<%{$fg[red]%}%?%{$fg[white]%}>%{$reset_color%}"
fi
}

last_command='%(?.>>.<<)'


## Prompts
PROMPT=' %F{red}<%F{white}%d%F{red}> 
 %F{cyan}>> '
