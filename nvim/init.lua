vim.o.number = true
vim.o.guicursor = "n-v-c-sm:ver25,i-ci-ve:ver25,r-cr-o:hor20"
vim.o.fileencoding = "utf8"
vim.o.shiftwidth = 2
vim.o.relativenumber = true
vim.o.smartindent = true

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then 
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<F5>", ":w | :!python graph1.py<CR><CR>")

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
  if packer_bootstrap then
    require('packer').sync()
  end
end)


