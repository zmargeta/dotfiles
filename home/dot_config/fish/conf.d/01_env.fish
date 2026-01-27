set -q XDG_CONFIG_HOME
or set -gx XDG_CONFIG_HOME $HOME/.config

set -q XDG_DATA_HOME
or set -gx XDG_DATA_HOME $HOME/.local/share

set -q XDG_STATE_HOME
or set -gx XDG_STATE_HOME $HOME/.local/state

set -q XDG_CACHE_HOME
or set -gx XDG_CACHE_HOME $HOME/.cache

test -d $XDG_CONFIG_HOME
or mkdir -p $XDG_CONFIG_HOME

test -d $XDG_DATA_HOME
or mkdir -p $XDG_DATA_HOME

test -d $XDG_STATE_HOME
or mkdir -p $XDG_STATE_HOME

test -d $XDG_CACHE_HOME
or mkdir -p $XDG_CACHE_HOME

