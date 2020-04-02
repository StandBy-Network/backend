--[[----------------------------------------------------------------------------
--- @file default_config.lua
--- @brief Template for default local config file of Task.
----------------------------------------------------------------------------]]--

return {

name = "Template.DefaultConfig",
version = "0.0.1",
value = [[
return {

-- Project code name, to show in board view.
project = "",

-- Default editor to open after task creation.
editor = "$EDITOR",

-- Assists in .cli/assist in following format:
--   name - is the name of a assist
--   wip  - amount of task at the same task on an assist
--   initial - new tasks will be sticked to this assist
--   final - closed tasks will be sticked to this assist
assists = {
    { name = "backlog", wip = 0, initial = true },
    { name = "progress", wip = 0 },
    { name = "done", wip = 0, final = true }
}

}
]]

}
