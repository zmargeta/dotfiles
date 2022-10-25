function fish_greeting
  if status is-interactive; and type -q fortune
    fortune
  end
end
