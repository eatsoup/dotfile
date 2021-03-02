export TERM=xterm-256color
export PATH=$PATH:/usr/local/go/bin/
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:/Users/luukkemp/.local/bin/
export GOPATH=$HOME/go
ZSH_TMUX_AUTOSTART=true
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
  export ZSH="/Users/luukkemp/.oh-my-zsh"
# Fuck!
  if [ -x "$(command -v thefuck)" ]; then
      export ZSH=/Users/luukkemp/.oh-my-zsh
  fi
  eval $(thefuck --alias)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="geoffgarside"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
  fzf
)
bindkey '^ ' autosuggest-accept

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias python=/usr/bin/python3
alias python2=/usr/bin/python
alias pip=/usr/bin/pip3
alias pip2=/usr/bin/pip
alias g=git
alias k=kubectl
alias kp='kubectl get po --all-namespaces'
alias pull='git pull'
alias push='git push'
alias gcm='git commit -m'
alias gs='git status'
alias gc='git checkout'
alias vi='/usr/local/bin/vim'
alias vim='/usr/local/bin/vim'
alias f1='cut -d " " -f1'
alias todo='grep -ri "TODO\|REVIEW\|DEBUG\|FIXME" .'
alias kgp='kubectl get pipelineruns -n tekton-pipelines --sort-by=.metadata.creationTimestamp'
alias dog='pygmentize -g'
stty -ixon
source <(kubectl completion zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/luukkemp/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/luukkemp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/luukkemp/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/luukkemp/google-cloud-sdk/completion.zsh.inc'; fi

# Custom functions

# Function to check SSL certificate on external site
# Call as (defaults to port 443): check_ssl site.com
# Or with port: check_ssl site.com 1443
# Returns the CN and valid_before and valid_after
# If http_proxy variable is set, then proxy it through the http_proxy
check_ssl() {
    if [ -z $2 ]
    then
        __PORT=443
    else
        __PORT=$2
    fi
    if [ -z $https_proxy ]
    then
        echo "Checking certificate for $1:$__PORT"
        echo | openssl s_client -servername $1 -connect $1:$__PORT 2>/dev/null | openssl x509 -noout -subject -dates -issuer
    else
        tmp_proxy=$(echo $https_proxy | sed 's/http:\/\///' | sed 's/https:\/\///')
        echo "Checking certificate for $1:$__PORT via $tmp_proxy"
        echo | openssl s_client -proxy $tmp_proxy -servername $1 -connect $1:$__PORT 2>/dev/null | openssl x509 -noout -subject -dates -issuer
    fi
}


awsprofile() {
  # Variable
  awsprofiles=""
  config=${AWS_CONFIG_FILE:-"$HOME/.aws/config"}
  credentials=${AWS_SHARED_CREDENTIALS_FILE:-"$HOME/.aws/credentials"}
  # Fill with profiles
  awsprofiles="$(cat ${config} | sed -n -e 's/\[profile\ \(.*\)\]/\1/p')"
  awsprofiles="$(cat ${credentials} | sed -n -e 's/\[\(.*\)\]/\1/p') $awsprofiles"
  if [ -z "${AWS_PROFILE+x}" ]
  then
        current="None Selected"
  else
        current=$AWS_PROFILE
  fi
  # Spaces to newlines, fzf
  selected=$(echo $awsprofiles | tr " " "\n" | fzf -0 -1 --tac -q "${1:-""}" --prompt "$current> ")
  if [ ! -z "$selected" ]; then
    export AWS_PROFILE=$selected
    echo "Set aws profile to \"$selected\""
  fi
}
alias awsvbsso='aws sso login --profile volksbank-sso-np4'

pr() {
    burl=`git config --get remote.origin.url`
    burl=${burl//.git/}
    gb=`git branch --show-current`
    pull="pull/new"
    if [[ $burl == *"github"* ]]
    then
        open $burl/$pull/$gb
    else
        repo=$(basename `git rev-parse --show-toplevel`)
        open "https://bitbucket.verz.local:8443/projects/K8S/repos/$repo/pull-requests?create&sourceBranch=$gb"
    fi
}

# hl using grep to only highlight without filtering
hl() {
    grep "$1\|$" 
}

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh ]

# Aws SSM FZF
ssm() {
    _node=$(kubectl get nodes | grep -v NAME | fzf -0 -1 | cut -d " " -f1)
    _nodeid=$(kubectl describe node $_node | grep ProviderID | cut -d "/" -f 5)
    aws ssm start-session --target $_nodeid
}

