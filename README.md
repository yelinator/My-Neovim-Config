# Neovim Config

Lua Neovim setup for Python, Rust, JavaScript/TypeScript, and web development.

## Requirements

- Neovim 0.9 or newer
- `git`
- A C compiler and `make` for optional Telescope FZF native support
- Language runtimes you use: Python, Node.js/npm, Rust/Cargo
- Go support is configured, but Go tools require `go` on `PATH`
- Rust formatting uses `rustfmt` from the Rust toolchain: `rustup component add rustfmt`
- Optional: `lazygit`

On first launch, `lazy.nvim` will be bootstrapped and plugins will install.

## Included

- Plugin management with `lazy.nvim`
- LSP with Mason-managed servers:
  - Python: `pyright`, `ruff`
  - Rust: `rust_analyzer`
  - JS/TS: `ts_ls`, `eslint`
  - Web: `html`, `cssls`, `tailwindcss`, `emmet_language_server`, `astro`, `svelte`, `graphql`, `htmx`
  - PHP: `intelephense`
  - C/C++: `clangd`
  - Go: `gopls` when installed
  - Shell, Docker, Docker Compose, TOML, Lua, JSON, YAML
- Completion with `nvim-cmp` and snippets
- Formatting with `conform.nvim`
- Linting with `nvim-lint`
- Treesitter syntax highlighting
- Git signs and LazyGit integration
- Telescope fuzzy finding
- VS Code-style file sidebar with Neo-tree
- DAP base setup with Python support

## Keymaps

- `<leader>ff`: find files
- `<leader>fg`: live grep
- `<leader>fb`: buffers
- `<leader>e`: toggle file sidebar
- `<leader>E`: focus file sidebar
- `-`: open parent directory with Oil
- `<leader>cf`: format
- `<leader>ca`: code action
- `<leader>rn`: rename symbol
- `<leader>ci`: toggle inlay hints
- `<leader>cl`: run CodeLens
- `<leader>cs`: document symbols
- `<leader>cS`: workspace symbols
- `<leader>xx`: diagnostics
- `<leader>gg`: LazyGit
- `<leader>gb`: Git blame line
- `<leader>gt`: toggle inline Git blame
- `<leader>gp`: preview Git hunk
- `<leader>gs`: stage Git hunk
- `<leader>gr`: reset Git hunk
- `]h` / `[h`: next/previous Git hunk
- `<leader>db`: toggle breakpoint
- `<leader>dc`: debug continue
- `<leader>rr`: Rust runnables
- `<leader>rt`: Rust testables
- `<leader>rd`: Rust debuggables
- `<leader>rh`: Rust hover actions
- `<leader>ra`: Rust Analyzer code actions
- `<leader>ri`: toggle Rust inlay hints
- `<leader>rl`: run Rust CodeLens
- `<leader>rm`: expand Rust macro
- `<leader>re`: explain Rust error

Leader is space.
