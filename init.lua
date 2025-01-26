 require "options"

 local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then  -- for lazy package manager
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



local plugins = {
	{"folke/tokyonight.nvim", lazy = false, priority = 1000},
	 {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',  --for grepping and finding files
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
	{'nvim-treesitter/nvim-treesitter', build = ":TSUpdate",    auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
}, 

--[[{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    },
}]]--
}

local opts = {}



require("lazy").setup(plugins, opts)
local builtin = require("telescope.builtin") --load everything up in lua file from module telescope.builtin





 vim.keymap.set("n", "<C-p>", ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true}) --uses fuzzy find to find in our file


require("tokyonight").setup()   -- helps to execute the plugin
vim.cmd.colorscheme "tokyonight-night" 


