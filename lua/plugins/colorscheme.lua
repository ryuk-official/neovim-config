
-- colorschemes

vim.pack.add({
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/folke/tokyonight.nvim"
})

-- transparency config

require('kanagawa').setup({
  ...,
  transparent = true,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  },
})
vim.cmd('colorscheme kanagawa')


