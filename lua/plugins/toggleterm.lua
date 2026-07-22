vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })

require("toggleterm").setup({
  -- Size can be a number or function
  size = 20,
  open_mapping = [[<leader>tt]], -- Default mapping to open/close terminal
  hide_numbers = true,           -- Hide buffer numbers in terminal windows
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 3,       -- The degree by which to darken terminal background
  start_in_insert = true,
  insert_mappings = true,   -- Open mappings in insert mode
  terminal_mappings = true, -- Open mappings in terminal mode
  persist_size = true,
  direction = 'float',      -- 'vertical' | 'horizontal' | 'tab' | 'float'
  highlights = {
    Normal = {
      link = "Normal", --
    },
    NormalNC = {
      link = "NormalNC",
    },
  },
  float_opts = {
    border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved'
    width = 80,
    height = 20,
    winblend = 30,
  },
})

-- Keymap to toggle a specific terminal (e.g., terminal 1)
vim.keymap.set('n', '<leader>t1', '<cmd>1ToggleTermExec cmd="bash"<CR>', { desc = "Toggle Terminal 1" })
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "toggleterm://*",
  command = "setlocal mouose-=a",
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "toggleterm://*",
  command = "startinsert!",
})
