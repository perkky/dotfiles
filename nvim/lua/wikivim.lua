vim.g.wiki_root = '~/git/vimwiki'
vim.g.wiki_filetypes = {'md'}
vim.g.wiki_link_target_type = 'md'
vim.g.wiki_link_extension = '.md'

vim.g.wiki_export = {
    args = '',
    from_format = 'markdown',
    ext = 'html',
    link_ext_replace = false,
    view = false,
    output = 'export',
}
