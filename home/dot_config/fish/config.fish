fish_vi_key_bindings

set -gx fish_cursor_default block
set -gx fish_cursor_insert underscore
set -gx fish_cursor_visual block
set -gx fish_cursor_replace block
set -gx fish_cursor_unknown underscore
set -gx fish_vi_force_cursor 1

fish_config theme choose TokyoNight\ Storm

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

if type -q volta
  set -gx VOLTA_HOME $HOME/.volta
  fish_add_path $VOLTA_HOME/bin
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
