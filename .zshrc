source antigen.zsh

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
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/zeljko/.sdkman"
[[ -s "/home/zeljko/.sdkman/bin/sdkman-init.sh" ]] && source "/home/zeljko/.sdkman/bin/sdkman-init.sh"
