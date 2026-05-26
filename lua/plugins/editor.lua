return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
            },
          },
        },
      })
      pcall(telescope.load_extension, "fzf")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gowork",
        "graphql",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "regex",
        "rust",
        "scss",
        "sql",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "󰍵" },
        topdelete = { text = "󰍵" },
        changedelete = { text = "󱕖" },
        untracked = { text = "┆" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
        ignore_whitespace = true,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      preview_config = {
        border = "rounded",
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]h", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, "Next Git hunk")

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[h", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, "Previous Git hunk")

        map("n", "<leader>gp", gitsigns.preview_hunk, "Preview Git hunk")
        map("n", "<leader>gr", gitsigns.reset_hunk, "Reset Git hunk")
        map("v", "<leader>gr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset Git hunk")
        map("n", "<leader>gs", gitsigns.stage_hunk, "Stage Git hunk")
        map("v", "<leader>gs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage Git hunk")
        map("n", "<leader>gS", gitsigns.stage_buffer, "Stage Git buffer")
        map("n", "<leader>gu", gitsigns.undo_stage_hunk, "Undo stage Git hunk")
        map("n", "<leader>gR", gitsigns.reset_buffer, "Reset Git buffer")
        map("n", "<leader>gb", gitsigns.blame_line, "Git blame line")
        map("n", "<leader>gB", function()
          gitsigns.blame_line({ full = true })
        end, "Git blame line full")
        map("n", "<leader>gt", gitsigns.toggle_current_line_blame, "Toggle Git blame")
        map("n", "<leader>gd", gitsigns.diffthis, "Git diff file")
        map("n", "<leader>gD", function()
          gitsigns.diffthis("~")
        end, "Git diff file against HEAD")
      end,
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
