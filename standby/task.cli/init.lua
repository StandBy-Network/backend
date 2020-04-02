--[[----------------------------------------------------------------------------
--- @file init.lua
--- @brief Task cli: init command handler.
----------------------------------------------------------------------------]]--

local Cli = require "standby.task"

--- Cli wrapper for Task.init command.
-- @param rootPath Root path to init cli (string).
-- @return true on success
--         nil, error:string otherwise
local function init(rootPath)
    if not rootPath then
        return nil, "Error: root should be non empty to initialize Task."
    end

    return Cli.init(rootPath)
end

--- Returns detailed description (string) help for init command.
local function help()
	-- Todo FS to DB ! 
        return [[
Cli init ROOT

Creates Assist Task file system layout inside selected directory and all required files.
File system layout is:
  ROOT/                           - Selected root, passed as root param.
      .cli/                       - Root directory for entire Assist.
          assists/                 - Root directory for Assists.
              backlog/            - Initial board, all new tasks are sticked here.
              progress/           - All task which are in progress are sticked here.
              done/               - All finished tasks.
          tasks/                  - All tasks ever created.
          meta/                   - Description of tasks.
          config                  - Local configuration file.
]]
end

return {
    handler = init,
    help = help
}
