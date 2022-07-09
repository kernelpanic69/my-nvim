return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("neovim/nvim-lspconfig")
	use("sainnhe/everforest")
    use { "ellisonleao/gruvbox.nvim" }
    use {'mhartington/oceanic-next'}
    use 'Mofiqul/vscode.nvim'
	use("marko-cerovac/material.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
			})
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function ()
            require('lualine').setup{}
        end
	})

    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("windwp/nvim-ts-autotag")

	use({ "neoclide/coc.nvim", branch = "release" })

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use("kyazdani42/nvim-web-devicons")

	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			require("nvim-tree").setup({
				hijack_cursor = true,
				open_on_tab = true,
                reload_on_bufenter = true,
				view = {
					centralize_selection = true,
				},
				renderer = {
					highlight_opened_files = "all",
				},
			})
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})

	use({
		"sudormrfbin/cheatsheet.nvim",

		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})

	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("mustache/vim-mustache-handlebars")

	use({
		"tanvirtin/vgit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("vgit").setup()
		end,
	})

	use({
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({
				overrides = {
					complex = {
						[".*templates/.*"] = "html.handlebars",
					},
				},
			})
		end,
	})

	use("oberblastmeister/termwrapper.nvim")

	require("termwrapper").setup({
		-- these are all of the defaults
		open_autoinsert = true, -- autoinsert when opening
		toggle_autoinsert = true, -- autoinsert when toggling
		autoclose = true, -- autoclose, (no [Process exited 0])
		winenter_autoinsert = false, -- autoinsert when entering the window
		default_window_command = "belowright 13split", -- the default window command to run when none is specified,
		-- opens a window in the bottom
		open_new_toggle = true, -- open a new terminal if the toggle target does not exist
		log = 1, -- 1 = warning, 2 = info, 3 = debug
	})

    use 'diepm/vim-rest-console'

    -- Lua
    use({
        "olimorris/persisted.nvim",
        --module = "persisted", -- For lazy loading
        config = function()
            require("persisted").setup()
            require("telescope").load_extension("persisted") -- To load the telescope extension
        end,
    })
end)
