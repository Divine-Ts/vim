local opts = {
    noremap = true,
}

-- window
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<leader>sp', '<C-w>s', opts)
vim.keymap.set('n', '<leader>vs', '<C-w>v', opts)

-- move
vim.keymap.set('i', '<C-h>', '<left>', opts)
vim.keymap.set('i', '<C-j>', '<down>', opts)
vim.keymap.set('i', '<C-k>', '<up>', opts)
vim.keymap.set('i', '<C-l>', '<right>', opts)

vim.keymap.set({'n', 'v'}, 'H', '^', opts)
vim.keymap.set({'n', 'v'}, 'L', '$', opts)
vim.keymap.set({'n', 'v'}, 'J', '10j', opts)
vim.keymap.set({'n', 'v'}, 'K', '10k', opts)
vim.keymap.set({'n', 'v'}, 'W', 'b', opts)
vim.keymap.set({'n', 'v'}, 'E', 'ge', opts)

-- copy, cut, delete
vim.keymap.set('v', '<leader>x', '"+x', opts)
vim.keymap.set('v', '<leader>d', '"+d', opts)
vim.keymap.set('n', '<leader>dd', '"+dd', opts)
vim.keymap.set('n', '<leader>dw', '"+dw', opts)
vim.keymap.set('v', '<leader>y', '"+y', opts)
vim.keymap.set('n', '<leader>yy', '"+yy', opts)
vim.keymap.set('n', '<leader>yw', 'viw"+y', opts)
vim.keymap.set('n', '<leader>p', '"+p', opts)
vim.keymap.set('n', '<leader>P', '"+P', opts)

vim.keymap.set('n', 'dl', 'd$', opts)
vim.keymap.set('n', 'dh', 'd0', opts)

-- exit
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts)
vim.keymap.set('n', '<leader>qq', '<cmd>wqa!<CR>', opts)
vim.keymap.set('n', '<leader>qa', '<cmd>qa!<CR>', opts)
vim.keymap.set('n', '<leader>qw', '<cmd>q!<CR>', opts)

-- misc
vim.keymap.set({'n', 'v', 'i'}, '<up>', '<nop>', opts)
vim.keymap.set({'n', 'v', 'i'}, '<down>', '<nop>', opts)
vim.keymap.set({'n', 'v', 'i'}, '<left>', '<nop>', opts)
vim.keymap.set({'n', 'v', 'i'}, '<right>', '<nop>', opts)

