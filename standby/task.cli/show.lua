--[[----------------------------------------------------------------------------
--- @file show.lua
--- @brief Task cli: show command handler.
----------------------------------------------------------------------------]]--

local Cli = require "standby.task"

-- @return true on success
--         nil, error:string otherwise
local function show(id)
    return Cli.show(id)
end

--- Returns detailed description (string) help for status command.
local function help()
        return [[
Cli show TASK

Shows content of the TASK.
]]
end

return {
    handler = show,
    help = help
}
