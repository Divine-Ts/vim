local gitsigns = require('gitsigns')
gitsigns.setup()

vim.keymap.set('n', '<leader>hh', gitsigns.preview_hunk)
vim.keymap.set('n', '<leader>hk', gitsigns.prev_hunk)
vim.keymap.set('n', '<leader>hj', gitsigns.next_hunk)


vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk)
vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk)

vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer)
vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer)

