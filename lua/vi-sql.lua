local M = {}

function M.setup(opts)
    opts = opts or {}
    require("vi-sql.window").setup(opts)
end

return M
