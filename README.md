# tmux AI Coding Tools 🦞

Tools for working with AI coding agents (Claude Code, OpenCode) in tmux.

## 🛠️ Tools

### 1. `tree` - AI Worktree Wizard
Interactive command to create worktrees with AI coding layout.

**Usage:**
```bash
tree              # Direct command
ctrl+t            # zsh keybinding
```

**What it does:**
1. Select repo with fzf
2. Ask for branch name
3. Option to create worktree in `~/.worktrees/`
4. Create tmux session with full layout

### 2. `ctrl-a ctrl-l` - AI Layout
Creates 4-pane layout in current session:
```
┌─────────────────────┬──────────┐
│ Claude Code         │ nvim     │
│ (75% width)         │ (25%)    │
├─────────────────────┼──────────┤
│ Terminal            │ Lazygit  │
└─────────────────────┴──────────┘
```

### 3. Quick splits
- `ctrl-a ctrl-c` → Split with `claude code`
- `ctrl-a ctrl-g` → Split with `lazygit`

## 📦 Installation

```bash
# 1. Clone repo
git clone https://github.com/DaniFdz/tmux-ai-tools.git
cd tmux-ai-tools

# 2. Run installer
./install.sh
```

## 📁 Structure

```
~/.config/scripts/
├── tmux-ai-layout.sh      # 4-pane layout
└── tmux-ai-worktree.sh    # Worktree wizard

~/.worktrees/              # Created worktrees
└── {repo}_{branch}/

~/.local/bin/
└── tree -> tmux-ai-worktree.sh
```

## ⚙️ Tmux Configuration

```tmux
# AI Coding Layout
bind-key C-l run-shell "~/.config/scripts/tmux-ai-layout.sh"

# AI Worktree Wizard
bind-key C-w display-popup -E -w 80% -h 60% "~/.config/scripts/tmux-ai-worktree.sh"

# Quick splits
bind-key C-c split-window -v -p 30 -c "#{pane_current_path}" "claude code"
bind-key C-g split-window -v -p 30 -c "#{pane_current_path}" "lazygit"
```

## 🎯 Workflows

### New feature with worktree
```bash
# Option 1: Command
tree

# Option 2: zsh keybinding
ctrl+t

# Option 3: From tmux
ctrl-a ctrl-w
```

### Quick layout in current session
```bash
ctrl-a ctrl-l
```

---

**Tech:** tmux + fzf + git worktrees + AI coding agents
