return {
  {
    "stevearc/aerial.nvim",
    cmd = {
      "AerialToggle",
      "AerialNavToggle",
      "AerialNext",
      "AerialPrev",
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>oo", "<cmd>AerialToggle!<cr>", desc = "Toggle symbol outline" },
      { "<leader>on", "<cmd>AerialNavToggle<cr>", desc = "Toggle symbol navigator" },
      { "]s", "<cmd>AerialNext<cr>", desc = "Next symbol" },
      { "[s", "<cmd>AerialPrev<cr>", desc = "Previous symbol" },
    },
    opts = {
      backends = { "lsp", "treesitter", "markdown", "man" },
      close_on_select = true,
      layout = {
        default_direction = "prefer_right",
        min_width = 30,
      },
      show_guides = true,
    },
  },
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerRun",
      "OverseerToggle",
      "OverseerTaskAction",
      "OverseerQuickAction",
    },
    keys = {
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run project task" },
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle task list" },
      { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
      { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick task action" },
    },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 15,
        max_height = 25,
      },
    },
  },
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      { "<leader>Rs", desc = "Send HTTP request" },
      { "<leader>Ra", desc = "Send all HTTP requests" },
      { "<leader>Rr", desc = "Replay last HTTP request" },
      { "<leader>Rb", desc = "Open HTTP scratchpad" },
    },
    opts = {
      global_keymaps = true,
      ui = {
        default_view = "body",
        display_mode = "split",
        split_direction = "right",
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewToggleFiles",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Open Git diff view" },
      { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Close Git diff view" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Current file Git history" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repository Git history" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>cj", function() require("treesj").toggle() end, desc = "Split or join code block" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
      max_join_length = 240,
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    ft = "python",
    cmd = "VenvSelect",
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Python virtual environment" },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      options = {
        picker = "telescope",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "mdx" },
    cmd = "RenderMarkdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>mp", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown preview" },
    },
    opts = {
      completions = {
        lsp = {
          enabled = true,
        },
      },
      heading = {
        sign = true,
      },
    },
  },
}
