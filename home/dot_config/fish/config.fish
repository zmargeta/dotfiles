fish_vi_key_bindings

set -gx fish_cursor_default block blink
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block blink
set -gx fish_cursor_replace underscore blink
set -gx fish_cursor_replace_one underscore blink
set -gx fish_cursor_unknown line blink

fish_config theme choose fish\ default

test -d $HOME/.local/bin
or mkdir -p $HOME/.local/bin
fish_add_path -g $HOME/.local/bin

test -d $HOME/.config/op
or mkdir $HOME/.config/op

if test $(uname) = "Darwin"
  test -f $HOME/.config/op/agent.sock
  or ln -sf $HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock $HOME/.config/op/agent.sock
end

set -gx SSH_AUTH_SOCK $HOME/.config/op/agent.sock

test -f $HOME/.config/op/plugins.sh
and source $HOME/.config/op/plugins.sh

if type -q nvim
  set -gx EDITOR (which nvim)
  set -gx VISUAL (which nvim)
end

if type -q ov
  set -gx PAGER (which ov)
end

if status is-interactive
  function separate_prompt --on-event fish_postexec
    echo ""
  end

  test -f $HOME/.config/fish/aliases.fish
  and source $HOME/.config/fish/aliases.fish
end
