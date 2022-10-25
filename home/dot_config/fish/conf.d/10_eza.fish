if type -q eza
  set -gx EZA_COLORS 'ur=33;49:uw=31;49:ux=32;49:ue=32;49:sn=32;49:sb=32;49:uu=33;49:nu=37;49'
  set -gx TIME_STYLE default
  alias la 'eza --long --binary --all'
  alias ll 'eza --long --binary --git-ignore'
  alias ls 'eza --git-ignore'
  alias lat 'eza --long --binary --all --tree --level=2'
  alias llt 'eza --long --binary --tree --level=2 --git-ignore'
  alias lst 'eza --tree --level=2 --git-ignore'
end
