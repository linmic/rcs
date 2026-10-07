-- Add a plugin by adding a line here, then restart (or run :Lazy sync).
-- Comments name the old plugin each entry replaces.
return {
  -- dracula/vim
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    config = function() vim.cmd.colorscheme("dracula") end,
  },

  -- vim-airline
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "dracula-nvim",
        icons_enabled = false,
        section_separators = "",
        component_separators = "|",
      },
    },
  },

  -- vim-startify, with the fortune | cowsay header
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        formats = { icon = function() return { "" } end }, -- no Nerd Font
        sections = {
          function()
            -- pad lines to one width so centering keeps the cow intact
            local lines = vim.fn.systemlist("fortune -s | cowsay -d")
            local width = 0
            for _, l in ipairs(lines) do width = math.max(width, vim.fn.strdisplaywidth(l)) end
            for i, l in ipairs(lines) do lines[i] = l .. (" "):rep(width - vim.fn.strdisplaywidth(l)) end
            return { header = table.concat(lines, "\n"), padding = 1 }
          end,
          { section = "keys", gap = 1, padding = 1 },
          { section = "recent_files", title = "Recent files", indent = 2, padding = 1 },
        },
      },
    },
  },

  { "folke/which-key.nvim", event = "VeryLazy", opts = {} }, -- shows pending keymaps

  -- tpope classics; vim-sleuth replaces detectindent
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-sleuth",
  "tpope/vim-fugitive",

  -- vim-easy-align, same mappings as before
  {
    "junegunn/vim-easy-align",
    keys = {
      { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "Align" },
      { "<CR>", "<Plug>(EasyAlign)", mode = "x", desc = "Align" },
    },
  },

  -- vim-easymotion: s{char}{char}{label}, ,j / ,k for lines
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash jump" },
      { "S", function() require("flash").treesitter() end, mode = { "n", "x", "o" }, desc = "Flash select node" },
      {
        "<leader>j",
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0, forward = true, wrap = false, multi_window = false },
            label = { after = { 0, 0 } },
            pattern = "^",
          })
        end,
        mode = { "n", "x", "o" },
        desc = "Jump to line below",
      },
      {
        "<leader>k",
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0, forward = false, wrap = false, multi_window = false },
            label = { after = { 0, 0 } },
            pattern = "^",
          })
        end,
        mode = { "n", "x", "o" },
        desc = "Jump to line above",
      },
    },
  },

  -- auto-pairs
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- vim-css-color
  { "brenoprata10/nvim-highlight-colors", opts = {} },

  -- vim-indent-guides, off by default and toggled with ,ig as before
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = { enabled = false },
    keys = { { "<leader>ig", "<cmd>IBLToggle<CR>", desc = "Toggle indent guides" } },
  },

  -- Git signs in the gutter
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(buf)
        local gs = require("gitsigns")
        vim.keymap.set("n", "]c", function() gs.nav_hunk("next") end, { buffer = buf })
        vim.keymap.set("n", "[c", function() gs.nav_hunk("prev") end, { buffer = buf })
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = buf, desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>hb", gs.blame_line, { buffer = buf, desc = "Blame line" })
      end,
    },
  },

  -- NERDTree on F1
  {
    "nvim-tree/nvim-tree.lua",
    keys = { { "<F1>", "<cmd>NvimTreeToggle<CR>", desc = "File tree" } },
    opts = {
      renderer = {
        icons = {
          show = { file = false, folder = false, git = true },
          glyphs = { folder = { arrow_closed = "▸", arrow_open = "▾" } },
        },
      },
      update_focused_file = { enable = true },
    },
  },

  -- Edit a directory as a buffer: - opens the current file's directory
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = { view_options = { show_hidden = true } },
    keys = { { "-", "<cmd>Oil<CR>", desc = "Open parent directory" } },
  },

  -- ctrlp.vim and ag.vim
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      {
        "<C-p>",
        -- Enter opens in a new tab like the old ctrlp setup; ctrl-e opens here
        function()
          local fzf = require("fzf-lua")
          fzf.files({ actions = { ["enter"] = fzf.actions.file_tabedit, ["ctrl-e"] = fzf.actions.file_edit } })
        end,
        desc = "Find files",
      },
      { "<leader>/", "<cmd>FzfLua live_grep<CR>", desc = "Grep project" },
      { "<leader>*", "<cmd>FzfLua grep_cword<CR>", desc = "Grep word under cursor" },
      { "<leader>b", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
      { "<leader>r", "<cmd>FzfLua oldfiles<CR>", desc = "Recent files" },
      { "<leader>sh", "<cmd>FzfLua helptags<CR>", desc = "Search help" },
      { "<leader>sd", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "Diagnostics" },
      { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Symbols" },
    },
    opts = {},
  },

  -- Every per-language syntax plugin (javascript, jsx, css3, html5, less,
  -- markdown, ruby, ...) is replaced by Tree-sitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "bash", "css", "diff", "dockerfile", "git_config", "gitcommit", "html",
        "javascript", "jsdoc", "json", "lua", "markdown", "markdown_inline",
        "nginx", "python", "regex", "ruby", "scss", "sql", "toml", "tsx",
        "typescript", "vim", "vimdoc", "yaml",
      })
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          if pcall(vim.treesitter.start) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  -- ale and the omnifunc completers: language servers via Mason.
  -- Add more servers to ensure_installed (:Mason lists what's available).
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      vim.lsp.config("lua_ls", {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "eslint", "jsonls", "bashls", "cssls", "html" },
      })
    end,
  },

  -- VimCompletesMe + UltiSnips: Tab cycles the menu and jumps through
  -- snippet fields, Enter accepts. Own snippets live in snippets/*.json.
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" }, -- replaces honza/vim-snippets
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        documentation = { auto_show = true },
      },
      signature = { enabled = true },
      sources = {
        providers = {
          snippets = {
            opts = {
              extended_filetypes = {
                typescript = { "javascript" },
                javascriptreact = { "javascript" },
                typescriptreact = { "javascript" },
              },
            },
          },
        },
      },
    },
  },

  -- csscomb and friends: format with the project's formatter
  {
    "stevearc/conform.nvim",
    keys = {
      { "<leader>f", function() require("conform").format({ lsp_format = "fallback" }) end, desc = "Format" },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        lua = { "stylua" },
      },
    },
  },
}
