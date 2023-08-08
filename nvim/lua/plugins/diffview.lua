local diffview = require('diffview')
diffview.setup({
    view = {
        default = {
            layout = 'diff2_horizontal',
        },
        merge_tool = {
            disable_diagnostics = true,
        }
    }
})

vim.keymap.set('n', '<leader>dfo', '<cmd>DiffviewOpen<CR>')
vim.keymap.set('n', '<leader>dfc', '<cmd>DiffviewClose<CR>')
vim.keymap.set('n', '<leader>dfh', '<cmd>DiffviewFileHistory<CR>')

