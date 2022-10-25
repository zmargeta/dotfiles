if type -q docker-compose
  if type -q brew
    mkdir -p $HOME/.docker/cli-plugins
    ln -sfn (brew --prefix docker-compose)/bin/docker-compose $HOME/.docker/cli-plugins/docker-compose
  end
end

