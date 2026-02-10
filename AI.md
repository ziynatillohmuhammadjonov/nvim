AI ni sozlash uchun kerakli ai ni api keyini olib mos ravishda ~/.zshrc yoki ~/.bashrc ga api keyni qo'shib qo'yamiz va uni yangilaylmiz source ~/.zshrc yoki source ~/.bashrc orqali. API keylar nomi mos bo'lishi kerak.


AI modellarini Neovim ichida (Avante yoki boshqa pluginlar orqali) to‘g‘ri ishlashi uchun, terminalingizda API kalitlar nomlanishi standartlarga mos bo‘lishi shart. Agar bu nomlar xato bo‘lsa, plugin kalitni topa olmaydi va sizdan qayta-qayta kalit so‘rayveradi.

Sizning .zshrc (yoki .bashrc) faylingiz uchun eng ko‘p qo‘llaniladigan standart API key nomlari ro‘yxati:
1. Asosiy AI Modellar uchun (Standart nomlar)

Ushbu qatorlarni .zshrc faylingiz oxiriga qo‘shing:

# Gemini (Sizda bor model)
export GEMINI_API_KEY="SIZNING_KALITINGIZ_BU_YERDA"

# OpenAI (ChatGPT modellar uchun)
export OPENAI_API_KEY="sk-..."

# Anthropic (Claude 3.5 Sonnet modellar uchun)
export ANTHROPIC_API_KEY="sk-ant-..."

# Groq (Llama 3 kabi ochiq modellarni juda tez ishlatish uchun)
export GROQ_API_KEY="gsk_..."

2. Nvim Pluginlari uchun Muhim Eslatma

Neovim'dagi ko‘pgina pluginlar (xususan Avante.nvim, gp.nvim, CodeCompanion) quyidagi qoidalarga tayanadi:

    Avante.nvim: Standart holatda GEMINI_API_KEY nomini qidiradi.

    Case Sensitivity: O‘zgaruvchi nomlari har doim KATTA HARFLARDA bo‘lishi shart.

    Tmux foydalanuvchilari uchun: Siz MacBook a1990 ishlatasiz va Tmux orqali ishlaysiz. Shuning uchun .zshrc ni yangilagandan so‘ng, Tmux seansini to‘liq o‘chirib yoqishni unutmang (tmux kill-server), aks holda yangi o‘zgaruvchilar Tmux ichida ko‘rinmaydi.

3. Tekshirish usuli

Kalitlarni qo‘shib, source ~/.zshrc qilganingizdan so‘ng, terminalda quyidagilarni yozib tekshiring:

printenv GEMINI_API_KEY

yoki 

echo GEMINI_API_KEY 
