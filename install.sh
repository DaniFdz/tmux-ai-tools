#!/usr/bin/env bash
set -e

echo "🦞 Installing tmux AI Coding Tools..."

# Create directories
mkdir -p ~/.config/scripts
mkdir -p ~/.local/bin
mkdir -p ~/.worktrees

# Copy scripts
cp scripts/tmux-ai-layout.sh ~/.config/scripts/
cp scripts/tmux-ai-worktree.sh ~/.config/scripts/
chmod +x ~/.config/scripts/tmux-ai-*.sh

# Create tree command symlink
ln -sf ~/.config/scripts/tmux-ai-worktree.sh ~/.local/bin/tree

# Add zsh keybinding if not present
if ! grep -q "bindkey -s \^t" ~/.zshrc 2>/dev/null; then
    echo '' >> ~/.zshrc
    echo '# AI Worktree Wizard (ctrl+t)' >> ~/.zshrc
    echo 'bindkey -s ^t "tree\n"' >> ~/.zshrc
    echo "✓ Added ctrl+t keybinding to ~/.zshrc"
fi

# Add tmux bindings instructions
echo ""
echo "✓ Scripts installed!"
echo ""
echo "📝 Add to your ~/.tmux.conf:"
echo ""
cat << 'TMUX'
# AI Coding Tools
bind-key C-l run-shell "~/.config/scripts/tmux-ai-layout.sh"
bind-key C-w display-popup -E -w 80% -h 60% "~/.config/scripts/tmux-ai-worktree.sh"
bind-key C-c split-window -v -p 30 -c "#{pane_current_path}" "claude code"
bind-key C-g split-window -v -p 30 -c "#{pane_current_path}" "lazygit"
TMUX
echo ""
echo "Then run: tmux source ~/.tmux.conf"
echo ""
echo "🚀 Usage:"
echo "  - tree         (command)"
echo "  - ctrl+t       (zsh keybinding)"
echo "  - ctrl-a ctrl-w (tmux popup)"
