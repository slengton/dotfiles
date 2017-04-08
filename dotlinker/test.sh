#!/usr/bin/env bash

existing_symlinks=($(ls -la ~ | grep "\->" | grep "\." | sed -E "s/[^\.]*\.([a-z\-]*)[^\/]*(\/.*$)/\1::\2/"))
existing_symlinks_map=$(mktemp -d)

echo $existing_symlinks_map

for symlink in "${existing_symlinks[@]}"; do
  key=${symlink%%::*}
  value=${symlink#*::}
  echo $value > $existing_symlinks_map/$key
done

if [[ -e "$existing_symlinks_map/$1" ]]; then
  echo "$(< $existing_symlinks_map/$1)"
else
  echo "not symlinked yet"
fi

rm -rf existing_symlinks_map
