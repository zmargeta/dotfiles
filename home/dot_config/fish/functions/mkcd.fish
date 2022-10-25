function mkcd -d 'Make and change directory'
  argparse --ignore-unknown 'h/help' -- $argv; or return
  if set -ql _flag_help
    echo 'mkcd file_name'
    return 0
  end
  if test (count $argv) -gt 1
    echo 'Usage: mkcd file_name'
    return 1
  end
  mkdir -p -v -- $argv[1] && cd -- $argv[1]
end
