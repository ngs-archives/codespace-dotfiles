
autoload -Uz promptinit
promptinit
prompt adam2

source ~/dotfiles/aliases
source ~/dotfiles/envrc

fpath=(~/.zsh $fpath)
eval $(direnv export zsh)
