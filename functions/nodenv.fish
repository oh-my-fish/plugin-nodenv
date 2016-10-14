function nodenv
  if set -q __NODENV_SUPPORTS_FISH
    command nodenv $argv
  else
    set command $argv[1]
    set -e argv[1]

    switch "$command"
    case rehash shell
      eval (nodenv "sh-$command" $argv)
    case '*'
      command nodenv "$command" $argv
    end
  end
end
