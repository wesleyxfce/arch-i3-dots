#!/usr/bin/env bash
set -e

REPO="https://github.com/wesleyxfce/arch-i3-dots.git"
TMP="$(mktemp -d)"

command -v git >/dev/null || sudo pacman -S --needed --noconfirm git
sudo pacman -S --needed --noconfirm ttf-jetbrains-mono-nerd

git clone --depth 1 "$REPO" "$TMP"

mkdir -p "$HOME/.config" "$HOME/Pictures/wallpapers" "$HOME/.local/share/rofi/themes"
cp -r "$TMP/configs/." "$HOME/.config/"
cp -r "$TMP/wallpapers/." "$HOME/Pictures/wallpapers/"
cp -r "$TMP/tema-rofi/." "$HOME/.local/share/rofi/themes/"

rm -rf "$TMP"
echo "Pronto! Configs em ~/.config e wallpapers em ~/Pictures/wallpapers, tema do rofi em ~/.local/share/rofi/themes"
