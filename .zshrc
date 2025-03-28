export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"

# User with skull
user_with_skull() {
    echo -n ""
}

POWERLEVEL9K_CUSTOM_USER="user_with_skull"

# Prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv custom_user dir vcs)
POWERLEVEL9K_VIRTUALENV_BACKGROUND='002'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        git
        zsh-autosuggestions
        virtualenv
        virtualenvwrapper
        zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export PATH=~/Library/Python/3.8/bin:$PATH
export PATH=$HOME/.docker/bin:$PATH
#export PATH=/Library/Frameworks/Python.framework/Versions/3.10/bin:$PATH
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

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
alias vim='nvim'
alias cl="clear"
alias m='neomutt'
alias lzd='lazydocker'

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
cd ~

compdef __start_kubectl k

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.env ]; then
    source ~/.env
fi

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"

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
fi
