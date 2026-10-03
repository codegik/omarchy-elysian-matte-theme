#!/bin/bash
# Install Elysian Matte for Omarchy.
#
# `omarchy theme install <url>` drops neovim.lua and terminal configs from
# themes cloned from a repo. A theme linked from your own working copy keeps
# every file, so this clones the repo and links it into Omarchy's themes dir.
set -euo pipefail

REPO=https://github.com/codegik/omarchy-elysian-matte-theme.git
SRC=${ELYSIAN_MATTE_DIR:-$HOME/.local/share/omarchy-elysian-matte-theme}
LINK=$HOME/.config/omarchy/themes/elysian-matte

if [[ -d $SRC/.git ]]; then
  git -C "$SRC" pull --ff-only
else
  git clone "$REPO" "$SRC"
fi

mkdir -p "${LINK%/*}"
[[ -e $LINK && ! -L $LINK ]] && rm -rf "$LINK"
ln -sfn "$SRC" "$LINK"

omarchy theme set elysian-matte
