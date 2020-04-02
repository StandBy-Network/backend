--[[----------------------------------------------------------------------------
--- @file move.lua
--- @brief Task cli: move command handler.
----------------------------------------------------------------------------]]--

local Cli = require "standby.task"

--- Cli wrapper for Task.move command.
-- @return true on success
--         nil, error:string otherwise
local function move(id, lane)
    return Cli.move(id, lane)
end

--- Returns detailed description (string) help for status command.
local function help()
        return [[
cli move TASK [LANE]

Moves task (TASK) either to the next lane in order set in config
or to the selected explicitly lane (LANE).

Task could be specified by its full id or partial id.

If partial id was used and there are more then one task with similar partial id
then error would occur.

If task moved to lane with defined WIP (> 0) and current amount of task
was already equal to WIP then error would occur.]]
end

return {
    handler = move,
    help = help
}
