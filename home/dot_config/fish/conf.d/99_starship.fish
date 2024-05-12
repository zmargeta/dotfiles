if type -q starship
  set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
  function starship_transient_prompt_func
  end
  function starship_transient_rprompt_func
    printf 'in %s %s' (starship module directory) (starship module time)
  end
  starship init fish | source
  enable_transience
end
