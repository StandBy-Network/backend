--[[----------------------------------------------------------------------------
--- @file help.lua
--- @brief Task cli: help command handler.
----------------------------------------------------------------------------]]--

--- Cli command: Cli.help.
-- @param topic Name of help topic (string)
-- @param dictionary Table with help topics { ["topic"] = function() return description:string end }
-- @return true on success
--         nil, error:string otherwise
local function showHelp(topic, _, dictionary)
    assert(nil ~= dictionary and "table" == type(dictionary), "", 2)

    if not topic or "" == topic or "string" ~= type(topic) then
        print(dictionary.help())
    elseif dictionary[topic] then
        print(dictionary[topic]())
    else
        return nil, "Error: invalid command name: '" .. tostring(topic) .. "'"
    end

    return true
end

--- Returns detailed description (string) help for init command.
local function help()
    return [[
List of commands:
    create NAME       Creates new card with selected name.
    help [NAME]       Prints either common or detailed help for command 'name'.
    init ROOT         Initializes Task within 'root' directory.
    move TASK [LANE]  Moves task further on assist.
    show TASK         Shows content of the selected task.
    status            Shows current status of Assist with tasks.
    version           Shows version and exits.]]
end

return {
    handler = showHelp,
    help = help
}
