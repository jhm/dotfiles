set -gx EDITOR helix

alias hx="helix"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

function fish_prompt
    set -g fish_prompt_pwd_dir_length 0
    # set -g __fish_git_prompt_showuntrackedfiles false
    # set -g __fish_git_prompt_show_informative_status false
    set -g __fish_git_prompt_use_informative_colors true
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showcolorhints true
    echo -n -s (set_color blue) (prompt_pwd) (set_color normal) (fish_git_prompt) (set_color green) ' » ' (set_color normal)
    # echo -n -s (set_color blue) (prompt_pwd) (set_color normal) (set_color green) ' » ' (set_color normal)
end

set -Ux SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
