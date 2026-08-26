-- I know this is too much but please read this before using it 😀
-- Make sure to use AI if this is not working for you.

local m = {}

local state = {
	buf = nil,
	win = nil,
	cwd = nil,
}

-- Compute terminal size & position
local function get_win_config()
-- You can change the height and width of the floating terminal just by changing these values.
	local width = math.floor(vim.o.columns * 0.5)
	local height = math.floor(vim.o.lines * 0.5)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)
	return {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	}
end

-- Get directory of current buffer
local function get_target_dir()
	local bufname = vim.api.nvim_buf_get_name(0)
	if bufname ~= "" and vim.fn.filereadable(bufname) == 1 then
		return vim.fn.fnamemodify(bufname, ":h")
	elseif bufname ~= "" and vim.fn.isdirectory(bufname) == 1 then
		return bufname
	end
	return vim.loop.cwd()
end

-- Create or reuse floating terminal
local function open_terminal()
	local dir = get_target_dir()
	local is_new_buf = false

	if not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
		state.buf = vim.api.nvim_create_buf(false, true)
		state.cwd = dir
		is_new_buf = true
	end

	-- Create window if needed
	if not state.win or not vim.api.nvim_win_is_valid(state.win) then
		state.win = vim.api.nvim_open_win(state.buf, true, get_win_config())
	else
		vim.api.nvim_win_set_buf(state.win, state.buf)
		vim.api.nvim_win_set_config(state.win, get_win_config())
	end

	-- Apply transparency to the floating window
	vim.api.nvim_set_option_value("winhl", "normal:normal,floatborder:normal", { win = state.win })
	vim.api.nvim_set_current_win(state.win)

	if is_new_buf then
		vim.fn.termopen(vim.o.shell, { cwd = dir })
	elseif state.cwd ~= dir then
		local job = vim.b[state.buf].terminal_job_id
		if job then
			vim.api.nvim_chan_send(job, "cd " .. vim.fn.shellescape(dir) .. " && clear\n")
		end
		state.cwd = dir
	end

	-- Scroll to the bottom of the terminal buffer to prevent jumping
	local line_count = vim.api.nvim_buf_line_count(state.buf)
	vim.api.nvim_win_set_cursor(state.win, { line_count, 0 })

	vim.cmd("startinsert")
end

-- Toggle terminal visibility
function m.toggle_terminal()
	if state.win and vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_hide(state.win)
	else
		open_terminal()
	end
end

return m

