vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("^1"),
  },
  {
    src = "https://github.com/rafamadriz/friendly-snippets",
  },
})

-- Lazy load on first insert mode entry
-- local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })
-- local module = require("")

-- vim.api.nvim_create_autocmd("InsertEnter", {
-- pattern = "*",
-- group = group,
-- once = true,
-- callback = function()
require("blink.cmp").setup({
  keymap = {
    preset = "none",
    ["<C-space>"] = {
      "show",
      "show_documentation",
      "hide_documentation",
    },

    ["<C-e>"] = {
      "hide",
    },

    ["<CR>"] = {
      "accept",
      "fallback",
    },

    ["<Esc>"] = {
      "cancel",
      "fallback",
    },

    ["<C-j>"] = {
      "select_next",
      "fallback",
    },

    ["<C-k>"] = {
      "select_prev",
      "fallback",
    },

    ["<C-d>"] = {
      "scroll_documentation_down",
      "fallback",
    },

    ["<C-u>"] = {
      "scroll_documentation_up",
      "fallback",
    },
  },
  appearance = {
    nerd_font_variant = "mono",
    use_nvim_cmp_as_default = true,
  },
  completion = {
    documentation = { auto_show = false },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
-- end,
-- })
