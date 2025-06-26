# Zeta theme for oh-my-zsh
# Tested on Linux, Unix and Windows under ANSI colors.
# Copyright: Skyler Lee, 2015
#
# Modified by Leonardo Cerasi, 2025

# Colors: black|red|blue|green|yellow|magenta|cyan|white
autoload -U colors && colors

local mantle=#1e2030
local red=#ed8796
local blue=#8aadf4
local green=#a6da95
local teal=#8bd5ca
local yellow=#eed49f
local magenta=#c6a0f6 # mauve
local sapphire=#7dc4e4
local white=#cad3f5
local text=#f4dbd6 # rosewater
local peach=#f5a97f
local pink=#f5bde6
local maroon=#ee99a0

local highlight_bg=$red

local cmd_prompt='χξς'

# Machine name.
function get_pc_name {
    if [ -f ~/.pc-name ]; then
        cat ~/.pc-name
    else
        echo $HOST
    fi
}

# User name.
function get_usr_name {
    local name="%n"
    if [[ "$USER" == 'root' ]]; then
        name="%F{$highlight_bg}$name%f"
    fi
    echo $name
}

# Directory info.
function get_current_dir {
    echo "${PWD/#$HOME/~}"
}

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{$blue}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b"
ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{$green} ✔ "
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{$red} ✘ "

# Git status.
ZSH_THEME_GIT_PROMPT_ADDED="%B%F{$green}+"
ZSH_THEME_GIT_PROMPT_DELETED="%B%F{$red}-"
ZSH_THEME_GIT_PROMPT_MODIFIED="%B%F{$magenta}*"
ZSH_THEME_GIT_PROMPT_RENAMED="%B%F{$blue}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%B%F{$cyan}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%B%F{$yellow}?"

# Git sha.
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="[%F{$yellow}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%f]"

function get_git_prompt {
    if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
        local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        local git_status=$(git status --porcelain 2>/dev/null)
        local git_sha=$(git rev-parse --short HEAD)

        local git_icons=""
        if [[ -n $git_status ]]; then
            local added_count=$(echo "$_gitstatus" | grep '^A ' | wc -l)
            local modified_count_1=$(echo "$git_status" | grep '^M ' | wc -l)
            local modified_count_2=$(echo "$git_status" | grep '^MM ' | wc -l)
            local modified_count_3=$(echo "$git_status" | grep '^ M ' | wc -l)
            local deleted_count_1=$(echo "$git_status" | grep '^D ' | wc -l)
            local deleted_count_2=$(echo "$git_status" | grep '^ D ' | wc -l)
            local renamed_count=$(echo "$git_status" | grep '^R ' | wc -l)
            local unmerged_count=$(echo "$git_status" | grep '^U ' | wc -l)
            local untracked_count=$(echo "$git_status" | grep '^?? ' | wc -l)

            local modified_count=$(echo "$modified_count_1 + $modified_count_2 + $modified_count_3" | bc -l)
            local deleted_count=$(echo "$deleted_count_1 + $deleted_count_2" | bc -l)

            (( added_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_ADDED$added_count"
            (( modified_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_MODIFIED$modified_count"
            (( deleted_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_DELETED$deleted_count"
            (( renamed_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_RENAMED$renamed_count"
            (( unmerged_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_UNMERGED$unmerged_count"
            (( untracked_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_UNTRACKED$untracked_count"

            git_icons=" %F{$text}[%f$git_icons%f%b%F{$text}]%f"
        fi

        local git_comm=""
        if [[ -n $git_sha ]]; then
            git_comm+="%F{$text}(%f%F{$yellow}$git_sha%f%F{$text})%f"
        fi

        echo " %F{$text}on%f %F{$peach} %B$branch%b%f$git_comm$git_icons"
    fi
}

function get_time_stamp {
    echo "%*"
}

function get_space {
    local str=$1$2
    local zero='%([BSUbfksu]|([FB]|){*})'
    local len=${#${(S%%)str//$~zero/}}
    local size=$(( $COLUMNS - $len - 1 ))
    local space=""
    while [[ $size -gt 0 ]]; do
        space="$space "
        let size=$size-1
    done
    echo $space
}

# Prompt: # USER@MACHINE: DIRECTORY <BRANCH [STATUS]> --- (TIME_STAMP)
# > command
function print_prompt_head {
    local left_prompt="\
%F{$green}$(get_usr_name)%f\
%F{$sapphire}@%f\
%F{$green}$(get_pc_name)%f \
%F{$blue} $NIX_VERSION%f %F{$text}at%f \
%B%F{$maroon}$(get_current_dir)%f%b\
$(get_git_prompt) "

    local right_prompt="%F{$blue}($(get_time_stamp))%f "
    print -rP "$left_prompt$(get_space $left_prompt $right_prompt)$right_prompt"
}
function get_prompt_indicator {
    if [[ $? -eq 0 ]]; then
        echo "%B%F{$magenta}$cmd_prompt%f%b "
    else
        echo "%B%F{$red}$cmd_prompt %f%b"
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd print_prompt_head
setopt prompt_subst

PROMPT='$(get_prompt_indicator)'
#RPROMPT='$(git_prompt_short_sha) '
