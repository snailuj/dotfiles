export PATH=$PATH:~/.local/bin:~/.local/bin/flutter:/opt/Postman:/snap/bin
export TERM="xterm-256color"
export TERM_ITALICS=true
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# gets history in iex
export ERL_AFLAGS="-kernel shell_history enabled"

export ECTO_EDITOR=nvim

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export COLORSCHEME="dark"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#nvm use node

source ~/.zplug/init.zsh

source ~/.zsh/spaceship.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/environment.zsh

setopt AUTO_CD
bindkey -v
autoload -Uz compinit && compinit -I
autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# By default, there is a 0.4 second delay after you hit the <ESC> key and when the mode change is registered.
# This results in a very jarring and frustrating transition between modes. Let's reduce this delay to 0.1 seconds.
# This can result in issues with other terminal commands that depended on this delay. If you have issues try
# raising the delay.

export KEYTIMEOUT=1
# setting KONSOLE_PROFILE_NAME is a hack for using tmux in Konsole with
# terminus plugin, prevents ghost "q" character appearing randomly
# see https://github.com/wincent/terminus/issues/32
alias nvim='KONSOLE_PROFILE_NAME=Default ~/.local/bin/nvim.appimage'
alias gpr='git pull --rebase'
alias gst='git status'
alias glog='git log'
alias gai='git add -i'
alias gap='git add -p' 
alias gc='git commit -v'
alias gcm='git commit -m'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gp='git push'
alias grb='git rebase'
alias gsh='git show'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color'
if [[ $REMOTE  ]]; then
  alias whatnext='ssh -X julian@nikita.treshna.com -p 22000 whatnext'
else
  alias whatnext='ssh -X julian@vulcan.treshna.com whatnext'
fi
alias ll='ls -la'
alias la='ls -a'
alias iex='iex --erl "-kernel shell_history enabled"'
