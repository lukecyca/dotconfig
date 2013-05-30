set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)

function virtualenv_prompt
    if [ -n "$VIRTUAL_ENV" ]
        set_color yellow
        printf '%s ' (basename "$VIRTUAL_ENV")
        set_color normal
    end
end

function hg_prompt
    hg prompt "$green{branch}{ {patch}}$normal" 2>/dev/null
end

function git_prompt
    if git root >/dev/null 2>&1
        set_color normal
        printf ' on '
        set_color magenta
        printf '%s' (git currentbranch ^/dev/null)
        set_color green
        git_prompt_status
        set_color normal
    end
end

function prompt_pwd --description 'Print the current working directory, shortend to fit the prompt'
    echo $PWD | sed -e "s|^$HOME|~|" | sed -e "s|^/Volumes/Spinny/Users/luke|~|"
end

function fish_prompt
    set last_status $status

    set_color magenta
    printf '%s' (whoami)
    set_color normal
    printf '@'

    set_color yellow
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal
    printf ':'

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    if test $last_status -eq 0
        set_color white -o
        printf ' ><((°> '
    else
        set_color red -o
        printf ' [%d] ><((ˣ> ' $last_status
    end

    set_color normal
end

function fish_right_prompt
    virtualenv_prompt
    hg_prompt
    git_prompt
end
