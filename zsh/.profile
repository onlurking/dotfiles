export EDITOR=$(which nvim)
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export PATH=$PATH:$HOME/.npm-packages/bin
export PATH=$PATH:$HOME/.emacs.d/bin
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin

export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.go/bin

[[ $TMUX != "" ]] && export TERM="tmux-256color"
[[ $TMUX = "" ]] && export TERM="xterm-256color"

export NVIM_GTK_PREFER_DARK_THEME=1
export NVIM_GTK_NO_HEADERBAR=1
export NVIM_GTK_NO_WINDOW_DECORATION=1

alias t=tmux
alias g=git
alias n=nvim

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export FONTCONFIG_PATH=/etc/fonts

export JAVA_HOME=/usr/lib/jvm/default/
export JRE_HOME=/usr/lib/jvm/default//jre
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/jre/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
