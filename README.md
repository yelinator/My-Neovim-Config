# Neovim Development Environment

Advanced Lua-based Neovim configuration for Python, Rust, JavaScript,
TypeScript, web development, APIs, Git workflows, testing, and debugging.

The leader key is `Space`. Press `Space` and wait briefly to discover available
commands through WhichKey.

## Requirements

### Core

- Neovim 0.12 or newer
- `git`
- A Nerd Font for icons
- `curl` and `tree-sitter-cli` for the Kulala HTTP client
- `fd` for Python virtual environment discovery
- A C compiler and `make` for Telescope FZF native support
- Optional: `lazygit`

macOS installation:

```sh
brew install neovim git curl tree-sitter-cli fd lazygit
```

### Language Toolchains

Install only the runtimes required by your projects:

- Python 3
- Node.js and npm
- Rust and Cargo
- Go
- PHP
- C/C++ compiler toolchain

Rust components and test runner:

```sh
rustup component add rust-analyzer clippy rustfmt
cargo install cargo-nextest --locked
```

## Installation

Back up any existing configuration, then place this repository at:

```text
~/.config/nvim
```

Start Neovim:

```sh
nvim
```

`lazy.nvim` bootstraps automatically. Plugins, LSP servers, formatters, linters,
and debug adapters are installed on first use or startup.

Useful installation and health commands:

```vim
:Lazy
:Mason
:checkhealth
:ConformInfo
:LspInfo
```

## Configuration Layout

```text
init.lua                  Entry point
lua/config/options.lua    Editor behavior and filetype detection
lua/config/keymaps.lua    Global keymaps
lua/config/lsp.lua        Shared LSP capabilities and keymaps
lua/config/lazy.lua       Plugin manager bootstrap
lua/plugins/lsp.lua       Language servers
lua/plugins/completion.lua Completion and snippets
lua/plugins/format.lua    Formatting, linting, and CLI tools
lua/plugins/debug.lua     Debug adapter configuration
lua/plugins/lang.lua      Language-specific features, including Rust
lua/plugins/editor.lua    Search, Git, tests, terminals, and sessions
lua/plugins/workflow.lua  Outline, tasks, APIs, Diffview, and editing tools
lua/plugins/ui.lua        Theme, statusline, sidebar, and buffers
```

Add new plugins to the most relevant file under `lua/plugins/`. Keep shared LSP
behavior in `lua/config/lsp.lua` and language-specific behavior in
`lua/plugins/lang.lua`.

## Daily Workflow

### Open And Navigate A Project

```sh
nvim .
```

Neo-tree opens as the project sidebar without showing `.git`.

- `<leader>w`: save file
- `<leader>q`: quit window
- `<leader>e`: toggle file sidebar
- `<leader>E`: focus file sidebar
- `-`: open the current directory with Oil
- `<leader>ff`: find files
- `<leader>fg`: live grep
- `<leader>fb`: find open buffers
- `<leader>fh`: search help
- `s`: Flash jump
- `S`: Flash Treesitter jump
- `<leader>oo`: toggle symbol outline
- `<leader>on`: toggle symbol navigator
- `]s` / `[s`: next or previous symbol

Use `j` and `k` to move through wrapped display lines. Supplying a count, such
as `5j`, moves through real lines.

### Understand And Modify Code

LSP keymaps become available when a language server attaches:

- `gd`: go to definition
- `gD`: go to declaration
- `gr`: find references
- `gi`: go to implementation
- `gt`: go to type definition
- `K`: hover documentation
- `<C-k>`: signature help
- `<leader>rn`: rename symbol
- `<leader>ca`: code action
- `<leader>ci`: toggle inlay hints
- `<leader>cl`: run CodeLens
- `<leader>cs`: document symbols
- `<leader>cS`: workspace symbols
- `]d` / `[d`: next or previous diagnostic
- `<leader>cd`: show line diagnostic
- `<leader>xx`: open diagnostics
- `<leader>xq`: open quickfix list
- `<leader>xt`: open TODO comments

Editing helpers:

- `<leader>cj`: split or join the code block under the cursor
- `ys{motion}{char}`: add surroundings
- `ds{char}`: delete surroundings
- `cs{old}{new}`: replace surroundings
- `<leader>sr`: project-wide search and replace
- `<leader>sw`: search current word or visual selection
- `<leader>sf`: search within the current file
- `<leader>u`: open undo history

