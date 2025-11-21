# Kitty Terminal Configuration

Personal Kitty terminal emulator configuration optimized for development workflows.

## Features

- **VSCode Dark Theme** - Consistent color scheme matching VSCode
- **Nerd Font Support** - DroidSansM Nerd Font Mono with full icon support
- **Shell Integration** - Enhanced prompt navigation and command output browsing
- **Powerline Tabs** - Slanted tab bar style for clean aesthetics
- **Performance Optimized** - Low latency rendering with 10,000 line scrollback
- **Wayland Integration** - Seamless titlebar color matching

## Quick Install

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/kitty-config.git ~/.config/kitty-config

# Run the install script
cd ~/.config/kitty-config
./install.sh
```

## Manual Install

```bash
# Create kitty config directory if it doesn't exist
mkdir -p ~/.config/kitty

# Copy configuration file
cp kitty.conf ~/.config/kitty/kitty.conf

# Reload kitty (if already running)
# Press Ctrl+Shift+F5 or restart kitty
```

## Requirements

- **Kitty** terminal emulator (v0.26+)
- **DroidSansM Nerd Font Mono** (install from [Nerd Fonts](https://www.nerdfonts.com/))

### Installing Nerd Fonts

```bash
# Download and install DroidSansMono Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Droid Sans Mono Nerd Font Complete.otf" \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fc-cache -fv
```

## Customization

### Adjusting Font Size

Edit `kitty.conf` and modify:
```conf
font_size 11.0  # Change to your preferred size
```

### Enable Transparency

Add to `kitty.conf`:
```conf
background_opacity 0.90  # 0.0 = transparent, 1.0 = opaque
dynamic_background_opacity yes
```

### Hide Window Decorations

Uncomment in `kitty.conf`:
```conf
hide_window_decorations yes
```

## Shell Integration

The config enables shell integration by default. Ensure your shell is supported:

- **Bash**: Add to `~/.bashrc`: `source <(kitty + complete setup bash)`
- **Zsh**: Add to `~/.zshrc`: `source <(kitty + complete setup zsh)`
- **Fish**: Automatically detected

### Shell Integration Features

- `Ctrl+Shift+Z` - Jump to previous command prompt
- `Ctrl+Shift+X` - Jump to next command prompt
- `Ctrl+Shift+G` - View last command output in pager

## Key Bindings

- `Ctrl+Shift+T` - New tab
- `Ctrl+Shift+Q` - Close tab
- `Ctrl+Shift+Right/Left` - Next/Previous tab
- `Ctrl+Shift+Enter` - New window
- `Ctrl+Shift+W` - Close window
- `Ctrl+Shift+F5` - Reload configuration
- `Ctrl+Shift+F2` - Edit configuration
- `F11` - Toggle fullscreen

## Color Scheme

VSCode Dark theme with 16 ANSI colors matching the official VSCode integrated terminal:

- Background: `#1e1e1e`
- Foreground: `#cccccc`
- Cursor: `#ffffff`

## SSH and Containers

This config works seamlessly in SSH sessions and containers:

```bash
# Use with SSH
ssh user@host -t "TERM=xterm-kitty bash"

# Copy config to remote
scp -r ~/.config/kitty user@host:~/.config/

# Use in containers
docker run -it -e TERM=xterm-kitty your-image
```

## Platform Support

- Linux (X11 and Wayland)
- macOS
- BSD

## License

MIT License - feel free to use and modify as needed.
