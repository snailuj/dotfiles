#!/usr/bin/env zsh


# node
eval `fnm env`

# python
export FLASK_ENV="development"

# go
export GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH

# ocaml
if [ -f $HOME/.opam/opam-init/init.zsh ]; then
  . /Users/leo/.opam/opam-init/init.zsh > /dev/null 2> /dev/null
fi