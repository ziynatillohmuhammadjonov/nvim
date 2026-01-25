Debugger Setup Guide (NestJS / NextJS)

Ushbu konfiguratsiya Neovim-da TypeScript/JavaScript loyihalarini professional debug qilish uchun ishlatiladi.
1. Talablar

    Node.js (v18+)

    Git

2. Debugger Adapterini o'rnatish

Har bir OS-da terminalni oching va quyidagi buyruqlarni ketma-ket yurgizing:
MacOS / Linux (Bash/Zsh)
Bash

# Papka yaratish
mkdir -p ~/.local/share/nvim/vscode-js-debug
cd ~/.local/share/nvim/vscode-js-debug

# Kodni klon qilish
git clone https://github.com/microsoft/vscode-js-debug .

# O'rnatish va Build qilish
npm install
npx gulp vsDebugServerBundle

Windows (PowerShell)
PowerShell

# Papka yaratish
New-Item -Path "$HOME\.local\share\nvim\vscode-js-debug" -ItemType Directory -Force
cd "$HOME\.local\share\nvim\vscode-js-debug"

# Kodni klon qilish
git clone https://github.com/microsoft/vscode-js-debug .

# O'rnatish va Build qilish
npm install
npx gulp vsDebugServerBundle

3. Loyihada foydalanish

    Loyihangizni debug rejimida ishga tushiring:
    Bash

    npm run start:debug

    Neovim-da kodingizga breakpoint qo'ying (<leader>b).

    <F5> ni bosing va "NestJS: Attach" ni tanlang.
