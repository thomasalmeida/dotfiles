-- Define the path to the session file.
local session_file = vim.fn.stdpath('data') .. '/session.vim'

-- Saves the current session.
-- This function uses the 'mksession' command to save the session state to the specified file.
local function save_session()
  vim.cmd('mksession! ' .. session_file)
end

-- Sets up an autocmd to save the session automatically when Neovim exits.
-- 'VimLeavePre' is triggered just before Neovim exits, ensuring the session is saved.
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = save_session,
})

-- Saves the session periodically.
-- This function recursively schedules itself to run every 15 minutes (900000 milliseconds),
-- ensuring the session is saved periodically while Neovim is running.
local function save_session_periodically()
  save_session()
  vim.defer_fn(save_session_periodically, 900000) -- 15 minutes in milliseconds
end

-- Loads the session if the session file exists.
-- This function checks if the session file is readable and, if so, sources it,
-- restoring the session state from the last time it was saved.
local function load_session_if_exists()
  if vim.fn.filereadable(session_file) == 1 then
    vim.cmd('source ' .. session_file)
  end
end

-- Load the session on startup.
load_session_if_exists()

-- Start the periodic session save.
save_session_periodically()
