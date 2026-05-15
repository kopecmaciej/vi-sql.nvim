local api = vim.api
local fn = vim.fn

local M = {
    _buf = nil,
    _win = nil,
    config = {
        persist = false,
        connection = nil,
        width = 0.9,
        height = 0.9,
    },
}

local function get_win_opts()
    local width = vim.o.columns
    local height = vim.o.lines

    local win_height = math.ceil(height * M.config.height)
    local win_width = math.ceil(width * M.config.width)

    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)

    return {
        style = "minimal",
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        border = "rounded",
    }
end

local function build_cmd()
    local cmd = "vi-sql"
    if M.config.connection then
        cmd = cmd .. " --connection-name " .. fn.shellescape(M.config.connection)
    end
    return cmd
end

local function create_vi_sql_window()
    if fn.executable("vi-sql") ~= 1 then
        api.nvim_err_writeln("Failed to start vi-sql. Is it installed and in your PATH?")
        return
    end

    if M.config.persist and M._buf and api.nvim_buf_is_valid(M._buf) then
        local opts = get_win_opts()
        M._win = api.nvim_open_win(M._buf, true, opts)
        api.nvim_set_option_value("winblend", 0, { win = M._win })
        vim.cmd("startinsert")
        return
    end

    local buf = api.nvim_create_buf(false, true)
    M._buf = buf
    local opts = get_win_opts()

    local win = api.nvim_open_win(buf, true, opts)
    M._win = win

    api.nvim_set_option_value("winblend", 0, { win = win })
    vim.bo[buf].bufhidden = M.config.persist and "hide" or "wipe"

    api.nvim_create_autocmd("TermClose", {
        buffer = buf,
        callback = function()
            vim.schedule(function()
                if api.nvim_win_is_valid(win) then
                    api.nvim_win_close(win, true)
                end
            end)
        end,
        once = true,
    })

    fn.jobstart(build_cmd(), { term = true })

    vim.cmd("startinsert")
end

function M.setup(opts)
    M.config = vim.tbl_extend("force", M.config, opts or {})
    api.nvim_create_user_command("ViSQL", create_vi_sql_window, { nargs = 0 })
end

return M
