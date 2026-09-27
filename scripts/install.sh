#!/usr/bin/env bash

# Check if the multilib repository is enabled
if grep -qw "#\[multilib\]" /etc/pacman.conf; then
    printf "Enable the multilib repository before executing the script\n" >&2
    exit 1
fi

# Elevate privileges
sudo -v

# Update the system
if ! sudo pacman -Syu; then
    printf "Failed to update the system\n" >&2
    exit 1
fi
printf "Updated the system\n"

# Install paru
if ! command -v paru > /dev/null; then
    if ! (
        sudo pacman -S --needed base-devel &&
        cd /tmp &&
        git clone https://aur.archlinux.org/paru.git &&
        cd paru &&
        makepkg -si
    ); then
        printf "Failed to install paru\n" >&2
        exit 1
    fi
    printf "Installed paru\n"
fi

# Install the packages
PACKAGES_LIST=(
    awww
    bat
    brave-origin-bin
    cliphist
    ente-auth-bin
    equibop-bin
    eza
    gamemode lib32-gamemode
    ghostty
    gnome-keyring
    lutris
    ly
    mangohud goverlay lib32-mangohud
    matugen
    mission-center
    nautilus 7zip cdrtools ffmpegthumbnailer file-roller icoextract unrar unzip zip
    openrazer-daemon linux-headers polychromatic
    pacman-contrib
    pear-desktop-bin
    protonplus
    pwvucontrol
    qimgv
    reflector
    rofi rofi-emoji
    session-desktop-bin
    steam millennium-bin
    swaync
    torbrowser-launcher
    ufw
    vlc vlc-plugins-all
    waybar
    yt-dlp
    zed
    zsh oh-my-zsh-git zsh-autosuggestions zsh-pure-prompt zsh-syntax-highlighting

    # AMDGPU
    mesa lib32-mesa
    vulkan-radeon lib32-vulkan-radeon
    xf86-video-amdgpu

    # Fonts
    inter-font
    noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
    otf-font-awesome
    ttf-jetbrains-mono-nerd
    ttf-nerd-fonts-symbols

    # Hyprland
    hyprland
    hyprlock
    hyprpicker
    hyprpolkitagent
    hyprshot
    hyprshutdown

    # Pipewire
    pipewire lib32-pipewire
    pipewire-alsa
    pipewire-audio
    pipewire-jack lib32-pipewire-jack
    pipewire-pulse
    wireplumber

    # Toolkits
    adw-gtk-theme
    adwaita-icon-theme
    bibata-cursor-theme-bin
    darkly-bin frameworkintegration
    gtk3 gtk4
    qt5-base qt6-base
    qt5-wayland qt6-wayland
    qt5ct-kde qt6ct-kde

    # XDG Desktop Portal
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
)

if ! paru -S --needed "${PACKAGES_LIST[@]}"; then
    printf "Failed to install the packages\n" >&2
    exit 1
fi
printf "Installed the packages\n"

# Add user to the groups
GROUPS_LIST=(
    gamemode
    input
    openrazer
)

for group in "${GROUPS_LIST[@]}"; do
    if ! groups "$USER" | grep -qw "$group"; then
        if ! gpasswd -a "$USER" "$group" > /dev/null; then
            printf "Failed to add %s to the %s group\n" "$USER" "$group" >&2
            exit 1
        fi
        printf "Added %s to the %s group\n" "$USER" "$group"
    fi
done

# Enable and start the services
SERVICES_LIST=(
    fstrim.timer
    paccache.timer
    systemd-oomd.service
    tor.service
    ufw.service
)

for service in "${SERVICES_LIST[@]}"; do
    if ! systemctl is-enabled "$service" > /dev/null; then
        if ! systemctl enable --now "$service" > /dev/null; then
            printf "Failed to enable and start the %s service\n" "$service" >&2
            exit 1
        fi
        printf "Enabled and started the %s service\n" "$service"
    fi
done

# Add execution permission of files
PERMISSION_LIST=(
    ~/.config/hypr/scripts/*
    ~/.config/rofi/scripts/*
    ~/scripts/*
)

for file in "${PERMISSION_LIST[@]}"; do
    if ! [[ -x "$file" ]]; then
        if ! chmod +x "$file" > /dev/null; then
            printf "Failed to add execution permission of %s\n" "$file" >&2
            exit 1
        fi
        printf "Added execution permission of %s\n" "$file"
    fi
done

# Enable UFW
if sudo ufw status | grep -qw "inactive"; then
    if ! sudo ufw enable > /dev/null; then
        printf "Failed to enable UFW\n" >&2
        exit 1
    fi
    printf "Enabled UFW\n"
fi

# Set ZSH as the default shell
if [[ "$SHELL" != $(command -v zsh) ]]; then
    if ! chsh -s $(command -v zsh) > /dev/null; then
        printf "Failed to set ZSH as the default shell\n" >&2
        exit 1
    fi
    print "Set ZSH as the default shell\n"
fi

# Enable ly
if ! systemctl is-enabled ly@tty1.service > /dev/null; then
    if ! systemctl enable ly@tty1.service > /dev/null; then
        printf "Failed to enable ly\n" >&2
        exit 1
    fi
    printf "Enabled ly\n"
fi

if systemctl is-enabled getty@tty1.service > /dev/null; then
    if ! systemctl disable getty@tty1.service > /dev/null; then
        printf "Failed to disable getty\n" >&2
        exit 1
    fi
    printf "Disabled getty\n"
fi

# Reboot the system
printf "The system will reboot in 10 seconds..."
sleep 10; reboot
