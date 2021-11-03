vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.background = 'dark'
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard = 'unnamed'
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.history = 1024
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.list = true
vim.opt.listchars = 'tab:»·,trail:·'
vim.opt.number = true
vim.opt.ruler = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 2
vim.opt.showcmd = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.ttimeoutlen = 10

vim.cmd('colorscheme solarized')
vim.api.nvim_command('let g:ackprg = \'rg --vimgrep --no-heading\'')
vim.api.nvim_command('let NERDTreeShowHidden=1')

local nvim_lsp = require('lspconfig')
local bindings = require('bindings')

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'eslint', 'flow' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = bindings.attach_lsp_bindings,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require('lualine').setup {
  options = {
    theme = 'solarized_dark',
  }
}
