vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
})

-- Lazy load on first insert mode entry (may not necessary)
local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = group,
	once = true,
	callback = function()
		require("blink.cmp").setup({
			keymap = { 
        preset = "none",

        -- Select items using vim direction keys
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },

        -- confirm completion 
        ['<CR>'] = { 'accept', 'fallback' },

        -- documentation window scrolling (Read hover docs)
        ['C-b'] = { 'scroll_documentation_up', 'fallback' },
        ['C-f'] = { 'scroll_documentation_down', 'fallback' },

        -- explicitly trigger / hide popup
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' }, 
        ['<C-e>'] = { 'cancel', 'fallback' },

        -- snippet navigation (super-tab)
        ['<Tab>' ] = { 'snippet_forward', 'fallback'},
        ['<S-Tab>' ] = { 'snippet_backward', 'fallback'},
      },
			appearance = {
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
      },
      {
				documentation = { auto_show = false },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		})
	end,
})


