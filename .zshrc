export TERM="xterm-256color"

# export PATH=$HOME/bin:/usr/local/bin:$PATH

user_with_skull() {
    echo -n ""
}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
        git
        zsh-autosuggestions
        virtualenv
        virtualenvwrapper
        zsh-syntax-highlighting
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"      #
export MANPATH=/opt/local/share/man:$MANPATH    # #
export PATH=/opt/local/bin:$PATH                # # # System paths
export PATH=/opt/local/sbin:$PATH               # #
export PATH=~/.local/bin:$PATH                  #

export PATH=~/Library/Python/3.8/bin:$PATH      # Python paths
export PATH=$HOME/.docker/bin:$PATH             # Docker paths
#export PATH=/usr/local/go/bin:$PATH             # Go path
export PATH=$HOME/go/bin:$PATH                  # Go-installed binaries, with Nix
#export PATH=/Library/Frameworks/Python.framework/Versions/3.10/bin:$PATH

# Android paths
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH

#export KUBECONFIG=~/.kube/config_qa:~/.kube/config_prod
export GIT_EDITOR='nvim +startinsert'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias q=exit
alias v='nvim'
alias vim='nvim'
alias cl="clear"
alias m='neomutt'
alias lzd='lazydocker'
alias cat='bat'

#alias lt='ls --tree'
#alias l='eza --all --long --color=always --icons=always --no-user --icons --git'
alias ll='eza --all --long --color=always --icons=always --no-user --icons --git --no-quotes'
alias ze='eza --all --long --color=always --icons=always --no-user --extended'
alias zt='eza --all --long --color=always --icons=always --no-user --tree --level=3'
alias zu='eza --all --long --color=always --icons=always --group'

alias icat='kitty icat'
alias dpa='docker ps -a'
alias ga='git add'
alias gc='git commit'
alias k='kubectl'

alias ktx=kubectx
alias kns=kubens

alias grer="grep -R -n"
alias exthaste='HASTE_SERVER=https://hastebin.com haste | pbcopy && echo "Complete and copy external($(pbpaste))!"'

kitty-reload() {
    pkill -USR1 -f /usr/bin/kitty
}

#cd ~

compdef __start_kubectl k

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Allow saving of files as sudo when I forgot to start vim using sudo.
# From here: https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
#cmap w!! w !sudo tee > /dev/null %

# SSH Agent Management
if [ -z "$SSH_AUTH_SOCK" ] || ! ssh-add -l &>/dev/null; then
    # Start SSH agent if it's not running
    eval "$(ssh-agent -s)" >/dev/null
    
    # Add the SSH key if it exists
    if [ -f ~/.ssh/globble_tim_rsa ]; then
        ssh-add ~/.ssh/globble_tim_rsa 2>/dev/null
    fi
    if [ -f ~/.ssh/globble_gitlab_rsa ]; then
        ssh-add ~/.ssh/globble_gitlab_rsa 2>/dev/null
    fi
fi
