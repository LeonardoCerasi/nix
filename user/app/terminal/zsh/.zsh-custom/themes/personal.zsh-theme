# Zeta theme for oh-my-zsh
# Tested on Linux, Unix and Windows under ANSI colors.
# Copyright: Skyler Lee, 2015

# Colors: black|red|blue|green|yellow|magenta|cyan|white
local black=$fg[black]
local red=$fg[red]
local blue=$fg[blue]
local green=$fg[green]
local yellow=$fg[yellow]
local magenta=$fg[magenta]
local cyan=$fg[cyan]
local white=$fg[white]

local black_bold=$fg_bold[black]
local red_bold=$fg_bold[red]
local blue_bold=$fg_bold[blue]
local green_bold=$fg_bold[green]
local yellow_bold=$fg_bold[yellow]
local magenta_bold=$fg_bold[magenta]
local cyan_bold=$fg_bold[cyan]
local white_bold=$fg_bold[white]

local highlight_bg=$bg[red]

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
        name="%{$highlight_bg%}%{$white_bold%}$name%{$reset_color%}"
    fi
    echo $name
}

# Directory info.
function get_current_dir {
    echo "${PWD/#$HOME/~}"
}

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$blue_bold%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$green_bold%} ✔ "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$red_bold%} ✘ "

# Git status.
ZSH_THEME_GIT_PROMPT_ADDED="%{$green_bold%}+"
ZSH_THEME_GIT_PROMPT_DELETED="%{$red_bold%}-"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$magenta_bold%}*"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$blue_bold%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$cyan_bold%}="
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$yellow_bold%}?"

# Git sha.
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="[%{$yellow%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}]"

function get_git_prompt {
    if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
        local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        local git_status=$(git status --porcelain 2>/dev/null)

        local git_icons=""
        if [[ -n $git_status ]]; then
            local added_count=$(echo "$_gitstatus" | grep '^A ' | wc -l)
            local modified_count=$(echo "$git_status" | grep '^ M' | wc -l)
            local deleted_count=$(echo "$git_status" | grep '^ D' | wc -l)
            local renamed_count=$(echo "$git_status" | grep '^R ' | wc -l)
            local unmerged_count=$(echo "$git_status" | grep '^U ' | wc -l)
            local untracked_count=$(echo "$git_status" | grep '^??' | wc -l)

            (( added_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_ADDED$added_count"
            (( modified_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_MODIFIED$modified_count"
            (( deleted_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_DELETED$deleted_count"
            (( renamed_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_RENAMED$renamed_count"
            (( unmerged_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_UNMERGED$unmerged_count"
            (( untracked_count > 0 )) && git_icons+="$ZSH_THEME_GIT_PROMPT_UNTRACKED$untracked_count"

            git_icons=" [$git_icons%{$reset_color%}]"
        fi

        echo " (%{$red_bold%}$branch%{$reset_color%}$git_icons)"
    fi
}

function get_git_prompt_old {
    if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
        local git_status="$(git_prompt_status)"
        if [[ -n $git_status ]]; then
            git_status="[$git_status%{$reset_color%}]"
        fi
        local git_prompt=" <$(git_prompt_info)$git_status>"
        echo $git_prompt
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
%{$blue%}# \
%{$green_bold%}$(get_usr_name)\
%{$blue%}@\
%{$cyan_bold%}$(get_pc_name): \
%{$yellow_bold%}$(get_current_dir)%{$reset_color%}\
$(get_git_prompt) "

    local right_prompt="%{$blue%}($(get_time_stamp))%{$reset_color%} "
    print -rP "$left_prompt$(get_space $left_prompt $right_prompt)$right_prompt"
}
function get_prompt_indicator {
    if [[ $? -eq 0 ]]; then
        echo "%{$magenta_bold%}$cmd_prompt %{$reset_color%}"
    else
        echo "%{$red_bold%}$cmd_prompt %{$reset_color%}"
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd print_prompt_head
setopt prompt_subst

PROMPT='$(get_prompt_indicator)'
#RPROMPT='$(git_prompt_short_sha) '
