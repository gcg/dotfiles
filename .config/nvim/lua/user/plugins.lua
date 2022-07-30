local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)

	-- Update packer by packer. 
	use("wbthomason/packer.nvim") 

	-- useful lua functions for telescope and other plugins 
	use("nvim-lua/plenary.nvim") 

	-- for auto closing quotes and bracket pairs. 
	use({ 
		"windwp/nvim-autopairs", 
		config = function () 
			require("nvim-autopairs").setup {} 
		end
	})

	-- for commenting and uncommenting blocks 
	use({
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup {}
    end
	})

	-- Fancy icons for filebrowser.
	use({
		"kyazdani42/nvim-web-devicons", 
		config = function()
			require('nvim-web-devicons').setup {}
		end
	})

	-- File browser 
	use("kyazdani42/nvim-tree.lua")


	-- Theme
	use("tanvirtin/monokai.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
