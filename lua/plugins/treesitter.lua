return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
--    config = function()
--      local config = require("nvim-treesitter")
--      config.install { 'lua', 'ruby', 'python', 'nix' }
--
--      vim.api.nvim_create_autocmd('FileType', {
--	pattern = { 'filetype' },
--	callback = function()
--	  vim.treesitter,start,
--	 -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()",
--	end
--      })
--    end
  }
}
