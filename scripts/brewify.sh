temp_dir=$(mktemp -d)

installed="${temp_dir}/installed.txt"
available="${temp_dir}/available.txt"

trap 'rm -rf "${temp_dir}"' EXIT

brew cask list -1 > "$installed"
brew search --casks > "$available"

for file_path in /Applications/*.app; do
    cask_name=${file_path##*/}
    cask_name=${cask_name%.*}
    cask_name=${cask_name// /-}

    if grep -Fixq "${cask_name}" "${available}" && ! grep -Fixq "${cask_name}" "$installed"
        then HOMEBREW_NO_AUTO_UPDATE=1 brew cask install --force ${cask_name}
    fi
done
