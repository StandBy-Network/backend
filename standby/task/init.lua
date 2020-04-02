--[[----------------------------------------------------------------------------
--- @file init.lua
--- @brief Task's init command.
----------------------------------------------------------------------------]]--

local Core = require "standby.task.core"

local Template = {
    config = require "standby.task.template.default_config",
    task = require "standby.task.template.md"
}

local _M = {}

--- Initialized fácil's file system layout inside selected directory.
-- @param root Path to the root directory, where to initialize fl.
-- @retval true - on success
-- @retval nil, string - on error, where string contains detailed description.
function _M.init(root)
    if not root or "string" ~= type(root) then
        return nil, "Invalid argument."
    end
	--- TODO: FS to DB!
    local directories = {
        root .. "/.cli",
        root .. "/.cli/assists",
        root .. "/.cli/assists/backlog",
        root .. "/.cli/assists/progress",
        root .. "/.cli/assists/done",
        root .. "/.cli/tasks",
        root .. "/.cli/meta",
        root .. "/.cli/template"
    }

    for _, path in pairs(directories) do
        if not Core.createDir(path) then
            return nil, "Can't create directory: " .. path
        end
    end

    local success, errorCode = Core.createFile(root, Template.config.value, "config")
    if not success then
        return nil, errorCode
    end

    success, errorCode = Core.createFile(root, Template.task.value, Core.path("template", "md.lua"))
    if not success then
        return nil, errorCode
    end

    return true
end

return _M
