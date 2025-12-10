# CaYeRok dotfiles

> ⚠️ **Note:** This is my personal Hyprland setup and is **not intended for widespread use**.  
> I frequently tweak and experiment with it as my preferences change.  

The configuration is structured to be **easy to modify**, with files split for convenience to make customization simple.

---

## 🛠 Dependencies
These programs are required to make the setup work:

- `hypridle` (currently unused)  
- `hyprlock`  
- `hyprpaper`  
- `swaync`  
- `pipewire`  
- `cliphist`  
- `wl-paste`  
- `waybar` – heavily based on: [Zilero232/arch-install-kit dotfiles](https://github.com/Zilero232/arch-install-kit/tree/master)  

---

## 💻 Default Programs
Most default programs can be customized in `keybinds.conf` as variables:

| Function       | Program           |
|----------------|-----------------|
| Terminal       | kitty (bash)     |
| Browser        | Firefox          |
| Menu           | Wofi             |
| IDE            | VSCode           |
| File Manager   | Yazi (CLI)       |

---

## ⌨️ Keybinds

| Key Combination           | Action                          |
|----------------------------|--------------------------------|
| SUPER + T                 | Open Terminal                  |
| SUPER + W                 | Open Browser                   |
| SUPER + M                 | Open Menu                       |
| SUPER + C                 | Open VSCode                     |
| SUPER + F                 | Open File Manager               |
| SUPER + Q                 | Close Window                    |
| SUPER + R                 | Reload Hyprland and Waybar     |
| SUPER + L                 | Lock Screen                     |
| SUPER + V                 | Copy History                     |
| SUPER + P                 | Screenshot: Full Screen        |
| SUPER + SHIFT + P         | Screenshot: Select Area        |
| SUPER + CTRL + P          | Screenshot: Active Window      |
| SUPER + 0-9               | Switch Workspace                |
| SUPER + ALT + 0-0         | Move Window to Workspace        |
| SUPER + ALT + SPACE       | Toggle Floating Window          |
| SUPER + SPACE             | Toggle Fullscreen               |

---

## 🤌 Gestures

| Gesture                    | Action                          |
|----------------------------|--------------------------------|
| 4-finger swipe             | Change Workspace               |
| SUPER + Left Click         | Move Window                    |
| SUPER + Right Click        | Resize Window                  |

---

## 🔧 Work In Progress (WIP)

- Remake Waybar configuration  
- Setup `hypridle`  
- Add Neovim config  
- Automatically start frequently used apps  
- Redo animations  
