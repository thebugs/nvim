return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      vim.lsp.enable({ "lua_ls", "ruby_lsp", "nil_ls" })

      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities()
      )

      vim.lsp.config("*", {
        capabilities = capabilities
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            }
          }
        }
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format()
        -- convert existing tabs → spaces (uses expandtab + tabstop)
        vim.cmd("retab")
        -- strip trailing whitespace, preserving cursor position
        local view = vim.fn.winsaveview()
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.fn.winrestview(view)
        -- ensure exactly one trailing newline: drop trailing blank lines
        -- (Neovim writes the final \n automatically via fixendofline)
        local n = vim.api.nvim_buf_line_count(0)
        while n > 1 and vim.api.nvim_buf_get_lines(0, n - 1, n, false)[1] == "" do
          vim.api.nvim_buf_set_lines(0, n - 1, n, false, {})
          n = n - 1
        end
      end, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    end,
  },
}
