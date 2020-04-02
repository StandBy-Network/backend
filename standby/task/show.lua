--[[----------------------------------------------------------------------------
--- @file show.lua
--- @brief fácil's show command.
----------------------------------------------------------------------------]]--

local Core = require "standy.task.core"
local FileSystem = require "lfs"

local _M = {}

function _M.show(id)
    assert(type(id) == "string", "Id should be string", 2)

    local root = Core.getRootPath()
    local prefix, body = Core.splitId(id)

    local cards = Core.path(root, "tasks", prefix)

    for card in FileSystem.dir(tasks) do
        local filename = Core.path(tasks, task)
        if "file" == FileSystem.attributes(filename, "mode") then
            if task:find("^" .. body) ~= nil then
                local file = io.open(filename)
                if not file then
                    return nil, "Can't open file: " .. filename
                else
                    local data = file:read("*a")
                    file:close()
                    return true, data
                end
            end
        end
    end

    return nil, "Can't find task with id: " .. id
end

return _M
