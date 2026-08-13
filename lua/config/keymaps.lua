-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


-- Prevent 'c' and 'C' from overwriting register/clipboard
vim.keymap.set({ "n", "x" }, "c", '"_c', { desc = "Change without yanking" })
vim.keymap.set({ "n", "x" }, "C", '"_C', { desc = "Change line without yanking" })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { desc = "Exit terminal mode"})


-- #code (keymaps.lua)
-- ==========================================================================
-- FLOATING TERMINAL KEYMAPS
-- ==========================================================================

-- Note: Replace 'ayush' with your own directory name if your folder structure is different.
-- This requires the 'toggle_terminal' function from your floating-terminal module.
local terminal = require("lua.config.floating-terminal")

-- --------------------------------------------------------------------------
-- 1. Toggle Floating Terminal
-- --------------------------------------------------------------------------
-- These bindings work in both Normal (n) and Terminal (t) modes.
-- This allows you to use the same key to both open and close the terminal.

-- Primary toggle key: Control + /
vim.keymap.set({ "n", "t" }, "<leader>ft", terminal.toggle_terminal, { desc = "Toggle floating terminal" })

-- --------------------------------------------------------------------------
-- 2. Exit Terminal Mode (Improved Navigation)
-- --------------------------------------------------------------------------
-- By default, Neovim requires pressing <C-\><C-n> to exit terminal mode.
-- Mapping it to 'jk' makes it much faster to switch to Normal Mode.

-- Once in Normal Mode, you can use Vim motions (h, j, k, l, /, G, etc.) 
-- to navigate, search, or copy text/errors from your terminal output.
-- Press 'i' or 'a' to enter back into Terminal Mode (Insert).
vim.keymap.set("t", "<C-[>", [[<C-\><C-N>]], { desc = "Exit terminal mode" })


