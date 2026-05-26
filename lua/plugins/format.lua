return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
    },
    opts = {
      format_on_save = function(bufnr)
        local disabled = {
          c = true,
          cpp = true,
        }
        if disabled[vim.bo[bufnr].filetype] then
          return nil
        end
        return { timeout_ms = 1000, lsp_fallback = true }
      end,
      formatters_by_ft = {
        css = { "prettier" },
        go = { "gofumpt", "goimports" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        mdx = { "prettier" },
        php = { "php_cs_fixer" },
        python = { "ruff_format", "ruff_organize_imports" },
        rust = { "rustfmt" },
        scss = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        yaml = { "prettier" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        python = { "ruff" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "codelldb",
        "eslint_d",
        "php-cs-fixer",
        "prettier",
        "ruff",
        "shfmt",
        "stylua",
      },
    },
  },
}
