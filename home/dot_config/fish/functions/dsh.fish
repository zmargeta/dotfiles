function dsh -d 'Execute shell in running container'
  argparse 'h/help' 's/shell=?' -- $argv; or return
  if set -ql _flag_help
    echo 'dsh [-h] [-s shell] container'
    return 0
  end
  if set -ql _flag_shell
    set shell "$_flag_shell"
  else
    set shell /bin/sh
  end
  docker exec -it $argv[1] $shell
end

