if type -q eza
  if type -q vivid
    if type -q dark-notify
      if test (dark-notify -e) = 'dark'
        set -gx EZA_COLORS (vivid generate gruvbox-dark)
      else
        set -gx EZA_COLORS (vivid generate gruvbox-light)
      end
    else
      set -gx EZA_COLORS (vivid generate gruvbox-dark)
    end
  end
  set -gx TIME_STYLE default
  alias la 'eza --long --binary --all'
  alias ll 'eza --long --binary --git-ignore'
  alias ls 'eza --git-ignore'
  alias lat 'eza --long --binary --all --tree --level=2'
  alias llt 'eza --long --binary --tree --level=2 --git-ignore'
  alias lst 'eza --tree --level=2 --git-ignore'
end
