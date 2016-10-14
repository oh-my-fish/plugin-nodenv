# SYNOPSIS
#   nodenv plugin for oh my fish

if not type -fq nodenv; and set -q NODENV_ROOT; and not contains "$NODENV_ROOT/bin" $PATH
  set PATH $NODENV_ROOT/bin $PATH
end

if type -q nodenv
  if command nodenv init - | grep --quiet "function"
    set -gx __NODENV_SUPPORTS_FISH true
    source (nodenv init - | psub)
  else
    if not set -q NODENV_ROOT
      set -x NODENV_ROOT "$HOME/.nodenv"
    end

    if not contains $NODENV_ROOT/shims $PATH
      set PATH $NODENV_ROOT/shims $PATH
    end
  end
else
  echo "Please install 'nodenv' first, or set \$NODENV_ROOT!"
end
