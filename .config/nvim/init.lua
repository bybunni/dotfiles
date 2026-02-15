-- Leader key
vim.g.mapleader = ","

-- Mouse off
vim.opt.mouse = ""

-- Colors
vim.opt.termguicolors = true

-- Enable language servers (nvim 0.11+)
vim.lsp.enable('pyright')  -- Python

-- LSP (requires a language server to be enabled)
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { silent = true })
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "<leader>s", ":vsplit | lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.keymap.set("n", "<leader>a", vim.lsp.buf.signature_help, { silent = true })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, { silent = true })

-- Navigation: next/prev method
vim.keymap.set("n", "<leader>m", "]m", { silent = true })
vim.keymap.set("n", "<leader>n", "[m", { silent = true })
-- Jump list
vim.keymap.set("n", "<leader>j", ":jumps<CR>", { silent = true })
-- Close buffer
vim.keymap.set("n", "<leader>c", ":bd<CR>", { silent = true })
-- Run python file in terminal
vim.keymap.set("n", "<leader>y", ":split | terminal uv run python %<CR>", { silent = true })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("fzf-lua").setup()
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = 'markdown',
    keys = {
        { '<leader>md', '<cmd>RenderMarkdown toggle<cr>', desc = 'Toggle Markdown Render' },
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
})

-- fzf-lua
vim.keymap.set("n", "<leader>f", ":FzfLua live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>b", ":FzfLua buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>p", ":FzfLua commands<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":FzfLua lsp_workspace_symbols<CR>", { silent = true })

