return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- Single source of truth. A string means the parser name equals the
      -- filetype; a table sets them separately (e.g. ERB's parser is
      -- embedded_template but its filetype is eruby). embedded_template
      -- injects html + ruby, so those parsers must be installed too.
      local languages = {
        'lua', 'ruby', 'python', 'nix', 'html',
        'css', 'javascript', 'json', 'yaml', 'sql',
        { parser = 'embedded_template', ft = 'eruby' },
      }

      local parsers, filetypes = {}, {}
      for _, lang in ipairs(languages) do
        if type(lang) == 'string' then
          parsers[#parsers + 1] = lang
          filetypes[#filetypes + 1] = lang
        else
          parsers[#parsers + 1] = lang.parser
          filetypes[#filetypes + 1] = lang.ft
        end
      end

      require('nvim-treesitter').install(parsers)

      -- The main branch does not enable highlighting automatically; opt in
      -- per buffer via a FileType autocmd.
      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  }
}
