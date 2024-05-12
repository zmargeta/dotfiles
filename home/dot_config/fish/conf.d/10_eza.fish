if type -q eza
  if type -q vivid
    set -gx EZA_COLORS (vivid generate gruvbox-dark-hard)':ur=1;30:uw=1;30:ux=1;30:ue=1;30:gr=1;30:gw=1;30:gx=1;30:tr=1;30:tw=1;30:tx=1;30:uu=33;40:gu=33;40'
  end
  set -gx TIME_STYLE default
  alias la 'eza --long --binary --all'
  alias ll 'eza --long --binary --git-ignore'
  alias ls 'eza --git-ignore'
  alias lat 'eza --long --binary --all --tree --level=2'
  alias llt 'eza --long --binary --tree --level=2 --git-ignore'
  alias lst 'eza --tree --level=2 --git-ignore'
end
