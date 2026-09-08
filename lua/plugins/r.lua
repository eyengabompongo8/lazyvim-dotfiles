return {
  -- Creates to keymaps to start and quit R
  {
    "R-nvim/R.nvim",
    keys = {
      { "<leader>rs", "<Cmd>lua require('r.run').start_R('R')<CR>", desc = "Start R (Console)" },
      { "<leader>rq", "<Cmd>lua require('r.run').quit_R('nosave')<CR>", desc = "Quit R" },
    },
  },
}
