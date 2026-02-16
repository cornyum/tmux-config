#!/bin/bash

# =====================================================
# Tmux Quick Installer (远程一键安装)
# 用法: curl -sL https://raw.githubusercontent.com/xxx/install.sh | bash
# =====================================================

set -e

# 颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}==> Tmux Quick Installer${NC}"

# 检查 tmux
if ! command -v tmux &> /dev/null; then
    echo -e "${YELLOW}Installing tmux...${NC}"
    brew install tmux
fi

# 创建目录
mkdir -p ~/.config/tmux
mkdir -p ~/.tmux/plugins

# 安装 TPM
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo -e "${YELLOW}Installing TPM...${NC}"
    git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi

# 写入配置
cat > ~/.config/tmux/tmux.conf << 'EOF'
# Tmux Configuration - Ctrl+d prefix

set -g prefix 'C-d'
unbind C-b
set -g mouse on
set -g base-index 1
setw -g pane-base-index 1
set -g history-limit 10000

# F1-F9 切换窗口
bind -n F1 select-window -t 1
bind -n F2 select-window -t 2
bind -n F3 select-window -t 3
bind -n F4 select-window -t 4
bind -n F5 select-window -t 5
bind -n F6 select-window -t 6
bind -n F7 select-window -t 7
bind -n F8 select-window -t 8
bind -n F9 select-window -t 9
bind -n F10 new-window -c "#{pane_current_path}"
bind -n F11 kill-pane
bind -n F12 copy-mode

# 分屏
bind u split-window -vb -c "#{pane_current_path}"
bind e split-window -v -c "#{pane_current_path}"
bind n split-window -hb -c "#{pane_current_path}"
bind i split-window -h -c "#{pane_current_path}"

# 面板切换
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# 复制模式
set -g mode-keys vi
bind -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"

# 主题
set -g status-bg black
set -g status-fg white
set -g pane-active-border-style fg=#b294bb

# 插件
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @continuum-restore 'on'

run '~/.tmux/plugins/tpm/tpm'
EOF

# 创建符号链接
ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf

echo -e "${GREEN}==> Done!${NC}"
echo "Run: tmux"
echo "Then press: Prefix + I (capital I) to install plugins"
