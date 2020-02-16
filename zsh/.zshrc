export ZSH="/home/onlurking/.oh-my-zsh"

ZSH_THEME="lambda-mod"

plugins=(git fast-syntax-highlighting zsh-autosuggestions docker)

eval "$(lua /home/onlurking/Documents/z.lua/z.lua --init zsh)"

source $ZSH/oh-my-zsh.sh
source $HOME/.profile

 autoload -Uz compinit && compinit -i

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
