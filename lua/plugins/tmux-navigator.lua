-- Seamless navigation between nvim splits and tmux panes with Alt+hjkl.
-- Pairs with the M-h/j/k/l bindings in tmux.nix (home-manager). Default
-- mappings are Ctrl; disabled here and remapped to Alt to match tmux
-- (and to avoid clobbering harpoon's <C-h>).
return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      { "<M-h>", "<cmd>TmuxNavigateLeft<cr>",  desc = "Navigate left (tmux)" },
      { "<M-j>", "<cmd>TmuxNavigateDown<cr>",  desc = "Navigate down (tmux)" },
      { "<M-k>", "<cmd>TmuxNavigateUp<cr>",    desc = "Navigate up (tmux)" },
      { "<M-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate right (tmux)" },
    },
  },
}
