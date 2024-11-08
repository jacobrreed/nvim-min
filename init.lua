-- [[ Globals ]]
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- #######################################################################
-- [[ Setting options ]]
-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
vim.opt.relativenumber = false
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.autowrite = true -- Enable auto write
vim.opt.autoread = true -- Enable auto read
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 1 -- Hide * markup for bold and italic
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.laststatus = 3 -- global statusline
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.mouse = "nv"
vim.opt.mousemoveevent = true
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitkeep = "screen"
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- Save swap file and trigger CursorHold
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.wrap = false -- Disable line wrap
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.opt.autochdir = false
if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.smoothscroll = true
end

-- For speed up, using nvim-ts-context-commentstring
vim.g.skip_ts_context_commentstring_module = true

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"

vim.g.markdown_recommended_style = 0

vim.g.qf_is_open = false
-- #######################################################################

-- [[ Basic Keymaps ]]
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w!<cr><esc>", { desc = "Save file" })
-- SAVE ALL
vim.keymap.set({ "i", "x", "n", "s" }, "<CS-s>", "<cmd>wa<cr><esc>", { desc = "Save all" })

-- Save all buffers and close
vim.keymap.set({ "i", "n" }, "<C-q>", "<cmd>silent! xa<cr>", { desc = "Save all and quit" })
vim.keymap.set({ "i", "n" }, "<C-x>", "<cmd>Bdelete<cr>", { desc = "Close current buffer" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- -- Rebind jj  and kk to escape
-- Superceded by betterescape
vim.keymap.set({ "i" }, "jj", "<Esc>")
vim.keymap.set({ "i" }, "kk", "<Esc>")

-- remap Insert to Esc, aka my CAPS lock key which is always bound to Insert on my desktop
vim.keymap.set({ "i", "n", "v", "x", "o", "t", "s", "x", "c", "l" }, "<Insert>", "<Esc>")
vim.keymap.set({ "i", "n", "v", "x", "o", "t", "s", "x", "c", "l" }, "", "<Esc>")

-- Unbind F1 help
vim.keymap.set({ "i", "n", "v", "x", "o", "t", "s", "x", "c", "l" }, "<F1>", "<Nop>")
-- Unbind ctrl left click
vim.keymap.set({ "i", "n", "v", "x", "o", "t", "s", "x", "c", "l" }, "<C-LeftMouse>", "<Nop>")
-- Unbind tags
vim.keymap.set({ "n" }, "<C-t>", "<Nop>")

-- Remap D to blackhole delete
vim.keymap.set({ "n", "v" }, "D", '"_d')

-- Map to take current selection and search/replace it
table.unpack = table.unpack or unpack
local function get_visual()
  local _, ls, cs = table.unpack(vim.fn.getpos("v"))
  local _, le, ce = table.unpack(vim.fn.getpos("."))
  return vim.api.nvim_buf_get_text(0, ls - 1, cs - 1, le - 1, ce, {})
end
vim.keymap.set("v", "<C-r>", function()
  local pattern = table.concat(get_visual())
  pattern = vim.fn.substitute(vim.fn.escape(pattern, "^$.*\\/~[]"), "\n", "\\n", "g")
  vim.api.nvim_input("<Esc>:%s/" .. pattern .. "//g<Left><Left>")
end)

vim.keymap.set({ "n" }, "<Backspace>", "^", { desc = "Move to first non-blank character" })

-- Remap paste without losing text
vim.keymap.set("v", "p", '"_dP')

-- Kitty
if os.getenv("TERM") == "xterm-kitty" then
  vim.g.kitty_navigator_no_mappings = 1
  vim.g.tmux_navigator_no_mappings = 1

  vim.cmd([[
    noremap <silent> <c-h> :<C-U>KittyNavigateLeft<cr>
    noremap <silent> <c-l> :<C-U>KittyNavigateRight<cr>
    noremap <silent> <c-j> :<C-U>KittyNavigateDown<cr>
    noremap <silent> <c-k> :<C-U>KittyNavigateUp<cr>
  ]])
end
-- #######################################################################

-- [[ Basic Autocommands ]]
local function augroup(name)
  return vim.api.nvim_create_augroup("autocmd_" .. name, { clear = true })
end
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].autocmd_last_loc then
      return
    end
    vim.b[buf].autocmd_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "lazy",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
vim.api.nvim_create_user_command("MasonUpgrade", function()
  local registry = require("mason-registry")
  registry.refresh()
  registry.update()
  local packages = registry.get_all_packages()
  for _, pkg in ipairs(packages) do
    if pkg:is_installed() then
      pkg:install()
    end
  end
  vim.cmd("doautocmd User MasonUpgradeComplete")
end, { force = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("organise_imports"),
  pattern = { "*.ts", ".tsx" },
  callback = function()
    ---@diagnostic disable-next-line: assign-type-mismatch
    vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" }, diagnostics = {} } })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("disable_nvim_cmp"),
  pattern = { "oil" },
  callback = function()
    local cmp = require("cmp")
    cmp.setup.buffer({
      sources = nil,
    })
  end,
})

-- #######################################################################

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      spec = {
        { "<leader>c", group = "Code", mode = { "n", "x" } },
        { "<leader>d", group = "Document" },
        { "<leader>s", group = "Search" },
        { "<leader>w", group = "Window" },
        { "<leader>t", group = "Toggle" },
        { "<leader>h", group = "Git Hunk", mode = { "n", "v" } },
        { "<leader>u", group = "UI", mode = { "n" } },
        { "<leader>Q", group = "Session", mode = { "n" } },
        { "<leader>g", group = "Git", mode = { "n" } },
        { "<leader>f", group = "Find", mode = { "n" } },
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({ "default-title" })
    end,
    keys = {
      {
        "<leader><leader>",
        function()
          require("fzf-lua").files()
        end,
        mode = "n",
        desc = "Find files",
      },
      {
        "<leader>/",
        function()
          require("fzf-lua").live_grep_resume()
        end,
        mode = "n",
        desc = "Live grep",
      },
      {
        "<leader>/",
        function()
          require("fzf-lua").grep_visual()
        end,
        mode = "v",
        desc = "Live grep (Visual)",
      },
      {
        "<leader>:",
        function()
          require("fzf-lua").command_history()
        end,
        mode = "n",
        desc = "Command history",
      },
      {
        "<leader>fs",
        function()
          require("fzf-lua").search_history()
        end,
        mode = "n",
        desc = "Search history",
      },
    },
  },
  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
  {
    -- Main LSP Configuration
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      "hrsh7th/cmp-nvim-lsp",
      "ibhagwan/fzf-lua",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map("gD", ":lua require('fzf-lua').lsp_definitions()<cr>", "Goto Definition")

          -- Find references for the word under your cursor.
          map("gr", ":lua require('fzf-lua').lsp_references()<cr>", "Goto References")

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map("gI", ":lua require('fzf-lua').lsp_implementations()<cr>", "Goto Implementation")

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map("<leader>cD", ":lua require('fzf-lua').lsp_type_definitions()<cr>", "Type Definition")

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map("<leader>cd", ":lua require('fzf-lua').lsp_document_symbols()<cr>", "Document Symbols")

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map("<leader>cs", ":lua require('fzf-lua').diagnostics_workspace()<cr>", "Workspace Symbols")

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map("<leader>cr", vim.lsp.buf.rename, "Rename")

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          -- map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "Toggle Inlay Hints")
          end
        end,
      })

      -- Change diagnostic symbols in the sign column (gutter)
      local signs = { Error = "", Warn = "", Hint = "", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- Enable the following language servers
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        rust_analyzer = {},
        vtsls = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = { disable = { "missing-fields" } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      require("mason").setup()

      -- You can add other tools here that you want Mason to install
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua",
        "prettierd",
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },

  { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = "never"
        else
          lsp_format_opt = "fallback"
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  { -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        "L3MON4D3/LuaSnip",
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
        },
      },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-buffer",
      "lukas-reineke/cmp-rg",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<tab>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<S-CR>"] = cmp.mapping.abort(),
          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        }),
        sources = {
          {
            name = "lazydev",
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = "nvim_lsp" },
          { name = "crates" },
          { name = "copilot" },
          { name = "luasnip" },
          { name = "rg", keyword_length = 3 },
          { name = "buffer" },
          { name = "path" },
          { name = "luasnip" },
          { name = "path" },
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            max_width = 100,
            symbol_map = {
              Copilot = " ",
              crates = " ",
            },
          }),
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    vscode = false,
    event = "VimEnter",
    opts = {
      filetypes = {
        markdown = false,
        help = false,
      },
    },
  },
  {
    "AndreM222/copilot-lualine",
    vscode = false,
  },
  {
    "nvimdev/dashboard-nvim",
    vscode = false,
    event = "VimEnter",
    opts = function()
      local logo = [[
⠀⠀⠀⠀⠀⠀⠀⣠⡤⠶⡄⠀⠀⠀⠀⠀⠀⠀⢠⠶⣦⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣿⡟⠀⠈⣀⣾⣝⣯⣿⣛⣷⣦⡀⠀⠈⢿⣿⣦⡀⠀⠀⠀⠀
⠀⠀⠀⣴⣿⣿⣿⡇⠀⢼⣿⣽⣿⢻⣿⣻⣿⣟⣷⡄⠀⢸⣿⣿⣾⣄⠀⠀⠀
⠀⠀⣞⣿⣿⣿⣿⣷⣤⣸⣟⣿⣿⣻⣯⣿⣿⣿⣿⣀⣴⣿⣿⣿⣿⣯⣆⠀⠀
⠀⡼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣜⡆⠀
⢠⣟⣯⣿⣿⣿⣷⢿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣟⠿⣿⣿⣿⣿⡷⣾⠀
⢸⣯⣿⣿⡏⠙⡇⣾⣟⣿⡿⢿⣿⣿⣿⣿⣿⢿⣟⡿⣿⠀⡟⠉⢹⣿⣿⢿⡄
⢸⣯⡿⢿⠀⠀⠱⢈⣿⢿⣿⡿⣏⣿⣿⣿⣿⣿⣿⣿⣿⣀⠃⠀⢸⡿⣿⣿⡇
⢸⣿⣇⠈⢃⣴⠟⠛⢉⣸⣇⣹⣿⣿⠚⡿⣿⣉⣿⠃⠈⠙⢻⡄⠎⠀⣿⡷⠃
⠈⡇⣿⠀⠀⠻⣤⠠⣿⠉⢻⡟⢷⣝⣷⠉⣿⢿⡻⣃⢀⢤⢀⡏⠀⢠⡏⡼⠀
⠀⠘⠘⡅⠀⣔⠚⢀⣉⣻⡾⢡⡾⣻⣧⡾⢃⣈⣳⢧⡘⠤⠞⠁⠀⡼⠁⠀⠀
⠀⠀⠀⠸⡀⠀⢠⡎⣝⠉⢰⠾⠿⢯⡘⢧⡧⠄⠀⡄⢻⠀⠀⠀⢰⠁⠀⠀⠀
⠀⠀⠀⠀⠁⠀⠈⢧⣈⠀⠘⢦⠀⣀⠇⣼⠃⠰⣄⣡⠞⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢤⠼⠁⠀⠀⠳⣤⡼⠀⠀⠀⠀⠀⠀
    ]]
      logo = string.rep("\n", 2) .. logo

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { action = "FzfLua files", desc = " Find file", icon = " ", key = "f" },
            { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
            { action = "FzfLua oldfiles", desc = " Recent files", icon = " ", key = "r" },
            { action = "FzfLua live_grep", desc = " Find text", icon = " ", key = "/" },
            {
              action = function()
                require("persistence").load({ last = true })
              end,
              desc = " Restore Session",
              icon = " ",
              key = "s",
            },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "󰤇  Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
  {
    "sindrets/diffview.nvim",
    vscode = false,
    setup = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        use_icons = true,
        view = {
          merge_tool = {
            layout = "diff3_horizontal",
            winbar_info = true,
            disable_diagnostics = true,
          },
        },
      })
    end,
    keys = {
      {
        "<leader>gd",
        function()
          local lib = require("diffview.lib")
          local view = lib.get_current_view()
          if view then
            vim.cmd.DiffviewClose()
          else
            vim.cmd.DiffviewOpen()
          end
        end,
        desc = "Diffview",
      },
    },
  },
  {
    dir = "~/dev/eldritch-workspace/eldritch.nvim",
    vscode = false,
    -- "eldritch-theme/eldritch.nvim",
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      local eldritch = require("eldritch")
      eldritch.setup(opts)
      vim.cmd([[colorscheme eldritch]])
    end,
  },
  { "knubie/vim-kitty-navigator", vscode = false, build = {
    "cp ./*.py ~/.config/kitty/",
  } },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      search = {
        multi_window = false,
      },
      modes = {
        search = {
          enabled = false,
        },
        char = {
          jump_labels = false,
        },
      },
      label = {
        rainbow = {
          enabled = true,
          shades = 9,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        char = "│",
        highlight = "NonText",
        show_start = true,
        show_end = true,
        injected_languages = true,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    -- config = function(_, opts)
    --   require("ibl").setup(opts)
    --   vim.cmd.highlight("clear @ibl.scope.underline.1")
    --   vim.cmd.highlight("link @ibl.scope.underline.1 IndentBlankLineScopeParent")
    -- end,
    main = "ibl",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = {
        bottom_search = true,
        inc_rename = true,
        lsp_doc_border = true,
        long_message_to_split = true,
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    vscode = false,
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    vscode = false,
    opts = function()
      local opts = {
        options = {
          theme = "eldritch",
          component_separators = "",
          section_separators = { left = "", right = "" },
          icons_enabled = true,
          globalstatus = true,
          refresh = { statusline = 1000, tabline = 1000 },
          disabled_filetypes = { statusline = { "dashboard" }, tabline = { "dashboard" } },
        },
        extensions = { "neo-tree", "lazy" },
        sections = {
          lualine_a = { { "mode", separator = { left = "", right = "" } } },
          lualine_b = { "branch" },
          lualine_c = {
            "filename",
            { "diff", symbols = { added = " ", modified = "󰣕 ", removed = " " } },
            "diagnostics",
          },
          lualine_x = {
            {
              "copilot",
              show_loading = true,
              show_colors = true,
              padding = { right = 1, left = 1 },
              symbols = {
                status = {
                  icons = {
                    enabled = " ",
                    sleep = " 󰒲",
                    disabled = " ",
                    warning = " ",
                    unknown = " ",
                  },
                  hl = {
                    sleep = "#04d1f9",
                  },
                },
              },
            },
          },
          lualine_y = {
            "filetype",
          },
          lualine_z = {
            {
              function()
                local lazyStatus = require("lazy.status")
                local has_updates = lazyStatus.has_updates
                local packages = require("lazy.status").updates
                if has_updates() then
                  return "󱧕 " .. packages
                else
                  return "󰏗 󰄵"
                end
              end,
            },
          },
        },
      }

      return opts
    end,
    dependencies = { "nvim-tree/nvim-web-devicons", "eldritch-theme/eldritch.nvim" },
  },
  {
    "folke/todo-comments.nvim",
    vscode = false,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true, -- show icons in the signs column
      merge_keywords = false, -- use only these
      keywords = {
        BUG = { icon = "", color = "error" },
        FIXME = { icon = "", color = "error" },
        HACK = { icon = "", color = "info" },
        NOTE = { icon = "❦", color = "info" },
        TODO = { icon = "★", color = "actionItem" },
        WARN = { icon = "󰀦", color = "warning" },
        WARNING = { icon = "󰀦", color = "warning" },
      },
      colors = {
        actionItem = { "ActionItem", "#f1fc79" },
        default = { "Identifier", "#37f499" },
        error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#f16c75" },
        info = { "LspDiagnosticsDefaultInformation", "#ebfafa" },
        warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#f7c67f" },
      },
      highlight = {
        keyword = "bg",
        pattern = [[.*<(KEYWORDS)\s*]],
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS)\b]],
      },
    },
    keys = {
      { "<leader>tt", "<cmd>TodoTelescope keywords=TODO<cr>", desc = "TODO list" },
    },
  },
  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - Visually select Around )paren
      --  - yinq - Yank Inside Next Quote
      --  - ci'  - Change Inside 'quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - Surround Add Inner Word )Paren
      -- - sd'   - Surround Delete 'quotes
      -- - sr)'  - Surround Replace ) '
      require("mini.surround").setup({
        mappings = {
          add = "gsa",
          delete = "gsd",
          find = "gsf",
          find_left = "gsF",
          highlight = "gsh",
          replace = "gsr",
          update_n_lines = "gsn",
        },
      })

      require("mini.pairs").setup({
        modes = { insert = true, command = false, terminal = false },
        markdown = false,
      })

      require("mini.animate").setup({})

      require("mini.comment").setup({
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          end,
        },
      })

      require("mini.hipatterns").setup({})

      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  {
    "rcarriga/nvim-notify",
    cond = not vim.g.vscode,
    opts = {
      render = "wrapped-compact",
      timeout = 3000,
      background_colour = "#FFFFFF",
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
  },
  {
    "folke/persistence.nvim",
    vscode = false,
    keys = {
      {
        "<leader>Qs",
        function()
          require("persistence").load()
        end,
        desc = "Restore Session",
      },
      {
        "<leader>Ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Restore Last Session",
      },
      {
        "<leader>Qd",
        function()
          require("persistence").stop()
        end,
        desc = "Don't Save Current Session",
      },
      { "<leader>q", false },
      { "<leader>qs", false },
      { "<leader>ql", false },
      { "<leader>qd", false },
    },
  },
  {
    "itchyny/vim-qfedit",
    vscode = false,
  },
  {
    "kevinhwang91/nvim-bqf",
    vscode = false,
    setup = function()
      vim.fn["fzf#install"]()
    end,
    opts = {
      preview = {
        winblend = 0,
      },
    },
    keys = {
      {
        "<leader>q",
        function()
          if vim.g.qf_is_open then
            vim.cmd("cclose")
            vim.g.qf_is_open = false
          else
            vim.cmd("copen")
            vim.g.qf_is_open = true
          end
        end,
        desc = "Quickfix Toggle",
      },
    },
  },
  {
    "2nthony/sortjson.nvim",
    vscode = false,
    cmd = {
      "SortJSONByAlphaNum",
      "SortJSONByAlphaNumReverse",
      "SortJSONByKeyLength",
      "SortJSONByKeyLengthReverse",
    },
    event = "Filetype json",
    config = true,
  },
  {
    "nvim-neotest/neotest",
    vscode = false,
    keys = {
      { "<leader>T", "", desc = "+test" },
      {
        "<leader>Tt",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run File",
      },
      {
        "<leader>TT",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run All Test Files",
      },
      {
        "<leader>Tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run Nearest",
      },
      {
        "<leader>Tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>Ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle Summary",
      },
      {
        "<leader>To",
        function()
          require("neotest").output.open({ enter = true, auto_close = true })
        end,
        desc = "Show Output",
      },
      {
        "<leader>TO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle Output Panel",
      },
      {
        "<leader>TS",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop",
      },
      {
        "<leader>Tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        desc = "Toggle Watch",
      },
      -- Disable lazyvim default maps
      { "<leader>t", "", false },
      {
        "<leader>tt",
        false,
      },
      {
        "<leader>tT",
        false,
      },
      {
        "<leader>tr",
        false,
      },
      {
        "<leader>tl",
        false,
      },
      {
        "<leader>ts",
        false,
      },
      {
        "<leader>to",
        false,
      },
      {
        "<leader>tO",
        false,
      },
      {
        "<leader>tS",
        false,
      },
      {
        "<leader>tw",
        false,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>Td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug Nearest",
      },
      { "<leader>td", false },
    },
  },
  {
    "levouh/tint.nvim",
    vscode = false,
    config = function()
      require("tint").setup({})
    end,
  },
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
        "typescript",
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
  {
    "tomasky/bookmarks.nvim",
    vscode = false,
    event = "VimEnter",
    config = function()
      local bookmarks = require("bookmarks")
      bookmarks.setup({
        keywords = {
          ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
          ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
          ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
          ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
        },
        on_attach = function(_) end,
      })
      local map = vim.keymap.set
      map("n", "mt", bookmarks.bookmark_toggle, { desc = "Bookmark Toggle" }) -- add or remove bookmark at current line
      map("n", "ma", bookmarks.bookmark_ann, { desc = "Bookmark Annotate" }) -- add or edit mark annotation at current line
      map("n", "mc", bookmarks.bookmark_clean, { desc = "Remove all bookmarks" }) -- clean all marks in local buffer
      map("n", "mn", bookmarks.bookmark_next, { desc = "Go to next bookmark" }) -- jump to next mark in local buffer
      map("n", "mN", bookmarks.bookmark_prev, { desc = "Go to previous bookmark" }) -- jump to previous mark in local buffer
      map("n", "ml", "<cmd>Telescope bookmarks list<cr>", { desc = "Bookmark List" }) -- show marked file list in quickfix window
    end,
  },
  {
    "stevearc/oil.nvim",
    vscode = false,
    opts = {
      columns = {
        "icon",
      },
      default_file_explorer = true,
      delete_to_trash = false,
      prompt_save_on_select_new_entry = false,
      skip_confirm_for_simple_edits = true,
      cleanup_delay_ms = 500,
      enabled = false,
      lsp_file_methods = {
        timeout_ms = 1000,
        autosave_changes = true,
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          local ignored = { ".git", ".hg", ".svn", ".DS_Store", "node_modules" }
          if vim.tbl_contains(ignored, name) then
            return true
          else
            return false
          end
        end,
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["q"] = "actions.close",
        ["<backspace>"] = "actions.parent",
        ["gv"] = "actions.select_vsplit",
        ["gh"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["gr"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["<C-o>"] = "actions.open_external",
        ["H"] = "actions.toggle_hidden",
        ["T"] = "actions.toggle_trash",
        ["<C-q>"] = "actions.send_to_qflist",
      },
      float = {
        win_options = {
          winblend = 0,
        },
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          require("oil").toggle_float()
        end,
        desc = "Toggle oil (file explorer)",
      },
      {
        "<leader>E",
        function()
          require("oil").toggle_float(vim.cmd("pwd"))
        end,
        desc = "Toggle oil (file explorer)",
      },
      {
        "<C-s>",
        function()
          require("oil").save()
        end,
        desc = "Save oil changes",
        ft = "oil",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "akinsho/bufferline.nvim",
    vscode = false,
    version = "*",
    priority = 900,
    event = { "VimEnter" },
    dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
    opts = {
      options = {
        themable = true,
        mode = "buffers",
        color_icons = true,
        separator_style = { " ", " " },
        show_tab_indicators = false,
        show_buffer_icons = true,
        max_name_length = 26,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        diagnostics_update_on_event = true, -- use nvim's diagnostic handler
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    keys = function()
      local wk = require("which-key")
      wk.add({ { "<leader>b", group = "Buffer" } })
      return {
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
        { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
        { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
        { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
        { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "<S-Right>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
        { "<S-Left>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
        { "[b", "<cmd>bprevious<cr>", desc = "Prev buffer" },
        { "]b", "<cmd>bnext<cr>", desc = "Next buffer" },
        { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Delete current buffer" },
      }
    end,
  },
}, {
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "eldritch" }, missing = true },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  change_detection = { notify = false, enabled = true },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
