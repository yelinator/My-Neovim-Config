-- Re-read files changed on disk by outside processes, similar to VS Code.
vim.opt.autoread = true

local reload = vim.api.nvim_create_augroup("ReloadChangedFiles", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "TermClose", "TermLeave" }, {
  group = reload,
  callback = function()
    if vim.o.buftype == "" and vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})