### Format And Lint

Formatting runs automatically on save, except for C and C++.

- `<leader>cf`: format the current buffer or visual selection
- `:ConformInfo`: inspect active formatters

Configured formatters:

- Python: Ruff format and import organization
- Rust: rustfmt
- Go: gofumpt and goimports
- JavaScript, TypeScript, web, JSON, YAML, and Markdown: Prettier
- Lua: Stylua
- PHP: PHP CS Fixer

Configured linters:

- Python: Ruff
- JavaScript and TypeScript: eslint_d

### Run Project Tasks

Overseer discovers project tasks from tools such as Cargo, npm, Make, and VS
Code task definitions.

- `<leader>or`: select and run a project task
- `<leader>ot`: toggle the task list
- `<leader>oa`: perform an action on a task
- `<leader>oq`: perform a quick task action

Use Overseer for long-running builds, servers, migrations, and project scripts.
Use ToggleTerm for interactive shell work:

- `<leader>tt`: floating terminal
- `<leader>th`: horizontal terminal
- `<leader>tv`: vertical terminal
- `<Esc><Esc>`: hide the focused terminal

### Test And Debug

Neotest supports Rust, Python, Jest, and Go:

- `<leader>tn`: run nearest test
- `<leader>tf`: run current file tests
- `<leader>ta`: run all tests
- `<leader>ts`: toggle test summary
- `<leader>to`: open test output
- `<leader>tO`: toggle test output panel
- `<leader>td`: debug nearest test
- `<leader>tx`: stop test

Debug Adapter Protocol controls:

- `<leader>db`: toggle breakpoint
- `<leader>dc`: start or continue
- `<leader>di`: step into
- `<leader>do`: step over
- `<leader>dO`: step out
- `<leader>du`: toggle debug UI

The debug UI opens automatically when a session starts and closes when it
finishes.

## Language Workflows

### Python

Python uses Pyright for language intelligence, Ruff for diagnostics and
formatting, Neotest for tests, and nvim-dap-python for debugging.

1. Open a Python file.
2. Press `<leader>cv` to select a virtual environment.
3. Use `<leader>cf` to format.
4. Use `<leader>tn` or `<leader>tf` to run tests.
5. Use `<leader>td` to debug the nearest test.

### JavaScript And TypeScript

JavaScript and TypeScript use `ts_ls`, ESLint, Prettier, and Jest. Inlay hints
for parameters, variables, properties, enum values, and return types are
enabled automatically.

Use `<leader>ci` to hide or restore inlay hints and `<leader>or` to run npm
scripts discovered by Overseer.

### Rust

Rust uses Rustaceanvim, Rust Analyzer, Clippy, rustfmt, crates.nvim, Neotest,
and CodeLLDB. Rust Analyzer checks all targets and features with Clippy.

Core Rust actions:

- `<leader>rr`: select runnable
- `<leader>rt`: select testable
- `<leader>rd`: select debuggable
- `<leader>rh`: hover actions
- `<leader>ra`: Rust Analyzer code action
- `<leader>ri`: toggle Rust inlay hints
- `<leader>rl`: run Rust CodeLens
- `<leader>re`: explain current error
- `<leader>rE`: render current diagnostic
- `<leader>rm`: expand macro
- `<leader>rc`: open `Cargo.toml`
- `<leader>ro`: open documentation
- `<leader>rp`: open parent module
- `<leader>rR`: reload workspace
- `<leader>rf`: run fly check
- `<leader>rj`: jump to related diagnostics
- `<leader>rs`: inspect syntax tree
- `<leader>rS`: structural search and replace
- `<leader>rk` / `<leader>rK`: move item up or down

Cargo dependency actions inside `Cargo.toml`:

- `<leader>rv`: show available crate versions
- `<leader>rF`: show crate features
- `<leader>rD`: show crate dependencies
- `<leader>ru`: update crate
- `<leader>rU`: upgrade crate
- `<leader>rA`: update all crates

### Web And API Development

Configured web language servers include HTML, CSS, Tailwind CSS, Emmet, Astro,
Svelte, GraphQL, HTMX, JSON, YAML, Docker, and Docker Compose.

