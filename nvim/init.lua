-- init.lua by Linmic, modernised from rcs/nvim/init.vim

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Options ---------------------------------------------------------------
local o = vim.opt
o.number = true
o.mouse = "a"
o.clipboard = "unnamedplus"     -- yank to the system clipboard
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2
o.smartindent = true
o.ignorecase = true
o.smartcase = true
o.undofile = true               -- persistent undo
o.swapfile = false
o.backup = false
o.writebackup = false
o.signcolumn = "yes"
o.scrolloff = 8
o.splitright = true
o.splitbelow = true
o.updatetime = 250
o.wrap = true
o.linebreak = true
o.formatoptions:append("mB")    -- CJK line breaking and joining
o.foldmethod = "expr"           -- Tree-sitter folds instead of {{{ markers
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevelstart = 99           -- start with every fold open
o.foldcolumn = "1"

-- Keymaps ---------------------------------------------------------------
local map = vim.keymap.set
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Tab indents, as before (this also takes over <C-i>, same as the old rc)
map("n", "<Tab>", ">>")
map("n", "<S-Tab>", "<<")
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Pasting over a selection keeps the register (built in as visual P now)
map("x", "p", "P")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- NERDCommenter muscle memory on top of the built-in gc
map("n", "<leader>c<Space>", "gcc", { remap = true, desc = "Toggle comment" })
map("x", "<leader>c<Space>", "gc", { remap = true, desc = "Toggle comment" })
map("n", "<leader>cc", "gcc", { remap = true, desc = "Toggle comment" })
map("x", "<leader>cc", "gc", { remap = true, desc = "Toggle comment" })

-- cosco.vim replacement: add a ; at the end of the line if it lacks ; or ,
local function end_with_semicolon()
  local line = vim.api.nvim_get_current_line()
  if not line:match("[;,]%s*$") then
    vim.api.nvim_set_current_line((line:gsub("%s*$", ";")))
  end
end
map("n", "<leader>;", end_with_semicolon, { desc = "Add semicolon" })
map("i", "<leader>;", end_with_semicolon, { desc = "Add semicolon" })

map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end)
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end)

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.hl.on_yank() end,
})

-- LSP keymaps (0.12 already provides K, grn rename, gra code action,
-- grr references, gri implementation, gO symbols)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
  end,
})

-- Plugin manager: lazy.nvim ---------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  checker = { enabled = true, notify = false }, -- check for updates quietly
  change_detection = { notify = false },
  rocks = { enabled = false },                  -- no plugin here needs luarocks
})
