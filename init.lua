-- Install lazy.nvim, the nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Map the leader keys
vim.g.mapleader = " ";
vim.g.maplocalleader = ","

require("lazy").setup("plugins");;

-- Import the options file
require("options")

-- Import custom keymaps
require("keymaps")
