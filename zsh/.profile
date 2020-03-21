export EDITOR=$(which nvim)
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export PATH=$PATH:$HOME/.npm-packages/bin
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