Create a `.http` or `.rest` file to use Kulala:

```http
@baseUrl = http://localhost:8000

GET {{baseUrl}}/health
Accept: application/json

###

POST {{baseUrl}}/api/items
Content-Type: application/json

{
  "name": "Example"
}
```

HTTP client actions:

- `<leader>Rs`: send request under cursor
- `<leader>Ra`: send all requests
- `<leader>Rr`: replay last request
- `<leader>Rb`: open HTTP scratchpad

Responses open in a right-side split.

### Markdown

Markdown and MDX files render headings, tables, code blocks, lists, and
callouts directly inside Neovim.

- `<leader>mp`: toggle rendered Markdown

## Git Workflow

Gitsigns provides line-level changes and blame:

- `]h` / `[h`: next or previous changed hunk
- `<leader>gp`: preview hunk
- `<leader>gs`: stage hunk
- `<leader>gS`: stage buffer
- `<leader>gu`: undo staged hunk
- `<leader>gr`: reset hunk
- `<leader>gR`: reset buffer
- `<leader>gb`: blame line
- `<leader>gB`: full blame details
- `<leader>gt`: toggle inline blame
- `<leader>gd`: diff current file
- `<leader>gD`: diff current file against `HEAD~`
- `<leader>gg`: open LazyGit

Diffview provides repository and file-history review:

- `<leader>gv`: open repository diff view
- `<leader>gh`: current file history
- `<leader>gH`: repository history
- `<leader>gx`: close Diffview

Conflict resolution:

- `<leader>gco`: choose ours
- `<leader>gct`: choose theirs
- `<leader>gcb`: choose both
- `<leader>gc0`: choose neither
- `<leader>gcn` / `<leader>gcp`: next or previous conflict

## Sessions

Sessions save automatically by working directory.

- `<leader>qs`: restore current directory session
- `<leader>ql`: restore last session
- `<leader>qd`: stop saving the current session

## Maintenance

Update plugins:

```vim
:Lazy update
```

Update Mason registry and tools:

```vim
:MasonUpdate
:Mason
```

Update Treesitter parsers:

```vim
:TSUpdate
```

After changing Lua configuration, validate startup:

```sh
nvim --headless -i NONE +qa
```

Before committing configuration changes:

```sh
git diff --check
git status --short
```

## Troubleshooting

### LSP Does Not Attach

1. Run `:LspInfo`.
2. Run `:Mason` and confirm the server is installed.
3. Confirm the project contains an expected root file such as `.git`,
   `package.json`, `pyproject.toml`, or `Cargo.toml`.
4. Run `:checkhealth vim.lsp`.

Rust uses Rustaceanvim to start Rust Analyzer. Do not manually enable a second
`rust_analyzer` client.

### Formatting Does Not Run

1. Run `:ConformInfo`.
2. Confirm the formatter executable is installed.
3. Check whether the filetype has a formatter in `lua/plugins/format.lua`.

C and C++ formatting on save is intentionally disabled.

### Tests Do Not Run

1. Open the project root before running tests.
2. Confirm the test framework is installed in the project.
3. Rust Neotest requires `cargo-nextest`.
4. Use `<leader>to` to inspect test output.

### Python Environment Is Missing

1. Confirm `fd` is available with `fd --version`.
2. Open a Python file.
3. Run `:VenvSelect`.

### HTTP Client Fails To Load

Confirm both commands are available:

```sh
curl --version
tree-sitter --version
```

Kulala loads only for `.http` and `.rest` files.

### Treesitter Query Or Parser Errors

This configuration uses the `main` branch of `nvim-treesitter`, which is
required for Neovim 0.12. The older `master` branch supports Neovim 0.10 and
0.11 and must not be used with this configuration.

Update the plugin and rebuild installed parsers:

```vim
:Lazy update nvim-treesitter
:TSUpdate
:checkhealth nvim-treesitter
```

Parser and query versions must stay aligned. If an error starts after changing
the Treesitter branch, rebuild parsers before debugging individual plugins.

### Icons Are Missing

Install and select a Nerd Font in the terminal emulator.

### Inspect Loaded Plugins

Run `:Lazy` to inspect plugin state, errors, load events, and startup timings.
