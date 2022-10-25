function chport -d 'Check port'
  sudo lsof -i -n -P | rg $argv[1]
end
