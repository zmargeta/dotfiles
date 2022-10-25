if type -q zoxide
  set -gx _ZO_DATA_DIR $XDG_DATA_HOME/zoxide
  zoxide init fish | source
end
