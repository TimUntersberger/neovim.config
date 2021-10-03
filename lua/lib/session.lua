local M = {}

M.session_directory = vim.fn.expand("~/.nvim_sessions")

local is_win = jit.os == "windows"

if not file_exists(M.session_directory) then
    os.execute('mkdir ' .. M.session_directory)
end

local function resolve_session(name)
    return vim.fn.expand(M.session_directory .. "/" .. name)
end

function M.save(name)
    vim.cmd("mksession! " .. resolve_session(name))
end

function M.save_current()
    local session = M.current_session()
    if session then
        M.save(session)
    end
end

function M.load(name)
    local path = resolve_session(name)

    if file_exists(path) then
        vim.cmd("silent! source " .. path)
    else
        print(string.format("Couldn't find session with name '%s'", name))
    end
end

function M.close()
    M.save_current()
    vim.v.this_session = ""
    vim.cmd [[wa]]
    vim.cmd [[%bw!]]
end

function M.delete(name)
    local path = resolve_session(name)
    local cmd = "del"
    if not is_win then
      cmd = "rm"
    end

    if file_exists(path) then
        os.execute(cmd .. ' ' .. path)
    else
        print(string.format("Couldn't find session with name '%s'", name))
    end
end

function M.list()
    local cmd = "dir /B"
    if not is_win then
      cmd = "ls"
    end
    local proc = io.popen(cmd .. ' ' .. M.session_directory)
    local lines = {}
    for line in proc:lines() do
        table.insert(lines, line)
    end
    proc:close()
    return lines
end

function M.enable_auto_save()
    autocmd {
        { "BufEnter", "VimLeavePre" },
        { "*" },
        M.save_current
    }
end

function M.current_session()
    if vim.v.this_session == "" then
        return nil
    end
    local tokens = vim.split(vim.v.this_session, os_seperator())
    return tokens[#tokens]
end

return M
