#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

  autoload -Uz promptinit
  promptinit
  prompt pure	

alias la='ls -la'
alias lt='ls -lt'
alias g='git' 
alias s='status'
alias co='checkout'
alias ps='push'
alias cm='commit'
alias pl='pull'
alias ll='ls -l'

eval "$(rbenv init - zsh)"
export PATH="/.rbenv/bin:$PATH"
export PATH="/.rbenv/bin:~/.rbenv/shims:$PATH"

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
