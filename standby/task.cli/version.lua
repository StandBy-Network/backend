--[[----------------------------------------------------------------------------
--- @file version.lua
--- @brief Task cli: version command handler.
----------------------------------------------------------------------------]]--

--- Name of fácil.
local TASK_NAME="Assist.Task"

--- Name of main executable of fácil.
local TASK_CLI_NAME="fl"

--- Version of fácil.
local TASK_VERSION="0.0.1"

--- Cli command: cli.version.
-- @param topic Name of help topic (string)
-- @param dictionary Table with help topics { ["topic"] = function() return description:string end }
-- @return true on success
--         nil, error:string otherwise
local function version()
    print(TASK_CLI_NAME .. ": " .. TASK_NAME .. " v" .. TASK_VERSION)
    return true
end

--- Returns detailed description (string) help for init command.
local function help()
    return "Shows the version of Task and exits."
end

return {
    name = TASK_NAME,
    cli = TASK_CLI_NAME,
    version = TASK_VERSION,
    handler = version,
    help = help
}
