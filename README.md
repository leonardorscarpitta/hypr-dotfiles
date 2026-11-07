# hypr-dotfiles

Hyprland rice for Arch Linux: ink-black surfaces with gold accents.

Includes Hyprland, hyprlock, hypridle, hyprpaper, waybar, rofi, kitty, mako, swayosd, yazi, neovim (LazyVim), btop, fastfetch, starship, GTK theme and a matching cursor.

## Requirements

Arch Linux with **Hyprland 0.57+** (the config uses the Lua format). Every package is in the official `extra` repo:

```sh
sudo pacman -S --needed \
  hyprland hyprlock hypridle hyprpaper hyprpolkitagent hyprpicker hyprshot hyprsunset \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  waybar rofi mako swayosd kitty starship fastfetch btop yazi mpv neovim \
  wl-clipboard cliphist playerctl pavucontrol nm-connection-editor gvfs \
  adw-gtk-theme papirus-icon-theme ttf-jetbrains-mono-nerd inter-font qt6ct
```

Optional: `rocm-smi-lib` (AMD GPU stats in btop), `greetd greetd-tuigreet` (login screen).

## Install

```sh
git clone https://github.com/leonardorscarpitta/hypr-dotfiles.git ~/hypr-dotfiles
cd ~/hypr-dotfiles

# back up what you have first
mkdir -p ~/.config.bak && cp -r ~/.config/{hypr,waybar,rofi,mako,kitty,fastfetch,btop,swayosd,yazi,nvim,gtk-3.0,gtk-4.0} ~/.config.bak/ 2>/dev/null

# link the configs
for d in hypr waybar rofi mako kitty fastfetch btop swayosd yazi nvim gtk-3.0 gtk-4.0; do
  rm -rf ~/.config/$d && ln -s "$PWD/$d" ~/.config/$d
done
ln -sf "$PWD/starship.toml" ~/.config/starship.toml
ln -sf "$PWD/XCompose" ~/.config/XCompose

# cursor theme
mkdir -p ~/.local/share/icons && ln -sfn "$PWD/icons/Bibata-Rounded" ~/.local/share/icons/Bibata-Rounded

# shell prompt and dark mode for GTK apps
echo 'eval "$(starship init bash)"' >> ~/.bashrc
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
gsettings set org.gnome.desktop.interface cursor-theme Bibata-Rounded
```

Log out and pick **Hyprland** at the login screen.

## Adjust for your machine

| file | what to change |
|---|---|
| `hypr/hyprland.lua` | monitor rule (`DP-1`, `2560x1080@99.94`) and keyboard layout (`us` / `intl`) |
| `waybar/config.jsonc` | network interfaces (`enp9s0`, `wg0`) |
| `waybar/scripts/gpu.sh` | GPU usage reads AMD `gpu_busy_percent` (falls back to `nvidia-smi`) |
| `rofi/kintsugi.rasi` | the hostname shown in the footer |

`system/` holds optional files for `/etc` (greetd login screen). Copy them with `sudo` only if you use greetd.

## Keybinds

| keys | action |
|---|---|
| `SUPER + Return` | terminal (kitty) |
| `SUPER + D` | app launcher (rofi) |
| `SUPER + E` | file manager (yazi) |
| `SUPER + C` | close window |
| `SUPER + T` | toggle floating |
| `SUPER + F` | fullscreen (`SHIFT` to maximize) |
| `SUPER + 1-0` | switch workspace (`SHIFT` to move window) |
| `SUPER + CTRL + arrows` | resize window |
| `SUPER + V` | clipboard history |
| `SUPER + L` | lock screen |
| `SUPER + Escape` | power menu |
| `SUPER + SHIFT + S` | screenshot (region) |
| `SUPER + Q` | color picker |
