source "$HOME/antigen.zsh"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle docker
antigen bundle git
antigen bundle git-flow
antigen bundle gradle
antigen bundle httpie
antigen bundle mvn
antigen bundle npm
antigen bundle pip
antigen bundle sdk
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zdharma/fast-syntax-highlighting

# Load the theme.
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell Antigen that you're done.
antigen apply

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

export GOPATH="$HOME/Development"
export PATH="$GOPATH/bin:$PATH"
export PATH="/usr/local/bin:${PATH}"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
export PATH="$PATH:$HOME/.rvm/bin"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
