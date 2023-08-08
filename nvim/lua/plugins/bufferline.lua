local bufferline = require('bufferline')
local commands = require('bufferline.commands')

bufferline.setup()

for i=1,9,1 do
    vim.keymap.set({'n', 'v', 'i'}, string.format('<A-%s>', i), string.format('<cmd>BufferLineGoToBuffer %s<CR>', i))
end

vim.keymap.set({'n', 'v', 'i'}, '<A-h>', '<cmd>BufferLineCyclePrev<CR>')
vim.keymap.set({'n', 'v', 'i'}, '<A-l>', '<cmd>BufferLineCycleNext<CR>')

vim.keymap.set({'n', 'v', 'i'}, '<A-H>', '<cmd>BufferLineMovePrev<CR>')
vim.keymap.set({'n', 'v', 'i'}, '<A-L>', '<cmd>BufferLineMoveNext<CR>')

vim.keymap.set({'n', 'v', 'i'}, '<A-J>', '<cmd>BufferLineCloseLeft<CR>')
vim.keymap.set({'n', 'v', 'i'}, '<A-K>', '<cmd>BufferLineCloseRight<CR>')
