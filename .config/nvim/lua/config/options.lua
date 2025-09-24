vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.mousescroll = "ver:1,hor:2"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cmdheight = 1
vim.opt.numberwidth = 4
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.fileencoding = "utf-8"
vim.opt.pumheight = 10
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 300
vim.opt.wrap = true
vim.opt.termguicolors = true

vim.cmd([[set iskeyword+=-]])
vim.cmd("set wildignore+=*/vendor/**")
vim.cmd("set wildignore+=*/node_modules/**")

vim.api.nvim_create_user_command("RemoveDocBlock", [[%s,/\*\_.\{-}\*/,,g]], {})
