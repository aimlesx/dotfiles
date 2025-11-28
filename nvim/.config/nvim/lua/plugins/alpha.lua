return {
  {
    "Shatur/neovim-session-manager",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "goolord/alpha-nvim",
    dependencies = {
      "echasnovski/mini.icons",
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[⠀⠀⠀⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡀]],
        [[⠀⠀⢰⡿⠙⠳⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡾⠛⢹⡇]],
        [[⠀⠀⢸⡇⠀⠀⠀⠙⠿⣦⣀⣀⣤⣤⣤⣄⣀⣠⡾⠛⠁⠀⠀⠀⢸⡇]],
        [[⠀⠀⢸⣷⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀ ⠀⢸⡇]],
        [[⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡇]],
        [[⠀⠀⢠⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇]],
        [[⠀⣤⣾⣇⡀⢸⡇⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⢰⡗⠀ ⢀⣠⣿⣤]],
        [[⠀⢀⣿⣈⡁⠈⢷⣤⣼⣿⠠⣄⠀⢀⠀⢀⡄⠘⢷⣤⣼⡇⠀⠀⠀⣩⣿⣂]],
        [[⠀⠈⢻⡇⠀⠀⠀⠀⠀⠀⠀⢹⣶⠟⢷⡾⠁⠀⠀⠀⠀⠀⠀⠀ ⢠⡿⠉]],
        [[⠀⠀⠀⢻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⢠⡾⠃]],
        [[⠀⠀⠀⠀⠙⢷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡶⠟]],
        [[⠀⠀⠀⠀⠀⠀⠈⠙⠛⠶⠶⣶⣤⣤⣤⣶⡶⠶⠟⠛⠉]],
      }
      alpha.setup(dashboard.opts)
    end,
  },
}
