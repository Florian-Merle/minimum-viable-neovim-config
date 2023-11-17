local function compare()
  vim.ui.input({ prompt = 'Compare with (origin/master): ' }, function(input)
    local branch = input or "origin/master"
    vim.cmd("Gvsplit " .. branch .. ":%")
  end)
end

local function toggle_blame()
  local config = {
    excluded_buftypes = {
      "nofile",
    },
  }

  if vim.tbl_contains(config.excluded_buftypes, vim.bo.buftype) then
    return
  end

  if "fugitiveblame" == vim.bo.filetype then
    vim.cmd("q")
  else
    vim.cmd("Git blame --date=format:'%Y-%m-%d'")
  end
end

return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require('gitsigns').setup()

        vim.keymap.set("n", "<leader>gb", function ()
            toggle_blame()
        end)
        vim.keymap.set("n", "<leader>gc", function ()
            compare()
        end)
    end
}
