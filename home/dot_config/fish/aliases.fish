  if type -q zoxide
    alias cd z
  end
  alias ... 'cd ../..'
  alias .... 'cd ../../..'
  alias ..... 'cd ../../../..'
  alias :q exit
  if type -q idea
    abbr -ag edit idea -e
  end
  if type -q nvim
    alias vi nvim
    alias vim nvim
    abbr -ag e nvim
  end
  if type -q chezmoi
    alias dot chezmoi
    abbr -ag dota dot add
    abbr -ag dotaa dot re-add
    abbr -ag dotapp dot apply
    abbr -ag dotcd dot cd
    abbr -ag dotd dot diff
    abbr -ag dote dot edit
    abbr -ag dote! dot edit --apply
    abbr -ag dotg dot git
    abbr -ag dotga dot git add
    abbr -ag dotgaa dot git add -- --all
    abbr -ag dotgau dot git add -- --update
    abbr -ag dotgb dot git branch
    abbr -ag dotgba dot git branch -- --all
    abbr -ag dotgbd dot git branch -- --delete
    abbr -ag dotgbd! dot git branch --delete --force
    abbr -ag dotgc dot git commit -- --verbose
    abbr -ag dotgc! dot git commit -- --verbose --amend
    abbr -ag dotgca dot git commit -- --verbose --all
    abbr -ag dotgca! dot git commit -- --verbose --all --amend
    abbr -ag dotgcam dot git commit -- --all --message
    abbr -ag dotgcan! dot git commit -- --verbose --all --amend --no-edit
    abbr -ag dotgcn! dot git commit -- --verbose --amend --no-edit
    abbr -ag dotgco dot git checkout
    abbr -ag dotgd dot git diff
    abbr -ag dotgdc dot git diff -- --cached
    abbr -ag dotgds dot git diff -- --staged
    abbr -ag dotgf dot git fetch
    abbr -ag dotgfp dot git fetch -- --prune
    abbr -ag dotgfpt dot git fetch -- --prune-tags
    abbr -ag dotgl dot git log -- --stat
    abbr -ag dotglg dot git log -- --graph
    abbr -ag dotglga dot git log -- --graph --decorate --all
    abbr -ag dotglgo dot git log -- --graph --oneline --decorate
    abbr -ag dotglgoa dot git log -- --graph --oneline --decorate --all
    abbr -ag dotglo dot git log -- --oneline --decorate
    abbr -ag dotgm dot git merge
    abbr -ag dotgma dot git merge -- --abort
    abbr -ag dotgmc dot git merge -- --continue
    abbr -ag dotgp dot git push
    abbr -ag dotgpf dot git push -- --force-with-lease
    abbr -ag dotgpf! dot git push -- --force
    abbr -ag dotgpu dot git push -- --set-upstream
    abbr -ag dotgP dot git pull
    abbr -ag dotgPr dot git pull -- --rebase
    abbr -ag dotgr dot git reset
    abbr -ag dotgr! dot git reset -- --hard
    abbr -ag dotgrb dot git rebase
    abbr -ag dotgrba dot git rebase -- --abort
    abbr -ag dotgrbc dot git rebase -- --continue
    abbr -ag dotgre dot git remote
    abbr -ag dotgrea dot git remote add
    abbr -ag dotgres dot git remote set-url
    abbr -ag dotgrs dot git restore
    abbr -ag dotgrss dot git restore -- --staged
    abbr -ag dotgrss! dot git restore -- --staged --worktree
    abbr -ag dotgrm dot git rm
    abbr -ag dotgrmc dot git rm -- --cached
    abbr -ag dotgs dot git status
    abbr -ag dotgsh dot git show
    abbr -ag dotgshp dot git show -- --pretty=short --show-signature
    abbr -ag dotgss dot git status -- --short
    abbr -ag dotls dot list
    abbr -ag dotrm dot forget
    abbr -ag dotrm! dot destroy
    abbr -ag dots dot status
    abbr -ag dottmpl dot chattr +template
    abbr -ag dotu dot update
    if test -f $XDG_DATA_HOME/chezmoi/.chezmoi.toml.tmpl
      abbr -ag dotec "$EDITOR $XDG_DATA_HOME/chezmoi/.chezmoi.toml.tmpl"
      abbr -ag dotec! "$EDITOR $XDG_DATA_HOME/chezmoi/.chezmoi.toml.tmpl && dot init"
    end
  end
  if type -q git
    abbr -ag g git
    abbr -ag ga git add
    abbr -ag gaa git add --all
    abbr -ag gap git add --patch
    abbr -ag gapp git apply
    abbr -ag gappt git apply --3way
    abbr -ag gau git add --update
    abbr -ag gav git add --verbose
    abbr -ag gb git branch
    abbr -ag gba git branch --all
    abbr -ag gbd git branch --delete
    abbr -ag gbd! git branch --delete --force
    abbr -ag gbl git blame -b -w
    abbr -ag gbm git branch -m
    abbr -ag gbr git branch --remote
    abbr -ag gc git commit --verbose
    abbr -ag gc! git commit --verbose --amend
    abbr -ag gca git commit --verbose --all
    abbr -ag gca! git commit --verbose --all --amend
    abbr -ag gcam git commit --all --message
    abbr -ag gcan! git commit --verbose --all --amend --no-edit
    abbr -ag gcl git clone --recurse-submodules
    abbr -ag gcm git commit --message
    abbr -ag gcn! git commit --verbose --amend --no-edit
    abbr -ag gco git checkout
    abbr -ag gcoi "git branch | rg -v '^\*' | fzf --height=20% --reverse --info=inline | xargs git checkout"
    abbr -ag gcor git checkout --recurse-submodules
    abbr -ag gcp git cherry-pick
    abbr -ag gcpa git cherry-pick --abort
    abbr -ag gcpc git cherry-pick --continue
    abbr -ag gd git diff
    abbr -ag gdc git diff --cached
    abbr -ag gds git diff --staged
    abbr -ag gdt git diff-tree --no-commit-id --name-only -r
    abbr -ag gf git fetch
    abbr -ag gfp git fetch --prune
    abbr -ag gfpt git fetch --prune-tags
    abbr -ag gl git log --stat
    abbr -ag glg git log --graph
    abbr -ag glga git log --graph --decorate --all
    abbr -ag glgo git log --graph --oneline --decorate
    abbr -ag glgoa git log --graph --oneline --decorate --all
    abbr -ag glo git log --oneline --decorate
    abbr -ag gm git merge
    abbr -ag gma git merge --abort
    abbr -ag gmc git merge --continue
    abbr -ag gp git push
    abbr -ag gpf git push --force-with-lease
    abbr -ag gpf! git push --force
    abbr -ag gpu git push --set-upstream
    abbr -ag gP git pull
    abbr -ag gPr git pull --rebase
    abbr -ag gr git reset
    abbr -ag gr! git reset --hard
    abbr -ag grb git rebase
    abbr -ag grba git rebase --abort
    abbr -ag grbc git rebase --continue
    abbr -ag gre git remote
    abbr -ag grea git remote add
    abbr -ag gres git remote set-url
    abbr -ag grm git rm
    abbr -ag grmc git rm --cached
    abbr -ag grs git restore
    abbr -ag grss git restore --staged
    abbr -ag grss! git restore --staged --worktree
    abbr -ag gs git status
    abbr -ag gsh git show
    abbr -ag gshp git show --pretty=short --show-signature
    abbr -ag gss git status --short
    abbr -ag gsta git stash apply
    abbr -ag gstc git stash clear
    abbr -ag gstl git stash list
    abbr -ag gstP git stash pop
    abbr -ag gstp git stash push
    abbr -ag gsts git stash show --text
    abbr -ag gsw git switch
    alias gwip 'git add -A; git rm (git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message \'--wip-- [skip ci]\''
    alias gunwip 'git log --max-count=1 | rg --quiet \'\\-\\-wip\\-\\-\' && git reset HEAD~1'
  end
  if type -q docker
    abbr -ag d docker
    abbr -ag dex docker run -it
    abbr -ag di docker image ls
    abbr -ag dip docker image prune
    abbr -ag dlg docker logs -f
    abbr -ag dn docker network ls
    abbr -ag dnp docker network prune
    abbr -ag dp docker push
    abbr -ag dP docker pull
    abbr -ag dps 'docker ps --format \'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}\''
    abbr -ag dpsp 'docker ps --format \'table {{.ID}}\t{{.Names}}\t{{.Ports}}\''
    abbr -ag dpsa 'docker ps -a --format \'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}\''
    abbr -ag dpsap 'docker ps -a --format \'table {{.ID}}\t{{.Names}}\t{{.Ports}}\''
    abbr -ag drm docker rm
    abbr -ag drm! docker rm -f
    abbr -ag drmi docker image rm
    abbr -ag drmi! docker image rm -f
    abbr -ag drmn docker network rm
    abbr -ag drmv docker volume remove
    abbr -ag drmx 'docker rm (docker ps -a -f status=exited -q)'
    abbr -ag dv docker volume ls
    abbr -ag dvp docker volume prune
  end
  if type -q bat
    alias cat 'bat --style=plain'
  end
  if type -q coursier
    alias cs coursier
  end
  if type -q ov
    alias less ov
  end
  if test $(uname) = "Darwin"
    if type -q brew
      abbr -ag br brew
      abbr -ag brc brew cleanup
      abbr -ag brc! 'brew autoremove && brew cleanup'
      abbr -ag brd brew desc --eval-all
      abbr -ag bri brew install
      abbr -ag brls brew list
      abbr -ag brs brew search
      abbr -ag bru brew uninstall
      abbr -ag brU brew update
      abbr -ag brU! 'brew update && brew upgrade'
    end
  end
  if test -d $HOME/Vaults/one-brain
    alias vaultcd 'cd $HOME/Vaults/one-brain'
  end
  if type -q thefuck
    set -x THEFUCK_OVERRIDDEN_ALIASES 'cat,cd,chezmoi,coursier,nvim,ov'
  end
