# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# antigen bundle sindresorhus/pure
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source "/etc/profile.d/vte.sh"
fi

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
[[ -s "/usr/local/bin/jenv" ]] && eval "$(/usr/local/bin/jenv init -)"
export GOPATH="$HOME/Development"
export PATH="$GOPATH/bin:$PATH"
[[ -s "/usr/local/bin/rbenv" ]] && eval "$(/usr/local/bin/rbenv init -)"
[[ -s "/usr/local/bin/pyenv" ]] && eval "$(/usr/local/bin/pyenv init -)"
export PATH="$HOME/.poetry/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[[ -s "/usr/local/opt/nvm/nvm.sh" ]] && source "/usr/local/opt/nvm/nvm.sh"
[[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ]] && source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
export PATH="$HOME/scripts:$PATH"
[[ -s "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"
