local M = {}

function M.capabilities()
  return require("cmp_nvim_lsp").default_capabilities()
end

function M.on_attach(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gr", vim.lsp.buf.references, "References")
  map("n", "gi", vim.lsp.buf.implementation, "Implementation")
  map("n", "gt", vim.lsp.buf.type_definition, "Type definition")
  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "<c-k>", vim.lsp.buf.signature_help, "Signature help")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("n", "<leader>cl", vim.lsp.codelens.run, "Run CodeLens")
  map("n", "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols")
  map("n", "<leader>cS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace symbols")
  map("n", "<leader>ci", function()
    if not vim.lsp.inlay_hint then
      return
    end
    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
    vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
  end, "Toggle inlay hints")

  if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  if client.server_capabilities.codeLensProvider then
    vim.lsp.codelens.enable(true, { bufnr = bufnr })
  end

  if client:supports_method("textDocument/documentHighlight") then
    local group = vim.api.nvim_create_augroup("lsp_document_highlight_" .. bufnr, { clear = true })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      group = group,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = bufnr,
      group = group,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

return M
