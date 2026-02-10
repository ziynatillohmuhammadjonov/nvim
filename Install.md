# Neovim Konfiguratsiya va O'rnatish Qo'llanmasi

Ushbu qo'llanma Neovim muhitini noldan tiklash yoki yangi qurilmaga (macOS, Linux, Windows) o'rnatish uchun mo'ljallangan. Sizning MacBook a1990 va boshqa qurilmalaringiz uchun moslashtirilgan.
1. Tizim talablari (Pre-requisites)

Git loyihani tortishdan oldin quyidagi asosiy vositalar tizimda o'rnatilgan bo'lishi shart:

    macOS: brew install neovim git node luarocks ripgrep fd fzf make coreutils

    Ubuntu/Debian: sudo apt update && sudo apt install neovim git nodejs npm luarocks ripgrep fd-find fzf make build-essential xclip

    Windows (Scoop): scoop install neovim git nodejs luarocks ripgrep fd fzf make gcc

    Muhim: make va gcc bo'lishi shart, chunki Avante.nvim va fzf-native pluginlari ularni kompilyatsiya qiladi.

2. Terminal va Font (UI uchun)

Pluginlar piktogrammalarini (icons) to'g'ri ko'rsatishi uchun Nerd Font o'rnatilgan bo'lishi kerak.

    Tavsiya: JetBrainsMono Nerd Font yoki Hack Nerd Font.

3. Konfiguratsiyani o'rnatish

    Eski ma'lumotlarni tozalash:
    Bash

    rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim

    Repozitoriyani klon qilish:
    Bash

    git clone https://github.com/ziynatillohmuhammadjonov/nvim.git ~/.config/nvim

4. API Kalitlarini sozlash (AI Integratsiyasi)

Sizda Avante.nvim va CodeCompanion borligi sababli, .zshrc yoki .bashrc faylingizga quyidagilarni qo'shing:
Bash

# Gemini API key (Avante uchun standart nom)
export GEMINI_API_KEY="SIZNING_KALITINGIZ"

So'ngra: source ~/.zshrc
5. Pluginlar va LSP Sozlamalari

    Neovim'ni oching: nvim.

    Lazy.nvim avtomatik ishga tushadi. I tugmasini bosib barchasini o'rnating.

    Mason: :Mason buyrug'i orqali DevOps va Web loyihalaringiz uchun kerakli LSP va Linterlarni o'rnating.

    Treesitter: :TSUpdate orqali sintaksisni yangilang.

6. Asosiy Pluginlar va Hotkeys
Plugin	Vazifasi	Keybind
Avante.nvim	AI Chat / Kod tahriri	<leader>aa / <leader>ae
Telescope	Fayllarni tezkor qidirish	<leader>ff
Neo-tree	Fayllar daraxti	<leader>e
Toggleterm	Ichki terminal	<C-\>
Gitsigns	Git o'zgarishlari	:Gitsigns
