return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- Install the parsers for the languages we use. embedded_template is
      -- the ERB parser; it injects html + ruby, so both must be installed too.
      require('nvim-treesitter').install({
        'lua', 'ruby', 'python', 'nix', 'html', 'embedded_template',
        'css', 'javascript', 'json', 'yaml',
      })

      -- The main branch does not enable highlighting automatically; opt in
      -- per buffer via a FileType autocmd. (ERB files have filetype 'eruby'.)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'lua', 'ruby', 'python', 'nix', 'html', 'eruby', 'css', 'javascript', 'json', 'yaml' },
        callback = function()
          -- tree-sitter syntax highlighting
          pcall(vim.treesitter.start)
          -- tree-sitter based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  }
}
