#!/usr/bin/env bash

[ -d /univr-ipc ] || exit 1

cd /univr || exit 1

git config --global user.email "ingo.blechschmidt@univr.it"
git config --global user.name "Ingo Blechschmidt (via Quasicoherent)"
git config --global push.default simple

mkdir -m 700 -p $HOME/.ssh
echo "$SSH_DEPLOY_KEY" | base64 -d > $HOME/.ssh/id_rsa
chmod 600 $HOME/.ssh/*
cat >> $HOME/.ssh/known_hosts <<EOF
github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk=
github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=
EOF

while :; do
  rmdir /univr-ipc/rebuild 2>/dev/null && {
    git reset --hard origin/master
    git fetch
    git merge origin/master
    nix-shell -I nixpkgs=https://nixos.org/channels/nixos-21.05/nixexprs.tar.xz -p haskellPackages.cabal-install -p wget -p git --run "nix-shell -I nixpkgs=https://nixos.org/channels/nixos-21.05/nixexprs.tar.xz --run './deploy.sh git@github.com:logic-seminar-verona/website.git'"
  }

  sleep 2
done
