return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup()
    vim.keymap.set("n", "<C-n>", ":Neotree action=focus source=filesystem toggle=true position=left<CR>", {})
    vim.keymap.set("n", "<leader>br", ":Neotree buffers reveal float<CR>", {})
  end,
}
