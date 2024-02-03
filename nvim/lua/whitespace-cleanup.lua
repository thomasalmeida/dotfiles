-- Removes trailing whitespace and deletes all blank lines at the end of the file before saving.
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd [[%s/\s\+$//e]]
    local last_non_blank = vim.fn.prevnonblank(vim.fn.line("$"))
    if last_non_blank < vim.fn.line("$") then
      vim.api.nvim_buf_set_lines(0, last_non_blank, -1, false, {})
    end
  end,
})
