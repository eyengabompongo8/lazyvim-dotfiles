-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


-- Prevent 'c' and 'C' from overwriting register/clipboard
vim.keymap.set({ "n", "x" }, "c", '"_c', { desc = "Change without yanking" })
vim.keymap.set({ "n", "x" }, "C", '"_C', { desc = "Change line without yanking" })
