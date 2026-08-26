-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


-- Prevent 'c', 'C', 'x' and 'X' from overwriting register/clipboard
vim.keymap.set({ "n", "x" }, "c", '"_c', { desc = "Change without yanking" })
vim.keymap.set({ "n", "x" }, "C", '"_C', { desc = "Change line without yanking" })
vim.keymap.set({ "n", "x" }, "x", '"_x', { desc = "Delete charachter without yanking" })
vim.keymap.set({ "n", "x" }, "X", '"_X', { desc = "Delete previous character without yanking" })

-- Exit Terminal Mode
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { desc = "Exit terminal mode"})


-- ==========================================================================
-- FLOATING TERMINAL KEYMAPS
-- ==========================================================================

-- This requires the 'toggle_terminal' function from your floating-terminal module.
local terminal = require("config.floating-terminal")

-- --------------------------------------------------------------------------
-- 1. Toggle Floating Terminal
-- --------------------------------------------------------------------------
-- These bindings work in both Normal (n) and Terminal (t) modes.

vim.keymap.set({ "n", "t" }, "<leader>ft", terminal.toggle_terminal, { desc = "Toggle floating terminal" })

-- --------------------------------------------------------------------------
-- 2. Exit Terminal Mode (Improved Navigation)
-- --------------------------------------------------------------------------
vim.keymap.set("t", "<C-[>", [[<C-\><C-N>]], { desc = "Exit terminal mode" })


