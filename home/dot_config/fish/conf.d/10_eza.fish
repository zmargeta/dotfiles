if type -q eza
  set -gx EZA_CONFIG_DIR $XDG_CONFIG_HOME/eza
  set -gx TIME_STYLE default
  alias la 'eza --long --binary --all'
  alias ll 'eza --long --binary --git-ignore'
  alias ls 'eza --git-ignore'
  alias lat 'eza --long --binary --all --tree --level=2'
  alias llt 'eza --long --binary --tree --level=2 --git-ignore'
  alias lst 'eza --tree --level=2 --git-ignore'
end
