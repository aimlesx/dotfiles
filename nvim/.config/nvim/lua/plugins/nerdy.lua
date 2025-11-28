return {
  "2kabhishek/nerdy.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Nerdy",
  config = function()
    vim.keymap.set("n", "<leader>f", ":Nerdy<CR>", {})
  end,
}
