#!/usr/bin/env bash

[ -d /univr-ipc ] || exit 1

cd /univr || exit 1

git config --global user.email "ingo.blechschmidt@univr.it"
git config --global user.name "Ingo Blechschmidt (via Quasicoherent)"
git config --global push.default simple

mkdir -m 700 -p $HOME/.ssh
echo "$SSH_DEPLOY_KEY" | base64 -d > $HOME/.ssh/id_rsa
chmod 600 $HOME/.ssh/*
echo "|1|QUKQi0hqb2IQIg53Hztk2sa8Ae4=|dWGPqBKSkj8OA3c2+RhP3otk4hs= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==" >> $HOME/.ssh/known_hosts
echo "|1|HWtB6v5G3xm6GVUAbUN/B7hphM8=|1Mpu47AyndKZ9YAsFMF2T26cSQo= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==" >> $HOME/.ssh/known_hosts

while :; do
  rmdir /univr-ipc/rebuild 2>/dev/null && {
    git reset --hard origin/master
    git fetch
    git merge origin/master
    /univr/deploy.sh
    # nix-shell -I nixpkgs=https://releases.nixos.org/nixos/19.03/nixos-19.03.173684.c8db7a8a16e/nixexprs.tar.xz -p haskellPackages.cabal-install -p wget -p git --run "nix-shell -I nixpkgs=https://releases.nixos.org/nixos/19.03/nixos-19.03.173684.c8db7a8a16e/nixexprs.tar.xz --run './deploy.sh git@github.com:logic-seminar-verona/website.git'"
    nix-shell -p haskellPackages.cabal-install -p wget -p git --run "nix-shell --run './deploy.sh git@github.com:logic-seminar-verona/website.git'"
  }

  sleep 2
done
