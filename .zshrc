export PATH=$PATH:~/.local/bin:~/.pyenv/bin:
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

# By default, there is a 0.4 second delay after you hit the <ESC> key and when the mode change is registered.
# This results in a very jarring and frustrating transition between modes. Let's reduce this delay to 0.1 seconds.
# This can result in issues with other terminal commands that depended on this delay. If you have issues try
# raising the delay.

export KEYTIMEOUT=1
alias 'nvim=~/.local/bin/nvim.appimage'
alias 'gpr=git pull --rebase'
alias 'gst=git status'
alias 'glog=git log'
alias 'gai=git add -i 5 *'
alias 'gc=git commit'
alias 'gcm=git commit -m'
alias 'gcp=git cherry-pick'
alias 'gco=git checkout'
alias 'gp=git push'
alias 'gsh=git show'
alias 'ls=ls --color'
alias 'whatnext=ssh -X julian@vulcan.treshna.com whatnext'
alias 'll=ls -la'
alias 'la=ls -a'
