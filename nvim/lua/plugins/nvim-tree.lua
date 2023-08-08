local function on_attach(bufnr)
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    local api = require("nvim-tree.api")

    vim.keymap.set('n', 'h',  api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'l',  api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', '<CR>',  api.node.open.edit, opts('Open'))

    vim.keymap.set('n', 'L',  api.tree.expand_all, opts('Expand All'))
    vim.keymap.set('n', 'H',  api.tree.collapse_all, opts('Collapse All'))
    vim.keymap.set('n', 'R',  api.tree.reload, opts('Refresh'))
    vim.keymap.set('n', 'i',  api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
    vim.keymap.set('n', 'f',  api.live_filter.start, opts('Filter'))
    vim.keymap.set('n', 'F',  api.live_filter.clear, opts('Clean Filter'))
    vim.keymap.set('n', 's',  api.tree.search_node, opts('Search'))

    vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
    vim.keymap.set('n', 'yy', api.fs.copy.node, opts('Copy'))
    vim.keymap.set('n', 'dd', api.fs.cut, opts('Cut'))
    vim.keymap.set('n', 'pp', api.fs.paste, opts('Paste'))
    vim.keymap.set('n', 'de', api.fs.remove, opts('Delete'))
    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))

    vim.keymap.set('n', 'yp', api.fs.copy.absolute_path, opts('Copy Absolute path'))
    vim.keymap.set('n', 'yr', api.fs.copy.relative_path, opts('Copy Relative path'))
    vim.keymap.set('n', 'yn', api.fs.copy.filename, opts('Copy filename'))
end

require("nvim-tree").setup({
    view = {
        adaptive_size = true,
        width = {
            max = 50,
        },
    },
    update_focused_file = {
        enable = true,
    },
    live_filter = {
        always_show_folders = false,
    },
    on_attach = on_attach,
})
vim.keymap.set({ 'n', 'v', 'i' }, '<F2>', '<cmd>NvimTreeToggle<CR>')

