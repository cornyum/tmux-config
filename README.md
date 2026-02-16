# tmux-config

> 基于 TheCW (theniceboy) 配置修改的 tmux 环境配置
> Prefix 键: `Ctrl+d`

## 特性

- 🎯 Prefix 键改为 `Ctrl+d`（更顺手）
- ⌨️ F1-F12 功能键直达，无需 Prefix
- 📱 鼠标支持
- 💾 自动保存会话 (tmux-continuum)
- 🍎 macOS 剪贴板集成

## 快速安装

### 本地安装

```bash
git clone https://github.com/cornyum/tmux-config.git ~/.tmux-config
cd ~/.tmux-config
./install.sh
```

### 远程一键安装

```bash
curl -sL https://raw.githubusercontent.com/cornyum/tmux-config/main/install.sh | bash
```

## 使用说明

### 启动 tmux

```bash
tmux
```

### 安装插件

首次启动后，按 `Ctrl+d + I` (大写 I) 安装插件

### 基本操作

| 快捷键 | 说明 |
|--------|------|
| `Ctrl+d` | Prefix 键 |
| F1-F9 | 切换窗口 (直达) |
| F10 | 新建窗口 |
| F11 | 关闭面板 |
| F12 | 进入复制模式 |
| `Ctrl+d + h/j/k/l` | 切换面板 |
| `Ctrl+d + u/e/n/i` | 分屏 (上/下/左/右) |
| `Ctrl+d + r` | 重载配置 |

## 快捷键速查

详见 [tmx_butt.md](./tmx_butt.md)

## 依赖

- macOS
- Homebrew
- tmux 3.0+

## License

MIT
