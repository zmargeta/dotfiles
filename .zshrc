setopt complete_aliases

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$HOME/antigen.zsh"

antigen use oh-my-zsh

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

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle mafredri/zsh-async

antigen theme romkatv/powerlevel10k

antigen apply

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source "/etc/profile.d/vte.sh"
fi

[[ -s "/usr/local/etc/profile.d/z.sh" ]] && source "/usr/local/etc/profile.d/z.sh"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
[[ -s "/usr/local/bin/jenv" ]] && eval "$(/usr/local/bin/jenv init -)"
export GOPATH="$HOME/Development"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$GOPATH/bin:$PATH"
[[ -s "/usr/local/bin/goenv" ]] && eval "$(/usr/local/bin/goenv init -)"
[[ -s "/usr/local/bin/rbenv" ]] && eval "$(/usr/local/bin/rbenv init -)"
[[ -s "/usr/local/bin/pyenv" ]] && eval "$(/usr/local/bin/pyenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[[ -s "/usr/local/opt/nvm/nvm.sh" ]] && source "/usr/local/opt/nvm/nvm.sh"
[[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ]] && source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
[[ -s "/usr/local/bin/direnv" ]] && eval "$(/usr/local/bin/direnv hook zsh)"
export PATH="$HOME/scripts:$PATH"
(( ${+PURE_PROMPT} )) && P10K_CONFIG="p10k-pure" || P10K_CONFIG="p10k"
[[ -s "$HOME/.$P10K_CONFIG.zsh" ]] && source "$HOME/.$P10K_CONFIG.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
