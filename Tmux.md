🚀 Tmux-ni Sozlash va Ishga Tushirish Yo'riqnomasi
Ushbu qo'llanma Tmux-ni noldan o'rnatish, Gruvbox mavzusini ulash va sessiyalarni saqlash tizimini yo'lga qo'yish uchun xizmat qiladi.

1. O'rnatishdan oldingi qadamlar (Pre-requisites)

Tmux va uning pluginlari ishlashi uchun tizimda git bo'lishi shart.
Bash

# Ubuntu/WSL uchun
sudo apt update
sudo apt install tmux git -y

Muhim: Shriftni sozlash

Chiroyli ikonka va belgilar ko'rinishi uchun kompyuteringizga (Windows/Mac) Nerd Font o'rnatilgan bo'lishi kerak.

    Tavsiya etiladi: JetBrainsMono Nerd Font

    Windows Terminal sozlamalaridan ushbu shriftni tanlab qo'ying.

2. TPM (Plugin Manager) o'rnatish

Pluginlarni boshqarish uchun eng avvalo TPM-ni yuklab olamiz:
Bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

3. Konfiguratsiya faylini yaratish

~/.tmux.conf faylini oching (yoki yarating):


# ==============================================================================
# TERMINAL VA TIZIM SOZLAMALARI
# ==============================================================================

# Terminal ranglarini to'g'ri ko'rsatish (Gruvbox uchun muhim)
set -g default-terminal "xterm-256color"
set -ga terminal-overrides ",xterm-256color:Tc"

# Backspace va funksional klavishlar to'g'ri ishlashi uchun
set-window-option -g xterm-keys on

# Escape kechikishini kamaytirish (Neovim tez ishlashi uchun)
set -sg escape-time 10

# Sichqonchani yoqish (Panellarni surish va tanlash uchun)
set -g mouse on

# Oynalar va panellar indeksini 0 dan emas, 1 dan boshlash
set -g base-index 1
setw -g pane-base-index 1

# ==============================================================================
# KEY BINDINGS (TUGMALAR)
# ==============================================================================

# Asosiy Prefix tugmasini Ctrl-b dan Ctrl-a ga o'zgartirish
set -g prefix C-a
unbind C-b
bind-key C-a send-prefix

# [Prefix + r] - Konfiguratsiyani qayta yuklash
unbind r
bind r source-file ~/.tmux.conf \; display "Konfiguratsiya yangilandi!"

# [Prefix + |] - Ekranni vertikal bo'lish (hozirgi papkada)
unbind %
bind | split-window -h -c "#{pane_current_path}"

# [Prefix + -] - Ekranni gorizontal bo'lish (hozirgi papkada)
unbind '"'
bind - split-window -v -c "#{pane_current_path}"

# [Prefix + h, j, k, l] - Panellar o'lchamini o'zgartirish (Resize)
bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5
bind -r h resize-pane -L 5

# VI rejimi sozlamalari (Nusxa olish uchun)
# [Prefix + [ ] - Nusxa olish rejimiga kirish
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection # 'v' bilan belgilash
bind-key -T copy-mode-vi 'y' send -X copy-selection  # 'y' bilan nusxalash (yank)
unbind -T copy-mode-vi MouseDragEnd1Pane             # Sichqoncha bilan belgilaganda avtomatik chiqib ketmaslik

# ==============================================================================
# PLUGINLAR (TPM)
# ==============================================================================

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator' # Neovim va Tmux orasida Ctrl+h/j/k/l orqali yurish
set -g @plugin 'egel/tmux-gruvbox'               # Gruvbox mavzusi
set -g @plugin 'tmux-plugins/tmux-resurrect'     # Sessiyani saqlash
set -g @plugin 'tmux-plugins/tmux-continuum'     # Avtomatik saqlash
set -g @plugin 'tmux-plugins/tmux-sessionist'   # Sessiyalarni oson boshqarish

# --- PLUGIN SOZLAMALARI ---
set -g @tmux-gruvbox 'dark'                      # Gruvbox qorong'u rejimi
set -g @resurrect-capture-pane-contents 'on'     # Panel ichidagi yozuvlarni ham saqlash
set -g @continuum-restore 'on'                   # Tmux ochilganda sessiyani avtomatik tiklash

# Manula installation.
# ~/.tmux/plugins/tpm/bin/install_plugins 

# TPM-ni ishga tushirish (DOIM OXIRIDA TURSIN)
run '~/.tmux/plugins/tpm/tpm'

4. Pluginlarni o'rnatish (Yakuniy qadam)
Faylni saqlagandan so'ng (Ctrl+O, Enter, Ctrl+X), Tmux-ga kiring va quyidagilarni bajaring:

    Tmux ichida turib: Ctrl + a keyin r bosing (Config yangilanadi).

    Pluginlarni o'rnatish uchun terminalda ushbu buyruqni bering:
    Bash

    ~/.tmux/plugins/tpm/bin/install_plugins


 Vazifa,Tugmalar kombinatsiyasi
Asosiy Prefix,Ctrl + a
Yangi oyna (Window),Prefix + c
Ekranni bo'lish (Split),Prefix + | yoki -
Sessiyani saqlash (Manual),Prefix + Ctrl + s
Sessiyani tiklash (Manual),Prefix + Ctrl + r
Sessiyalar ro'yxati,Prefix + s
Oynani qayta nomlash,"Prefix + ,"
Konfiguratsiyani yangilash,Prefix + r   Hammasi tayyor! Gruvbox mavzusi va barcha funksiyalar ishga tushishi kerak.
