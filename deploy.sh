#!/bin/sh

# Tools the shell and Neovim configs rely on: fuzzy finding, folder jumping,
# zsh plugins, Tree-sitter parsers, lazygit and the start screen
if command -v brew >/dev/null; then
  brew install neovim ripgrep fd fzf zoxide lazygit tree-sitter-cli fortune cowsay \
    zsh-autosuggestions zsh-syntax-highlighting
fi

# Oh My Zsh, keeping the .zshrc linked below instead of writing its own
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

p10k="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
[ -d "$p10k" ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k"

# home/* skips dotfiles, so link each dotfile explicitly
for f in "$PWD"/home/.[!.]*; do
  ln -is "$f" "$HOME"
done

mkdir -p "$HOME/.config/nvim"
ln -is "$PWD"/nvim/* "$HOME/.config/nvim"
# Install plugins at the versions pinned in lazy-lock.json
nvim --headless "+Lazy! restore" +qa
