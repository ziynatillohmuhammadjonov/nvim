
Recomenndet terminal - ghostty
setting .config/ghostty/config


# Shrift sozlamalari
font-family = "JetBrainsMono Nerd Font"
font-size = 14

# Ranglar mavzusi (Ghostty-da ko'plab ichki mavzular bor)
theme = tokyonight

# Oyna sozlamalari
window-padding-x = 10
window-padding-y = 10
# Fon shaffofligi (0.0 dan 1.0 gacha)
background-opacity = 0.97

# Fonni xiralashtirish (macOS-da ishlaydi)
background-blur = true
# Kursorni sozlash

cursor-style = block
shell-integration = zsh

# GPU va renderlashni optimallashtirish
unfocused-split-opacity = 0.7

# --- Klaviatura kombinatsiyalari ---
# F11 bosilganda Fullscreen qilish (Huddi Alacritty kabi)
keybind = f11=toggle_fullscreen
# Command+Enter (macOS) yoki Alt+Enter (Linux) orqali ham qilish mumkin
keybind = super+enter=toggle_fullscreen



Windows terminal setup
Recomenndet alacrity terminal
setup C:\Users\User\AppData\Roaming\alacritty\alacritty.toml

# Alacritty Configuration


# Terminal ochiladigan boshlang'ich papka
# Eslatma: Windowsda slashelarni "/" ko'rinishida yozish xavfsizroq
general.working_directory = "D:/"

# Agar ma'lum bir loyiha papkasida ochilmoqchi bo'lsangiz:
# general.working_directory = "D:/findwork/findwork-client"

[window]
# Oynani biroz shaffof qilish (nvim chiroyli ko'rinishi uchun)
opacity = 0.95
startup_mode = "Fullscreen" # Yoki "Maximized" qilsangiz tepadagi panel ko'rinib turadi

# Oynaning chetidagi ramkalarni sozlash
padding = { x = 10, y = 10 }
# Sarlavha satrini olib tashlash (minimalizm uchun 'None', bo'lmasa 'Full')
decorations = "Full"

[scrolling]
history = 10000

[font]
# Neovimda ikonkalarni ko'rish uchun "Nerd Font" o'rnatilgan bo'lishi shart!
# Masalan: "JetBrainsMono Nerd Font" yoki "CascadiaCode NF"
normal = { family = "JetBrainsMono Nerd Font", style = "Regular" }
bold = { family = "JetBrainsMono Nerd Font", style = "Bold" }
italic = { family = "JetBrainsMono Nerd Font", style = "Italic" }
size = 11.0

[colors]
# Alacritty uchun ranglar (Masalan: Tokyo Night yoki Catppuccin stili)
[colors.primary]
background = "#1a1b26"
foreground = "#a9b1d6"

[colors.normal]
black =   "#32344a"
red =     "#f7768e"
green =   "#9ece6a"
yellow =  "#e0af68"
blue =    "#7aa2f7"
magenta = "#ad8ee6"
cyan =    "#449dab"
white =   "#787c99"

[colors.bright]
black =   "#444b6a"
red =     "#ff7a93"
green =   "#b9f27c"
yellow =  "#ff9e64"
blue =    "#7da6ff"
magenta = "#bb9af7"
cyan =    "#0db9d7"
white =   "#acb0d0"

[cursor]
style = "Block"
blink_interval = 500

[env]
# Neovimda ranglar to'g'ri chiqishi uchun (TrueColor)
TERM = "xterm-256color"

[[keyboard.bindings]]
key = "F11"
action = "ToggleFullscreen"

# [terminal.shell]
# Windowsda standart terminal sifatida Git Bashni tanlash (Manzilni tekshiring)
# program = "C:\\Program Files\\Git\\bin\\bash.exe"
# args = ["--login", "-i"]

# Agar windowsda subsystem qilib linux ishlatilsa unda ishlash tavsiya etiladi.
<!-- [terminal.shell] -->
<!-- program = "wsl.exe" -->
# -u dan keyin faqat user nomi: ziynatilloh
# --cd dan keyin Linuxdagi to'liq yo'l: /home/ziynatilloh/projects
<!-- args = ["-d", "Ubuntu", "-u", "ziynatilloh", "--cd", "/home/ziynatilloh/projects"] -->
