return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- Install the parsers for the languages we use.
      require('nvim-treesitter').install({ 'lua', 'ruby', 'python', 'nix' })

      -- The main branch does not enable highlighting automatically; opt in
      -- per buffer via a FileType autocmd.
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'lua', 'ruby', 'python', 'nix' },
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
