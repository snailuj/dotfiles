#!/usr/bin/env zsh


zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "desyncr/auto-ls"
zplug "plugins/git", from:oh-my-zsh
zplug "rupa/z", use:z.sh
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-history-substring-search"

if zplug check zsh-users/zsh-history-substring-search; then
    zmodload zsh/terminfo
    bindkey "\eOA" history-substring-search-up
    bindkey "\eOB" history-substring-search-down
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Load 'em
zplug load


# fzf needs some extra coaxing
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
