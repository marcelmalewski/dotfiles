vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

require("lazy").setup({
  spec = { { import = "plugins" } },
  checker = { enabled = true },
  rocks = { enabled = false },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[C] [F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[C] [F]ind by [G]rep' })

local config = require("nvim-treesitter.configs")
config.setup({
  -- snap neovim come with a lot of parsers but treesitter will only respect this parsers
  ensure_installed = 
    { "lua", "javascript", "markdown" },
  auto_install = false,
  highlight = { enable = true , additional_vim_regex_highlighting = false},
  indent = { enable = true }
})


vim.keymap.set('i', 'jk', '<ESC>', { desc= 'Exit insert mode' })
vim.keymap.set('n', '\\', ':Neotree toggle left<CR>', { desc= '[C] NeoTree reveal' })
