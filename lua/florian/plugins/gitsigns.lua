return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    require('gitsigns').setup()
  end,
  event = { "BufEnter" },
  keys = {
    {"<leader>gs", function()
      require("gitsigns").stage_hunk()
    end},
    {"<leader>gu", function()
      require("gitsigns").undo_stage_hunk()
    end},
    {"<leader>gr", function()
      require("gitsigns").reset_hunk()
    end},
    {"<leader>gp", function()
      require("gitsigns").preview_hunk()
    end},
  },
}
