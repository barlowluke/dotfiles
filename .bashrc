#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export PATH="$PATH:$HOME/.config/emacs/bin"
export PATH="$PATH:$HOME/.local/bin/yt-dlp"
export PATH="$PATH:$HOME/dox/scripts"
export PATH="$PATH:$HOME/mus/scripts"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$UID"

export QT_AUTO_SCREEN_SET_FACTOR=0
export QT_SCALE_FACTOR=1.25
export QT_FONT_DPI=96

export CALIBRE_USE_SYSTEM_THEME=1

export EDITOR="vim"

alias pipe="ps aux | grep pipe"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "ssh-agent: Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"$SSH_ENV"
    echo "ssh-agent: succeeded"
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" >/dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" >/dev/null
    #ps $SSH_AGENT_PID doesn't work under Cygwin
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ >/dev/null || {
        start_agent
    }
else
    start_agent
fi

