#!/usr/bin/env zsh


export SPACESHIP_PROMPT_SEPARATE_NEWLINE=false
export SPACESHIP_PROMPT_SEPARATE_LINE=true
export SPACESHIP_VI_MODE_SHOW=true
export SPACESHIP_USER_SHOW=true
export SPACESHIP_GIT_STATUS_SHOW=false
export SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
#"╭"
export SPACESHIP_USER_PREFIX=""
#"╰"
export SPACESHIP_CHAR_PREFIX=""
export SPACESHIP_DIR_PREFIX=""
export SPACESHIP_DIR_TRUNC=0
export SPACESHIP_DIR_TRUNC_REPO=false
export SPACESHIP_CHAR_SYMBOL="λ"
export SPACESHIP_CHAR_SUFFIX=" "
export SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  hg            # Mercurial section (hg_branch  + hg_status)
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  vi_mode       # Vi-mode indicator
  char          # Prompt character
)
export SPACESHIP_RPROMPT_ORDER=(
)