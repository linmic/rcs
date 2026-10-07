#!/bin/sh

# home/* skips dotfiles, so link each dotfile explicitly
for f in "$PWD"/home/.[!.]*; do
  ln -is "$f" "$HOME"
done

# Tools the Neovim config relies on: fuzzy finding, Tree-sitter parsers, start screen
if command -v brew >/dev/null; then
  brew install neovim ripgrep fd fzf tree-sitter-cli fortune cowsay
fi

mkdir -p "$HOME/.config/nvim"
ln -is "$PWD"/nvim/* "$HOME/.config/nvim"
# Install plugins at the versions pinned in lazy-lock.json
nvim --headless "+Lazy! restore" +qa
