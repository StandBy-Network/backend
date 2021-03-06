--[[----------------------------------------------------------------------------
--- @file create.lua
--- @brief fácil cli: create command handler.
----------------------------------------------------------------------------]]--

local Cli = require "standby.task"

--- Cli wrapper for cli.create command.
-- @param name Name of the created task (string)
-- @return true on success
--         nil, error:string otherwise
local function create(name)
    if not name then
        return nil, "Error: name should be non empty to create card."
    end

    local code, result = Cli.create(name)
    if code then
      result = "Created: " .. result
    end

    return code, result
end

--- Returns detailed description (string) help for create command.
local function help()
        return [[
Cli create NAME

Creates new card

Card consists of three files:
  1 Card file - text file with markdown content contained description of task.
  2 Meta data file - text file in lua format with meta data described card itself.
  3 Status file - empty file in boards pointed to current status of the card.
All these files are placed inside .fl directory (by default).
]]
end

return {
    handler = create,
    help = help
}
