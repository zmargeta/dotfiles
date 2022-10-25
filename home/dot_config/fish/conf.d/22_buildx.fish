if type -q docker-buildx
  if type -q brew
    mkdir -p $HOME/.docker/cli-plugins
    ln -sfn (brew --prefix docker-buildx)/bin/docker-buildx $HOME/.docker/cli-plugins/docker-buildx
  end
end

