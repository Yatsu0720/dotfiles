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
alias gs='status'
alias -g co='checkout'
alias -g ps='push'
alias -g cm='commit'
alias -g pl='pull'
alias ll='ls -l'

eval "$(rbenv init - zsh)"
export PATH="/.rbenv/bin:$PATH"
export PATH="/.rbenv/bin:~/.rbenv/shims:$PATH"

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# git add, commit, pushまで一度に行う
gish() {
    # 全てステージにのせる
    git add -A;
    # コミット対象のファイルを確認
    git status;
    read "yesno?Commit with this content. OK? (y/N): "
    case "$yesno" in
    # yes
    [yY]*) read "msg?Input Commit Message: "; 
           git commit -m "$msg";
           CULLENT_BRANCH=`git rev-parse --abbrev-ref HEAD`;
           git push origin ${CULLENT_BRANCH};;
    # no
    *) echo "Quit." ;;
    esac
}

export XDG_CONFIG_HOME=~/.config

