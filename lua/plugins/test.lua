return {
  {
    'vim-test/vim-test',
    dependencies = { 'preservim/vimux' },
    cmd = { 'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit' },
    keys = {
      { '<leader>tn', '<cmd>TestNearest<cr>', desc = 'Test nearest' },
      { '<leader>tf', '<cmd>TestFile<cr>',    desc = 'Test file' },
      { '<leader>ts', '<cmd>TestSuite<cr>',   desc = 'Test suite' },
      { '<leader>tl', '<cmd>TestLast<cr>',    desc = 'Test last' },
      { '<leader>tv', '<cmd>TestVisit<cr>',   desc = 'Test visit last file' },
    },
    init = function()
      vim.g['test#strategy'] = 'vimux'
    end,
  }
}
