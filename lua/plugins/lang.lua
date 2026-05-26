return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          code_actions = {
            ui_select_fallback = true,
          },
          hover_actions = {
            replace_builtin_hover = true,
          },
        },
        server = {
          cmd = function()
            local ok, registry = pcall(require, "mason-registry")
            if ok and registry.is_installed("rust-analyzer") then
              local package = registry.get_package("rust-analyzer")
              local receipt = package:get_receipt():get()
              local binary = receipt.links.bin["rust-analyzer"] or "rust-analyzer"
              return { ("%s/%s"):format(package:get_install_path(), binary) }
            end

            return { "rust-analyzer" }
          end,
          on_attach = function(client, bufnr)
            require("config.lsp").on_attach(client, bufnr)

            local map = function(mode, lhs, rhs, desc)
              vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            map("n", "<leader>rr", "<cmd>RustLsp runnables<cr>", "Rust runnables")
            map("n", "<leader>rt", "<cmd>RustLsp testables<cr>", "Rust testables")
            map("n", "<leader>rd", "<cmd>RustLsp debuggables<cr>", "Rust debuggables")
            map("n", "<leader>rh", "<cmd>RustLsp hover actions<cr>", "Rust hover actions")
            map("n", "<leader>ra", "<cmd>RustLsp codeAction<cr>", "Rust code action")
            map("n", "<leader>re", "<cmd>RustLsp explainError current<cr>", "Rust explain error")
            map("n", "<leader>rE", "<cmd>RustLsp renderDiagnostic current<cr>", "Rust render diagnostic")
            map("n", "<leader>rm", "<cmd>RustLsp expandMacro<cr>", "Rust expand macro")
            map("n", "<leader>rc", "<cmd>RustLsp openCargo<cr>", "Rust open Cargo.toml")
            map("n", "<leader>ro", "<cmd>RustLsp openDocs<cr>", "Rust open docs.rs")
            map("n", "<leader>rp", "<cmd>RustLsp parentModule<cr>", "Rust parent module")
            map("n", "J", "<cmd>RustLsp joinLines<cr>", "Rust join lines")

            if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
              map("n", "<leader>ri", function()
                local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
                vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
              end, "Toggle Rust inlay hints")
            end

            if client.server_capabilities.codeLensProvider then
              vim.lsp.codelens.enable(true, { bufnr = bufnr })
              map("n", "<leader>rl", vim.lsp.codelens.run, "Run Rust CodeLens")
            end
          end,
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                buildScripts = {
                  enable = true,
                },
              },
              check = {
                command = "clippy",
                allTargets = true,
              },
              checkOnSave = true,
              completion = {
                autoimport = {
                  enable = true,
                },
                callable = {
                  snippets = "add_parentheses",
                },
              },
              diagnostics = {
                enable = true,
                experimental = {
                  enable = true,
                },
              },
              inlayHints = {
                bindingModeHints = {
                  enable = true,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  enable = true,
                },
                closureCaptureHints = {
                  enable = true,
                },
                closureReturnTypeHints = {
                  enable = "always",
                },
                closureStyle = "rust_analyzer",
                expressionAdjustmentHints = {
                  enable = "always",
                },
                lifetimeElisionHints = {
                  enable = "skip_trivial",
                  useParameterNames = true,
                },
                maxLength = 25,
                parameterHints = {
                  enable = true,
                },
                reborrowHints = {
                  enable = "always",
                },
                renderColons = true,
                typeHints = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideNamedConstructor = false,
                },
              },
              lens = {
                enable = true,
                debug = {
                  enable = true,
                },
                implementations = {
                  enable = true,
                },
                references = {
                  adt = {
                    enable = true,
                  },
                  enumVariant = {
                    enable = true,
                  },
                  method = {
                    enable = true,
                  },
                  trait = {
                    enable = true,
                  },
                },
                run = {
                  enable = true,
                },
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
      }
    end,
  },
  {
    "folke/neodev.nvim",
    ft = "lua",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo comments" },
    },
  },
}
