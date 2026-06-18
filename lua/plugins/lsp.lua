return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      automatic_enable = false,
      ensure_installed = {
        "astro",
        "bashls",
        "biome",
        "clangd",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "emmet_language_server",
        "eslint",
        "graphql",
        "html",
        "htmx",
        "intelephense",
        "jsonls",
        "lua_ls",
        "pyright",
        "ruff",
        "rust_analyzer",
        "svelte",
        "tailwindcss",
        "taplo",
        "ts_ls",
        "yamlls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lsp = require("config.lsp")
      local capabilities = lsp.capabilities()

      vim.diagnostic.config({
        virtual_text = { prefix = "●" },
        severity_sort = true,
        float = { border = "rounded" },
      })

      local servers = {
        astro = {},
        bashls = {},
        biome = {},
        clangd = {},
        cssls = {},
        docker_compose_language_service = {},
        dockerls = {},
        emmet_language_server = {
          filetypes = {
            "astro",
            "css",
            "eruby",
            "html",
            "htmldjango",
            "javascriptreact",
            "less",
            "php",
            "sass",
            "scss",
            "svelte",
            "typescriptreact",
            "vue",
          },
        },
        eslint = {},
        gopls = {
          settings = {
            gopls = {
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
              },
              gofumpt = true,
              staticcheck = true,
              usePlaceholders = true,
            },
          },
        },
        graphql = {},
        html = {},
        htmx = {},
        intelephense = {},
        jsonls = {},
        pyright = {},
        ruff = {},
        svelte = {},
        tailwindcss = {
          filetypes = {
            "astro",
            "css",
            "heex",
            "html",
            "htmlangular",
            "javascript",
            "javascriptreact",
            "less",
            "mdx",
            "php",
            "postcss",
            "rust",
            "sass",
            "scss",
            "svelte",
            "templ",
            "typescript",
            "typescriptreact",
            "vue",
          },
          settings = {
            tailwindCSS = {
              classAttributes = {
                "class",
                "className",
                "class:list",
                "classList",
                "ngClass",
              },
              classFunctions = {
                "cn",
                "clsx",
                "cva",
                "tw",
                "twMerge",
              },
              experimental = {
                classRegex = {
                  { "class\\s*=\\s*[\"']([^\"']*)[\"']" },
                  { "class\\s*=\\s*r#\"([^\"]*)\"#" },
                  { "class:\\s*[\"']([^\"']*)[\"']" },
                  { "class:\\s*r#\"([^\"]*)\"#" },
                  { "className\\s*=\\s*[\"']([^\"']*)[\"']" },
                  { "className:\\s*[\"']([^\"']*)[\"']" },
                  { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
                  { "clsx\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
                  { "twMerge\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
                },
              },
              lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
              },
              validate = true,
            },
          },
        },
        taplo = {},
        ts_ls = {
          settings = {
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              },
            },
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              },
            },
          },
        },
        yamlls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      }

      for server, config in pairs(servers) do
        if server == "gopls" and vim.fn.executable("gopls") == 0 then
          goto continue
        end

        config.capabilities = capabilities
        config.on_attach = lsp.on_attach
        vim.lsp.config(server, config)
        vim.lsp.enable(server)

        ::continue::
      end
    end,
  },
}
